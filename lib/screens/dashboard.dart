import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../screens/new_part.dart';

import '../components/layout/dls_bottom_navigation.dart';
import '../components/layout/dls_drawer.dart';
import '../components/layout/dls_app_bar.dart';
import '../components/dls_card.dart';

import '../services/parts_api.dart';
import '../models/user.dart';

class DashboardScreen extends StatefulWidget {
  static String id = 'dashboard_screen';
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;
  int awaitingApproval = 0;
  var parts = [];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int partsAwaitingApproval(dynamic parts){
    dynamic filteredParts = parts.where((part) => part['ApprovedYN'] == 'N');

    return filteredParts.length;
  }

  Future<dynamic> loadParts() async {
    var results = await PartsModel().getParts(token: await FlutterSecureStorage().read(key: 'X-Auth-Token'));

    setState(() {
      parts = results;
      awaitingApproval = partsAwaitingApproval(parts);
    });

  }

  @override
  void initState() {
    super.initState();

    loadParts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DLSDrawer(),
        appBar: DLSAppBar(_scaffoldKey),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
          child: ListView(
            children: <Widget>[
              DLSCard(
                  cardTitle: 'Part Request',
                  cardInfo: 'Request a new part to be added to the system',
                  img: AssetImage('images/file.png'),
                  onTapHandler: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => NewPartScreen()));
                  }
              ),
              DLSCard(
                  cardTitle: 'Approve Parts',
                  cardInfo: 'There are $awaitingApproval parts awaiting approval',
                  img: AssetImage('images/stamp.png'),
                  onTapHandler: () {
                    print('Clicked on Approve Parts');
                    }
              ),
            ],
          ),
        ),
        bottomNavigationBar: DLSBottomNav(
            selectedIndex: _selectedIndex, onItemTapped: _onItemTapped));
  }
}


