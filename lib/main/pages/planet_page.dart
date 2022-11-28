import 'package:flutter/material.dart';
import 'package:planetka/main/components/indicators.dart';
import 'package:planetka/main/components/navigation_bar.dart';
import 'package:planetka/main/components/sample_button.dart';

class PlanetPage extends StatelessWidget {
  const PlanetPage({Key? key}) : super(key: key);

  static final List<Widget> _widgetOptions = <Widget>[
    const PlanetPage(),
    const PlanetPage(),
    const PlanetPage(),
    const PlanetPage(),
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
              Row(
                children: const [
                  IndicatorsComponent(
                    percent: 20,
                    imageUrl: 'assets/icons/icon-achievements.png',
                    text: 'gas',
                    fillColor: Color(0xff106EBE),
                    backgroundColor: Color(0xffEFF6FC),
                    borderColor: Color(0xffC7E0F4),
                  ),
                  IndicatorsComponent(
                    percent: 45,
                    imageUrl: 'assets/icons/icon-water.png',
                    text: 'water',
                    fillColor: Color(0xffAEA33C),
                    backgroundColor: Color(0xffF9FCEF),
                    borderColor: Color(0xffAEA33C),
                  ),
                  IndicatorsComponent(
                    percent: 10,
                    imageUrl: 'assets/icons/icon-area.png',
                    text: 'area',
                    fillColor: Color(0xff106EBE),
                    backgroundColor: Color(0xffEFF6FC),
                    borderColor: Color(0xffC7E0F4),
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
