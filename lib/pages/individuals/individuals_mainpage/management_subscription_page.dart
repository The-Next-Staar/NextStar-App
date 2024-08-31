import 'package:flutter/material.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({super.key});

  @override
  _SubscriptionPageState createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  final List<bool> _featureAnimations = [false, false, false];
  bool _buttonAnimation = false;

  @override
  void initState() {
    super.initState();
    _startAnimations();
  }

  void _startAnimations() {
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() => _featureAnimations[0] = true);
    });
    Future.delayed(const Duration(milliseconds: 600), () {
      setState(() => _featureAnimations[1] = true);
    });
    Future.delayed(const Duration(milliseconds: 900), () {
      setState(() => _featureAnimations[2] = true);
    });
    Future.delayed(const Duration(milliseconds: 1200), () {
      setState(() => _buttonAnimation = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF292131), Colors.black],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF3F8),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  'Premium',
                  style: TextStyle(
                    color: Color(0xFFE685B1),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                '지금 당신의 매니저를 구독하세요!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '내 매니저를 고용해서\n아이돌 데뷔에 더 가까워져요!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFD9D9D9),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 30),
              _buildAnimatedFeatureItem(
                  0, '1', '연습 일지 및 평가', '노래와 영상을 업로드하고, 평가서로 기록해봐요!'),
              const SizedBox(height: 15),
              _buildAnimatedFeatureItem(
                  1, '2', '오늘의 식단 구성', '최적의 컨디션을 위한 맞춤형 식단을 제공합니다!'),
              const SizedBox(height: 15),
              _buildAnimatedFeatureItem(
                  2, '3', '오디션 우선 제공', '비공개 오디션 기회를 누구보다 먼저 누리세요!'),
              const Spacer(),
              _buildAnimatedSubscriptionButton(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureItem(String number, String title, String description) {
    return Container(
      width: double.infinity,
      height: 79,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFF302737),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: const Color(0xFF5A4E63),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: Text(
                number,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedFeatureItem(
      int index, String number, String title, String description) {
    return AnimatedOpacity(
      opacity: _featureAnimations[index] ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 500),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
        transform:
            Matrix4.translationValues(0, _featureAnimations[index] ? 0 : 20, 0),
        child: _buildFeatureItem(number, title, description),
      ),
    );
  }

  Widget _buildSubscriptionButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              title: const Center(
                child: Text(
                  '준비 중입니다.',
                  style: TextStyle(
                    color: Color(0xFFEF69A6),
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              actions: <Widget>[
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFFEF69A6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: const Text(
                      '확인',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
      child: Container(
        width: 350,
        height: 70,
        decoration: BoxDecoration(
          color: const Color(0xFFEF69A6),
          borderRadius: BorderRadius.circular(6),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '월 26,000원',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  '7일 무료체험',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Text(
              '나만의 매니저 고용하기',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedSubscriptionButton() {
    return AnimatedOpacity(
      opacity: _buttonAnimation ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 500),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
        transform: Matrix4.translationValues(0, _buttonAnimation ? 0 : 20, 0),
        child: _buildSubscriptionButton(context),
      ),
    );
  }
}
