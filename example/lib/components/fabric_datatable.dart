import 'package:flutter/material.dart';

class FabricDatatable extends StatefulWidget {
  const FabricDatatable({super.key});

  @override
  State<FabricDatatable> createState() => _FabricDatatableState();
}

class _FabricDatatableState extends State<FabricDatatable> {
  final List<bool> _selectedRows = List<bool>.generate(6, (int index) => index == 0);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: DataTable(
        columns: const <DataColumn>[
          DataColumn(label: Text('Select')),
          DataColumn(label: Text('Name')),
          DataColumn(label: Text('Age')),
          DataColumn(label: Text('Role')),
        ],
        rows: List<DataRow>.generate(
          6,
          (int index) => DataRow(
            selected: _selectedRows[index],
            cells: <DataCell>[
              DataCell(
                Checkbox(
                  value: _selectedRows[index],
                  onChanged: (bool? value) {
                    setState(() {
                      _selectedRows[index] = value ?? false;
                    });
                  },
                ),
              ),
              DataCell(
                Text(
                  const <String>[
                    'Alice',
                    'Bob',
                    'Charlie',
                    'Diana',
                    'Eve',
                    'Frank',
                  ][index],
                ),
              ),
              DataCell(
                Text(
                  const <String>['25', '30', '35', '28', '40', '50'][index],
                ),
              ),
              DataCell(
                Text(
                  const <String>[
                    'Developer',
                    'Designer',
                    'Manager',
                    'Tester',
                    'Architect',
                    'Consultant',
                  ][index],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
