import 'package:flutter/material.dart';

class FabricSlider extends StatefulWidget {
  const FabricSlider({super.key});

  @override
  State<FabricSlider> createState() => _FabricSliderState();
}

class _FabricSliderState extends State<FabricSlider> {
  double _basicValue = 0.0;
  double _customValue = 20.0;
  final double _disabledValue = 50.0;
  RangeValues _rangeValues = const RangeValues(20, 80);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Slider(
          value: _basicValue,
          onChanged: (value) {
            setState(() {
              _basicValue = value;
            });
          },
        ),
        Text('Basic Value: ${_basicValue.toStringAsFixed(2)}'),
        Slider(
          value: _customValue,
          min: 0,
          max: 100,
          divisions: 10,
          label: _customValue.round().toString(),
          onChanged: (value) {
            setState(() {
              _customValue = value;
            });
          },
        ),
        Text('Custom Value: ${_customValue.round()}'),
        Slider(
          value: _disabledValue,
          min: 0,
          max: 100,
          onChanged: null, // This makes the slider disabled
        ),
        Text('Disabled Value: ${_disabledValue.round()}'),
        RangeSlider(
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
        Text('Range: ${_rangeValues.start.round()} - ${_rangeValues.end.round()}'),
      ],
    );
  }
}
