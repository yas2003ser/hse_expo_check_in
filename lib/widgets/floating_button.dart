import 'package:flutter/material.dart';
import 'package:hse_expo_check/screen/qrscanner/qr_go.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const QrGo(),
            ),
          );
        },
        tooltip: 'QR Code',
        backgroundColor: const Color(0xff0E8C87),
        child: const Icon(
          Icons.qr_code,
          color: Colors.white,
        ), // Adjust the color as needed
      ),
    );
  }
}
