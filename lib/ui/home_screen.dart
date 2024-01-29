import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pesantren_ecommerce/response/model_produk.dart';
import 'package:pesantren_ecommerce/response/res_kategori.dart';
import 'package:pesantren_ecommerce/ui/detail_produk_screen.dart';
import 'package:pesantren_ecommerce/ui/produk_by_kategori_screen.dart';
import 'package:pesantren_ecommerce/utils/nav_utils.dart';
import 'package:provider/provider.dart';
import 'package:pesantren_ecommerce/network/api.dart';
import 'package:pesantren_ecommerce/provider/provider_produk/provider_produk.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return ProviderProduk.init();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home Screen"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Consumer<ProviderProduk>(
                  builder: (BuildContext context, valKat, Widget? child) =>
                      Column(
                        children: [
                          CarouselSlider(
                              items: valKat.listKategori.map((e) {
                                return Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Image.network(
                                    "${Api.imageUrl}${e.foto}",
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                );
                              }).toList(),
                              options: CarouselOptions(
                                  height: 250,
                                  enlargeCenterPage: true,
                                  autoPlay: true)),
                          SizedBox(height: 25),
                          SizedBox(
                            height: 120,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: valKat.listKategori.length,
                              itemBuilder: (context, index) {
                                Kategori data = valKat.listKategori[index];
                                return GestureDetector(
                                  onTap: () {
                                    NavUtils.goTo(context, ProdukByKategoriPage(data.kategoriId, data.kategoriNama));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Column(
                                      children: [
                                        Image.network(
                                          "${Api.imageUrl}${data.foto}",
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                            ),
                            shrinkWrap: true,
                            itemCount: valKat.listProduk.length,
                            itemBuilder: (context, index) {
                              DataProduct data = valKat.listProduk[index];
                              return GestureDetector(
                                onTap: () {
                                  NavUtils.goTo(context, DetailProdukScreen(data));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Card(
                                    semanticContainer: true,
                                    // You can customize the card as needed
                                    elevation: 3,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Display product image
                                        Image.network(
                                          "${Api.imageUrl}${data.produkGambar}",
                                          height: 120,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                        // Display product details
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${data.produkNama}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text('Price: Rp.${data.produkHarga}'),
                                              Text('Stock: ${data.produkStok}'),
                                              // Add more product details as needed
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        ],
                      )),
            ],
          ),
        ),
      ),
    );
  }
}
