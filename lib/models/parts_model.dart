class PartsState {
  Category category;
  Subcategory subcategory;
  String partsDescription;
  Vendor vendor;
  String vendorPartNumber;
  String location;
  UOM purchaseUOM;
  UOM saleUOM;
  UOM inventoryUOM;
  double pricePer;
  String currency;
  String msrpKnownYN;
  double msrp;
  String poNumber;
  bool saleItemYN;
  bool inventoryItemYN;
  bool purchaseItemYN;
  User submittedBy;
  String submittedDate;

  PartsState({
    this.category,
    this.subcategory,
    this.partsDescription,
    this.vendor,
    this.vendorPartNumber,
    this.location,
    this.purchaseUOM,
    this.saleUOM,
    this.inventoryUOM,
    this.pricePer,
    this.currency,
    this.msrpKnownYN,
    this.msrp,
    this.poNumber,
    this.saleItemYN,
    this.inventoryItemYN,
    this.purchaseItemYN,
    this.submittedBy,
    this.submittedDate
  });

}


class Category {
  int id;
  String description;

  Category({this.id, this.description});
}

class Subcategory {
  final int id;
  final String description;
  final Category category;
  Subcategory({this.id, this.description, this.category});

}

class Vendor {
  final String id;
  final String name;

  Vendor({this.id, this.name});
}


class UOM {
  final int id;
  final String unitDescription;

  UOM({this.id, this.unitDescription});
}


class User {
  final int id;
  final String email;

  User({this.id, this.email});
}