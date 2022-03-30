import 'package:flutter/material.dart';

class Instruction extends StatefulWidget {
  const Instruction({Key? key}) : super(key: key);

  @override
  State<Instruction> createState() => _InstructionState();
}

class _InstructionState extends State<Instruction> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/abd.jpg"), fit: BoxFit.cover),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 150.0),
              child: Column(
                children: [
                  Text(
                    "\t \t YOUR REGISTRATION IS COMPLETE"
                    "\n\n After ONE to FOUR hours your conformation massage will send through"
                    "\t\t\nyour email and email"
                    "\t \n \n \t \t \t \t \t \t \t \t \t \t \t \t \t \t \t \t \t \t \t \t \t \t \t \t \t THANK YOU",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.redAccent.shade700,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  const Text(
                    '\t \t FOR RETURN PRESS TICK',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        'Login',
                      );
                    },
                    //new Text('',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight:FontWeight.bold
                    //),),
                    icon: const Icon(
                      Icons.verified,
                      size: 70,
                      color: Colors.blueAccent,
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
