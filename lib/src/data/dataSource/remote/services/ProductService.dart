import 'dart:convert';
import 'dart:io';

import 'package:ecommerce_flutter/src/data/api/ApiConfig.dart';
import 'package:ecommerce_flutter/src/data/dataSource/local/SharedPref.dart';
import 'package:ecommerce_flutter/src/domain/models/AuthResponse.dart';
import 'package:ecommerce_flutter/src/domain/models/Product.dart';
import 'package:ecommerce_flutter/src/domain/utils/ListToString.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';

class ProductService {
  SharedPref sharedPref;

  ProductService(this.sharedPref);

  Future<Resource<Product>> create(Product product, List<File> files) async {
    try {
      print('Metodo actualizar con imagen');
      Uri url = Uri.http(Apiconfig.API_ECOMMERCE, '/products');
      String token = "";
      final userSesion = await sharedPref.read('user');
      if (userSesion != null) {
        AuthResponse authResponse = AuthResponse.fromJson(userSesion);
        token = authResponse.token;
      }
      final request = http.MultipartRequest('POST', url);
      request.headers['Authorization'] = token;

      files.forEach((file) async {
        request.files.add(
          http.MultipartFile(
            'files[]',
            http.ByteStream(file.openRead().cast()),
            await file.length(),
            filename: basename(file.path),
            contentType: MediaType('image', 'jpg'),
          ),
        );
      });

      print('CATEGORY ${product.toJson()}');
      request.fields['name'] = product.name;
      request.fields['description'] = product.description;
      request.fields['price'] = product.price.toString();
      request.fields['id_categort'] = product.idCategory.toString();

      final response = await request.send();
      final data = json.decode(
        await response.stream.transform(utf8.decoder).first,
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        Product productResponse = Product.fromJson(data);
        return Success(productResponse);
      } else {
        return Error(listToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  Future<Resource<List<Product>>> getProductsByCategory(
    String idCategory,
  ) async {
    try {
      Uri url = Uri.http(
        Apiconfig.API_ECOMMERCE,
        '/products/category/$idCategory',
      );
      String token = "";
      final userSesion = await sharedPref.read('user');
      if (userSesion != null) {
        AuthResponse authResponse = AuthResponse.fromJson(userSesion);
        token = authResponse.token;
      }
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": token,
      };

      final response = await http.get(url, headers: headers);
      final data = json.decode(response.body);
      if (response.statusCode == 201 || response.statusCode == 200) {
        List<Product> productResponse = Product.fromJsonList(data);
        return Success(productResponse);
      } else {
        return Error(listToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }
}
