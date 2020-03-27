import 'package:flutter/material.dart';
import '../../layout/dls_drawer.dart';
import '../../layout/dls_app_bar.dart';

class PartsCategoryList extends StatelessWidget {
  final categories; 
  PartsCategoryList(this.categories); 
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DLSDrawer(),
      appBar: DLSAppBar(_scaffoldKey),
      body: ListView.builder(
          itemCount: categories.length,

          itemBuilder: (context, i){
            return categories[i] != null ? ListTile(
              title: GestureDetector(
                  onTap: () {
                    Navigator.pop(context, categories[i]);
                  },
                  child: Text(categories[i]['Category'])),
            ): Container(
              height: 0,
              width: 0,
            );
          }),
    );
  }
}
