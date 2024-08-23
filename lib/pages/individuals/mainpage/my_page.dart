import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileSection(),
            _buildSectionTitle('내 프로필 관리'),
            _buildListItem('내 프로필 열람 기업 (20곳)'),
            _buildListItem('프로필 수정하기'),
            _buildSectionTitle('오디션 관리'),
            _buildListItem('내 지원 현황 관리'),
            _buildListItem('내가 저장한 기업'),
            _buildSectionTitle('설정'),
            _buildListItem('시스템 설정'),
            _buildListItem('문의하기'),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 40, bottom: 20, right: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF878787)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '나의 프로필',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF434343),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Container(
                width: 107,
                height: 134,
                color: const Color(0xFFD9D9D9),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('이름:', style: _profileTextStyle()),
                  const SizedBox(height: 10),
                  Text('나이:', style: _profileTextStyle()),
                  const SizedBox(height: 10),
                  Text('스펙:', style: _profileTextStyle()),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xFF434343),
        ),
      ),
    );
  }

  Widget _buildListItem(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFFF4F4F5)),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          color: Color(0xFF434343),
        ),
      ),
    );
  }

  TextStyle _profileTextStyle() {
    return const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Color(0xFF434343),
    );
  }
}
