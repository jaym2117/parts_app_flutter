import 'package:flutter/material.dart';
import '../parts_form_list_input_field.dart';

class PartsSixBody extends StatelessWidget {
  final itemHandler;
  final bool inventoryItemYN, salesItemYN, purchaseItemYN;


  PartsSixBody({
    this.itemHandler,
    this.inventoryItemYN,
    this.salesItemYN,
    this.purchaseItemYN
});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: ListView(
        children: <Widget>[
          PartsFormListInputField(
            label: 'Inventory Item ?',
            value: inventoryItemYN == true ? 'Yes' : 'No',
            onClickHandler: () {itemHandler(context, ['Yes', 'No'], 'Inventory'); },
          ),
          PartsFormListInputField(
            label: 'Sales Item ?',
            value: salesItemYN == true ? 'Yes' : 'No',
            onClickHandler: () {itemHandler(context, ['Yes', 'No'], 'Sales'); },
          ),
          PartsFormListInputField(
            label: 'Purchase Item ?',
            value: purchaseItemYN == true ? 'Yes' : 'No',
            onClickHandler: () {itemHandler(context, ['Yes', 'No'], 'Purchasing'); },
          ),
        ],
      ),
    );
  }
}
