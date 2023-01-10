import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:batik_srikandi/widget/category.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required String email, required String password});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 231, 224, 213),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket_sharp), label: "Keranjang"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil")
      ]),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 140,
                  width: double.infinity,
                  color: Color.fromRGBO(121, 85, 72, 1),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                  alignment: Alignment.topLeft,
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "http://images6.fanpop.com/image/photos/41800000/NCT-Season-s-Greetings-2019-Haechan-nct-u-41810768-825-1200.jpg")),
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(
                                          color: Colors.black,
                                          style: BorderStyle.solid,
                                          width: 2))),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Halo Putra, Selamat Datang !",
                                style:
                                    GoogleFonts.montserrat(color: Colors.white),
                              )
                            ],
                          ),
                          Container(
                              alignment: Alignment.topRight,
                              child: Icon(
                                Icons.notifications_active,
                                color: Colors.white,
                                size: 30,
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color(0xFFF5F5F7),
                            borderRadius: BorderRadius.circular(40)),
                        child: TextField(
                          cursorHeight: 20,
                          autofocus: false,
                          decoration: InputDecoration(
                              hintText: "Cari Produk Batik di Srikandi",
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 2),
                                  borderRadius: BorderRadius.circular(30))),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Category(imagePath: "assets/bawah.png", title: "Bawahan"),
                  Category(imagePath: "assets/batik.png", title: "Atasan"),
                  Category(imagePath: "assets/hat.png", title: "Aksesoris"),
                  Category(imagePath: "assets/jenis.png", title: "Batik"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                "Produk Best Seller",
                style: GoogleFonts.montserrat(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            batik(
              imagePad: "assets/moderen.jpg",
              name: "Baju Favorit",
              rating: "4,7",
              harga: "Rp365.000",
            ),
            batik(
              imagePad: "assets/baju.jpeg",
              name: "Batik Favorit",
              rating: "4,8",
              harga: "Rp200.000",
            ),
          ],
        )),
      ),
    );
  }
}

class batik extends StatelessWidget {
  final String imagePad;
  final String name;
  final String rating;
  final String harga;

  const batik({
    Key? key,
    required this.imagePad,
    required this.name,
    required this.rating,
    required this.harga,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 240,
      child: Stack(
        children: [
          Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 10,
            child: Column(children: [
              SizedBox(
                  width: double.infinity,
                  height: 150,
                  child: Image.asset(imagePad, fit: BoxFit.cover))
            ]),
          ),
          Positioned(
            bottom: 0,
            left: 10,
            child: SizedBox(
              height: 70,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: GoogleFonts.montserrat(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          rating,
                          style: GoogleFonts.montserrat(fontSize: 12),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(Icons.private_connectivity, color: Colors.grey),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          harga,
                          style: GoogleFonts.montserrat(fontSize: 12),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
