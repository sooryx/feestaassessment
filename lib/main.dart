import 'package:feesta/Constants/theme.dart';
import 'package:feesta/Providers/Homescreen/RestaurantItemProvider.dart';
import 'package:feesta/Screens/Homescreen/Homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
   MyApp(),

  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(411.42857142857144, 843.4285714285714),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => RestaurantItemProvider(),
            ),
          ],
          child: MaterialApp(
            title: 'Zomato Clone',
            debugShowCheckedModeBanner: false,
            theme: CustomTheme.theme,
            home: HomeScreen(),
          ),
        );
      }
    );


  }
}


