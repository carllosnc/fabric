import 'package:flutter/material.dart';

class FabricSlider extends StatefulWidget {
  const FabricSlider({super.key});

  @override
  State<FabricSlider> createState() => _FabricSliderState();
}

class _FabricSliderState extends State<FabricSlider> {
  double _basicValue = 0.35;
  double _customValue = 40.0;
  final double _disabledValue = 50.0;
  RangeValues _rangeValues = const RangeValues(20, 80);

  Widget _buildSliderGroup({
    required BuildContext context,
    required String label,
    required String valueText,
    required Widget slider,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(label, style: Theme.of(context).textTheme.labelMedium),
              Text(valueText, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: slider,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: <Widget>[
        _buildSliderGroup(
          context: context,
          label: 'Continuous',
          valueText: '${(_basicValue * 100).round()}%',
          slider: Slider(
            value: _basicValue,
            onChanged: (double value) {
              setState(() {
                _basicValue = value;
              });
            },
          ),
        ),
        _buildSliderGroup(
          context: context,
          label: 'Discrete (10 divisions)',
          valueText: '${_customValue.round()}',
          slider: Slider(
            value: _customValue,
            min: 0,
            max: 100,
            divisions: 10,
            label: _customValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                _customValue = value;
              });
            },
          ),
        ),
        _buildSliderGroup(
          context: context,
          label: 'Disabled',
          valueText: '${_disabledValue.round()}',
          slider: Slider(
            value: _disabledValue,
            min: 0,
            max: 100,
            onChanged: null,
          ),
        ),
        _buildSliderGroup(
          context: context,
          label: 'Range Slider',
          valueText: '${_rangeValues.start.round()} – ${_rangeValues.end.round()}',
          slider: RangeSlider(
            values: _rangeValues,
            min: 0,
            max: 100,
            labels: RangeLabels(
              _rangeValues.start.round().toString(),
              _rangeValues.end.round().toString(),
            ),
            onChanged: (RangeValues values) {
              setState(() {
                _rangeValues = values;
              });
            },
          ),
        ),
      ],
    );
  }
}
