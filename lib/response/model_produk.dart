class DataProduct {
  String produkId;
  String produkNama;
  String produkStok;
  String produkGrowback;
  String produkStatus;
  String produkHarga;
  String produkTanggal;
  String deskripsiProduk;
  String produkGambar;
  String produkKategori;
  String produkRating;
  bool isPromote;
  DateTime createdAt;
  DateTime? updatedAt;

  DataProduct({
    required this.produkId,
    required this.produkNama,
    required this.produkStok,
    required this.produkGrowback,
    required this.produkStatus,
    required this.produkHarga,
    required this.produkTanggal,
    required this.deskripsiProduk,
    required this.produkGambar,
    required this.produkKategori,
    required this.produkRating,
    required this.isPromote,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DataProduct.fromJson(Map<String, dynamic> json) => DataProduct(
    produkId: json["produk_id"],
    produkNama: json["produk_nama"],
    produkStok: json["produk_stok"],
    produkGrowback: json["produk_growback"],
    produkStatus: json["produk_status"],
    produkHarga: json["produk_harga"],
    produkTanggal: json["produk_tanggal"],
    deskripsiProduk: json["deskripsi_produk"],
    produkGambar: json["produk_gambar"],
    produkKategori: json["produk_kategori"],
    produkRating: json["produk_rating"],
    isPromote: json["is_promote"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "produk_id": produkId,
    "produk_nama": produkNama,
    "produk_stok": produkStok,
    "produk_growback": produkGrowback,
    "produk_status": produkStatus,
    "produk_harga": produkHarga,
    "produk_tanggal": produkTanggal,
    "deskripsi_produk": deskripsiProduk,
    "produk_gambar": produkGambar,
    "produk_kategori": produkKategori,
    "produk_rating": produkRating,
    "is_promote": isPromote,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}