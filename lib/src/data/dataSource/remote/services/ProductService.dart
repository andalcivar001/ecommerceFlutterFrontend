import 'dart:convert';
import 'dart:io';
import 'package:ecommerce_flutter/src/data/api/ApiConfig.dart';
import 'package:ecommerce_flutter/src/domain/models/Product.dart';
import 'package:ecommerce_flutter/src/domain/utils/ListToString.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';

class ProductService {
  Future<String> token;
  ProductService(this.token);

  Future<Resource<Product>> create(Product product, List<File> files) async {
    try {
      print('Metodo actualizar con imagen');
      Uri url = Uri.http(Apiconfig.API_ECOMMERCE, '/products');

      final request = http.MultipartRequest('POST', url);
      request.headers['Authorization'] = await token;

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
      request.fields['id_category'] = product.idCategory.toString();

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

  Future<Resource<List<Product>>> getProductsByCategory(int idCategory) async {
    try {
      Uri url = Uri.http(
        Apiconfig.API_ECOMMERCE,
        '/products/category/$idCategory',
      );

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token,
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

  Future<Resource<Product>> update(int id, Product product) async {
    try {
      print('Metodo actualizar sin imagen');
      Uri url = Uri.http(Apiconfig.API_ECOMMERCE, '/products/$id');

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token,
      };
      String body = json.encode({
        'name': product.name,
        'description': product.description,
        'price': product.price,
      });

      final response = await http.put(url, headers: headers, body: body);
      final data = json.decode(response.body);
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

  Future<Resource<Product>> updateWithImage(
    int id,
    Product product,
    List<File> files,
    List<int> imagesToUpdate,
  ) async {
    try {
      print('Metodo actualizar con imagen');
      Uri url = Uri.http(Apiconfig.API_ECOMMERCE, '/products/upload/$id');

      final request = http.MultipartRequest('PUT', url);
      request.headers['Authorization'] = await token;

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
      request.fields['images_to_update[]'] = imagesToUpdate.toString();

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
}
