import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:farmer_app/screens/main_page.dart';
import 'package:farmer_app/widgets/call_banner.dart';
import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//-------------------------------------

class ProductDetails1 extends StatefulWidget {
  final detailsProduct;
  ProductDetails1({this.detailsProduct});

  @override
  State<ProductDetails1> createState() => _ProductDetails1State();
}

class _ProductDetails1State extends State<ProductDetails1> {
  @override
  Widget build(BuildContext context) {
    Map products = widget.detailsProduct;
    // print('here it is coming');
    // print();
    return Scaffold(
      // backgroundColor: HexColor('#d2e9e6'),
      // ignore: unnecessary_new
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xff1e9486),
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const MainPage()));
          },
        ),
        // title: Padding(
        //   padding: EdgeInsets.only(right: 40),
        //   child: Align(
        //     alignment: Alignment(0, 0),
        //     child: Text(
        //       widget.detailsProduct['name'],
        //       textAlign: TextAlign.center,
        //       overflow: TextOverflow.clip,
        //       style: TextStyle(
        //         fontWeight: FontWeight.w800,
        //         fontStyle: FontStyle.normal,
        //         color: Color(0xff1e9486),
        //       ),
        //     ),
        //   ),
        // ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
                  child: Text(
                    products['name'],
                    style: const TextStyle(
                      fontFamily: 'Itim',
                      fontSize: 25,
                      color: Color(0xff1e9486),
                    ),
                  ),
                ),

                CarouselSlider(
                  items: [
                    CachedNetworkImage(
                      imageUrl: widget.detailsProduct['image1'],
                      imageBuilder: (context, imageProvider) => Container(
                        margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width * 0.75,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(14),
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                        ),
                      ),
                      placeholder: ((context, s) => const Center(
                            child: CircularProgressIndicator(),
                          )),
                      fit: BoxFit.fill,
                    ),
                    CachedNetworkImage(
                      imageUrl: widget.detailsProduct['image2'],
                      imageBuilder: (context, imageProvider) => Container(
                        margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width * 0.75,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(14),
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.fill),
                        ),
                      ),
                      placeholder: ((context, s) => const Center(
                            child: CircularProgressIndicator(),
                          )),
                      fit: BoxFit.cover,
                    ),
                    CachedNetworkImage(
                      imageUrl: widget.detailsProduct['image3'],
                      imageBuilder: (context, imageProvider) => Container(
                        margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width * 0.75,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(14),
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.fill),
                        ),
                      ),
                      placeholder: ((context, s) => const Center(
                            child: CircularProgressIndicator(),
                          )),
                      fit: BoxFit.cover,
                    ),
                    CachedNetworkImage(
                      imageUrl: widget.detailsProduct['image4'],
                      imageBuilder: (context, imageProvider) => Container(
                        margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width * 0.75,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(14),
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.fill),
                        ),
                      ),
                      placeholder: ((context, s) => const Center(
                            child: CircularProgressIndicator(),
                          )),
                      fit: BoxFit.cover,
                    ),
                  ],
                  options: CarouselOptions(
                    height: 220.0,
                    enlargeCenterPage: false,
                    autoPlay: true,
                    aspectRatio: 16 / 8,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: const Duration(milliseconds: 800),
                    viewportFraction: 1,
                  ),
                ),

                const SizedBox(
                  height: 5,
                ),

                Card(
                  color: const Color.fromRGBO(235, 238, 241, 1),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                  child: ListTile(
                    title: const Text(
                      'Description',
                      // style: Theme.of(context).textTheme.bodyText2),
                      style: TextStyle(
                        fontFamily: 'RobotoCondensed-Bold',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1e9486),
                      ),
                    ),
                    subtitle: Text(
                      widget.detailsProduct['desc'],
                      // style: Theme.of(context).textTheme.bodyText1),
                      style: const TextStyle(
                        fontFamily: 'RobotoCondensed',
                        fontSize: 15,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                  ),
                ),
                Card(
                  color: const Color.fromRGBO(235, 238, 241, 1),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                  child: ListTile(
                    title: const Text(
                      'Rent',
                      // style: Theme.of(context).textTheme.bodyText2),
                      style: TextStyle(
                        fontFamily: 'RobotoCondensed-Bold',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1e9486),
                      ),
                    ),
                    subtitle: Text(
                      "₹" + widget.detailsProduct['depositep'],
                      // style: Theme.of(context).textTheme.bodyText1),
                      style: const TextStyle(
                        fontFamily: 'RobotoCondensed',
                        fontSize: 15,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                  ),
                ),
                Card(
                  color: const Color.fromRGBO(235, 238, 241, 1),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                  child: ListTile(
                    title: const Text(
                      'Deposit',
                      // style: Theme.of(context).textTheme.bodyText2),
                      style: TextStyle(
                        fontFamily: 'RobotoCondensed-Bold',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1e9486),
                      ),
                    ),
                    subtitle: Text(
                      "₹" + widget.detailsProduct['depositep'],
                      style: const TextStyle(
                        fontFamily: 'RobotoCondensed',
                        fontSize: 15,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                    // style: Theme.of(context).textTheme.bodyText1),
                  ),
                ),



                Card(
                  color: const Color.fromRGBO(235, 238, 241, 1),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                  child: ListTile(
                    title: const Text(
                      '\nAddress',
                      // style: Theme.of(context).textTheme.bodyText2,
                      style: TextStyle(
                        fontFamily: 'RobotoCondensed-Bold',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1e9486),
                      ),
                    ),
                    subtitle: Text(
                      widget.detailsProduct['uid'] + '\n',
                      style: const TextStyle(
                        fontFamily: 'RobotoCondensed',
                        fontSize: 15,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                    // style: Theme.of(context).textTheme.bodyText1),
                  ),
                ),

                
                
                const SizedBox(height:15),
                
                ElevatedButton(onPressed:(){
                 
                },

                style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor:const Color(0xff1e9486),
                    ),
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                )
                
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
