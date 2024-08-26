import 'package:flutter/material.dart';
import 'search_page.dart';
import 'search_results_page.dart';
import 'proposal_management_page.dart';
import 'my_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  String _searchQuery = '';

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      SearchPage(onSearch: _handleSearch),
      SearchResultsPage(searchQuery: _searchQuery),
      const ProposalManagementPage(),
      const MyPage(),
    ];
  }

  void _handleSearch(String query) {
    setState(() {
      _searchQuery = query;
      _selectedIndex = 1;
      _pages[1] = SearchResultsPage(searchQuery: _searchQuery);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildAppBar(),
          Expanded(
            child: _pages[_selectedIndex],
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildAppBar() {
    return Container(
      width: double.infinity,
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 24),
            Image.asset(
              'assets/images/the_next_star_logo_line.png',
              width: 150,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 24),
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
              _buildBottomNavItem(0, 'finding'),
              _buildBottomNavItem(2, 'contact'),
              _buildBottomNavItem(3, 'mypage'),
            ],
          ),
          Positioned(
            top: 0,
            left: MediaQuery.of(context).size.width / 6 +
                (_selectedIndex == 0
                    ? 0
                    : (_selectedIndex - 1) *
                        MediaQuery.of(context).size.width /
                        3) -
                24.5,
            child: Container(
              width: 49,
              height: 5,
              decoration: const BoxDecoration(
                color: Color(0xFF434343),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavItem(int index, String label) {
    bool isSelected =
        _selectedIndex == index || (index == 0 && _selectedIndex <= 1);
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
          if (index == 0) {
            _searchQuery = '';
            _pages[1] = SearchResultsPage(searchQuery: _searchQuery);
          }
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
