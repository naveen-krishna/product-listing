import 'package:product_listing/core/model_to_entity_mapper/mapper.dart';
import 'package:product_listing/feature/home/data/models/category_model.dart';
import 'package:product_listing/feature/home/data/models/product_model.dart';

class ProductEntity extends Mapper<ProductModel, ProductEntity> {
  String? title;
  int? price;
  String? description;
  List<String>? images;
  DateTime? creationAt;
  DateTime? updatedAt;
  Category? category;

  ProductEntity({
    this.title,
    this.price,
    this.description,
    this.images,
    this.creationAt,
    this.updatedAt,
    this.category,
  });

  @override
  ProductEntity call(ProductModel object) {
    return ProductEntity(
      title: object.title,
      price: object.price,
      description: object.description,
      images: object.images,
      creationAt: object.creationAt,
      updatedAt: object.updatedAt,
      category: object.category,
    );
  }
}
