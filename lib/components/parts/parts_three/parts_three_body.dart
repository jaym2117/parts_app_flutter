import 'package:flutter/material.dart';
import '../parts_form_list_input_field.dart';

class PartsThreeBody extends StatelessWidget {
  final uoms;
  final purchaseUOM, saleUOM, inventoryUOM;
  final purchaseUOMHandler, saleUOMHandler,inventoryUOMHandler;

  PartsThreeBody({
    this.uoms,
    this.purchaseUOM,
    this.saleUOM,
    this.inventoryUOM,
    this.purchaseUOMHandler,
    this.saleUOMHandler,
    this.inventoryUOMHandler
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: ListView(
        children: <Widget>[
          PartsFormListInputField(
            label: 'Purchase UOM *',
            value: purchaseUOM.unitDescription,
            onClickHandler: () {purchaseUOMHandler(context, uoms);
            },
          ),
          PartsFormListInputField(
            label: 'Sales UOM *',
            value: saleUOM.unitDescription,
            onClickHandler: () {
              saleUOMHandler(context, uoms);
            },
          ),
          PartsFormListInputField(
            label: 'Inventory UOM *',
            value: inventoryUOM.unitDescription,
            onClickHandler: () {
              inventoryUOMHandler(context, uoms);
            },
          ),
        ],
      ),
    );
  }
}