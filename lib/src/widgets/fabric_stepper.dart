import 'package:flutter/material.dart';
import '../fabric_theme_extension.dart';

/// Represents a single step inside a [FabricStepper].
///
/// If [state] or [isActive] are omitted, [FabricStepper] automatically
/// computes them based on the active `currentStep` index.
@immutable
class FabricStep {
  const FabricStep({
    required this.title,
    required this.content,
    this.subtitle,
    this.state,
    this.isActive,
    this.label,
  });

  /// Primary title of the step.
  final Widget title;

  /// Optional secondary subtitle displayed below [title].
  final Widget? subtitle;

  /// Body content revealed when this step is current.
  final Widget content;

  /// Optional explicit [StepState]. When null, [FabricStepper] resolves:
  /// - [StepState.complete] for steps before `currentStep`
  /// - [StepState.editing] for `currentStep`
  /// - [StepState.indexed] for steps after `currentStep`
  final StepState? state;

  /// Optional explicit active flag. When null, defaults to `currentStep >= index`.
  final bool? isActive;

  /// Optional custom label widget for horizontal steppers.
  final Widget? label;
}

/// A pre-styled Material 3 multi-step progress component integrated with
/// [FabricThemeExtension] tokens.
///
/// Unlike Flutter's raw [Stepper], [FabricStepper]:
/// - Automatically resolves step states (`complete`, `editing`, `indexed`) and
///   active indicators based on [currentStep].
/// - Styles connector lines, step indicator badges, and typography using
///   [FabricThemeExtension] tokens.
/// - Provides modern `FilledButton` / `OutlinedButton` action controls with
///   customizable [continueLabel], [finishLabel], and [cancelLabel].
/// - Safely bounds height in [StepperType.horizontal] mode via
///   [horizontalHeight] so it can be placed directly inside scrollable lists.
class FabricStepper extends StatelessWidget {
  const FabricStepper({
    super.key,
    required this.steps,
    this.currentStep = 0,
    this.type = StepperType.vertical,
    this.physics = const NeverScrollableScrollPhysics(),
    this.onStepTapped,
    this.onStepContinue,
    this.onStepCancel,
    this.controlsBuilder,
    this.stepIconBuilder,
    this.continueLabel = 'Continue',
    this.finishLabel = 'Finish',
    this.cancelLabel = 'Back',
    this.showContinueIcon = true,
    this.bordered = true,
    this.horizontalHeight = 220,
    this.connectorThickness = 1.5,
    this.margin,
  }) : assert(
         currentStep >= 0,
         'currentStep must be non-negative',
       );

  /// The steps of the stepper whose titles, subtitles, and content are displayed.
  final List<FabricStep> steps;

  /// The index into [steps] of the current step whose content is displayed.
  final int currentStep;

  /// Whether the stepper is laid out vertically or horizontally.
  final StepperType type;

  /// How the stepper's scroll view should respond to user input.
  final ScrollPhysics? physics;

  /// Called when a step header is tapped.
  final ValueChanged<int>? onStepTapped;

  /// Called when the primary continue/finish button is tapped.
  final VoidCallback? onStepContinue;

  /// Called when the secondary back/cancel button is tapped.
  final VoidCallback? onStepCancel;

  /// Optional custom controls builder. When null, renders Fabric's default
  /// `FilledButton` and `OutlinedButton` controls.
  final ControlsWidgetBuilder? controlsBuilder;

  /// Optional custom icon builder for step indicator circles.
  final StepIconBuilder? stepIconBuilder;

  /// Label for the primary button on non-final steps.
  final String continueLabel;

  /// Label for the primary button on the final step.
  final String finishLabel;

  /// Label for the secondary button on steps after step 0.
  final String cancelLabel;

  /// Whether to show a trailing arrow/check icon inside the primary button.
  final bool showContinueIcon;

  /// Whether to wrap the stepper inside a bordered Fabric [Card] container.
  final bool bordered;

  /// Bounded height applied when [type] is [StepperType.horizontal].
  final double horizontalHeight;

  /// Thickness of the line connecting steps.
  final double connectorThickness;

  /// Optional outer margin around the stepper.
  final EdgeInsetsGeometry? margin;

  StepState _resolveStepState(int index, FabricStep step) {
    if (step.state != null) {
      return step.state!;
    }
    if (currentStep > index) {
      return StepState.complete;
    }
    if (currentStep == index) {
      return StepState.editing;
    }
    return StepState.indexed;
  }

  Widget _buildDefaultControls(BuildContext context, ControlsDetails details) {
    final bool isLastStep = details.stepIndex == steps.length - 1;
    final String primaryText = isLastStep ? finishLabel : continueLabel;

    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: <Widget>[
          if (showContinueIcon)
            FilledButton.icon(
              onPressed: details.onStepContinue,
              icon: Icon(
                isLastStep ? Icons.check : Icons.arrow_forward,
                size: 18,
              ),
              label: Text(primaryText),
            )
          else
            FilledButton(
              onPressed: details.onStepContinue,
              child: Text(primaryText),
            ),
          if (currentStep > 0 && onStepCancel != null)
            OutlinedButton(
              onPressed: details.onStepCancel,
              child: Text(cancelLabel),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final FabricThemeExtension tokens = context.fabricTokens;

    final Widget stepper = Stepper(
      key: ValueKey<StepperType>(type),
      elevation: 0,
      type: type,
      physics: physics,
      currentStep: currentStep,
      connectorThickness: connectorThickness,
      connectorColor: WidgetStateProperty.resolveWith<Color>((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.selected)) {
          return colorScheme.primary;
        }
        return tokens.borderColor;
      }),
      stepIconBuilder: stepIconBuilder,
      onStepTapped: onStepTapped,
      onStepContinue: onStepContinue,
      onStepCancel: onStepCancel,
      controlsBuilder: controlsBuilder ?? _buildDefaultControls,
      steps: List<Step>.generate(steps.length, (int index) {
        final FabricStep item = steps[index];
        final bool isActive = item.isActive ?? (currentStep >= index);
        final StepState resolvedState = _resolveStepState(index, item);

        return Step(
          isActive: isActive,
          state: resolvedState,
          label: item.label,
          title: DefaultTextStyle.merge(
            style: theme.textTheme.titleSmall?.copyWith(
              color: isActive ? colorScheme.onSurface : tokens.mutedForeground,
            ),
            child: item.title,
          ),
          subtitle: item.subtitle != null
              ? DefaultTextStyle.merge(
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: tokens.mutedForeground,
                  ),
                  child: item.subtitle!,
                )
              : null,
          content: Align(
            alignment: Alignment.centerLeft,
            child: DefaultTextStyle.merge(
              style: theme.textTheme.bodyMedium?.copyWith(
                color: tokens.mutedForeground,
              ),
              child: item.content,
            ),
          ),
        );
      }),
    );

    Widget result = type == StepperType.horizontal
        ? SizedBox(
            height: horizontalHeight,
            child: stepper,
          )
        : Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: stepper,
          );

    if (bordered) {
      result = Card(
        clipBehavior: Clip.antiAlias,
        child: result,
      );
    }

    if (margin != null) {
      result = Padding(
        padding: margin!,
        child: result,
      );
    }

    return result;
  }
}
