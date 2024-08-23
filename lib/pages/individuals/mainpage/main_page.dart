import 'package:flutter/material.dart';
import 'company_list_page.dart';
import 'application_management_page.dart';
import 'my_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    CompanyListPage(),
    const ApplicationManagementPage(),
    const MyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildCustomAppBar(),
          Expanded(
            child: _pages[_selectedIndex],
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildCustomAppBar() {
    return Container(
      width: double.infinity,
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/the_next_star_logo_line.png',
              width: 140,
              height: 15.07,
              fit: BoxFit.contain,
            ),
            const Icon(Icons.menu, size: 24, color: Color(0xFF171719)),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      height: 90,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFD9D9D9))),
      ),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildBottomNavItem(0, 'companylist'),
              _buildBottomNavItem(1, 'contact'),
              _buildBottomNavItem(2, 'mypage'),
            ],
          ),
          Positioned(
            top: 0,
            left: MediaQuery.of(context).size.width / 6 +
                (_selectedIndex * MediaQuery.of(context).size.width / 3) -
                24.5,
            child: Container(
              width: 49,
              height: 5,
              decoration: BoxDecoration(
                color: const Color(0xFF434343),
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavItem(int index, String label) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/${label}_${isSelected ? 'true' : 'false'}.png',
            width: 50,
            height: 50,
          ),
        ],
      ),
    );
  }
}
