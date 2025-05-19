import 'package:flutter/material.dart';

class NeutralDatepicker extends StatefulWidget {
  const NeutralDatepicker({super.key});

  @override
  State<NeutralDatepicker> createState() => _NeutralDatepickerState();
}

class _NeutralDatepickerState extends State<NeutralDatepicker> {
  DateTime selectedDate = DateTime.now();
  DateTimeRange? selectedDateRange;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      helpText: 'Select a range of dates',
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
      child: Row(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FilledButton(
            onPressed: () => _selectDateRange(context),
            child: Text('Select a range of dates'),
          ),
          FilledButton(
            onPressed: () => _selectDate(context),
            child: Text('Select a date'),
          ),
        ],
      ),
    );
  }
}
