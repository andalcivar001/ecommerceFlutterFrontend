import 'dart:convert';
import 'dart:io';

import 'package:ecommerce_flutter/src/data/api/ApiConfig.dart';
import 'package:ecommerce_flutter/src/data/dataSource/local/SharedPref.dart';
import 'package:ecommerce_flutter/src/domain/models/AuthResponse.dart';
import 'package:ecommerce_flutter/src/domain/models/Category.dart';
import 'package:ecommerce_flutter/src/domain/models/User.dart';
import 'package:ecommerce_flutter/src/domain/utils/ListToString.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';

class CategoryService {
  SharedPref sharedPref;

  CategoryService(this.sharedPref);

  Future<Resource<Category>> create(Category category, File file) async {
    try {
      print('Metodo actualizar con imagen');
      Uri url = Uri.http(Apiconfig.API_ECOMMERCE, '/categories');
      String token = "";
      final userSesion = await sharedPref.read('user');
      if (userSesion != null) {
        AuthResponse authResponse = AuthResponse.fromJson(userSesion);
        token = authResponse.token;
      }
      final request = http.MultipartRequest('POST', url);
      request.headers['Authorization'] = token;
      request.files.add(
        http.MultipartFile(
          'file',
          http.ByteStream(file.openRead().cast()),
          await file.length(),
          filename: basename(file.path),
          contentType: MediaType('image', 'jpg'),
        ),
      );
      print('CATEGORY ${category.toJson()}');
      request.fields['name'] = category.name;
      request.fields['description'] = category.description;

      final response = await request.send();
      final data = json.decode(
        await response.stream.transform(utf8.decoder).first,
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        Category categoryResponse = Category.fromJson(data);
        return Success(categoryResponse);
      } else {
        return Error(listToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  Future<Resource<List<Category>>> getCategories() async {
    try {
      Uri url = Uri.http(Apiconfig.API_ECOMMERCE, '/categories');
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
        List<Category> categoryResponse = Category.fromJsonList(data);
        return Success(categoryResponse);
      } else {
        return Error(listToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  Future<Resource<Category>> update(
    int id,
    Category category,
    File file,
  ) async {
    try {
      Uri url = Uri.http(Apiconfig.API_ECOMMERCE, '/categories/$id');
      String token = "";
      final userSesion = await sharedPref.read('user');
      if (userSesion != null) {
        AuthResponse authResponse = AuthResponse.fromJson(userSesion);
        token = authResponse.token;
      }
      final request = http.MultipartRequest('PUT', url);
      request.headers['Authorization'] = token;

      request.files.add(
        http.MultipartFile(
          'file',
          http.ByteStream(file.openRead().cast()),
          await file.length(),
          filename: basename(file.path),
          contentType: MediaType('image', 'jpg'),
        ),
      );
      request.fields['category'] = json.encode({
        'name': category.name,
        'description': category.description,
      });
      final response = await request.send();
      final data = json.decode(
        await response.stream.transform(utf8.decoder).first,
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        Category categoryResponse = Category.fromJson(data);
        return Success(categoryResponse);
      } else {
        return Error(listToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }
}
