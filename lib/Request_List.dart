import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RequestList extends StatefulWidget {
  const RequestList({Key? key}) : super(key: key);

  @override
  State<RequestList> createState() => _RequestListState();
}

class _RequestListState extends State<RequestList> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  List<String> list = [];
  Future<List<String>> getRequest() async {
    firebaseFirestore
        .collection("Users")
        .where("VERIFICATION", isEqualTo: true)
        .get()
        .then((QuerySnapshot ds) {
      for (DocumentSnapshot documentSnapshot in ds.docs) {
        firebaseFirestore
            .collection("Users")
            .doc(documentSnapshot.id)
            .collection("Request")
            .get()
            .then((QuerySnapshot element) {
          for (DocumentSnapshot documentSnapshot2 in element.docs) {
            list.clear();
            list.add(documentSnapshot2.get("CURRENT_LONG"));
            list.add(documentSnapshot2.get("CURRENT_LAT"));
            list.add(documentSnapshot2.get("DESTINATION_LONG"));
            list.add(documentSnapshot2.get("DESTINATION_LAT"));
            list.add(documentSnapshot.id);
            list.add(documentSnapshot2.id);
            return list;
          }
        });
      }
    });
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.white),
        body: FutureBuilder(
          builder: (context, snapshot) {
            if (ConnectionState.active != null && !snapshot.hasData) {
              return const Center(child: Text("loading..."));
            }
            if (ConnectionState.done != null && !snapshot.hasError) {
              return const Center(child: Text("Error"));
            }
            if (ConnectionState.done != null && !snapshot.hasData) {
              final data = snapshot.data as List<String>;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: ElevatedButton(
                      onPressed: () {
                        firebaseFirestore
                            .collection("Users")
                            .doc("$data[4]")
                            .collection("Request")
                            .doc("$data[5]")
                            .update({"REQUEST_APPROVE": false}).then((value) {
                          print("Request Rejected");
                        });
                      },
                      child: const Text("REJECT"),
                    ),
                    title: Text("$data[0],$data[1] => $data[2],$data[3]"),
                    trailing: ElevatedButton(
                      onPressed: () {
                        firebaseFirestore
                            .collection("Users")
                            .doc("$data[4]")
                            .collection("Request")
                            .doc("$data[5]")
                            .update({"REQUEST_APPROVE": true}).then((value) {
                          print("Request Accepted");
                        });
                      },
                      child: const Text("Accept"),
                    ),
                    onTap: () {},
                    enabled: true,
                  );
                },
                itemCount: 5,
              );
            }
            return Container();
          },
          future: getRequest(),
        ),
      ),
    );
  }
}
