import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:pesantren_ecommerce/response/res_kategori.dart';
import 'package:pesantren_ecommerce/network/api.dart';
import 'package:pesantren_ecommerce/response/res_produk.dart';
import 'package:pesantren_ecommerce/response/model_produk.dart';
import 'package:pesantren_ecommerce/response/res_produk_by_kategori.dart';


class RepoProduk{
  Future<ResKategori?> getKategori() async{
    try{
      Response res = await Api().dio.get("${Api.baseUrl}getKategori");
      return resKategoriFromJson(res.data);
    }catch (e, st) {
      if (kDebugMode) {
        print("Error e ${e.toString()}");
        print("Error st ${st.toString()}");
      }
    }
  }

  Future<ResProduk?> getProduk() async{
    try{
      Response res = await Api().dio.get("${Api.baseUrl}getProduk");
      return resProdukFromJson(res.data);
    }catch (e, st) {
      if (kDebugMode) {
        print("Error e ${e.toString()}");
        print("Error st ${st.toString()}");
      }
    }
  }

  Future<ResProdukByKategori?> getProdukByKategori(String idKat) async{
    try{
      var hearders = {'Content-Type': 'application/x-www-form-urlencoded'};
      Response res = await Api()
          .dio
          .post("${Api.baseUrl}produkPerKategori",
          data: {'id' : idKat}, options: Options(headers: hearders));
      return resProdukByKategoriFromJson(res.data);
    }catch (e, st) {
      if (kDebugMode) {
        print("Error e ${e.toString()}");
        print("Error st ${st.toString()}");
      }
    }
  }
}