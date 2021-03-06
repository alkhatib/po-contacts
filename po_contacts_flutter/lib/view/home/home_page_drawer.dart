import 'package:flutter/material.dart';
import 'package:po_contacts_flutter/assets/i18n.dart';
import 'package:po_contacts_flutter/controller/main_controller.dart';

class HomePageDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        top: true,
        bottom: false,
        left: false,
        right: false,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            ListTile(
              title: Text(I18n.getString(I18n.string.export_all_as_vcf)),
              onTap: () {
                MainController.get().startExportAllAsVCF();
              },
            ),
            ListTile(
              title: Text(I18n.getString(I18n.string.about, MainController.get().model.appVersion)),
              onTap: () {
                MainController.get().showAboutDialog();
              },
            ),
          ],
        ),
      ),
    );
  }
}
