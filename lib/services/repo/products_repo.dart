import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/products_model.dart';

class DogRepository {
  final String apiUrl = "https://api.thedogapi.com/v1/breeds";

  Future<List<DogModel>> fetchDogs() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<DogModel> dogs =
          data.map((json) => DogModel.fromJson(json)).toList();
      return dogs;
    } else {
      throw Exception('Failed to load dogs');
    }
  }
}
