class Categories {
  static Map<String, Category> _cats = {"ALL": Category(categoryName: "ALL")};

  static Map<String, Category> get cats => _cats;
}

class Category {
  String? categoryName;

  Category({
    this.categoryName,
  });

  Category.fromJson(String category) {
    categoryName = category;
  }
}
