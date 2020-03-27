import 'package:flutter/material.dart';
import '../parts_form_list_input_field.dart';
import '../parts_form_text_field.dart';

class PartsFourBody extends StatelessWidget {
  final List<String> currencies;
  final double pricePer;
  final currency;
  final pricePerHandler, currencyHandler;

  PartsFourBody({
    this.currencies,
    this.pricePer,
    this.currency,
    this.pricePerHandler,
    this.currencyHandler
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: ListView(
        children: <Widget>[
          PartsFormTextField(
            keyboardType: TextInputType.number,
            value: '\$${pricePer.toString()}',
            label: 'Purchase Price Per Sales UOM',
            onChangeHandler: pricePerHandler,
          ),
          PartsFormListInputField(
            label: 'Currency',
            value: currency,
            onClickHandler: () {
              currencyHandler(context, currencies);
            },
          )
        ],
      ),
    );
  }
}