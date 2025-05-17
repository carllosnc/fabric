import 'package:example/components/neutral_button.dart';
import 'package:example/components/neutral_chip.dart';
import 'package:example/components/neutral_app_bar.dart';
import 'package:example/components/neutral_drawer.dart';
import 'package:example/components/neutral_list_tyle.dart';
import 'package:example/components/neutral_switch.dart';
import 'package:example/components/neutral_text_field.dart';
import 'package:flutter/material.dart';
import 'package:neutral/neutral.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeutralAppBar(),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 25,
          children: [
            Container(
              color: Colors.red,
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(child: Container(width: 30, height: 130, color: neutralColor.shade50)),
                  Expanded(child: Container(width: 30, height: 130, color: neutralColor.shade100)),
                  Expanded(child: Container(width: 30, height: 130, color: neutralColor.shade200)),
                  Expanded(child: Container(width: 30, height: 130, color: neutralColor.shade300)),
                  Expanded(child: Container(width: 30, height: 130, color: neutralColor.shade400)),
                  Expanded(child: Container(width: 30, height: 130, color: neutralColor.shade500)),
                  Expanded(child: Container(width: 30, height: 130, color: neutralColor.shade600)),
                  Expanded(child: Container(width: 30, height: 130, color: neutralColor.shade700)),
                  Expanded(child: Container(width: 30, height: 130, color: neutralColor.shade800)),
                  Expanded(child: Container(width: 30, height: 130, color: neutralColor.shade900)),
                ],
              ),
            ),
            Divider(),
            NeutralButton(),
            Divider(),
            NeutralSwitch(),
            Divider(),
            NeutralChip(),
            Divider(),
            NeutralListTile(),
            Divider(),
            NeutralTextField(),
          ],
        ),
      ),
    );
  }
}
