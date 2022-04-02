import 'package:appi/Trigger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
  bool _isVisible = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController passcont = TextEditingController();
  static TextEditingController emailcont = TextEditingController();
  bool hidePassword = true;
  Selected selection = Selected.email;

  Future<void> emailPasswordSignIn(String Email, String Password) async {
    try {
      passcont.clear();
      emailcont.clear();
      // await FirebaseAuth.instance.signOut();
      UserCredential userCredential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: Email, password: Password)
              .then((value) => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const MyTrigger())))
          as UserCredential;

      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => const MyTrigger()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  List<Widget> emailSpace = [
    TextFormField(
      controller: emailcont,
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
          prefixIcon: const Icon(Icons.phone),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    ),
  ];

  @override
  void dispose() {
    // super.dispose();
    passcont.dispose();
    emailcont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/img2.jpg'), fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              actions: [],
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
                          obscureText: !_isVisible,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'PLEASE ENTER PASSWORD';
                            }
                            return null;
                          },
                          //obscureText: hidePassword,
                          controller: passcont,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isVisible = !_isVisible;
                                  });
                                },
                                icon: _isVisible
                                    ? Icon(
                                        Icons.visibility,
                                        color: Colors.black,
                                      )
                                    : Icon(
                                        Icons.visibility_off,
                                        color: Colors.grey,
                                      ),
                              ),
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
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blueAccent.shade700,
                              side: BorderSide(width: 3, color: Colors.black),
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              padding: EdgeInsets.all(20)),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              emailPasswordSignIn(
                                  emailcont.value.text.toString(),
                                  passcont.value.text.toString());
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
                        /*Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CircleAvatar(
                              child: TextButton(

                              radius: 40,
                              backgroundColor: Colors.blueAccent.shade700,
                            ),
                            SizedBox(
                              width: 150,
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
                                signInWithGoogle();
                              },
                              child: const Text(
                                "google \n sign in",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        )*/
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
                    height: 85,
                  ),
                  Row(
                    children: const [
                      Text(
                        'HELPNo-XXXXXXXXXX \nEMAIL-ITIRP',
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
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      hidePassword = !hidePassword;
    });
  }
}
