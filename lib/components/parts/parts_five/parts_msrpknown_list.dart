import 'package:flutter/material.dart';
import '../../layout/dls_drawer.dart';
import '../../layout/dls_app_bar.dart';

class PartsMSRPKnownList extends StatelessWidget {
  final msrps;
  PartsMSRPKnownList(this.msrps);
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DLSDrawer(),
      appBar: DLSAppBar(_scaffoldKey),
      body: ListView.builder(
          itemCount: msrps.length,

          itemBuilder: (context, i){
            return msrps[i] != null ? ListTile(
              title: GestureDetector(
                  onTap: () {
                    Navigator.pop(context, msrps[i]);
                  },
                  child: Text(msrps[i])),
            ): Container(
              height: 0,
              width: 0,
            );
          }),
    );
  }
}