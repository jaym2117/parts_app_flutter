import 'package:flutter/material.dart';
import '../parts_form_list_input_field.dart';
import '../parts_form_text_field.dart';

class PartsTwoBody extends StatelessWidget {
  final vendors;
  final vendor;
  final vendorHandler;
  final vendorPartNum;
  final vendorPartHandler;
  final location;
  final locationHandler;

  PartsTwoBody({
    this.vendors,
    this.vendor,
    this.vendorHandler,
    this.vendorPartNum,
    this.vendorPartHandler,
    this.location,
    this.locationHandler
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: ListView(
        children: <Widget>[
          PartsFormListInputField(
            label: 'Vendor *',
            value: '${vendor.id} - ${vendor.name}',
            onClickHandler: () {vendorHandler(context, vendors);},
          ),
          PartsFormTextField(
            label: 'Vendor Part # *',
            value: vendorPartNum,
            hintText: 'Enter the vendor\'s part number',
            onChangeHandler: vendorPartHandler,
          ),
          PartsFormTextField(
            label: 'Location',
            value: location,
            hintText: 'Enter the parts location',
            onChangeHandler: locationHandler,
          ),
        ],
      ),
    );
  }
}