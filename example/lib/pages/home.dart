import 'package:example/components/neutral_bottom_navigation_bar.dart';
import 'package:example/components/neutral_button.dart';
import 'package:example/components/neutral_chip.dart';
import 'package:example/components/neutral_app_bar.dart';
import 'package:example/components/neutral_drawer.dart';
import 'package:example/components/neutral_float_action_button.dart';
import 'package:example/components/neutral_list_tyle.dart';
import 'package:example/components/neutral_switch.dart';
import 'package:example/components/neutral_text_field.dart';
import 'package:example/components/neutral_dialog.dart';
import 'package:example/components/neutral_bottom_sheet.dart';
import 'package:example/components/neutral_slider.dart';
import 'package:example/components/neutral_indicators.dart';
import 'package:example/components/neutral_check_box.dart';
import 'package:example/components/neutral_radio_button.dart';
import 'package:example/components/neutral_time_picker.dart';
import 'package:example/components/neutral_date_picker.dart';
import 'package:example/components/neutral_segment_button.dart';
import 'package:example/components/neutral_expansion_panel.dart';
import 'package:example/components/neutral_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:neutral/neutral.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeutralAppBar(),
      drawer: CustomDrawer(),
      bottomNavigationBar: NeutralBottomNavigationBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 100, top: 5),
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
            NeutralSegmentButton(),
            Divider(),
            NeutralFloatActionButton(),
            Divider(),
            NeutralSwitch(),
            Divider(),
            NeutralChip(),
            Divider(),
            NeutralListTile(),
            Divider(),
            NeutralExpansionPanel(),
            Divider(),
            NeutralTextField(),
            Divider(),
            NeutralSlider(),
            Divider(),
            NeutralIndicators(),
            Divider(),
            NeutralCheckbox(),
            Divider(),
            NeutralRadioButton(),
            Divider(),
            NeutralTimePicker(),
            Divider(),
            NeutralDatepicker(),
            Divider(),
            NeutralDialog(),
            Divider(),
            NeutralBottomSheet(),
            Divider(),
            NeutralSnackbar(),
          ],
        ),
      ),
    );
  }
}
