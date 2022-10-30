import 'package:equatable/equatable.dart';
import 'package:food_delivery_app/models/category_model.dart';

class CategoryFilter extends Equatable {
final String id;
final Price category;
final bool value;

  CategoryFilter({
    required this.id, 
    required this.category, 
    required this.value});

  CategoryFilter copyWith({
      String? id,
      Price? category,
      bool? value,

  }) {
    return CategoryFilter(
      id: id ?? this.id, 
      category: category?? this.category, 
      value: value?? this.value);
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    category,
    value];

  static List<CategoryFilter> filters = Price.categories.map((category) => CategoryFilter(
    id: category.id, 
    category: category, 
    value: false)).toList();
}