import 'package:flutter/material.dart';

// Part Model
import '../../models/parts_model.dart';

// Part Body Components
import 'parts_one/parts_one_body.dart';
import 'parts_two/parts_two_body.dart';
import 'parts_three/parts_three_body.dart';
import 'parts_four/parts_four_body.dart';
import 'parts_five/parts_five_body.dart';
import 'parts_six/parts_six_body.dart';

// Part Footer Components
import 'parts_one/parts_one_footer.dart';
import 'parts_two/parts_two_footer.dart';
import 'parts_three/parts_three_footer.dart';
import 'parts_four/parts_four_footer.dart';
import 'parts_five/parts_five_footer.dart';
import 'parts_six/parts_six_footer.dart';

class PartsController {
  Widget partsBodyController(
      {int page,
        List<dynamic> categories,
        List<dynamic> subcategories,
        List<dynamic> vendors,
        List<dynamic> uoms,
        PartsState partsState,
        categoryHandler,
        subcategoryHandler,
        partsDescriptionHandler,
        vendorHandler,
        vendorPartHandler,
        locationHandler,
        purchaseUOMHandler,
        saleUOMHandler,
        inventoryUOMHandler,
        pricePerHandler,
        currencyHandler,
        msrpKnownHandler,
        msrpHandler,
        poHandler,
        itemHandler
      }) {
    if (partsState != null){
      List<dynamic> filterSubcategories = subcategories.where((sub) => sub['Category']['ID'] == partsState.category.id).toList();
      switch (page) {
        case 1:
          return PartsOneBody(
            categories: categories,
            subcategories: filterSubcategories,
            category: partsState.category,
            subcategory: partsState.subcategory,
            partsDescription: partsState.partsDescription,
            categoryHandler: categoryHandler,
            subcategoryHandler: subcategoryHandler,
            partsDescriptionHandler: partsDescriptionHandler
          );
        case 2:
          return PartsTwoBody(
              vendors: vendors,
              vendor: partsState.vendor,
              vendorPartNum: partsState.vendorPartNumber,
              location: partsState.location,
              vendorHandler: vendorHandler,
              vendorPartHandler: vendorPartHandler,
              locationHandler: locationHandler,
          );
        case 3:
          return PartsThreeBody(
            uoms: uoms,
            purchaseUOM: partsState.purchaseUOM,
            saleUOM: partsState.saleUOM,
            inventoryUOM: partsState.inventoryUOM,
            purchaseUOMHandler: purchaseUOMHandler,
            saleUOMHandler: saleUOMHandler,
            inventoryUOMHandler: inventoryUOMHandler,
          );
        case 4:
          return PartsFourBody(
            currency: partsState.currency,
            pricePer: partsState.pricePer,
            currencies: ['CAD', 'USD'],
            currencyHandler: currencyHandler,
            pricePerHandler: pricePerHandler,
          );
        case 5:
          return PartsFiveBody(
            msrpKnownYN: partsState.msrpKnownYN,
            msrp: partsState.msrp,
            initialPO: partsState.poNumber,
            msrpHandler: msrpHandler,
            msrpKnownHandler: msrpKnownHandler,
            poHandler: poHandler,
          );
        case 6:
          return PartsSixBody(
            inventoryItemYN: partsState.inventoryItemYN,
            purchaseItemYN: partsState.purchaseItemYN,
            salesItemYN: partsState.saleItemYN,
            itemHandler: itemHandler,
          );
        default:
          return Container();
      }
    } else {
      return Container();
    }
  }

  Widget partsFooterController(int page, nextPage, backPage, submitPart) {
    switch (page) {
      case 1:
        return PartsOneFooter(
          nextPage: nextPage,
        );
      case 2:
        return PartsTwoFooter(
          nextPage: nextPage,
          backPage: backPage,
        );
      case 3:
        return PartsThreeFooter(
            nextPage: nextPage,
            backPage: backPage
        );
      case 4:
        return PartsFourFooter(
            nextPage: nextPage,
            backPage: backPage
        );
      case 5:
        return PartsFiveFooter(
            nextPage: nextPage,
            backPage: backPage
        );
      case 6:
        return PartsSixFooter(
            backPage: backPage,
            submitPart: submitPart
        );
      default:
        return Container();
    }
  }
}