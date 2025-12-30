import 'dart:convert';

import 'package:ecommerce_flutter/src/data/api/ApiConfig.dart';
import 'package:ecommerce_flutter/src/domain/models/MercadoPagoIdentificationType.dart';
import 'package:ecommerce_flutter/src/domain/utils/ListToString.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:http/http.dart' as http;

class MercadoPagoService {
  Future<String> token;

  MercadoPagoService(this.token);

  Future<Resource<List<MercadoPagoIdentificationType>>>
  getIdentificationTypes() async {
    try {
      Uri url = Uri.http(
        Apiconfig.API_ECOMMERCE,
        '/mercado-pago/identification-types',
      );

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token,
      };

      final response = await http.get(url, headers: headers);
      final data = json.decode(response.body);
      if (response.statusCode == 201 || response.statusCode == 200) {
        List<MercadoPagoIdentificationType> response =
            MercadoPagoIdentificationType.fromJsonList(data);
        return Success(response);
      } else {
        return Error(listToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }
}
