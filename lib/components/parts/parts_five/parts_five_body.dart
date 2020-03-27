import 'package:flutter/material.dart';
import '../parts_form_list_input_field.dart';
import '../parts_form_text_field.dart';

class PartsFiveBody extends StatelessWidget {
  final msrpKnownYN, msrp, initialPO;
  final msrpKnownHandler, msrpHandler, poHandler;

  PartsFiveBody({
    this.msrpKnownYN,
    this.msrp,
    this.initialPO,
    this.msrpKnownHandler,
    this.msrpHandler,
    this.poHandler
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: ListView(
        children: <Widget>[
          PartsFormListInputField(
            label: 'MSRP Known ?',
            value: msrpKnownYN,
            onClickHandler: () {msrpKnownHandler(context, ['Yes', 'No']); },
          ),
          PartsFormTextField(
            label: 'MSRP',
            enabled: msrpKnownYN == 'Yes' ? true : false,
            keyboardType: TextInputType.number,
            value: msrpKnownYN == 'No' ? "":"\$$msrp",
            onChangeHandler: msrpHandler,
          ),
          PartsFormTextField(
            label: 'Initial Purchase Order #',
            hintText: "Enter the inital PO #",
            value: initialPO,
            onChangeHandler: poHandler,
          ),
        ],
      ),
    );
  }
}
