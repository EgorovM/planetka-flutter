import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:planetka/main/components/indicators.dart';
import 'package:planetka/main/components/navigation_bar.dart';
import 'package:planetka/main/components/sample_button.dart';

import '../api/resource_api.dart';

class PlanetPage extends StatefulWidget {
  const PlanetPage({Key? key}) : super(key: key);

  @override
  State<PlanetPage> createState() => _PlanetPageState();
}

class _PlanetPageState extends State<PlanetPage> {
  final resourceApi = ResourceAPI();

  bool isShowed = false;
  int gasPercent = 0;
  int waterPercent = 0;
  int areaPercent = 0;

  _PlanetPageState() {
    setResources();
  }

  Future<void> setResources() async {
    final resources = await resourceApi.getResources();

    print(resources);

    gasPercent = resources["total_ghg"].round();
    waterPercent = resources["total_water"].round();
    areaPercent = resources["total_land"].round();

    setState(() {});
  }

  static final List<Widget> _foodOptions = <Widget>[
    Padding(
      padding: const EdgeInsets.all(5.0),
      child: Image.asset(
        'assets/icons/icon-samplefood.png',
        width: 56,
        height: 56,
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(5.0),
      child: Image.asset(
        'assets/icons/icon-samplefood.png',
        width: 56,
        height: 56,
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(5.0),
      child: Image.asset(
        'assets/icons/icon-samplefood.png',
        width: 56,
        height: 56,
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(5.0),
      child: Image.asset(
        'assets/icons/icon-samplefood.png',
        width: 56,
        height: 56,
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(5.0),
      child: Image.asset(
        'assets/icons/icon-samplefood.png',
        width: 56,
        height: 56,
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(5.0),
      child: Image.asset(
        'assets/icons/icon-samplefood.png',
        width: 56,
        height: 56,
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(5.0),
      child: Image.asset(
        'assets/icons/icon-samplefood.png',
        width: 56,
        height: 56,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 55,
        flexibleSpace: Container(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              SampleButton(
                destination: PlanetPage(),
                imgPath: 'assets/icons/icon-achievements.png',
                name: 'achievements',
                textColor: 'grey',
              ),
              SampleButton(
                  destination: PlanetPage(),
                  imgPath: 'assets/icons/icon-goals.png',
                  name: 'goals',
                  textColor: 'grey'),
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Global indicators',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/images/emotion-happy.png',
                    width: 300,
                    height: 500,
                    alignment: Alignment.bottomRight,
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      IndicatorsComponent(
                        percent: gasPercent,
                        imageUrl: 'assets/icons/icon-achievements.png',
                        text: 'gas',
                        fillColor: const Color(0xff106EBE),
                        backgroundColor: const Color(0xffEFF6FC),
                        borderColor: const Color(0xffC7E0F4),
                      ),
                      IndicatorsComponent(
                        percent: waterPercent,
                        imageUrl: 'assets/icons/icon-water.png',
                        text: 'water',
                        fillColor: const Color(0xffAEA33C),
                        backgroundColor: const Color(0xffF9FCEF),
                        borderColor: const Color(0xffAEA33C),
                      ),
                      IndicatorsComponent(
                        percent: areaPercent,
                        imageUrl: 'assets/icons/icon-area.png',
                        text: 'area',
                        fillColor: const Color(0xff106EBE),
                        backgroundColor: const Color(0xffEFF6FC),
                        borderColor: const Color(0xffC7E0F4),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 200),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      if (isShowed) {
                                        isShowed = false;
                                      } else {
                                        isShowed = true;
                                      }
                                    });
                                  },
                                  child: const IndicatorsComponent(
                                    percent: 0,
                                    imageUrl: 'assets/icons/icon-forks.png',
                                    text: 'food',
                                    fillColor: Color(0xffFFFFFF),
                                    backgroundColor: Color(0xffFFFFFF),
                                    borderColor: Color(0xffE8ECEF),
                                  ),
                                ),
                                isShowed
                                    ? SizedBox(
                                  width: 300,
                                  height: 70,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: _foodOptions.length,
                                      itemBuilder: (BuildContext context,
                                          int index) {
                                        return _foodOptions[index];
                                      }),
                                )
                                    : const Opacity(
                                  opacity: 0.0,
                                  child: Text("wow"),
                                ),
                              ],
                            ),
                            Container(
                              alignment: Alignment.bottomLeft,
                              child: TextButton(
                                onPressed: () {},
                                child: const IndicatorsComponent(
                                  percent: 0,
                                  imageUrl: 'assets/icons/icon-cup.png',
                                  text: 'water',
                                  fillColor: Color(0xffFFFFFF),
                                  backgroundColor: Color(0xffFFFFFF),
                                  borderColor: Color(0xffE8ECEF),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )
        ],
      ),
      bottomNavigationBar: const CustomNavigationBar(
        selectedIndex: 2,
      ),
    );
  }
}
