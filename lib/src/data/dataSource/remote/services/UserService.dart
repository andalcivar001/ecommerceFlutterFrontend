import 'dart:convert';
import 'dart:io';
import 'package:ecommerce_flutter/src/data/api/ApiConfig.dart';
import 'package:ecommerce_flutter/src/domain/models/User.dart';
import 'package:ecommerce_flutter/src/domain/utils/ListToString.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class UserService {
  Future<Resource<User>> update(int id, User user) async {
    try {
      Uri url = Uri.http(Apiconfig.API_ECOMMERCE, '/users/$id');
      Map<String, String> headers = {"Content-Type": "application/json"};
      String body = json.encode(user);
      final response = await http.put(url, headers: headers, body: body);
      final data = json.decode(response.body);
      if (response.statusCode == 201 || response.statusCode == 200) {
        User userResponse = User.fromJson(data);
        return Success(userResponse);
      } else {
        return Error(listToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  Future<Resource<User>> updateImage(int id, User user, File file) async {
    try {
      Uri url = Uri.http(Apiconfig.API_ECOMMERCE, '/users/upload/$id');
      final request = http.MultipartRequest('PUT', url);
      request.files.add(
        http.MultipartFile(
          'file',
          http.ByteStream(file.openRead().cast()),
          await file.length(),
          filename: basename(file.path),
        ),
      );
      request.fields['user'] = json.encode(user);
      final response = await request.send();
      final data = json.decode(
        await response.stream.transform(utf8.decoder).first,
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        User userResponse = User.fromJson(data);
        return Success(userResponse);
      } else {
        return Error(listToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }
}
