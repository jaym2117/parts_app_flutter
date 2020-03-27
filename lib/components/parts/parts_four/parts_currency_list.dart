import 'package:flutter/material.dart';
import '../../layout/dls_drawer.dart';
import '../../layout/dls_app_bar.dart';

class PartsCurrencyList extends StatelessWidget {
  final currencies;
  PartsCurrencyList(this.currencies);
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DLSDrawer(),
      appBar: DLSAppBar(_scaffoldKey),
      body: ListView.builder(
          itemCount: currencies.length,

          itemBuilder: (context, i){
            return currencies[i] != null ? ListTile(
              title: GestureDetector(
                  onTap: () {
                    Navigator.pop(context, currencies[i]);
                  },
                  child: Text(currencies[i])),
            ): Container(
              height: 0,
              width: 0,
            );
          }),
    );
  }
}