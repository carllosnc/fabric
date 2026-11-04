import 'package:flutter/material.dart';

class FabricDatatable extends StatefulWidget {
  const FabricDatatable({super.key});

  @override
  State<FabricDatatable> createState() => _FabricDatatableState();
}

class _FabricDatatableState extends State<FabricDatatable> {
  final List<bool> _selectedRows =
      List<bool>.generate(6, (int index) => index == 0);

  static const List<Map<String, dynamic>> _teamMembers = <Map<String, dynamic>>[
    <String, dynamic>{
      'name': 'Alice Johnson',
      'role': 'Product Designer',
      'status': 'Active',
      'age': 25,
    },
    <String, dynamic>{
      'name': 'Bob Smith',
      'role': 'Lead Developer',
      'status': 'Active',
      'age': 30,
    },
    <String, dynamic>{
      'name': 'Charlie Brown',
      'role': 'Engineering Manager',
      'status': 'Busy',
      'age': 35,
    },
    <String, dynamic>{
      'name': 'Diana Prince',
      'role': 'QA Specialist',
      'status': 'Active',
      'age': 28,
    },
    <String, dynamic>{
      'name': 'Eve Adams',
      'role': 'Security Consultant',
      'status': 'Offline',
      'age': 40,
    },
    <String, dynamic>{
      'name': 'Frank Miller',
      'role': 'Solutions Architect',
      'status': 'Active',
      'age': 50,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: DataTable(
        showCheckboxColumn: true,
        onSelectAll: (bool? value) {
          setState(() {
            for (int i = 0; i < _selectedRows.length; i++) {
              _selectedRows[i] = value ?? false;
            }
          });
        },
        columns: const <DataColumn>[
          DataColumn(label: Text('Name')),
          DataColumn(label: Text('Role')),
          DataColumn(label: Text('Status')),
          DataColumn(label: Text('Age'), numeric: true),
        ],
        rows: List<DataRow>.generate(
          _teamMembers.length,
          (int index) {
            final Map<String, dynamic> member = _teamMembers[index];
            return DataRow(
              selected: _selectedRows[index],
              onSelectChanged: (bool? value) {
                setState(() {
                  _selectedRows[index] = value ?? false;
                });
              },
              cells: <DataCell>[
                DataCell(
                  Text(
                    member['name'] as String,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                DataCell(Text(member['role'] as String)),
                DataCell(Text(member['status'] as String)),
                DataCell(Text('${member['age']}')),
              ],
            );
          },
        ),
      ),
    );
  }
}
