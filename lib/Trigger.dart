import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appi/gps.dart';
import 'GoogleMap.dart';
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
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/img2.jpg'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
                padding: const EdgeInsets.only(left: 50, top: 70),
                child: const Text(
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
                          prefixIcon: const Icon(Icons.verified_user_outlined),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    // TextField(
                    //   decoration: InputDecoration(
                    //       fillColor: Colors.white,
                    //       filled: true,
                    //       hintText: 'STARING POINT',
                    //       prefixIcon: const Icon(Icons.gps_fixed),
                    //       border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(30))),
                    // ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        //Text('LOG IN',style: TextStyle(
                        //color: Color(0xFFFFFFFF),
                        //  fontSize: 25,
                        //   fontWeight: FontWeight.w700

                        //),
                        //),
                        const Text(
                          'TRIGGER',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        CircleAvatar(
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Gps()));
                            },
                            //new Text('',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight:FontWeight.bold
                            //),),
                            icon: const Icon(
                              Icons.arrow_forward,
                              size: 35,
                              color: Colors.white,
                            ),
                          ),
                          radius: 40,
                          backgroundColor: Colors.blueAccent.shade700,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        /* Text('LOG IN',style: TextStyle(
                        color: Color(0xFFFFFFFF),
                         fontSize: 25,
                          fontWeight: FontWeight.w700

                        ),
                        ),
                        CircleAvatar(
                        TextButton(
                         onPressed: () => {
                           Navigator.pushNamed(context, 'Registration')
                         },
                         child:new Text('SING UP',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight:FontWeight.bold
                        ),),
                        icon: Icon(Icons.arrow_forward),

                        ),
                        ),
                        CircleAvatar(

                        TextButton(
                        onPressed: () => {},
                        child:new Text('FORGOT PASSWORD',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight:FontWeight.bold,
                        ),),
                        icon: Icon(Icons.arrow_forward),

                        ),

                        ),*/
                      ],
                    ),
                    const SizedBox(
                      height: 85,
                    ),
                    Row(children: const [
                      Text(
                        'HELPNo-XXXXXXXXXX \nEMAIL-ITIRP',
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
