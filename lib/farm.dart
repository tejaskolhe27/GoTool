import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmer_app/screens/Products/product_details.dart';
import 'package:farmer_app/screens/main_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Farm extends StatelessWidget {
  Farm({Key? key}) : super(key: key) {
    _stream = _reference.snapshots();
  }

  // ignore: prefer_final_fields
  CollectionReference _reference = FirebaseFirestore.instance
      .collection('Products')
      .doc("Farm")
      .collection("Harvesters");

  // ignore: prefer_final_fields
  CollectionReference _ref = FirebaseFirestore.instance
      .collection('Delete')
      .doc("Farm")
      .collection("Harvesters");

  //_reference.get()  ---> returns Future<QuerySnapshot>
  //_reference.snapshots()--> Stream<QuerySnapshot> -- realtime updates
  late Stream<QuerySnapshot> _stream;

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
                  MaterialPageRoute(builder: (context) => const MainPage()));
            },
          ),
          title: const Padding(
            padding: EdgeInsets.only(right: 40),
            child: Align(
              alignment: Alignment(0, 0),
              child: Text(
                "Farming Products",
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
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => ProductDetails(
                                        detailsProduct: thisItem)));
                          },
                          onLongPress: () {
                            //showDeleteDialog(document);
                          },
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
                                      flex: 1,
                                      child: CachedNetworkImage(
                                        imageUrl: '${thisItem['image1']}',
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                          width:
                                              MediaQuery.of(context).size.width,
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
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 60,
                                    ),
                                    Flexible(
                                        child: ElevatedButton(
                                      child: Text("Delete"),
                                      onPressed: () {
                                        _reference
                                            .doc('${thisItem['id']}')
                                            .delete();

                                        _ref.doc('${thisItem['id']}').set({
                                          "image1": '${thisItem['image1']}',
                                          "image2": '${thisItem['image2']}',
                                          "image3": '${thisItem['image3']}',
                                          "image4": '${thisItem['image4']}',
                                          "desc": '${thisItem['desc']}',
                                          "id": '${thisItem['id']}',
                                          "depositep":
                                              '${thisItem['depositep']}',
                                          "rent": '${thisItem['rent']}',
                                          "uid": '${thisItem['uid']}',
                                          "name": '${thisItem['name']}',
                                        });
                                      },
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
