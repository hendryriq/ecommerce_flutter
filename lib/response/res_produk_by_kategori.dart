// To parse this JSON data, do
//
//     final resProduk = resProdukFromJson(jsonString);

import 'dart:convert';

import 'package:pesantren_ecommerce/response/model_produk.dart';

ResProdukByKategori resProdukByKategoriFromJson(String str) => ResProdukByKategori.fromJson(json.decode(str));

String resProdukByKategoriToJson(ResProdukByKategori data) => json.encode(data.toJson());

class ResProdukByKategori {
  String message;
  int status;
  List<DataProduct> dataProduct;

  ResProdukByKategori({
    required this.message,
    required this.status,
    required this.dataProduct,
  });

  factory ResProdukByKategori.fromJson(Map<String, dynamic> json) => ResProdukByKategori(
    message: json["message"],
    status: json["status"],
    dataProduct: List<DataProduct>.from(json["dataProduct"].map((x) => DataProduct.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "dataProduct": List<dynamic>.from(dataProduct.map((x) => x.toJson())),
  };
}


