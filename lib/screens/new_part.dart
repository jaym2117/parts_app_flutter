import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:parts_app_flutter/components/parts/parts_five/parts_msrpknown_list.dart';
import 'package:parts_app_flutter/components/parts/parts_four/parts_currency_list.dart';
import 'package:parts_app_flutter/components/parts/parts_six/parts_item_list.dart';
import 'package:parts_app_flutter/components/parts/parts_three/parts_uom_list.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../services/parts_api.dart';
import '../models/parts_model.dart';

import '../components/layout/dls_drawer.dart';
import '../components/layout/dls_app_bar.dart';
import '../components/parts/parts_controller.dart';
import '../components/parts/parts_one/parts_category_list.dart';
import '../components/parts/parts_one/parts_subcategory_list.dart';
import '../components/parts/parts_two/parts_vendor_list.dart';

class NewPartScreen extends StatefulWidget {
  static String id = 'new_part_screen';
  @override
  _NewPartScreenState createState() => _NewPartScreenState();
}

class _NewPartScreenState extends State<NewPartScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final PartsController pc = PartsController();

  var categories = [];
  var subcategories = [];
  var vendors = [];
  var uoms = [];

  var partsState = PartsState(
      category: Category(id: 1, description: 'Milking'),
      subcategory: Subcategory(
          id: 1,
          description: 'Robot',
          category: Category(id: 1, description: 'Milking')),
      partsDescription: '',
      vendor: Vendor(id: 'V5364', name: 'GEA Farm Technologies'),
      vendorPartNumber: '',
      location: '',
      purchaseUOM: UOM(id: 1, unitDescription: 'EA'),
      saleUOM: UOM(id: 1, unitDescription: 'EA'),
      inventoryUOM: UOM(id: 1, unitDescription: 'EA'),
      pricePer: 0,
      currency: 'CAD',
      msrpKnownYN: 'No',
      msrp: 0,
      poNumber: '',
      saleItemYN: false,
      inventoryItemYN: false,
      purchaseItemYN: false);

  int page = 1;

  void categoryHandler(BuildContext context, categories) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => PartsCategoryList(categories)));

    setState(() {
      partsState.category =
          new Category(id: result['ID'], description: result['Category']);
      var filteredSubs = subcategories
          .where((sub) => sub['Category']['ID'] == partsState.category.id)
          .toList();
      if (partsState.subcategory.category.id != partsState.category.id) {
        partsState.subcategory = new Subcategory(
            id: filteredSubs[0]['ID'],
            description: filteredSubs[0]['Subcategory'],
            category: partsState.category);
      }
    });
  }

  void subcategoryHandler(BuildContext context, subcategories) async {
    var result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PartsSubcategoryList(subcategories)));
    setState(() {
      partsState.subcategory = Subcategory(
          id: result['ID'],
          description: result['Subcategory'],
          category: partsState.category);
    });
  }

  void partsDescriptionHandler(String val) {
    setState(() {
      partsState.partsDescription = val;
    });
  }

  void vendorHandler(BuildContext context, vendors) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => PartsVendorList(vendors)));

    setState(() {
      partsState.vendor =
          Vendor(id: result['CardCode'], name: result['CardName']);
    });
  }

  void vendorPartHandler(String val) {
    setState(() {
      partsState.vendorPartNumber = val;
    });
  }

  void locationHandler(String val) {
    setState(() {
      partsState.location = val;
    });
  }

  void purchaseUOMHandler(BuildContext context, uoms) async {
    var result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => PartsUOMList(uoms)));

    setState(() {
      partsState.purchaseUOM =
          UOM(id: result['ID'], unitDescription: result['UOM']);
    });
  }

  void saleUOMHandler(BuildContext context, uoms) async {
    var result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => PartsUOMList(uoms)));

    setState(() {
      partsState.saleUOM =
          UOM(id: result['ID'], unitDescription: result['UOM']);
    });
  }

  void inventoryUOMHandler(BuildContext context, uoms) async {
    var result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => PartsUOMList(uoms)));

    setState(() {
      partsState.inventoryUOM =
          UOM(id: result['ID'], unitDescription: result['UOM']);
    });
  }

  void pricePerHandler(String val) {
    double newVal = double.parse(val.substring(1));
    setState(() {
      partsState.pricePer = newVal;
    });
  }

  void currencyHandler(BuildContext context, currencies) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => PartsCurrencyList(currencies)));

    setState(() {
      partsState.currency = result;
    });
  }

  void msrpKnownHandler(BuildContext context, msrps) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => PartsMSRPKnownList(msrps)));

    setState(() {
      partsState.msrpKnownYN = result;
    });
  }

  void msrpHandler(String val) {
    double newVal = double.parse(val.substring(1));
    setState(() {
      partsState.msrp = newVal;
    });
  }

  void poHandler(String val) {
    setState(() {
      partsState.poNumber = val;
    });
  }

  void itemHandler(BuildContext context, items, String type) async {
    var result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => ItemsList(items)));
    bool newVal = result == 'Yes' ? true : false;
    if (type == 'Inventory') {
      setState(() {
        partsState.inventoryItemYN = newVal;
      });
    } else if (type == 'Sales') {
      setState(() {
        partsState.saleItemYN = newVal;
      });
    } else if (type == 'Purchasing') {
      setState(() {
        partsState.purchaseItemYN = newVal;
      });
    }
  }

  void _errorAlert(context, title, desc) {
    Alert(
        context: context,
        type: AlertType.error,
        title: title,
        desc: desc,
        buttons: [
          DialogButton(
            color: Colors.red,
            child: Text(
              'Ok',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ]).show();
  }

  @override
  void initState() {
    super.initState();
    getCategories();
    getSubcategories();
    getVendors();
    getUOMs();
  }

  Future<dynamic> getCategories() async {
    var results = await PartsModel().getCategories(
        token: await FlutterSecureStorage().read(key: 'X-Auth-Token'));

    if (results != null) {
      setState(() {
        categories = results;
      });
    }
  }

  Future<dynamic> getSubcategories() async {
    var results = await PartsModel().getSubcategories(
        token: await FlutterSecureStorage().read(key: 'X-Auth-Token'));

    setState(() {
      subcategories = results;
    });
  }

  Future<dynamic> getVendors() async {
    var results = await PartsModel().getVendors(
        token: await FlutterSecureStorage().read(key: 'X-Auth-Token'));
    setState(() {
      vendors = results;
    });
  }

  Future<dynamic> getUOMs() async {
    var results = await PartsModel()
        .getUOMs(token: await FlutterSecureStorage().read(key: 'X-Auth-Token'));
    setState(() {
      uoms = results;
    });
  }

  void nextPage() {
    switch (page) {
      case 1:
        if (partsState.partsDescription == '') {
          _errorAlert(context, 'Empty Part Description',
              'Please enter a part description.');
        } else {
          setState(() {
            page++;
          });
        }
        break;
      case 2:
        if (partsState.vendorPartNumber == '') {
          _errorAlert(context, 'Empty Vendor Part Number',
              'Please enter the Part Number on the Vendor\'s PO.');
        } else {
          setState(() {
            page++;
          });
        }
        break;
      case 4:
        if (partsState.pricePer <= 0) {
          _errorAlert(context, 'Invalid Purchase Price',
              'Please enter a valid Purchase Price');
        } else {
          setState(() {
            page++;
          });
        }
        break;
      case 5:
        if (partsState.poNumber == '') {
          _errorAlert(context, 'Missing PO Number',
              'Please enter an initial PO Number');
        } else {
          setState(() {
            page++;
          });
        }
        break;
      default:
        setState(() {
          page++;
        });
    }
  }

  void backPage() {
    setState(() {
      page--;
    });
  }

  void submitPart() {
    print('submitted');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DLSDrawer(),
        appBar: DLSAppBar(_scaffoldKey),
        body: Container(
          color: Color(0xFFEEEEEE),
          child: Container(
            margin: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey, width: 1)),
            child: Column(
              children: <Widget>[
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: <Widget>[
                          Image(
                            image: AssetImage('images/file.png'),
                            width: 50.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: Text(
                              'Parts Request',
                              style: TextStyle(
                                  color: Color(0xFF195532),
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 3.0),
                            ),
                          )
                        ],
                      ),
                    )),
                pc.partsBodyController(
                    page: page,
                    categories: categories,
                    subcategories: subcategories,
                    vendors: vendors,
                    uoms: uoms,
                    partsState: partsState,
                    categoryHandler: categoryHandler,
                    subcategoryHandler: subcategoryHandler,
                    partsDescriptionHandler: partsDescriptionHandler,
                    vendorHandler: vendorHandler,
                    vendorPartHandler: vendorPartHandler,
                    locationHandler: locationHandler,
                    purchaseUOMHandler: purchaseUOMHandler,
                    saleUOMHandler: saleUOMHandler,
                    inventoryUOMHandler: inventoryUOMHandler,
                    pricePerHandler: pricePerHandler,
                    currencyHandler: currencyHandler,
                    msrpHandler: msrpHandler,
                    msrpKnownHandler: msrpKnownHandler,
                    poHandler: poHandler,
                    itemHandler: itemHandler),
                pc.partsFooterController(page, nextPage, backPage, submitPart)
              ],
            ),
          ),
        ));
  }
}
