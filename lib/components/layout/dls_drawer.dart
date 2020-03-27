import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:parts_app_flutter/screens/dashboard.dart';
import 'package:parts_app_flutter/screens/loading.dart';
import 'package:parts_app_flutter/screens/new_part.dart';

class DLSDrawer extends StatelessWidget {

  void logoutUser(context) async {
    final storage = new FlutterSecureStorage();
    await storage.delete(key: 'X-Auth-Token');
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoadingScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home Screen'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardScreen()));
              },
            ),
            Opacity(
              opacity: 0.15,
              child: Container(
                height: 1.0,
                margin: EdgeInsets.only(left: 20.0),
                width: double.infinity,
                color: Colors.grey,
              ),
            ),
            ListTile(
              leading: Icon(Icons.build),
              title: Text('Request A New Part'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => NewPartScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.check_box),
              title: Text('Approve Parts'),
              onTap: () {
                print('Approve Parts Screen');
                Navigator.pop(context);
              },
            ),
            Opacity(
              opacity: 0.15,
              child: Container(
                height: 1.0,
                margin: EdgeInsets.only(left: 20.0),
                width: double.infinity,
                color: Colors.grey,
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('My Profile'),
              onTap: () {
                print('Profile Screen');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                print('Settings Screen');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings_backup_restore),
              title: Text('Admin'),
              onTap: () {
                print('Admin Screen');
                Navigator.pop(context);
              },
            ),
            Opacity(
              opacity: 0.15,
              child: Container(
                height: 1.0,
                margin: EdgeInsets.only(left: 20.0),
                width: double.infinity,
                color: Colors.grey,
              ),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () {
                logoutUser(context);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}