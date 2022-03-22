import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:location/location.dart';

class MyTrigger extends StatefulWidget {
  const MyTrigger({Key? key}) : super(key: key);

  @override
  _MyTriggerState createState() => _MyTriggerState();
}

class _MyTriggerState extends State<MyTrigger> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/img2.jpg'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
                padding: EdgeInsets.only(left: 50, top: 70),
                child: Text(
                  'TRIGGER PAGE',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                )),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.3,
                    right: 35,
                    left: 35),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'DESTINATION',
                          prefixIcon: Icon(Icons.verified_user_outlined),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'STARING POINT',
                          prefixIcon: Icon(Icons.gps_fixed),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        //Text('LOG IN',style: TextStyle(
                        //color: Color(0xFFFFFFFF),
                        //  fontSize: 25,
                        //   fontWeight: FontWeight.w700

                        //),
                        //),
                        new Text(
                          'TRIGGER',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        CircleAvatar(
                          child: IconButton(
                            onPressed: () {},
                            //new Text('',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight:FontWeight.bold
                            //),),
                            icon: Icon(
                              Icons.arrow_forward,
                              size: 35,
                            ),
                          ),
                          radius: 40,
                          backgroundColor: Color(0xFF01579B),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //Text('LOG IN',style: TextStyle(
                        //color: Color(0xFFFFFFFF),
                        //  fontSize: 25,
                        //   fontWeight: FontWeight.w700

                        //),
                        //),
                        //CircleAvatar(
                        //TextButton(
                        //  onPressed: () => {
                        //    Navigator.pushNamed(context, 'Registration')
                        //  },
                        //  child:new Text('SING UP',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight:FontWeight.bold
                        // ),),
                        //icon: Icon(Icons.arrow_forward),

                        //),
                        //),
                        //CircleAvatar(

                        //TextButton(
                        // onPressed: () => {},
                        //child:new Text('FORGOT PASSWORD',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight:FontWeight.bold,
                        //),),
                        //icon: Icon(Icons.arrow_forward),

                        //),

                        //),
                      ],
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Row(children: [
                      Text(
                        'HELPNo-XXXXXXXXXX \nEmail-captainhydra',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
