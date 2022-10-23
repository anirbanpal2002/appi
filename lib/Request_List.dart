import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RequestList extends StatefulWidget {
  const RequestList({Key? key}) : super(key: key);

  @override
  State<RequestList> createState() => _RequestListState();
}

class _RequestListState extends State<RequestList> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  Future getRequest() async {}
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.white),
        body: FutureBuilder(
          builder: (context, snapshot) {
            if (ConnectionState.active != null && !snapshot.hasData) {
              return const Center(child: Text("loading"));
            }
            if (ConnectionState.done != null && !snapshot.hasError) {
              return const Center(child: Text("Error"));
            }
            if (ConnectionState.done != null && !snapshot.hasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: ElevatedButton(
                      onPressed: () {},
                      child: const Text("REJECT"),
                    ),
                    title: Text("A -> B"),
                    trailing: ElevatedButton(
                      onPressed: () {},
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
