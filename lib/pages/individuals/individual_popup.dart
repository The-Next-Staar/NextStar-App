import 'package:flutter/material.dart';
import 'create_profile.dart';

class IndividualPopupPage extends StatelessWidget {
  final Color tnsMainPink = const Color(0xFFEF69A6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/individual_background.png',
            fit: BoxFit.cover,
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
            backgroundColor: tnsMainPink,
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
}
