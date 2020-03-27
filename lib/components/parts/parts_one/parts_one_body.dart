import 'package:flutter/material.dart';
import '../parts_form_list_input_field.dart';
import '../parts_form_text_field.dart';




class PartsOneBody extends StatelessWidget {
  final categories;
  final subcategories;
  final category;
  final subcategory;
  final String partsDescription;
  final categoryHandler;
  final subcategoryHandler;
  final partsDescriptionHandler;


  PartsOneBody({
    this.categories,
    this.subcategories,
    this.category,
    this.subcategory,
    this.partsDescription,
    this.categoryHandler,
    this.subcategoryHandler,
    this.partsDescriptionHandler
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: ListView(
        children: <Widget>[
          PartsFormListInputField(
            label: 'Category *',
            value: category.description,
            onClickHandler: (){categoryHandler(context, categories);}
          ),
          PartsFormListInputField(
            label: 'Subcategory *',
            value: subcategory.description,
            onClickHandler: () {subcategoryHandler(context, subcategories);},
          ),
          PartsFormTextField(
            label: 'Part Description *',
            hintText: 'Enter the description of the part',
            value: partsDescription,
            onChangeHandler: partsDescriptionHandler,
          ),
        ],
      ),
    );
  }
}