// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel()
  ..title = json['title'] as String?
  ..name = json['name'] as String?
  ..kacKisilik = json['kacKisilik'] as String?
  ..hazirlanmaSuresi = json['hazirlanmaSuresi'] as String?
  ..pisirmeSuresi = json['pisirmeSuresi'] as String?
  ..malzemeler = json['malzemeler'] as String?
  ..hazirlanisi = json['hazirlanisi'] as String?
  ..kategori = json['kategori'] as String?
  ..img = json['img'] as String?
  ..favorite = json['favorite'] as int?;

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'name': instance.name,
      'kacKisilik': instance.kacKisilik,
      'hazirlanmaSuresi': instance.hazirlanmaSuresi,
      'pisirmeSuresi': instance.pisirmeSuresi,
      'malzemeler': instance.malzemeler,
      'hazirlanisi': instance.hazirlanisi,
      'kategori': instance.kategori,
      'img': instance.img,
      'favorite': instance.favorite,
    };
