import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmer_app/screens/Products/product_details.dart';
import 'package:farmer_app/screens/addproduct/additem.dart';
import 'package:farmer_app/screens/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class Landscape extends StatelessWidget {
  Landscape({Key? key}) : super(key: key) {
    _stream = FirebaseFirestore.instance
      .collection('Products')
      .doc("Outdoor")
      .collection("Landscaping")
      .where("uid", isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .snapshots();
  }



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
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const MainPage()));
          },
        ),
        title: const Padding(
          padding: EdgeInsets.only(right: 40),
          child: Align(
            alignment: Alignment(0, 0),
            child: Text(
              "Landscapping Tools",
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
      body: StreamBuilder<QuerySnapshot>(
        stream: _stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          //Check error
          if (snapshot.hasError) {
            return Center(child: Text('Some error occurred ${snapshot.error}'));
          }

          //Check if data arrived
          if (snapshot.hasData) {
            //get the data
            QuerySnapshot querySnapshot = snapshot.data;
            List<QueryDocumentSnapshot> documents = querySnapshot.docs;

            //Convert the documents to Maps
            List<Map> items = documents.map((e) => e.data() as Map).toList();

            //Display the list

            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.68,
                ),
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  //Get the item at this index
                  Map thisItem = items[index];
                  // print(thisItem);
                  //REturn the widget for the list items
                  return Card(
                    margin: const EdgeInsets.all(4),
                    color: const Color(0xffffffff),
                    shadowColor: const Color(0xff000000),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                ProductDetails(detailsProduct: thisItem)));
                      },
                      child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
//============================================ image of Product =========================================================================
                                Container(
                                  child: thisItem.containsKey('image1')
                                      ? Image.network(
                                          '${thisItem['image1']}',
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.15,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          fit: BoxFit.cover,
                                        )
                                      : Container(),
                                ),

//=============================================================== Image end =======================================================
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          '${thisItem['name']}',
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.clip,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 12,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.fromLTRB(0, 4, 0, 0),
                                          child: Text(
                                            '${thisItem['desc']}',
                                            textAlign: TextAlign.start,
                                            maxLines: 3,
                                            overflow: TextOverflow.clip,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 12,
                                              color: Color(0xff7c7c7c),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                  flex: 1,
                                                  child: Row(
                                                    children: <Widget>[
                                                      const Text("₹ ",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black)),
                                                      Text(
                                                        '${thisItem['depositep']}',
                                                        textAlign:
                                                            TextAlign.start,
                                                        maxLines: 1,
                                                        overflow:
                                                            TextOverflow.clip,
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontSize: 14,
                                                          color:
                                                              Color(0xff000000),
                                                        ),
                                                      ),
                                                    ],
                                                  )),
                                              Container(
                                                  alignment: Alignment.center,
                                                  margin: const EdgeInsets.all(0),
                                                  padding: const EdgeInsets.all(0),
                                                  width: 46,
                                                  height: 20,
                                                  decoration: BoxDecoration(
                                                    color: const Color(0xff1e9486),
                                                    shape: BoxShape.rectangle,
                                                    borderRadius:
                                                        BorderRadius.zero,
                                                    border: Border.all(
                                                        color:
                                                            const Color(0x4d9e9e9e),
                                                        width: 1),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: <Widget>[
                                                      const Text("₹ ",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white)),
                                                      Text(
                                                        '${thisItem['rentp']}',
                                                        textAlign:
                                                            TextAlign.start,
                                                        overflow:
                                                            TextOverflow.clip,
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontSize: 11,
                                                          color:
                                                              Color(0xffffffff),
                                                        ),
                                                      ),
                                                    ],
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ])),
                      // child:
                      //   GestureDetector(
                      //     onTap: () {
                      //       Navigator.of(context).push(MaterialPageRoute(
                      //           builder: (context) => ProductDetails()));
                      //     },
                      //   ),
                    ),
                  );
                });
          }

          //Show loader
          return const Center(child: CircularProgressIndicator());
        },
      ), //Display a list // Add a FutureBuilder
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const AddItem()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
        backgroundColor: const Color(0xff1e9486),
      ),
    );
  }
}
