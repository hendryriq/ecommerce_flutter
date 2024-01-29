import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pesantren_ecommerce/repository/repo_produk.dart';
import 'package:pesantren_ecommerce/response/res_kategori.dart';
import 'package:pesantren_ecommerce/response/res_produk.dart';
import 'package:pesantren_ecommerce/response/res_produk_by_kategori.dart';
import 'package:pesantren_ecommerce/response/model_produk.dart';


class ProviderProduk extends ChangeNotifier{
  ProviderProduk();
  ProviderProduk.produkKategori(String id){
    getProdukByKategori(id);
  }

  ProviderProduk.init(){
    getKategori();
    getProduk();
    // getProdukByKategori(String id);
  }
  List<Kategori> listKategori = [];
  List<DataProduct> listProduk = [];
  List<DataProduct> listProdukByKategori =[];

  bool isKategori = false;
  bool isProdukByKategori = false;
  bool isProduk = false;
  RepoProduk repo = RepoProduk();

  Future<void> getKategori() async{
    try{
      isKategori =true;
      notifyListeners();

      ResKategori? res = await repo.getKategori();
      if(res?.status == 200){
        isKategori = false;
        listKategori = res?.data ?? [];
        notifyListeners();
      }else{
        isKategori = false;
        if (kDebugMode){
          print("Error ${res?.message}");
        }
        notifyListeners();
      }
    }catch (e){
      isKategori = false;
      if(kDebugMode){
        print("Error e ${e.toString()}");
      }
      notifyListeners();
    }
  }
  Future<void> getProduk() async{
    try{
      isProduk =true;
      notifyListeners();

      ResProduk? res = await repo.getProduk();
      if(res?.status == 200){
        isProduk = false;
        listProduk = res?.dataProduct ?? [];
        notifyListeners();
      }else{
        isProduk = false;
        if (kDebugMode){
          print("Error ${res?.message}");
        }
        notifyListeners();
      }
    }catch (e){
      isProduk = false;
      if(kDebugMode){
        print("Error e ${e.toString()}");
      }
      notifyListeners();
    }
  }

  Future<void> getProdukByKategori(String id) async{
    try{
      isProdukByKategori =true;
      notifyListeners();

      ResProdukByKategori? res = await repo.getProdukByKategori(id);
      if(res?.status == 200){
        isProdukByKategori = false;
        listProdukByKategori = res?.dataProduct ?? [];
        notifyListeners();
      }else{
        isProdukByKategori = false;
        if (kDebugMode){
          print("Error ${res?.message}");
        }
        notifyListeners();
      }
    }catch (e){
      isProdukByKategori = false;
      if(kDebugMode){
        print("Error e ${e.toString()}");
      }
      notifyListeners();
    }
  }

}