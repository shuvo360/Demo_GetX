import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo_getx/content_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF69c5df),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            height: 700,
            child: Container(
              height: 700,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('img/background.jpg'), fit: BoxFit.cover),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'pick your favorite \nContests',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                // const Text(
                //   'Contests',
                //   style: TextStyle(
                //       fontSize: 32,
                //       fontWeight: FontWeight.w600,
                //       color: Colors.white),
                // ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 25,
                  child: const Text(
                    "We make great design work "
                    "happen with our great community designer",
                    style: TextStyle(color: Colors.white60),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  width: 200,
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFffbc33e)),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: const Color(0xFFfbc33e),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    onPressed: () => Get.to(() => ContentPage()),
                    child: const Text(
                      "Get started",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
