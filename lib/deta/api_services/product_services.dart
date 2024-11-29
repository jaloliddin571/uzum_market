import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../models/product_model.dart';



Future<List?>getAllProductsByCategory(String category) async{
  Uri uri = Uri.parse("https://fakestoreapi.com/products/category/$category");
  var response = await http.get(uri);
  if(response.statusCode == 200){
    var jsonResponse = convert.jsonDecode(response.body);
    return jsonResponse.map((e) => Product.fromJson(e)).toList();
  }
  return null ;

}