class CartItem {
  int? _id;
  String? _title;
  String? _description;
  String? _img;
  int? _quantity;
  double? _price;

  CartItem(
    int id,
    String title,
    String description,
    String img,
    double price,
    int quantity,
  ) {
    this._id = _id;
    this._title = title;
    this._description = description;
    this._img = img;
    this._quantity = quantity;
    this._price = price;
  }

  String get title => _title!;
  String get description => _description!;
  String get img => _img!;
  int get quantity => _quantity!;
  double get price => _price!;

  set quantity(int qty) => _quantity = qty;

  CartItem.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _title = json['title'];
    _description = json['description'];
    _img = json['img'];
    _quantity = json['quantity'];
    _price = json['price'];
  }
}
