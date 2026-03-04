import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/product.dart';
import '../models/profile.dart';

class DataService {
  Future<List<Product>> getProducts() async {
    final String response = await rootBundle.loadString('assets/data/products.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => Product.fromJson(json)).toList();
  }

  Future<Profile> getProfile() async {
    final String response = await rootBundle.loadString('assets/data/profile.json');
    final Map<String, dynamic> data = json.decode(response);
    return Profile.fromJson(data);
  }
}
