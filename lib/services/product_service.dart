import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/product.dart';

class ApiService {
  static const String baseUrl = 'https://api.timbu.cloud/products';
  static const String organizationId = '30aa7faee065453883d79187ff59833a';
  static const String appId = '2ITOWSJ5GB9SW2R';
  static const String apiKey =
      'cd0fa5888a38492a8d42b9fc552129b620240712232512466148';

  Future<List<Sneaker>> fetchSneakers() async {
    final String url =
        '$baseUrl?organization_id=$organizationId&Appid=$appId&Apikey=$apiKey';

    final Uri uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      // print('Response status code: ${response.statusCode}');
      // print('Response body: ${response.body}');

      final mapResponse = json.decode(response.body);
      final listResponse = mapResponse['items'];

      if (listResponse != null && listResponse is List) {
        return List<Sneaker>.from(
            listResponse.map((item) => Sneaker.fromJson(item)));
      } else {
        // print('No items found in the response.');
        return [];
      }
    } else {
      // print('Failed to load data. Status code: ${response.statusCode}');
      // print('Response body: ${response.body}');
      throw Exception(
          'Failed to load data. Status code: ${response.statusCode}');
    }
  }

  Future<List<Sneaker>> fetchSpecificProducts() async {
    final allSneakers = await fetchSneakers();
    final specificUniqueId = [
      'TO196029P',
      'TO196059P',
      'TO198086P',
      'TO198176P'
    ];
    return allSneakers
        .where((sneaker) => specificUniqueId.contains(sneaker.uniqueId))
        .toList();
  }
}
