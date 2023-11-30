import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freezeriot/Activity/Partials/CardIndikator.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(23, 24, 26, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 80.h,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Text(
                "Hi, Alexa",
                style: TextStyle(
                    fontFamily: "Inria", color: Colors.white, fontSize: 25.sp),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(16, 27, 43, 1),
                  borderRadius: BorderRadius.circular(10.h)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Indikator",
                    style: TextStyle(
                        color: Colors.grey,
                        fontFamily: "Inria",
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CardIndikator(context,
                          width: 150.w,
                          height: 50.h,
                          icon: Icons.thermostat,
                          iconColor: Colors.orange,
                          label: "Suhu Freezer",
                          value: "27 *C"),
                      CardIndikator(context,
                          width: 150.w,
                          height: 50.h,
                          icon: Icons.waves,
                          value: "37 *C",
                          label: "Suhu Lingkungan",
                          iconColor: Colors.deepOrange),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CardIndikator(context,
                          width: 150.w,
                          height: 50.h,
                          value: "230 RPM",
                          label: "Speed Kipas",
                          icon: Icons.energy_savings_leaf,
                          iconColor: Colors.green),
                      CardIndikator(context,
                          width: 150.w,
                          height: 50.h,
                          label: "Daya",
                          value: "70 watt",
                          icon: Icons.wind_power,
                          iconColor: Colors.blue),
                    ],
                  ),
                ],
              ),
            ),
          ),
           SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.08,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(16, 27, 43, 1),
                        borderRadius: BorderRadius.circular(10.h)),
                  )
        ],
      ),
    );
  }
}
