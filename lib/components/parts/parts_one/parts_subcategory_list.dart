import 'package:flutter/material.dart';
import '../../layout/dls_drawer.dart';
import '../../layout/dls_app_bar.dart';

class PartsSubcategoryList extends StatelessWidget {
  final subcategories;
  PartsSubcategoryList(this.subcategories);
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DLSDrawer(),
      appBar: DLSAppBar(_scaffoldKey),
      body: ListView.builder(
          itemCount: subcategories.length,

          itemBuilder: (context, i){
            return subcategories[i] != null ? ListTile(
              title: GestureDetector(
                  onTap: () {
                    Navigator.pop(context, subcategories[i]);
                  },
                  child: Text(subcategories[i]['Subcategory'])),
            ): Container(
              height: 0,
              width: 0,
            );
          }),
    );
  }
}
