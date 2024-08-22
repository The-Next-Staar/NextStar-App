import 'package:flutter/material.dart';

class CompanyPopupPage extends StatelessWidget {
  const CompanyPopupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildMainContent(),
          _buildPopup(context),
        ],
      ),
    );
  }

  Widget _buildMainContent() {
    return SafeArea(
      child: Column(
        children: [
          _buildAppBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildPageTitle(),
                    _buildCompanyList(),
                  ],
                ),
              ),
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

  Widget _buildCompanyList() {
    return Column(
      children: [
        _buildCompanyCard(),
        const SizedBox(height: 10),
        _buildCompanyCard(),
        const SizedBox(height: 10),
        _buildCompanyCard(),
      ],
    );
  }

  Widget _buildCompanyCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F4F5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'JYP Online Audition',
                style: TextStyle(
                  color: Color(0xFF434343),
                  fontSize: 18,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0x1470737C),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Row(
                  children: [
                    Text(
                      '저장',
                      style: TextStyle(
                        color: Color(0x9B37383C),
                        fontSize: 12,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 3),
                    Icon(Icons.bookmark_border,
                        size: 14, color: Color(0x9B37383C)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            '차세대 스타를 찾고 있습니다.\n지금 그 주인공이 되어보세요.',
            style: TextStyle(
              color: Color(0xFF434343),
              fontSize: 13,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _buildTag('적극 모집 중'),
              const SizedBox(width: 8),
              _buildTag('지원 자격 무관'),
              const Spacer(),
              const Text(
                '상세보기',
                style: TextStyle(
                  color: Color(0xFF878787),
                  fontSize: 13,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Icon(Icons.chevron_right,
                  size: 16, color: Color(0xFF878787)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
      decoration: BoxDecoration(
        color: const Color(0x1470737C),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0x9B37383C),
          fontSize: 11,
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildPopup(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              '기업을 등록하세요!',
              style: TextStyle(
                color: Color(0xFF434343),
                fontSize: 22,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF878787),
                minimumSize: const Size(double.infinity, 44),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: const Text(
                '내 기업 등록하기',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
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
}
