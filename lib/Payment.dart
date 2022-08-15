import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'CIPHERS';
    return const MaterialApp(
      home: PaymentScreen(),
      title: appTitle,
      debugShowCheckedModeBanner: false,
    );
  }
}

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Center(
            child: Text(
          'PAYMENT OPTIONS',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        )),
      ),
      backgroundColor: Colors.deepPurple.shade700,
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(children: [
            const SizedBox(
              height: 90,
            ),
            Container(
                margin: const EdgeInsets.all(7),
                child: ElevatedButton.icon(
                  onPressed: () {
                    /*Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PlayFont.PlayFont()));*/
                  },
                  label: const Text('PLAYFAIR CIPHER',
                      style: TextStyle(fontSize: 20)),
                  icon: const Icon(Icons.play_arrow),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    primary: Colors.deepOrange,
                    padding: const EdgeInsets.all(16),
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            Container(
                margin: const EdgeInsets.all(7),
                child: ElevatedButton.icon(
                  onPressed: () {
                    /*Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ));*/
                  },
                  label: const Text('CAESAR CIPHER',
                      style: TextStyle(fontSize: 20)),
                  icon: const Icon(Icons.play_arrow),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200, 50),
                    maximumSize: const Size(270, 80),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    primary: Colors.deepOrange,
                    padding: const EdgeInsets.all(16),
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            Container(
                margin: const EdgeInsets.all(7),
                child: ElevatedButton.icon(
                  onPressed: () {
                    /*Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ));*/
                  },
                  label:
                      const Text('OTP CIPHER', style: TextStyle(fontSize: 20)),
                  icon: const Icon(Icons.play_arrow),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200, 50),
                    maximumSize: const Size(270, 80),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    primary: Colors.deepOrange,
                    padding: const EdgeInsets.all(16),
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            Container(
                margin: const EdgeInsets.all(7),
                child: ElevatedButton.icon(
                  onPressed: () {
                    /*Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CipherFront()));*/
                  },
                  label:
                      const Text('OTTENDORF', style: TextStyle(fontSize: 20)),
                  icon: const Icon(Icons.play_arrow),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200, 50),
                    maximumSize: const Size(270, 80),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    primary: Colors.deepOrange,
                    padding: const EdgeInsets.all(16),
                  ),
                )),
            Column(children: []),
          ]),
        ),
      ),
    );
  }
}
