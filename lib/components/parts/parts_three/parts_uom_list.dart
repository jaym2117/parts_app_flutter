import 'package:flutter/material.dart';
import '../../layout/dls_drawer.dart';
import '../../layout/dls_app_bar.dart';

class PartsUOMList extends StatelessWidget {
  final uoms;
  PartsUOMList(this.uoms);
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DLSDrawer(),
      appBar: DLSAppBar(_scaffoldKey),
      body: ListView.builder(
          itemCount: uoms.length,

          itemBuilder: (context, i){
            return uoms[i] != null ? ListTile(
              title: GestureDetector(
                  onTap: () {
                    Navigator.pop(context, uoms[i]);
                  },
                  child: Text(uoms[i]['UOM'])),
            ): Container(
              height: 0,
              width: 0,
            );
          }),
    );
  }
}