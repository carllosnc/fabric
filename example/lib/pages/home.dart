import 'package:example/components/neutral_banner.dart';
import 'package:example/components/neutral_button.dart';
import 'package:example/components/neutral_chip.dart';
import 'package:example/components/neutral_app_bar.dart';
import 'package:example/components/neutral_datatable.dart';
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
import 'package:example/components/neutral_icon_button.dart';
import 'package:example/components/neutral_menu_bar.dart';
import 'package:example/components/neutral_cards.dart';
import 'package:example/components/neutral_navigation_bar.dart';
import 'package:example/components/neutral_search_anchor.dart';
import 'package:example/components/neutral_text.dart';
import 'package:flutter/material.dart';
import 'package:neutral/neutral.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeutralAppBar(),
      drawer: CustomDrawer(),
      bottomNavigationBar: NeutralNavigationBar(),
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
                  Expanded(child: Container(width: 30, height: 130, color: stone.shade50)),
                  Expanded(child: Container(width: 30, height: 130, color: stone.shade100)),
                  Expanded(child: Container(width: 30, height: 130, color: stone.shade200)),
                  Expanded(child: Container(width: 30, height: 130, color: stone.shade300)),
                  Expanded(child: Container(width: 30, height: 130, color: stone.shade400)),
                  Expanded(child: Container(width: 30, height: 130, color: stone.shade500)),
                  Expanded(child: Container(width: 30, height: 130, color: stone.shade600)),
                  Expanded(child: Container(width: 30, height: 130, color: stone.shade700)),
                  Expanded(child: Container(width: 30, height: 130, color: stone.shade800)),
                  Expanded(child: Container(width: 30, height: 130, color: stone.shade900)),
                  Expanded(child: Container(width: 30, height: 130, color: stone.shade950)),
                ],
              ),
            ),
            Divider(),
            NeutralButton(),
            Divider(),
            NeutralSegmentButton(),
            Divider(),
            NeutralIconButton(),
            Divider(),
            NeutralFloatActionButton(),
            Divider(),
            NeutralSwitch(),
            Divider(),
            NeutralDatatable(),
            Divider(),
            NeutralChip(),
            Divider(),
            NeutralListTile(),
            Divider(),
            NeutralExpansionPanel(),
            Divider(),
            NeutralBanner(),
            Divider(),
            NeutralTextField(),
            Divider(),
            NeutralSlider(),
            Divider(),
            NeutralIndicators(),
            Divider(),
            NeutralCheckbox(),
            Divider(),
            NeutralText(),
            Divider(),
            NeutralRadioButton(),
            Divider(),
            NeutralCards(),
            Divider(),
            NeutralMenuBar(),
            Divider(),
            NeutralSearchAnchor(),
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
