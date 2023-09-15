import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmer_app/constants/colors.dart';
import 'package:farmer_app/screens/orders/Farm/farmd.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Speciald extends StatelessWidget {
  Speciald({Key? key}) : super(key: key) {
    _stream = _reference
        .where("uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
  }

  // ignore: prefer_final_fields
  CollectionReference _reference = FirebaseFirestore.instance
      .collection('Products')
      .doc("Farm")
      .collection("Farm Tools");

  // ignore: prefer_final_fields
  CollectionReference _ref = FirebaseFirestore.instance.collection("Delete");

  //_reference.get()  ---> returns Future<QuerySnapshot>
  //_reference.snapshots()--> Stream<QuerySnapshot> -- realtime updates
  late Stream<QuerySnapshot> _stream;

  uploadTile(
      {required String imageString,
      required String text,
      required Function() onPressed}) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
          border: Border.all(
            width: 0.7,
            color: Colors.grey.shade400,
          ),
          borderRadius: BorderRadius.circular(10.0)),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            Container(
              height: 26,
              width: 26,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imageString),
                ),
              ),
            ),
            const SizedBox(width: 14),
            Text(
              text,
              style: const TextStyle(
                  fontSize: 12,
                  color: GlobalColors.smallText,
                  fontWeight: FontWeight.w400),
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xfff7f7f7),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xff1e9486),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Farmd()));
            },
          ),
          title: const Padding(
            padding: EdgeInsets.only(right: 40),
            child: Align(
              alignment: Alignment(0, 0),
              child: Text(
                "Special Tools",
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontStyle: FontStyle.normal,
                  fontSize: 18,
                  color: Color(0xff1e9486),
                ),
              ),
            ),
          ),
        ),
        //Display a list // Add a FutureBuilder

        body: Scaffold(
          body: StreamBuilder<QuerySnapshot>(
            stream: _stream,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              //Check error
              if (snapshot.hasError) {
                return Center(
                    child: Text('Some error occurred ${snapshot.error}'));
              }

              //Check if data arrived
              if (snapshot.hasData) {
                //get the data
                QuerySnapshot querySnapshot = snapshot.data;
                List<QueryDocumentSnapshot> documents = querySnapshot.docs;

                //Convert the documents to Maps
                List<Map> items =
                    documents.map((e) => e.data() as Map).toList();

                //Display the list

                return ListView.builder(
                  // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //   crossAxisCount: 2,
                  //   crossAxisSpacing: 8,
                  //   mainAxisSpacing: 8,
                  //   childAspectRatio: 0.68,
                  // ),
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    //Get the item at this index
                    Map thisItem = items[index];
                    // print(thisItem);
                    //REturn the widget for the list items
                    return Card(
                        // color: HexColor('#e8f4f2'),
                        // elevation: 0,
                        color: const Color(0xffffffff),
                        shadowColor: const Color(0xff000000),
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.0)),
                        child: ListTile(
                         
                          title: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${thisItem['name']}',
                                  style: const TextStyle(
                                    fontFamily: 'Itim',
                                    fontSize: 20,
                                    color: Color(0xff1e9486),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text("₹" '${thisItem['rentp']}',
                                    style: GoogleFonts.slabo27px(
                                        textStyle: const TextStyle(
                                            color: Colors.black,
                                            letterSpacing: .5,
                                            fontWeight: FontWeight.bold))),
                                Divider(
                                  height: 15,
                                  thickness: 0,
                                  color: Theme.of(context).dividerColor,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 10, 5),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              '${thisItem['desc']}',
                                              softWrap: true,
                                              style: const TextStyle(
                                                fontFamily: 'RobotoCondensed',
                                                fontSize: 13.5,
                                                color:
                                                    Color.fromRGBO(0, 0, 0, 1),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: CarouselSlider(
                                        items: [
                                          CachedNetworkImage(
                                            imageUrl: '${thisItem['image1']}',
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                    Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: DecorationImage(
                                                    image: imageProvider,
                                                    fit: BoxFit.fill),
                                              ),
                                            ),
                                            placeholder: ((context, s) =>
                                                const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                )),
                                            fit: BoxFit.fill,
                                          ),
                                          CachedNetworkImage(
                                            imageUrl: '${thisItem['image2']}',
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                    Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: DecorationImage(
                                                    image: imageProvider,
                                                    fit: BoxFit.fill),
                                              ),
                                            ),
                                            placeholder: ((context, s) =>
                                                const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                )),
                                            fit: BoxFit.fill,
                                          ),
                                          CachedNetworkImage(
                                            imageUrl: '${thisItem['image3']}',
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                    Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: DecorationImage(
                                                    image: imageProvider,
                                                    fit: BoxFit.fill),
                                              ),
                                            ),
                                            placeholder: ((context, s) =>
                                                const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                )),
                                            fit: BoxFit.fill,
                                          ),
                                          CachedNetworkImage(
                                            imageUrl: '${thisItem['image4']}',
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                    Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: DecorationImage(
                                                    image: imageProvider,
                                                    fit: BoxFit.fill),
                                              ),
                                            ),
                                            placeholder: ((context, s) =>
                                                const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                )),
                                            fit: BoxFit.fill,
                                          ),
                                        ],
                                        options: CarouselOptions(
                                          height: 220.0,
                                          enlargeCenterPage: false,
                                          autoPlay: true,
                                          aspectRatio: 16 / 8,
                                          autoPlayCurve: Curves.fastOutSlowIn,
                                          enableInfiniteScroll: true,
                                          autoPlayAnimationDuration:
                                              const Duration(milliseconds: 800),
                                          viewportFraction: 1,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 60,
                                    ),
                                  ],
                                ),
                                Divider(
                                  height: 15,
                                  thickness: 0,
                                  color: Theme.of(context).dividerColor,
                                ),
                                Row(
                                  children: [
                                    Flexible(
                                        child: ElevatedButton.icon(
                                      icon: const Icon(Icons
                                          .delete), //icon data for elevated button
                                      label: const Text("Delete"),
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        minimumSize:
                                            const Size(double.infinity, 50),
                                        backgroundColor:
                                            const Color.fromARGB(170, 205, 50, 3),
                                      ),

                                      onPressed: () {
                                        showModalBottomSheet<dynamic>(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.white,
                                          context: context,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(20.0),
                                            ),
                                          ),
                                          builder: (context) {
                                            return Wrap(
                                              children: [
                                                SingleChildScrollView(
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 22.0,
                                                        vertical: 22),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Row(
                                                          children: const [
                                                            SizedBox(
                                                              width: 146,
                                                            ),
                                                            CircleAvatar(
                                                              backgroundImage:
                                                                  AssetImage(
                                                                      "assets/images/alert.png"),
                                                              radius: 25,
                                                            )
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                            height: 15),
                                                        RichText(
                                                          text: const TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text: 'Alert!',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 19,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          205,
                                                                          50,
                                                                          3),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 8),
                                                        const Text(
                                                          'Removing your advertisement for now will save all your data, which will assist you in republishing it later',
                                                          style: TextStyle(
                                                            fontSize: 13,
                                                            color: GlobalColors
                                                                .smallText,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 10),
                                                        const Text(
                                                          "No data will be stored after you click 'Delete items Permanently'",
                                                          style: TextStyle(
                                                            fontSize: 13,
                                                            color: GlobalColors
                                                                .smallText,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                        const Divider(
                                                            color: GlobalColors
                                                                .smallText,
                                                            thickness: 0.4),
                                                        const SizedBox(
                                                            height: 18),
                                                        uploadTile(
                                                          text:
                                                              'Remove for now',
                                                          imageString:
                                                              'assets/images/remove.png',
                                                          onPressed: () async {
                                                            _reference
                                                                .doc(
                                                                    '${thisItem['id']}')
                                                                .delete();

                                                            _ref
                                                                .doc(
                                                                    '${thisItem['id']}')
                                                                .set({
                                                              "image1":
                                                                  '${thisItem['image1']}',
                                                              "image2":
                                                                  '${thisItem['image2']}',
                                                              "image3":
                                                                  '${thisItem['image3']}',
                                                              "image4":
                                                                  '${thisItem['image4']}',
                                                              "desc":
                                                                  '${thisItem['desc']}',
                                                              "id":
                                                                  '${thisItem['id']}',
                                                              "depositep":
                                                                  '${thisItem['depositep']}',
                                                              "rentp":
                                                                  '${thisItem['rentp']}',
                                                              "uid":
                                                                  '${thisItem['uid']}',
                                                              "name":
                                                                  '${thisItem['name']}',
                                                              "category":
                                                                  "Farm",
                                                              "subcategory":
                                                                  "Farm Tools",
                                                            });

                                                            Navigator.pop(
                                                                context);
                                                          },
                                                        ),
                                                        const SizedBox(height: 14),
                                                        uploadTile(
                                                          text:
                                                              'Delete items Permanently',
                                                          imageString:
                                                              'assets/images/delete.png',
                                                          onPressed: () async {
                                                            //           _reference
                                                            // .doc('${thisItem['id']}')
                                                            // .delete();
                                                            // Navigator.pop(
                                                            //     context);
                                                            
                                                          },
                                                        ),
                                                        const SizedBox(height: 24),
                                                        ElevatedButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                            ),
                                                            minimumSize: const Size(
                                                                double.infinity,
                                                                50),
                                                            backgroundColor:
                                                                const Color(
                                                                    0xff1e9486),
                                                          ),
                                                          child: const Text(
                                                            "Cancel",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 13,
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(height: 16),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );

                                            // return SelectedMedicineAlternative();
                                          },
                                        );
                                      },
                                    )),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Flexible(
                                        flex: 1,
                                        child: ElevatedButton.icon(
                                          icon: const Icon(Icons
                                              .edit), //icon data for elevated button
                                          label: const Text("Edit"),
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            minimumSize:
                                                const Size(double.infinity, 50),
                                            backgroundColor:
                                                const Color(0xff1e9486),
                                          ),

                                          onPressed: () {},
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ));
                  },
                );
              }

              //Show loader
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ));
  }
}
