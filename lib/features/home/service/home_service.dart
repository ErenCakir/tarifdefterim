import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';
import 'package:yemektariflerim/features/home/model/categories_model.dart';
import 'package:yemektariflerim/features/home/model/postProduct_model.dart';
import 'package:yemektariflerim/features/home/model/product_model.dart';
import 'package:yemektariflerim/features/home/model/register_model.dart';
import 'package:yemektariflerim/features/home/model/user_model.dart';
import 'package:yemektariflerim/product/query/product_queries.dart';
import 'package:yemektariflerim/product/utility/project_utilitys.dart';

import '../model/image_upload_model.dart';

enum _HomeServicePath { foods, categories, users }

abstract class IHomeService {
  late final INetworkManager _networkManager;

  IHomeService(INetworkManager networkManager)
      : _networkManager = networkManager;

  Future<List<ProductModel>?> fetchAllProducts();
  Future<List<ProductModel>?> fetchSelectedProducts(String data);
  Future<List<CategoriesModel>?> fetchAllCategories();
  Future<List<ProductModel>?> fetchAllProductsWithSort();
  Future<IResponseModel<ProductModel?>?> postProduct(postProductModel model);
  Future<IResponseModel<ImageUploadResponse?>?> postImages(File? image);
  Future<IResponseModel<UsersModel?>?> postRegister(registerModel model);
}

class HomeService extends IHomeService {
  late final Dio dio;
  HomeService(INetworkManager networkManager) : super(networkManager);

  @override
  Future<IResponseModel<ProductModel?>?> postProduct(
      postProductModel model) async {
    return await _networkManager.send<ProductModel, ProductModel>(
        _HomeServicePath.foods.name,
        data: model,
        parseModel: ProductModel(),
        method: RequestType.POST);
  }

  @override
  Future<IResponseModel<UsersModel?>?> postRegister(registerModel model) async {
    return await _networkManager.send<UsersModel, UsersModel>(
        _HomeServicePath.users.name,
        data: model,
        method: RequestType.POST,
        parseModel: UsersModel());
  }

  @override
  Future<IResponseModel<ImageUploadResponse?>?> postImages(File? image) async {
    return await _networkManager.send<ImageUploadResponse, ImageUploadResponse>(
        'A2yTjtpmqSxmWyLwILcOEz',
        parseModel: ImageUploadResponse(),
        method: RequestType.POST);
  }

  @override
  Future<List<ProductModel>?> fetchAllProductsWithSort() async {
    final response = await _networkManager
        .send<ProductModel, List<ProductModel>>("foods?_sort=favorite&",
            parseModel: ProductModel(),
            method: RequestType.GET,
            queryParameters: Map.fromEntries([
              foodsQueries.Sort.toMapEntry('desc'),
            ]));

    return response.data;
  }

  @override
  Future<List<ProductModel>?> fetchAllProducts() async {
    final response = await _networkManager
        .send<ProductModel, List<ProductModel>>(_HomeServicePath.foods.name,
            parseModel: ProductModel(), method: RequestType.GET);

    return response.data;
  }

  @override
  Future<List<ProductModel>?> fetchSelectedProducts(String data) async {
    final response =
        await _networkManager.send<ProductModel, List<ProductModel>>(
            _HomeServicePath.foods.name + '/$data',
            parseModel: ProductModel(),
            method: RequestType.GET);

    return response.data;
  }

  @override
  Future<List<CategoriesModel>?> fetchAllCategories() async {
    final CategoriesResponse =
        await _networkManager.send<CategoriesModel, List<CategoriesModel>>(
            _HomeServicePath.categories.name,
            parseModel: CategoriesModel(),
            method: RequestType.GET);

    return CategoriesResponse.data;
  }
}
