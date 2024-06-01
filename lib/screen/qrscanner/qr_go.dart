import 'package:flutter/material.dart';
import 'package:hse_expo_check/screen/qrscanner/qr_scanner.dart';

class QrGo extends StatelessWidget {
  const QrGo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff082D44),
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 40),
          child: Text(
            'QR Code Scanner',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 120),
            Image.asset("assets/scanner.png"),
            const SizedBox(height: 150),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const QRViewScreen()));
              },
              child: Container(
                width: 250,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xff0E8C87),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Center(
                  child: Text(
                    'Scan QR Code',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
