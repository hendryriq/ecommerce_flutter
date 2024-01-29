// To parse this JSON data, do
//
//     final resKategori = resKategoriFromJson(jsonString);

import 'dart:convert';

ResKategori resKategoriFromJson(String str) => ResKategori.fromJson(json.decode(str));

String resKategoriToJson(ResKategori data) => json.encode(data.toJson());

class ResKategori {
  String message;
  int status;
  List<Kategori> data;

  ResKategori({
    required this.message,
    required this.status,
    required this.data,
  });

  factory ResKategori.fromJson(Map<String, dynamic> json) => ResKategori(
    message: json["message"],
    status: json["status"],
    data: List<Kategori>.from(json["data"].map((x) => Kategori.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Kategori {
  String kategoriId;
  String kategoriNama;
  String kategoriStatus;
  String foto;
  DateTime createdAt;
  DateTime? updatedAt;

  Kategori({
    required this.kategoriId,
    required this.kategoriNama,
    required this.kategoriStatus,
    required this.foto,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Kategori.fromJson(Map<String, dynamic> json) => Kategori(
    kategoriId: json["kategori_id"],
    kategoriNama: json["kategori_nama"],
    kategoriStatus: json["kategori_status"],
    foto: json["foto"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "kategori_id": kategoriId,
    "kategori_nama": kategoriNama,
    "kategori_status": kategoriStatus,
    "foto": foto,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
