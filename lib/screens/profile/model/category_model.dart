class CategoryModel {
  String name = "";
  String icon = "";

  CategoryModel();

  CategoryModel.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        icon = json["icon"];
}

CategoryModel categoryModel(Object? json) {
  return (json == null
      ? CategoryModel()
      : CategoryModel.fromJson(json as Map<String, dynamic>));
}

List<CategoryModel?> categoryList(Object? json) {
  return (json == null
      ? []
      : (json as List<dynamic>).map((elem) {
          return categoryModel(elem);
        }).toList());
}
