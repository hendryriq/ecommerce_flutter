// To parse this JSON data, do
//
//     final resProduk = resProdukFromJson(jsonString);

import 'dart:convert';

import 'package:pesantren_ecommerce/response/model_produk.dart';

ResProduk resProdukFromJson(String str) => ResProduk.fromJson(json.decode(str));

String resProdukToJson(ResProduk data) => json.encode(data.toJson());

class ResProduk {
  String message;
  int status;
  List<DataProduct> dataProduct;

  ResProduk({
    required this.message,
    required this.status,
    required this.dataProduct,
  });

  factory ResProduk.fromJson(Map<String, dynamic> json) => ResProduk(
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


