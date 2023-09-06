import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
part 'product.g.dart';

@JsonSerializable()
class Product extends Equatable {
  final int? userId;
  final int? id;
  final String? title;

  const Product({ this.id,  this.title,  this.userId});

  @override
  List<Object?> get props => [id, userId, id];

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  factory Product.withDefaults() => const Product(id: null, title: null, userId: null);

}
