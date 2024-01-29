import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:pesantren_ecommerce/network/api.dart';
import 'package:pesantren_ecommerce/provider/provider_produk/provider_cart.dart';
import 'package:pesantren_ecommerce/response/model_produk.dart';
import 'package:pesantren_ecommerce/response/res_produk.dart';
import 'package:provider/provider.dart';

class DetailProdukScreen extends StatefulWidget {
  final DataProduct? data;
  const DetailProdukScreen(this.data, {super.key});

  // final DataProduct? data;
  // const DetailProdukScreen(this.data, {super.key});

  @override
  State<DetailProdukScreen> createState() => _DetailProdukScreenState();
}

class _DetailProdukScreenState extends State<DetailProdukScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context){
        return ProviderCart();
      },
      child: Consumer<ProviderCart>(
        builder: (BuildContext context, value, Widget? child) => Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                SizedBox(width: 30),
                Text(
                  "${widget.data?.produkNama}",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
                Spacer(),
                Container(
                  clipBehavior: Clip.hardEdge,
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Stack(
                      children: [
                        Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.shopping_bag_outlined,
                            size: 30,
                            color: Colors.black,
                          ),
                        ),
                        Positioned(
                            bottom: 8,
                            left: 8,
                            child: Container(
                              child: Center(
                                  child: Text(
                                "2",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10),
                              )),
                              height: 18,
                              width: 18,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                color: Color.fromRGBO(235, 87, 87, 1),
                                shape: BoxShape.circle,
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: Stack(
            children: [
              Container(
                color: Colors.grey,
                width: double.infinity,
                child: Image.network(
                  "${Api.imageUrl}${widget.data?.produkGambar}",
                  fit: BoxFit.cover,
                ),
              ),
              DraggableScrollableSheet(
                  initialChildSize: 0.5,
                  maxChildSize: 1,
                  minChildSize: 0.5,
                  builder: (context, scrollController) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(20),
                            topRight: const Radius.circular(20)),
                      ),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 25),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [],
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "${widget.data?.produkNama}",
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                                ),
                                Spacer(),
                                CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Color.fromRGBO(242, 242, 242, 1),
                                  child: Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "Rp.${widget.data?.produkHarga}",
                              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Row(
                              children: [
                                Icon(Icons.star, color: Color.fromRGBO(242, 201, 76, 1)),
                                Icon(Icons.star, color: Color.fromRGBO(242, 201, 76, 1)),
                                Icon(Icons.star, color: Color.fromRGBO(242, 201, 76, 1)),
                                Icon(Icons.star, color: Color.fromRGBO(242, 201, 76, 1)),
                                Icon(Icons.star, color: Color.fromRGBO(189, 189, 189, 1)),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "${widget.data?.produkRating}",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                              "${widget.data?.deskripsiProduk}",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                              style: TextStyle(height: 1.5),
                            ),
                            Text(
                              "Read More",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Stok : ${widget.data?.produkStok}",
                              style: TextStyle(height: 1.5),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(height: 30),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    value.minusItem();
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: Colors.black,
                                    radius: 15,
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Text("${value.counter} Item"),
                                GestureDetector(
                                  onTap: () {
                                    value.additem();
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: Colors.black,
                                    radius: 15,
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 250),
                              ],
                            ),
                            SizedBox(height: 30),
                            Text("Total Rp. ${value.counter * int.parse(widget.data?.produkHarga ?? "")}"),
                            MaterialButton(
                              child: Text(
                                "Add to Cart",
                                style: TextStyle(
                                    color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100)),
                              onPressed: () {},
                              minWidth: double.infinity,
                              height: 60,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
