import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hse_expo_check/screen/home/home.dart';
import 'package:hse_expo_check/widgets/floating_button.dart';

import 'package:http/http.dart';

class TableScreen extends StatefulWidget {
  const TableScreen({super.key});

  @override
  State<TableScreen> createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  List data = [];
  bool isLoading = true;

  Future<void> getData() async {
    final Response response = await get(
        Uri.parse('https://checkhh-5ceedbe08c3c.herokuapp.com/members'));
    final List<dynamic> memberList = jsonDecode(response.body) as List;
    setState(() {
      data = memberList;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 15.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
                icon: const Icon(
                  Icons.home_outlined,
                  size: 30,
                ),
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NavHome()),
                    )),
            const SizedBox(width: 20),
            // Adjust the spacing as needed
            IconButton(icon: const Icon(Icons.logout), onPressed: () {}),
          ],
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/logo.png", width: 100, height: 100),
                  Image.asset("assets/circle.png"),
                ],
              ),
              const SizedBox(height: 50),
              const Text(
                "member Details",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Table(
                        columnWidths: const {
                          0: FlexColumnWidth(1),
                          1: FlexColumnWidth(2),
                          2: FlexColumnWidth(2),
                          3: FlexColumnWidth(3),
                          4: FlexColumnWidth(3),
                        },
                        border: TableBorder.all(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10)),
                        children: [
                          TableRow(
                            children: [
                              TableCell(
                                child: Container(
                                  height: 55,
                                  color: const Color(0xffEBEBEB),
                                  padding: const EdgeInsets.all(8.0),
                                  child: const Center(
                                    child: Text(
                                      'id',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Container(
                                  height: 55,
                                  color: const Color(0xffEBEBEB),
                                  padding: const EdgeInsets.all(8.0),
                                  child: const Center(
                                    child: Text(
                                      'Full Name',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Container(
                                  height: 55,
                                  color: const Color(0xffEBEBEB),
                                  padding: const EdgeInsets.all(8.0),
                                  child: const Center(
                                    child: Text(
                                      'Team Name',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Container(
                                  height: 55,
                                  color: const Color(0xffEBEBEB),
                                  padding: const EdgeInsets.all(8.0),
                                  child: const Center(
                                    child: Text(
                                      'Check in',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Container(
                                  height: 55,
                                  color: const Color(0xffEBEBEB),
                                  padding: const EdgeInsets.all(8.0),
                                  child: const Center(
                                    child: Text(
                                      'Check out',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          for (int i = 0; i < data.length; i++)
                            TableRow(
                              children: [
                                TableCell(
                                  child: Container(
                                    height: 55,
                                    color: i % 2 == 0
                                        ? const Color(0xffEBEBEB)
                                        : Colors.white,
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(
                                        data[i]['id'].toString(),
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    height: 55,
                                    color: i % 2 == 0
                                        ? const Color(0xffEBEBEB)
                                        : Colors.white,
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(
                                        data[i]['full_name'].toString(),
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    height: 55,
                                    color: i % 2 == 0
                                        ? const Color(0xffEBEBEB)
                                        : Colors.white,
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(
                                        data[i]['team_name'].toString(),
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    height: 55,
                                    color: i % 2 == 0
                                        ? const Color(0xffEBEBEB)
                                        : Colors.white,
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(
                                        data[i]['check_in'].toString(),
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    height: 55,
                                    color: i % 2 == 0
                                        ? const Color(0xffEBEBEB)
                                        : Colors.white,
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(
                                        data[i]['check_out'].toString(),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          // Add more rows as needed
                        ],
                      ),
                    )
            ],
          ),
        ),
      )),
    );
  }
}
