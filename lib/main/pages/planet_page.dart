import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:planetka/main/components/indicators.dart';
import 'package:planetka/main/components/navigation_bar.dart';
import 'package:planetka/main/components/sample_button.dart';

import '../api/resource_api.dart';
import '../components/food.dart';

class PlanetPage extends StatefulWidget {
  const PlanetPage({Key? key}) : super(key: key);

  @override
  State<PlanetPage> createState() => _PlanetPageState();
}

class _PlanetPageState extends State<PlanetPage> {
  final resourceApi = ResourceAPI();

  String planetImage = "assets/images/emotion-happy.png";

  bool isShowed = false;
  bool isWaterShowed = false;
  int gasPercent = 0;
  int waterPercent = 0;
  int areaPercent = 0;

  @override
  void initState() {
    setResources();
    setFoods();
    super.initState();
  }

  Future<void> setResources() async {
    final resources = await resourceApi.getResources();
    print(resources);
    gasPercent = min(max((resources["total_ghg"]).round(), 0), 100);
    waterPercent = min(max((resources["total_water"]).round(), 0), 100);
    areaPercent = min(max((resources["total_land"]).round(), 0), 100);
    setState(() {});
  }

  Future<void> foodCallback(Map foodJson) async {
    await setResources();

    if(!foodJson["is_green"]) {
      setState(() {
        planetImage = "assets/images/emotion-sad.png";
      });

      Timer(
          const Duration(seconds: 2),
          () => setState(() {
            planetImage = "assets/images/emotion-happy.png";
          })
      );
      }
  }

  Future<void> setFoods() async {
    _foodOptions.clear();
    _waterOptions.clear();

    final foods = await resourceApi.getFoods();

    for(final foodJson in foods) {
      (foodJson["type"] == "drink" ? _waterOptions : _foodOptions).add(
          FoodComponent(foodJson, foodCallback)
      );
    }
    setState(() {});
  }

  static final List<Widget> _foodOptions = <Widget>[];
  static final List<Widget> _waterOptions = <Widget>[];

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
                    planetImage,
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
                                      isShowed = !isShowed;
                                      isWaterShowed = false;
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
                            Row(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      isWaterShowed = !isWaterShowed;
                                      isShowed = false;
                                    });
                                  },
                                  child: const IndicatorsComponent(
                                    percent: 0,
                                    imageUrl: 'assets/icons/icon-cup.png',
                                    text: 'water',
                                    fillColor: Color(0xffFFFFFF),
                                    backgroundColor: Color(0xffFFFFFF),
                                    borderColor: Color(0xffE8ECEF),
                                  ),
                                ),
                                isWaterShowed
                                    ? SizedBox(
                                  width: 300,
                                  height: 70,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: _waterOptions.length,
                                      itemBuilder: (BuildContext context,
                                          int index) {
                                        return _waterOptions[index];
                                      }),
                                )
                                    : const Opacity(
                                  opacity: 0.0,
                                  child: Text("wow"),
                                ),
                              ],
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
