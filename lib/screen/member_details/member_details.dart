// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hse_expo_check/model/member.dart';
import 'package:http/http.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class MemberDetails extends StatefulWidget {
  const MemberDetails({super.key, required this.member, required this.result});
  final Member member;
  final Barcode? result;

  @override
  State<MemberDetails> createState() => _MemberDetailsState();

  Future<String> checkIn() async {
    try {
      final url = Uri.parse(
          "https://checkhh-5ceedbe08c3c.herokuapp.com/checkin/${result!.code}");
      final Response res = await post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"id": result!.code}),
      );

      if (res.statusCode < 400) {
        // Successful check-in
        final Map<String, dynamic> responseData = jsonDecode(res.body);
        final String message = responseData["message"];
        return message;
      } else {
        final Map<String, dynamic> responseData = jsonDecode(res.body);
        final String message = responseData["message"];
        return message;
      }
    } catch (e) {
      // Handle exceptions
      return "An error occurred during check-in: $e";
    }
  }

  Future<String> checkOut() async {
    try {
      final url = Uri.parse(
          "https://checkhh-5ceedbe08c3c.herokuapp.com/checkout/${result!.code}");
      final Response res = await post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"id": result!.code}),
      );

      if (res.statusCode < 400) {
        // Successful check-in
        final Map<String, dynamic> responseData = jsonDecode(res.body);
        final String message = responseData["message"];
        return message;
      } else {
        final Map<String, dynamic> responseData = jsonDecode(res.body);
        final String message = responseData["message"];
        return message;
      }
    } catch (e) {
      // Handle exceptions
      return "An error occurred during check-in: $e";
    }
  }
}

class _MemberDetailsState extends State<MemberDetails> {
  @override
  Widget build(BuildContext context) {
    final Member member = widget.member;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/logo.png", width: 100, height: 100),
                  Image.asset("assets/circle.png"),
                ],
              ),
              const SizedBox(height: 50),
              const Center(
                child: Text(
                  "Member Details",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 80),
              deatils("Full Name", member.fullName),
              const SizedBox(height: 20),
              deatils("Team Name", member.teamname),
              const SizedBox(height: 100),
              GestureDetector(
                onTap: () async {
                  try {
                    final message = await widget.checkIn();
                    setState(() {
                      showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog.adaptive(
                                title: const Text("Check In success"),
                                content: Text(message),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(ctx);
                                      },
                                      child: const Text("ok"))
                                ],
                              ));
                    });
                    log(message);

                    // ... rest of your code
                  } catch (e) {
                    // Handle exceptions if needed
                    log("Error during check-in: $e");
                  }
                },
                child: Container(
                  height: 60,
                  width: 230,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xff0E8C87).withOpacity(0.5),
                        const Color(0xff273D8A).withOpacity(0.5)
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      "Check In",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  try {
                    final message = await widget.checkOut();
                    setState(() {
                      showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog.adaptive(
                                title: const Text("Check Out success"),
                                content: Text(message),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(ctx);
                                      },
                                      child: const Text("ok"))
                                ],
                              ));
                    });
                    log(message);

                    // ... rest of your code
                  } catch (e) {
                    // Handle exceptions if needed
                    log("Error during check-in: $e");
                  }
                },
                child: Container(
                  height: 60,
                  width: 200,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                      colors: [
                        const Color(0xff0E8C87).withOpacity(0.5),
                        const Color(0xff273D8A).withOpacity(0.5)
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      "Check Out",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Container deatils(key, value) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 18),
    margin: const EdgeInsets.symmetric(horizontal: 20),
    decoration: BoxDecoration(
      border: Border.all(color: const Color(0xff0E8C87), width: 1.5),
      borderRadius: const BorderRadius.all(
        Radius.circular(5),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$key :",
          style: const TextStyle(fontSize: 17, color: Colors.black),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(value, style: const TextStyle(fontSize: 17, color: Colors.blue)),
      ],
    ),
  );
}
