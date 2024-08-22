import 'package:flutter/material.dart';
import 'package:nextstar_app/pages/individuals/create_profile.dart';

class IndividualPopupPage extends StatelessWidget {
  final Color tnsMainPink = const Color(0xFFEF69A6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildMainContent(),
          Container(
            color: Colors.white.withOpacity(0.8),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: _buildProfilePrompt(context),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildMainContent() {
  return SafeArea(
    child: Column(
      children: [
        _buildAppBar(),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              _buildPageTitle(),
              _buildFilterChip(),
              _buildTotalCompaniesCount(),
              _buildCompanyList(),
            ],
          ),
        ),
        _buildBottomNavigationBar(),
      ],
    ),
  );
}

Widget _buildAppBar() {
  return Container(
    height: 52,
    padding: const EdgeInsets.symmetric(horizontal: 20),
    decoration: const BoxDecoration(
      color: Colors.white,
      border: Border(bottom: BorderSide(color: Color(0xFFD9D9D9))),
    ),
    child: const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'TN STUDIO',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF434343),
          ),
        ),
        Icon(Icons.menu, color: Color(0xFF434343)),
      ],
    ),
  );
}

Widget _buildPageTitle() {
  return const Padding(
    padding: EdgeInsets.only(top: 24, bottom: 16),
    child: Text(
      '기업 리스트 보기',
      style: TextStyle(
        color: Color(0xFF434343),
        fontSize: 20,
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}

Widget _buildFilterChip() {
  return Container(
    margin: const EdgeInsets.only(bottom: 16),
    child: Wrap(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: ShapeDecoration(
            color: const Color(0xFFFFF5FC),
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0xFFFFE9F3)),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: const Text(
            '모집 중인 기업만 보기',
            style: TextStyle(
              color: Color(0xFFEF69A6),
              fontSize: 14,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildTotalCompaniesCount() {
  return const Padding(
    padding: EdgeInsets.only(bottom: 16),
    child: Text(
      '전체 기업 3곳',
      style: TextStyle(
        color: Color(0xFF878787),
        fontSize: 12,
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}

Widget _buildCompanyList() {
  return Column(
    children: [
      _buildCompanyCard(
        'JYP Online Audition',
        '차세대 스타를 찾고 있습니다.\n지금 그 주인공이 되어보세요.',
        ['현재 모집 중', '7일 남음'],
      ),
      const SizedBox(height: 10),
      _buildCompanyCard(
        'JYP Online Audition',
        '차세대 스타를 찾고 있습니다.\n지금 그 주인공이 되어보세요.',
        ['모집 예정'],
      ),
    ],
  );
}

Widget _buildCompanyCard(String title, String subtitle, List<String> tags) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    decoration: ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: Color(0xFFD9D9D9)),
        borderRadius: BorderRadius.circular(6),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF434343),
            fontSize: 18,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: const TextStyle(
            color: Color(0xFF434343),
            fontSize: 13,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            ...tags.map((tag) => _buildTag(tag)).toList(),
            const Spacer(),
            const Text(
              '상세보기',
              style: TextStyle(
                color: Color(0xFF878787),
                fontSize: 12,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w500,
              ),
            ),
            const Icon(Icons.arrow_forward_ios,
                size: 12, color: Color(0xFF878787)),
          ],
        ),
      ],
    ),
  );
}

Widget _buildTag(String label) {
  return Container(
    margin: const EdgeInsets.only(right: 8),
    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
    decoration: BoxDecoration(
      color: label.contains('모집 중')
          ? const Color(0xFFEF69A6)
          : label.contains('모집 예정')
              ? const Color(0xFFF4F4F5)
              : const Color(0xFFFFF2F8),
      borderRadius: BorderRadius.circular(4),
    ),
    child: Text(
      label,
      style: TextStyle(
        color: label.contains('모집 중')
            ? Colors.white
            : label.contains('모집 예정')
                ? const Color(0xFFCBCBCB)
                : const Color(0xFFA139B2),
        fontSize: 12,
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

Widget _buildProfilePrompt(BuildContext context) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      const Text(
        '아직 프로필이 없어요!',
        style: TextStyle(
          color: Color(0xFF434343),
          fontSize: 20,
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w700,
        ),
      ),
      const SizedBox(height: 8),
      const Text(
        '프로필 만들고 더 많은 오디션 정보를 얻어요.',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xFF878787),
          fontSize: 14,
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w400,
        ),
      ),
      const SizedBox(height: 24),
      Image.asset(
        'assets/images/individual_popup.png',
        width: 300,
        fit: BoxFit.contain,
      ),
      ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfileCreatePage()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFEF69A6),
          minimumSize: const Size(double.infinity, 44),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          padding: EdgeInsets.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: const Text(
          '내 프로필 만들기',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ],
  );
}

Widget _buildBottomNavigationBar() {
  return Container(
    height: 80,
    decoration: const BoxDecoration(
      color: Colors.white,
      border: Border(top: BorderSide(color: Color(0xFFD9D9D9))),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildBottomNavItem(Icons.list, '기업리스트', const Color(0xFF434343)),
        _buildBottomNavItem(Icons.file_copy, '지원관리', const Color(0xFFD9D9D9)),
        _buildBottomNavItem(Icons.person, '마이페이지', const Color(0xFFD9D9D9)),
      ],
    ),
  );
}

Widget _buildBottomNavItem(IconData icon, String label, Color color) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: color),
      const SizedBox(height: 4),
      Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w700,
        ),
      ),
    ],
  );
}
