import 'package:flutter/material.dart';
import '../../login/login_page.dart';

class CompaniesRegistrationPage3 extends StatefulWidget {
  @override
  _CompaniesRegistrationPage3State createState() =>
      _CompaniesRegistrationPage3State();
}

class _CompaniesRegistrationPage3State
    extends State<CompaniesRegistrationPage3> {
  bool _isAllAgreed = false;
  List<bool> _agreements = List.generate(4, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 390,
        height: 844,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            _buildAppBar(),
            _buildProgressIndicator(),
            _buildPageTitle(),
            _buildAllAgreementCheckbox(),
            _buildAgreementsList(),
            _buildCompleteButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Positioned(
      left: 0,
      top: 44,
      child: SizedBox(
        width: 390,
        height: 42.86,
        child: Stack(
          children: [
            Positioned(
              left: 20,
              top: 9,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: const Icon(Icons.arrow_back, color: Color(0xFF434343)),
              ),
            ),
            const Positioned(
              left: 164,
              top: 8,
              child: Text(
                '기업회원 회원가입',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF434343),
                  fontSize: 18,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return Positioned(
      left: 297,
      top: 102,
      child: SizedBox(
        width: 72.59,
        height: 18.59,
        child: Stack(
          children: [
            _buildProgressStep(0, '1'),
            _buildProgressStep(27, '2'),
            _buildProgressStep(54, '3'),
            _buildProgressLine(18),
            _buildProgressLine(45),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressStep(double left, String text) {
    return Positioned(
      left: left,
      top: 0,
      child: Container(
        width: 18.59,
        height: 18.59,
        decoration: const ShapeDecoration(
          color: Color(0xFF434343),
          shape: OvalBorder(),
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFFF4F4F5),
              fontSize: 12,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProgressLine(double left) {
    return Positioned(
      left: left,
      top: 11,
      child: Container(
        width: 10,
        decoration: const ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              strokeAlign: BorderSide.strokeAlignCenter,
              color: Color(0xFF434343),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPageTitle() {
    return const Positioned(
      left: 20,
      top: 136,
      child: Text(
        '이용약관',
        style: TextStyle(
          color: Color(0xFF434343),
          fontSize: 24,
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildAllAgreementCheckbox() {
    return Positioned(
      left: 20,
      top: 192,
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isAllAgreed = !_isAllAgreed;
            _agreements = List.generate(4, (_) => _isAllAgreed);
          });
        },
        child: Container(
          width: 350,
          height: 60,
          decoration: ShapeDecoration(
            color: const Color(0xFFD9D9D9),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          ),
          child: Stack(
            children: [
              const Positioned(
                left: 30,
                top: 18,
                child: Text(
                  '약관 전체동의',
                  style: TextStyle(
                    color: Color(0xFF878787),
                    fontSize: 16,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Positioned(
                left: 300,
                top: 17.20,
                child: Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFF878787)),
                  ),
                  child: _isAllAgreed
                      ? const Icon(Icons.check,
                          size: 20, color: Color(0xFF878787))
                      : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAgreementsList() {
    return Positioned(
      left: 20,
      top: 282,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '필수 약관 전체동의',
            style: TextStyle(
              color: Color(0xFF434343),
              fontSize: 18,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 27),
          ..._agreements.asMap().entries.map((entry) {
            return _buildAgreementItem(entry.key, '(필수) 개인정보 수집/이용 동의');
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildAgreementItem(int index, String text) {
    return Container(
      width: 350,
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: Color(0xFFD9D9D9),
              fontSize: 16,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _agreements[index] = !_agreements[index];
                    _isAllAgreed = _agreements.every((element) => element);
                  });
                },
                child: Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFFD9D9D9)),
                  ),
                  child: _agreements[index]
                      ? const Icon(Icons.check,
                          size: 20, color: Color(0xFFD9D9D9))
                      : null,
                ),
              ),
              const SizedBox(width: 10),
              const Icon(Icons.arrow_forward_ios,
                  color: Color(0xFFD9D9D9), size: 20),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCompleteButton() {
    return Positioned(
      left: 20,
      top: 684,
      child: GestureDetector(
        onTap: _showCompletionPopup,
        child: Container(
          width: 350,
          height: 44,
          decoration: ShapeDecoration(
            color: const Color(0xFF878787),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          ),
          child: const Center(
            child: Text(
              '완료하기',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showCompletionPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          content: SizedBox(
            width: 300,
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '회원가입이 완료되었습니다!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: const Text('로그인하러 가기'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
