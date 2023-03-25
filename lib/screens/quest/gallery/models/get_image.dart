import 't_gallery.dart';

List<TGallery> getGalleryList(dataSource) {
  if (dataSource == null) {
    return [];
  }

  return (dataSource as List<dynamic>).map<TGallery>((dynamic item) {
    return TGallery(
      id: item['id'] ?? 0,
      submitDate: item['submitDate'] ?? '',
      image: item['image'] ?? '',
    );
  }).toList();
}
