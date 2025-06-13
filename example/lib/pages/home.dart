import 'package:example/components/fabric_banner.dart';
import 'package:example/components/fabric_bottom_navigation_bar.dart';
import 'package:example/components/fabric_button.dart';
import 'package:example/components/fabric_chip.dart';
import 'package:example/components/fabric_app_bar.dart';
import 'package:example/components/fabric_datatable.dart';
import 'package:example/components/fabric_drawer.dart';
import 'package:example/components/fabric_float_action_button.dart';
import 'package:example/components/fabric_list_tyle.dart';
import 'package:example/components/fabric_switch.dart';
import 'package:example/components/fabric_text_field.dart';
import 'package:example/components/fabric_dialog.dart';
import 'package:example/components/fabric_bottom_sheet.dart';
import 'package:example/components/fabric_slider.dart';
import 'package:example/components/fabric_indicators.dart';
import 'package:example/components/fabric_check_box.dart';
import 'package:example/components/fabric_radio_button.dart';
import 'package:example/components/fabric_time_picker.dart';
import 'package:example/components/fabric_date_picker.dart';
import 'package:example/components/fabric_segment_button.dart';
import 'package:example/components/fabric_expansion_panel.dart';
import 'package:example/components/fabric_snackbar.dart';
import 'package:example/components/fabric_icon_button.dart';
import 'package:example/components/fabric_menu_bar.dart';
import 'package:example/components/fabric_cards.dart';
import 'package:example/components/fabric_navigation_bar.dart';
import 'package:example/components/fabric_search_anchor.dart';
import 'package:example/components/fabric_text.dart';
import 'package:flutter/material.dart';
import 'package:fabric/fabric.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FabricAppBar(),
      drawer: CustomDrawer(),
      bottomNavigationBar: FabricNavigationBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 100, top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 25,
          children: [
            SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(child: Container(width: 30, height: 130, color: fabricConfig.color.shade50)),
                  Expanded(child: Container(width: 30, height: 130, color: fabricConfig.color.shade100)),
                  Expanded(child: Container(width: 30, height: 130, color: fabricConfig.color.shade200)),
                  Expanded(child: Container(width: 30, height: 130, color: fabricConfig.color.shade300)),
                  Expanded(child: Container(width: 30, height: 130, color: fabricConfig.color.shade400)),
                  Expanded(child: Container(width: 30, height: 130, color: fabricConfig.color.shade500)),
                  Expanded(child: Container(width: 30, height: 130, color: fabricConfig.color.shade600)),
                  Expanded(child: Container(width: 30, height: 130, color: fabricConfig.color.shade700)),
                  Expanded(child: Container(width: 30, height: 130, color: fabricConfig.color.shade800)),
                  Expanded(child: Container(width: 30, height: 130, color: fabricConfig.color.shade900)),
                  Expanded(child: Container(width: 30, height: 130, color: fabricConfig.color.shade950)),
                ],
              ),
            ),
            Divider(),
            FabricButton(),
            Divider(),
            FabricSegmentButton(),
            Divider(),
            FabricIconButton(),
            Divider(),
            FabricFloatActionButton(),
            Divider(),
            FabricSwitch(),
            Divider(),
            FabricDatatable(),
            Divider(),
            FabricChip(),
            Divider(),
            FabricListTile(),
            Divider(),
            FabricExpansionPanel(),
            Divider(),
            FabricBanner(),
            Divider(),
            FabricTextField(),
            Divider(),
            FabricBottomNavigationBar(),
            Divider(),
            FabricSlider(),
            Divider(),
            FabricIndicators(),
            Divider(),
            FabricCheckbox(),
            Divider(),
            FabricText(),
            Divider(),
            FabricRadioButton(),
            Divider(),
            FabricCards(),
            Divider(),
            FabricMenuBar(),
            Divider(),
            FabricSearchAnchor(),
            Divider(),
            FabricTimePicker(),
            Divider(),
            FabricDatepicker(),
            Divider(),
            FabricDialog(),
            Divider(),
            FabricBottomSheet(),
            Divider(),
            FabricSnackbar(),
          ],
        ),
      ),
    );
  }
}
