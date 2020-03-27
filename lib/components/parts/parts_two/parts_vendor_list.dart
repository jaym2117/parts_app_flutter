import 'package:flutter/material.dart';
import '../../layout/dls_drawer.dart';
import '../../layout/dls_app_bar.dart';

class PartsVendorList extends StatelessWidget {
  final vendors;
  PartsVendorList(this.vendors);
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DLSDrawer(),
      appBar: DLSAppBar(_scaffoldKey),
      body: ListView.builder(
          itemCount: vendors.length,

          itemBuilder: (context, i){
            return vendors[i] != null ? ListTile(
              title: GestureDetector(
                  onTap: () {
                    Navigator.pop(context, vendors[i]);
                  },
                  child: Text('${vendors[i]['CardCode']} - ${vendors[i]['CardName']}')),
            ): Container(
              height: 0,
              width: 0,
            );
          }),
    );
  }
}