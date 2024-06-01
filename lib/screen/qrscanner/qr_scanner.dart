import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hse_expo_check/model/member.dart';
import 'package:hse_expo_check/screen/member_details/member_details.dart';

import 'package:http/http.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRViewScreen extends StatefulWidget {
  const QRViewScreen({super.key});

  @override
  State<StatefulWidget> createState() => _QRViewScreenState();
}

class _QRViewScreenState extends State<QRViewScreen> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool _isLoading = false;

  void _loadData() async {
    if (result == null || result!.code == null) {
      // Handle the case where result or result.code is null
      return;
    }

    if (!mounted) return; // Check if the widget is still mounted

    setState(() {
      _isLoading = true;
    });

    if (!mounted) return; // Check if the widget is still mounted

    final url = Uri.parse(
        "https://checkhh-5ceedbe08c3c.herokuapp.com/members/${result!.code!}");
    final Response res = await get(url);
    log(res.body);

    if (!mounted) return; // Check again before updating the state

    setState(() {
      _isLoading = false;
    });

    if (!mounted) return; // Check if the widget is still mounted

    final Map<String, dynamic> data = jsonDecode(res.body);
    Timer(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (ctx) => MemberDetails(
              member: Member(
                fullName: data['full_name'],
                teamname: data['team_name'],
              ),
              result: result,
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (result != null && result!.code != null) {
      controller!.pauseCamera();
      _loadData();
    }

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: _buildQrView(context),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text('Scan a code'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(8),
                          child: InkWell(
                            onTap: () async {
                              await controller?.toggleFlash();
                              setState(() {});
                            },
                            child: FutureBuilder(
                              future: controller?.getFlashStatus(),
                              builder: (context, snapshot) {
                                return Container(
                                  padding: const EdgeInsets.all(8),
                                  width: 150,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: snapshot.data == true
                                        ? Colors.white
                                        : Colors.blue,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Icon(
                                    Icons.flash_on,
                                    color: snapshot.data == true
                                        ? Colors.blue
                                        : Colors.white,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          if (_isLoading)
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.5),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: const Color(0xff0E8C87),
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
