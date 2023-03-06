import '../type/t_category.dart';

List<TCategory> getCategoryList(dataSource) {
  if (dataSource == null) {
    return [];
  }

  return (dataSource as List<dynamic>).map<TCategory>((category) {
    return TCategory(
      id: category['id'],
      label: category['name'],
      icon: category['icon'],
      priority: category['priority'],
      achieveRate: category['achieveRate'],
    );
  }).toList();
}
