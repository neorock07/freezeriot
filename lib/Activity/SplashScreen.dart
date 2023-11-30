import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freezeriot/Activity/Menu.dart';

class SplashScreen extends StatefulWidget {
const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 3), (){
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => Menu())
          );
    });
  }
  
  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.dispose();
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
       backgroundColor: const Color.fromRGBO(23, 24, 26, 1) ,  
       appBar: AppBar(
        backgroundColor:const Color.fromRGBO(23, 24, 26, 1),
       ), 
       body: Center(
        child: Text("LOGO", 
          style: TextStyle(
            color: const Color.fromRGBO(170, 54, 252, 1),
            fontFamily: "Inria",
            fontSize: 25.sp,
            fontWeight: FontWeight.bold
          ),
        ),
       ),
    );
  }
}