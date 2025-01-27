import 'package:product_listing/core/model_to_entity_mapper/mapper.dart';
import 'package:product_listing/feature/home/data/models/category_model.dart';

class CategoryEntity extends Mapper<Category, CategoryEntity> {
  int? id;
  String? name;
  String? image;

  CategoryEntity({
    this.id,
    this.name,
    this.image,
  });

  @override
  CategoryEntity call(Category object) {
    return CategoryEntity(
      id: object.id,
      name: object.name,
      image: object.image,
    );
  }
}
