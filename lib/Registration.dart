import 'package:appi/Instruction.dart';
import 'package:appi/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyRegistration extends StatefulWidget {
  const MyRegistration({Key? key}) : super(key: key);

  @override
  _MyRegistrationState createState() => _MyRegistrationState();
}

class _MyRegistrationState extends State<MyRegistration> {
  final _regKey = GlobalKey<FormState>();
  TextEditingController passcont = TextEditingController();
  TextEditingController emailcont = TextEditingController();
  TextEditingController phcont = TextEditingController();
  TextEditingController vlcont = TextEditingController();
  final FirebaseFirestore database = FirebaseFirestore.instance;
  String radioValue = "Ambulance";
  Future<void> signInWithEmail(String Email, String Password) async {
    try {
      passcont.clear();
      emailcont.clear();
      phcont.clear();
      vlcont.clear();
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: Email, password: Password)
          .whenComplete(() {
        //print('User Added');
        //Navigator.push(
        //    context, MaterialPageRoute(builder: (context) => const MyLogin()));
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Instruction()));
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void addRegistrationDetail(
      String password, String email, String ph, String vl) {
    database.collection("Users").add({
      'PASSWORD': password,
      'EMAIL': email,
      'PHONE_NUMBER': ph,
      'VEHICLE_NUMBER': vl,
      'TYPE_OF_SERVICE': radioValue,
    }).then((value) {
      signInWithEmail(email, password);
      // print('User Added');
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => const MyLogin()));
      //return true;
    }).catchError((error) {
      print('ERROR');
      //return false;
    });

    //return false;
  }

  @override
  void dispose() {
    // super.dispose();
    passcont.dispose();
    emailcont.dispose();
    vlcont.dispose();
    phcont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/img2.jpg'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: const Text(
            'REGISTRATION',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
          padding: const EdgeInsets.only(right: 35, left: 35),
          child: Form(
            key: _regKey,
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Radio(
                      fillColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.white),
                      toggleable: true,
                      activeColor: Colors.white,
                      value: 'AMBULANCE',
                      groupValue: radioValue,
                      onChanged: (value) {
                        setState(() {
                          radioValue = value.toString();
                        });
                      },
                    ),
                    const Text(
                      "Ambulance",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 90.0),
                    Radio(
                      fillColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.white),
                      toggleable: true,
                      activeColor: Colors.white,
                      value: "Fire",
                      groupValue: radioValue,
                      onChanged: (value) {
                        setState(() {
                          radioValue = value.toString();
                        });
                      },
                    ),
                    const Text(
                      "Fire",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: emailcont,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'PLEASE ENTER YOUR USER ID';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      errorStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'EMAIL',
                      prefixIcon: const Icon(Icons.email),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: phcont,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'PLEASE ENTER YOUR USER ID';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      errorStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Phone Number',
                      prefixIcon: const Icon(Icons.phone_android),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: vlcont,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'PLEASE ENTER YOUR USER ID';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      errorStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "V NUMBER",
                      prefixIcon: const Icon(
                        Icons.car_rental,
                        size: 30,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: passcont,
                  keyboardType: TextInputType.name,
                  // key: _regKey,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'PLEASE ENTER USER NAME';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      errorStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: ' PASSWORD ',
                      prefixIcon: const Icon(Icons.verified_user_rounded),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                ),
                const SizedBox(
                  height: 10,
                ),
                //ElevatedButton.icon(
                //   style: ElevatedButton.styleFrom(
                //     primary: Colors.white,
                //     onPrimary: Colors.grey,
                //     shadowColor: Colors.greenAccent,
                //     elevation: 3,
                //     shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(32.0)),
                //     minimumSize: const Size(345, 50), //////// HERE
                //   ),
                //   onPressed: () {},
                //   label: const Text('UPLOAD PDF OF VL'),
                //   icon: const Icon(Icons.picture_as_pdf_rounded),
                // ),

                //TextField(
                //  decoration:InputDecoration(
                //      fillColor: Colors.white,
                //      filled: true,
                //      hintText: 'V L pdf',
                //      prefixIcon: Icon(Icons.picture_as_pdf),
                //      border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(30))) ,
                //),

                // const SizedBox(
                //   height: 10,
                // ),
                //TextField(
                //  decoration:InputDecoration(
                //      fillColor: Colors.white,
                //      filled: true,
                //      hintText: 'H pdf',
                //      prefixIcon: Icon(Icons.picture_as_pdf),
                //      border: OutlineInputBorder(
                //          borderRadius: BorderRadius.circular(30))) ,
                //),
                // ElevatedButton.icon(
                //   style: ElevatedButton.styleFrom(
                //     primary: Colors.white,
                //     onPrimary: Colors.grey,
                //     shadowColor: Colors.greenAccent,
                //     elevation: 3,
                //     shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(32.0)),
                //     minimumSize: const Size(345, 50), //////// HERE
                //   ),
                //   onPressed: () {},
                //   label: const Text('UPLOAD PDF OF H.L'),
                //   icon: const Icon(Icons.picture_as_pdf_rounded),
                // ),
                // const SizedBox(
                //   height: 15,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Text('LOG IN',style: TextStyle(
                    //color: Color(0xFFFFFFFF),
                    //  fontSize: 25,
                    //   fontWeight: FontWeight.w700

                    //),
                    //),
                    //CircleAvatar(
                    //child:
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blueAccent.shade700,
                        onPrimary: Colors.grey,
                        shadowColor: Colors.greenAccent,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                        minimumSize: const Size(30, 50),
                      ),
                      onPressed: () {
                        if (_regKey.currentState!.validate()) {
                          print('Valid');
                          addRegistrationDetail(
                            passcont.value.text,
                            emailcont.value.text,
                            phcont.value.text,
                            vlcont.value.text,
                          );
                        }
                      },
                      child: const Text(
                        'MAKE \n PAYMENT',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      //icon: Icon(Icons.arrow_forward),
                    ),
                    // radius: 50,
                    // backgroundColor: Color(0xFF01579B),
                    // ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    //Text('LOG IN',style: TextStyle(
                    //color: Color(0xFFFFFFFF),
                    //  fontSize: 25,
                    //   fontWeight: FontWeight.w700

                    //),
                    //),
                    //CircleAvatar(

                    //icon: Icon(Icons.arrow_forward),
                    Text(
                      'HELPNo-XXXXXXXXXX \nEMAIL-ITIRP',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //CircleAvatar(

                    //TextButton(
                    //  onPressed: () => {},
                    //  child:new Text('FORGOT PASSWORD',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight:FontWeight.bold,
                    //  ),),
                    //icon: Icon(Icons.arrow_forward),

                    //),

                    //),
                  ],
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
