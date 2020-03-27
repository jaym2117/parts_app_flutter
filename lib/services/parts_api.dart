import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

const partsURL = 'http://192.168.1.64:5000/api/v1';


class PartsModel {
  Future<dynamic> signInUser({@required String emailAddress, @required String password}) async {
    Map bodyMap = {'email': emailAddress, 'password': password};
    var body = json.encode(bodyMap);
    var res = await http.post('$partsURL/auth', body: body, headers: {'Content-Type': 'application/json'});

    if (res.statusCode == 200) {
      String data = res.body;

      return jsonDecode(data);
    }
    print(res.statusCode);
  }

  Future<dynamic> authenticateUser({@required String token}) async {
    var res = await http.get('$partsURL/auth', headers: {'X-Auth-Token': token});

    if (res.statusCode == 200) {
      String data = res.body;

      return jsonDecode(data);
    }
    print(res.statusCode);
  }

  Future<dynamic> getParts({@required String token}) async {
    var res = await http.get('$partsURL/parts', headers: {'X-Auth-Token': token});

    if (res.statusCode == 200) {
      String data = res.body;

      return jsonDecode(data);
    }

    print(res.statusCode);
  }

  Future<dynamic> getCategories({@required String token}) async {
    var res = await http.get('$partsURL/category', headers: {'X-Auth-Token': token});

    if (res.statusCode == 200) {
      String data = res.body;

      return jsonDecode(data);
    }

    print(res.statusCode);
  }

  Future<dynamic> getSubcategories({@required String token}) async {
    var res = await http.get('$partsURL/subcategory', headers: {'X-Auth-Token': token});

    if (res.statusCode == 200) {
      String data = res.body;

      return jsonDecode(data);
    }

    print(res.statusCode);
  }

  Future<dynamic> getVendors({@required String token}) async {
    var res = await http.get('$partsURL/vendors', headers: {'X-Auth-Token': token});

    if (res.statusCode == 200) {
      String data = res.body;

      return jsonDecode(data);
    }

    print(res.statusCode);
  }

  Future<dynamic> getUOMs({@required String token}) async {
    var res = await http.get('$partsURL/UOM', headers: {'X-Auth-Token': token});

    if (res.statusCode == 200) {
    String data = res.body;

    return jsonDecode(data);
    }

    print(res.statusCode);
  }
}


