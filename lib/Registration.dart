import 'package:appi/Login.dart';
import 'package:flutter/material.dart';
import 'package:appi/Trigger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyRegistration extends StatefulWidget {
  const MyRegistration({Key? key}) : super(key: key);

  @override
  _MyRegistrationState createState() => _MyRegistrationState();
}

class _MyRegistrationState extends State<MyRegistration> {
  final _regKey = GlobalKey<FormState>();
  TextEditingController uncont = TextEditingController();
  TextEditingController emailcont = TextEditingController();
  TextEditingController phcont = TextEditingController();
  TextEditingController vlcont = TextEditingController();
  final FirebaseFirestore database = FirebaseFirestore.instance;

  void addRegistrationDetail(String un, String email, String ph, String vl) {
    database.collection("Users").add({
      'USER_NAME': un,
      'EMAIL': email,
      'PHONE_NUMBER': ph,
      'VEHICLE_NUMBER': vl,
    }).then((value) {
      print('User Added');
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const MyLogin()));
      //return true;
    }).catchError((error) {
      print('ERROR');
      //return false;
    });

    //return false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage('assets/img2.jpg'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            //IconButton(
            //onPressed: () => {Navigator.pop(context, 'Login')},
            //icon: Icon(
            //  Icons.arrow_back,
            //  size: 30,
            //  color: Colors.white,
            //),
            //padding: EdgeInsets.only(left: 25, top: 30),
            //child:new Text('Sing in',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight:FontWeight.bold
            //),),
            //icon: Icon(Icons.arrow_forward),
            //),
            Container(
                padding: EdgeInsets.only(left: 50, top: 40),
                child: Text(
                  'REGISTRATION',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                )),
            SingleChildScrollView(
                child: Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.14,
                  right: 35,
                  left: 35),
              child: Form(
                key: _regKey,
                child: Column(
                  children: [
                    SizedBox(
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
                          errorStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'EMAIL',
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                    SizedBox(
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
                          errorStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Phone Number',
                          prefixIcon: Icon(Icons.phone_android),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                    SizedBox(
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
                          errorStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'V number',
                          prefixIcon: Icon(Icons.car_rental),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: uncont,
                      keyboardType: TextInputType.name,
                      // key: _regKey,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'PLEASE ENTER USER NAME';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          errorStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: ' PASSWORD ',
                          prefixIcon: Icon(Icons.verified_user_rounded),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.grey,
                        shadowColor: Colors.greenAccent,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                        minimumSize: Size(345, 50), //////// HERE
                      ),
                      onPressed: () {},
                      label: Text('UPLOAD PDF OF VL'),
                      icon: Icon(Icons.picture_as_pdf_rounded),
                    ),

                    //TextField(
                    //  decoration:InputDecoration(
                    //      fillColor: Colors.white,
                    //      filled: true,
                    //      hintText: 'V L pdf',
                    //      prefixIcon: Icon(Icons.picture_as_pdf),
                    //      border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(30))) ,
                    //),

                    SizedBox(
                      height: 10,
                    ),
                    //TextField(
                    //  decoration:InputDecoration(
                    //      fillColor: Colors.white,
                    //      filled: true,
                    //      hintText: 'H pdf',
                    //      prefixIcon: Icon(Icons.picture_as_pdf),
                    //      border: OutlineInputBorder(
                    //          borderRadius: BorderRadius.circular(30))) ,
                    //),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.grey,
                        shadowColor: Colors.greenAccent,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                        minimumSize: Size(345, 50), //////// HERE
                      ),
                      onPressed: () {},
                      label: Text('UPLOAD PDF OF H.L'),
                      icon: Icon(Icons.picture_as_pdf_rounded),
                    ),
                    SizedBox(
                      height: 15,
                    ),
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
                            minimumSize: Size(30, 50),
                          ),
                          onPressed: () {
                            if (_regKey.currentState!.validate()) {
                              print('Valid');
                              addRegistrationDetail(
                                  uncont.value.text,
                                  emailcont.value.text,
                                  phcont.value.text,
                                  vlcont.value.text);
                            }
                          },
                          child: new Text(
                            'Sign in',
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
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //Text('LOG IN',style: TextStyle(
                        //color: Color(0xFFFFFFFF),
                        //  fontSize: 25,
                        //   fontWeight: FontWeight.w700

                        //),
                        //),
                        //CircleAvatar(

                        //icon: Icon(Icons.arrow_forward),
                        Text(
                          'HELPNo-XXXXXXXXXX \nEmail-captainhydra',
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
            ))
          ],
        ),
      ),
    );
  }
}
