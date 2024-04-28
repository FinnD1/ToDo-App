import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/task/create_task_page.dart';
import 'package:flutter_firebase/ui/home_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> pages = [];
  int _currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    pages = [
      const HomeScreen(),
      Container(
        color: Colors.green,
      ),
      Container(
        color: Colors.blue,
      ),
      Container(
        color: Colors.yellow,
      ),
      Container(
        color: Colors.amber,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      body: pages.elementAt(_currentPage),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF363636),
        unselectedItemColor: Colors.white,
        selectedItemColor: Color(0xFF8687E7),
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentPage,
        onTap: (index) {
          if (index == 2) return; //khong lam j ca
          setState(() {
            _currentPage = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/home-2.png",
                width: 24,
                height: 24,
                fit: BoxFit.fill,
              ),
              activeIcon: Image.asset(
                "assets/images/home-2.png",
                width: 24,
                height: 24,
                fit: BoxFit.fill,
                color: const Color(0xFF8687E7),
              ),
              backgroundColor: Colors.transparent,
              label: "Home"),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/calendar.png",
                width: 24,
                height: 24,
                fit: BoxFit.fill,
              ),
              activeIcon: Image.asset(
                "assets/images/calendar.png",
                width: 24,
                height: 24,
                fit: BoxFit.fill,
                color: const Color(0xFF8687E7),
              ),
              backgroundColor: Colors.transparent,
              label: "Calendar"),
          BottomNavigationBarItem(
              icon: Container(),
              label: "",
              backgroundColor: Colors.transparent),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/clock.png",
                width: 24,
                height: 24,
                fit: BoxFit.fill,
              ),
              activeIcon: Image.asset(
                "assets/images/clock.png",
                width: 24,
                height: 24,
                fit: BoxFit.fill,
                color: const Color(0xFF8687E7),
              ),
              backgroundColor: Colors.transparent,
              label: "Focuse"),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/user.png",
                width: 24,
                height: 24,
                fit: BoxFit.fill,
              ),
              activeIcon: Image.asset(
                "assets/images/user.png",
                width: 24,
                height: 24,
                fit: BoxFit.fill,
                color: const Color(0xFF8687E7),
              ),
              backgroundColor: Colors.transparent,
              label: "Profile"),
        ],
      ),
      floatingActionButton: Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          color: Color(0xFF8687E7),
          borderRadius: BorderRadius.circular(32),
        ),
        child: IconButton(
            onPressed: _onShowCreateTask,
            icon: Icon(
              Icons.add,
              size: 32,
              color: Colors.white,
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void _onShowCreateTask() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: const CreateTaskPage());
        });
  }
}
