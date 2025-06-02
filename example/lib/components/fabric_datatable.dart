import 'package:flutter/material.dart';

class FabricDatatable extends StatefulWidget {
  const FabricDatatable({super.key});

  @override
  State<FabricDatatable> createState() => _FabricDatatableState();
}

class _FabricDatatableState extends State<FabricDatatable> {
  final List<bool> _selectedRows = List<bool>.generate(6, (index) => false);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DataTable(
        columns: const [
          DataColumn(
            label: Text('Select'),
          ),
          DataColumn(
            label: Text('Name'),
          ),
          DataColumn(
            label: Text('Age'),
          ),
          DataColumn(
            label: Text('Role'),
          ),
        ],
        rows: List<DataRow>.generate(
          6,
          (index) => DataRow(
            cells: [
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
              DataCell(Text(['Alice', 'Bob', 'Charlie', 'Diana', 'Eve', 'Frank'][index])),
              DataCell(Text(['25', '30', '35', '28', '40', '50'][index])),
              DataCell(Text(['Developer', 'Designer', 'Manager', 'Tester', 'Architect', 'Consultant'][index])),
            ],
          ),
        ),
      ),
    );
  }
}
