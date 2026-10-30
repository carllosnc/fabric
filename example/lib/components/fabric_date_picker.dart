import 'package:flutter/material.dart';

class FabricDatepicker extends StatefulWidget {
  const FabricDatepicker({super.key});

  @override
  State<FabricDatepicker> createState() => _FabricDatepickerState();
}

class _FabricDatepickerState extends State<FabricDatepicker> {
  DateTime selectedDate = DateTime.now();
  DateTimeRange? selectedDateRange;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      helpText: 'Select a date',
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectDateRange(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      helpText: 'Select a range of dates',
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDateRange: selectedDateRange ??
          DateTimeRange(
            start: DateTime.now(),
            end: DateTime.now().add(const Duration(days: 7)),
          ),
    );
    if (picked != null) {
      setState(() {
        selectedDateRange = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: <Widget>[
          FilledButton(
            onPressed: () => _selectDateRange(context),
            child: const Text('Select a range of dates'),
          ),
          FilledButton(
            onPressed: () => _selectDate(context),
            child: const Text('Select a date'),
          ),
        ],
      ),
    );
  }
}
