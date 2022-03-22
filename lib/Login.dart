import 'package:appi/Trigger.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/painting.dart';

enum Selected {
  email,
  phone,
}

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final _formKey = GlobalKey<FormState>();
  bool hidePassword = true;
  Selected selection = Selected.email;

  List<Widget> emailSpace = [
    TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'PLEASE ENTER YOUR EMAIL ID';
        }
        return null;
      },
      decoration: InputDecoration(
          errorStyle: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
          fillColor: Colors.white,
          filled: true,
          hintText: 'Email Id',
          prefixIcon: const Icon(Icons.verified_user_rounded),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    ),
  ];
  List<Widget> phoneSpace = [
    TextFormField(
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'PLEASE ENTER YOUR PHONE NUMBER';
        }
        return null;
      },
      decoration: InputDecoration(
          errorStyle: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
          fillColor: Colors.white,
          filled: true,
          hintText: 'Phone Number',
          prefixIcon: const Icon(Icons.verified_user_rounded),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/img2.jpg'), fit: BoxFit.cover),
      ),
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: const Text(
              'LOGIN',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blueAccent.shade700,
                            side: BorderSide(width: 3, color: Colors.black),
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            padding: EdgeInsets.all(20)),
                        onPressed: () {
                          setState(() {
                            selection = Selected.email;
                          });
                        },
                        child: const Text(
                          "Email",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blueAccent.shade700,
                            side: BorderSide(width: 3, color: Colors.black),
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            padding: EdgeInsets.all(20)),
                        onPressed: () {
                          setState(() {
                            selection = Selected.phone;
                          });
                        },
                        child: const Text(
                          "Phone",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    // key: _formKey,
                    children: [
                      Column(
                        children: (selection == Selected.email)
                            ? emailSpace
                            : phoneSpace,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'PLEASE ENTER PASSWORD';
                          }
                          return null;
                        },
                        obscureText: hidePassword,
                        decoration: InputDecoration(
                            errorStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'PASSWORD',
                            prefixIcon: const Icon(Icons.security),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CircleAvatar(
                        child: TextButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const MyTrigger()));
                            }
                          },
                          child: const Text(
                            'log in',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        radius: 40,
                        backgroundColor: Colors.blueAccent.shade700,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 45,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    TextButton(
                      onPressed: () => {
                        Navigator.pushNamed(
                          context,
                          'Registration',
                        ),
                      },
                      child: const Text(
                        'SIGN UP',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'FORGOT PASSWORD',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: const [
                    Text(
                      'HELPNo-XXXXXXXXXX \nEmail-captainhydra',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      hidePassword = !hidePassword;
    });
  }
}
