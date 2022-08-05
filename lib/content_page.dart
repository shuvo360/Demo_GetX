//import 'dart:ui';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({Key? key}) : super(key: key);

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  List list = [];
  List info = [];
  List img = [];

  _readdata() async {
    await DefaultAssetBundle.of(context)
        .loadString('json/recent.json')
        .then((p) {
      setState(() {
        list = jsonDecode(p);
      });
    });
    await DefaultAssetBundle.of(context)
        .loadString('json/detail.json')
        .then((p) {
      setState(() {
        info = jsonDecode(p);
      });
    });
    await DefaultAssetBundle.of(context).loadString('json/img.json').then((p) {
      setState(() {
        img = jsonDecode(p);
      });
    });
  }

  @override
  void initState() {
    _readdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double widget = MediaQuery.of(context).size.width;
    int _currentIndex = 0;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 70),
        color: const Color(0xFFc5e5f3),
        child: Column(
          children: [
            Container(
              width: widget,
              height: 100,
              margin: const EdgeInsets.only(left: 25, right: 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xFFebf8fd),
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('img/background.jpg'),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'James Smith',
                          style: TextStyle(
                            color: Color(0xFF3b3f42),
                            fontSize: 18,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Top Level',
                          style: TextStyle(
                            color: Color(0xFFfdebb2),
                            fontSize: 12,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                    Expanded(child: Container()),
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xFFf3fafc),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.notifications,
                          color: Color(0xFF69c5df),
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            //popular contest
            Container(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Row(
                children: [
                  Text(
                    'Popular Contest',
                    style: TextStyle(
                        color: Color(0xFF1f2326),
                        fontSize: 20,
                        decoration: TextDecoration.none),
                  ),
                  Expanded(child: Container()),
                  Text(
                    'Show all',
                    style: TextStyle(
                        color: Color(0xFFcfd5b3),
                        fontSize: 15,
                        decoration: TextDecoration.none),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xFFfdc33c),
                    ),
                    child: GestureDetector(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            //list
            Container(
              height: 220,
              child: PageView.builder(
                controller: PageController(viewportFraction: 0.88),
                itemCount: info.length,
                itemBuilder: (_, i) {
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed('/detail', arguments: {
                        'title': info[i]['title'].toString(),
                        'name': info[i]['name'].toString(),
                        'img': info[i]['img'].toString(),
                        'text': info[i]['text'].toString(),
                        'time': info[i]['time'].toString(),
                        'prize': info[i]['prize'].toString(),
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      height: 220,
                      width: MediaQuery.of(context).size.width - 20,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: i.isEven
                            ? Color.fromARGB(255, 63, 147, 170)
                            : Color(0xFF9294cc),
                      ),
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Text(
                                  info[i]['title'],
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                                Expanded(child: Container()),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: widget,
                            child: Text(
                              info[i]['text'],
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xFFb8eefc),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Divider(
                            thickness: 1.0,
                          ),
                          Row(
                            children: [
                              for (int i = 0; i < info.length; i++)
                                SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      image: DecorationImage(
                                        image: AssetImage(info[i]['img']),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            //recent contest
            Container(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Row(
                children: [
                  Text(
                    'Recent Contests',
                    style: TextStyle(
                        color: Color(0xFF1f2326),
                        fontSize: 20,
                        decoration: TextDecoration.none),
                  ),
                  Expanded(child: Container()),
                  Text(
                    'Show all',
                    style: TextStyle(
                        color: Color(0xFFcfd5b3),
                        fontSize: 15,
                        decoration: TextDecoration.none),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFfdc33c),
                    ),
                    child: GestureDetector(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: list.length,
                  itemBuilder: (_, i) {
                    return Container(
                      width: widget,
                      height: 100,
                      margin: const EdgeInsets.only(
                          left: 25, right: 25, bottom: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFFebf8fd),
                      ),
                      child: Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundImage: AssetImage(list[i]['img']),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  list[i]['status'],
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 143, 113, 13),
                                    fontSize: 12,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  width: 70,
                                  child: Text(
                                    list[i]['text'],
                                    style: TextStyle(
                                        color: Color(0xFF3b3f42),
                                        fontSize: 12,
                                        decoration: TextDecoration.none),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(child: Container()),
                            Container(
                              width: 70,
                              height: 70,
                              child: Text(
                                list[i]['time'],
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Color(0xFFb2b8bb),
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
