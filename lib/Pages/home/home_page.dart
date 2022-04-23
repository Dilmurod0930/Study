import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:study/Pages/bodys/calendar_screen.dart';
import 'package:study/Pages/bodys/home_screen.dart';
import 'package:study/Pages/bodys/person_screen.dart';
import 'package:study/Pages/bodys/screen3.dart';
import 'package:study/core/constants/color_const.dart';
import 'package:study/providers/bottom_bar_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Widget> bodys;

  @override
  void initState() {
    super.initState();
    bodys = const [
      HomeScreen(),
      CalendarScreen(),
      Screen3Page(),
      PersonAccountScreen()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodys[context.watch<BottomBarProvider>().currenetIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          context.read<BottomBarProvider>().statusCurrentIndex(value);
        },
        currentIndex: context.watch<BottomBarProvider>().currenetIndex,
        backgroundColor: ColorConst.kTransparentColor,
        elevation: 0,
        items: items,
      ),
    );
  }

  List<BottomNavigationBarItem> items = [
  
    BottomNavigationBarItem(
        label: "", icon: SvgPicture.asset('assets/icons/fi-sr-apps.svg')),
    BottomNavigationBarItem(
        label: "", icon: SvgPicture.asset('assets/icons/fi-sr-calendar.svg')),
    BottomNavigationBarItem(
        label: "", icon: SvgPicture.asset('assets/icons/bottom3.svg')),
    BottomNavigationBarItem(
        label: "", icon: SvgPicture.asset('assets/icons/fi-sr-user.svg')),
  ];
}
