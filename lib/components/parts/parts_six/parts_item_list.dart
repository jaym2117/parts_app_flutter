import 'package:flutter/material.dart';
import '../../layout/dls_drawer.dart';
import '../../layout/dls_app_bar.dart';

class ItemsList extends StatelessWidget {
  final items;
  ItemsList(this.items);
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DLSDrawer(),
      appBar: DLSAppBar(_scaffoldKey),
      body: ListView.builder(
          itemCount: items.length,

          itemBuilder: (context, i){
            return items[i] != null ? ListTile(
              title: GestureDetector(
                  onTap: () {
                    Navigator.pop(context, items[i]);
                  },
                  child: Text(items[i])),
            ): Container(
              height: 0,
              width: 0,
            );
          }),
    );
  }
}