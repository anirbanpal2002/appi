import 'package:appi/CraditCard.dart';
import 'package:appi/PaymentScreen.dart';
import 'package:flutter/material.dart';

class Ammount extends StatefulWidget {
  const Ammount({Key? key}) : super(key: key);

  @override
  State<Ammount> createState() => _AmmountState();
}

class _AmmountState extends State<Ammount> {
  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/bg.png"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Form(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    obscureText: !_isVisible,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'PLEASE ENTER PASSWORD';
                      }
                      return null;
                    },
                    //obscureText: hidePassword,
                    decoration: InputDecoration(
                        errorStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Enter the Amount',
                        prefixIcon: const Icon(Icons.currency_rupee),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red.shade700,
                        side: BorderSide(width: 0, color: Colors.black),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.all(20)),
                    onPressed: () {
                      setState(() {
                        setState(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PaymentScreen()));
                        });
                      });
                    },
                    child: const Text(
                      'PROCEED',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
