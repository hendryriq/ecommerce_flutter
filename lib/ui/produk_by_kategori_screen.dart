import 'package:flutter/material.dart';
import 'package:pesantren_ecommerce/network/api.dart';
import 'package:pesantren_ecommerce/provider/provider_produk/provider_produk.dart';
import 'package:pesantren_ecommerce/response/model_produk.dart';
import 'package:provider/provider.dart';

class ProdukByKategoriPage extends StatefulWidget {
  final String? kategoriId;
  final String? kategoriNama;
  const ProdukByKategoriPage(this.kategoriId, this.kategoriNama, {super.key});

  @override
  State<ProdukByKategoriPage> createState() => _ProdukByKategoriPageState();
}

class _ProdukByKategoriPageState extends State<ProdukByKategoriPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return ProviderProduk.produkKategori(widget.kategoriId ?? "");
      },
      child: Consumer<ProviderProduk>(
        builder: (BuildContext context, value, Widget? child) => Scaffold(
          appBar: AppBar(
            title: Text("Produk By Categori"),
            backgroundColor: Colors.green,
            iconTheme: IconThemeData(color: Colors.white),
          ),
          body: Column(
            children: [
              Text("${widget.kategoriNama}", style: TextStyle(fontSize: 18),),
              SizedBox(height: 20),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                shrinkWrap: true,
                itemCount: value.listProdukByKategori.length,
                itemBuilder: (context, index) {
                  DataProduct data = value.listProdukByKategori[index];
                  return GestureDetector(
                    onTap: () {
                      // Handle product tap
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Card(
                        semanticContainer: true,
                        // You can customize the card as needed
                        elevation: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
