import 'package:flutter/material.dart';
import 'package:hse_expo_check/screen/home/home_screen.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 500, right: 100),
                child: Stack(alignment: Alignment.center, children: [
                  Image.asset("assets/cirlce2.png"),
                  Container(
                    padding: const EdgeInsets.only(top: 100, left: 60),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff0E8C87),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()));
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.arrow_forward, color: Colors.white),
                            Text(
                              "Get Started",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ],
                        )),
                  )
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 130),
                child: ClipPath(
                  clipper: BottomOvalClipper(),
                  child: Container(
                    height: 650,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/bg.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 130),
                child: ClipPath(
                  clipper: BottomOvalClipper(),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 650,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color(0xff0E8C87).withOpacity(0.5),
                          const Color(0xff273D8A).withOpacity(0.5)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset("assets/logo2.png"),
                      const SizedBox(
                        width: 10,
                      ),
                      Image.asset("assets/speb.png", width: 150, height: 150),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 150),
                    child: Text("QHESE-EXPO\nCHECK-IN\nAPP",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Custom clipper for the bottom oval shape
class BottomOvalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(
        0, size.height - 100); // Change 100 to adjust the height of the curve
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 100);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
