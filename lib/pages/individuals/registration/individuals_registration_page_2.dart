import 'package:flutter/material.dart';
import 'individuals_registration_page_3.dart';

class IndividualsRegistrationPage2 extends StatefulWidget {
  @override
  _IndividualsRegistrationPage2State createState() =>
      _IndividualsRegistrationPage2State();
}

class _IndividualsRegistrationPage2State
    extends State<IndividualsRegistrationPage2> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String? _selectedEmailDomain;
  final List<String> _emailDomains = [
    'gmail.com',
    'naver.com',
    'daum.net',
    '직접입력'
  ];

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
            _buildRegistrationForm(),
            _buildNextButton(),
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
                '회원가입',
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
            _buildProgressStep(0, '1', true),
            _buildProgressStep(27, '2', true),
            _buildProgressStep(54, '3', false),
            _buildProgressLine(18, true),
            _buildProgressLine(45, false),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressStep(double left, String text, bool isActive) {
    return Positioned(
      left: left,
      top: 0,
      child: Container(
        width: 18.59,
        height: 18.59,
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF434343) : const Color(0xFFD9D9D9),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            text,
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

  Widget _buildProgressLine(double left, bool isActive) {
    return Positioned(
      left: left,
      top: 11,
      child: Container(
        width: 10,
        height: 2,
        color: isActive ? const Color(0xFF434343) : const Color(0xFFD9D9D9),
      ),
    );
  }

  Widget _buildPageTitle() {
    return const Positioned(
      left: 20,
      top: 136,
      child: Text(
        '기업회원 회원가입',
        style: TextStyle(
          color: Color(0xFF434343),
          fontSize: 24,
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildRegistrationForm() {
    return Positioned(
      left: 20,
      top: 192,
      child: SizedBox(
        width: 350,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInputField('아이디', _idController,
                hasSuffixButton: true, suffixButtonText: '중복확인'),
            const SizedBox(height: 20),
            _buildPasswordFields(),
            const SizedBox(height: 20),
            _buildEmailField(),
            const SizedBox(height: 20),
            _buildInputField('휴대폰 번호', _phoneController,
                hasSuffixButton: true, suffixButtonText: '인증번호 받기'),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String label, TextEditingController controller,
      {bool hasSuffixButton = false, String? suffixButtonText}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF434343),
            fontSize: 18,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  color: const Color(0xFFF4F4F5),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    hintText: '${label}를 입력해주세요.',
                    hintStyle: const TextStyle(
                      color: Color(0xFF878787),
                      fontSize: 14,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            if (hasSuffixButton) ...[
              const SizedBox(width: 15),
              Container(
                width: 150,
                height: 44,
                decoration: BoxDecoration(
                  color: const Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Text(
                    suffixButtonText!,
                    style: const TextStyle(
                      color: Color(0xFF878787),
                      fontSize: 16,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }

  Widget _buildPasswordFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '비밀번호',
          style: TextStyle(
            color: Color(0xFF434343),
            fontSize: 18,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 45,
          decoration: BoxDecoration(
            color: const Color(0xFFF4F4F5),
            borderRadius: BorderRadius.circular(6),
          ),
          child: TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              hintText: '비밀번호',
              hintStyle: TextStyle(
                color: Color(0xFF878787),
                fontSize: 14,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 45,
          decoration: BoxDecoration(
            color: const Color(0xFFF4F4F5),
            borderRadius: BorderRadius.circular(6),
          ),
          child: TextField(
            controller: _confirmPasswordController,
            obscureText: true,
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              hintText: '비밀번호 확인',
              hintStyle: TextStyle(
                color: Color(0xFF878787),
                fontSize: 14,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '이메일',
          style: TextStyle(
            color: Color(0xFF434343),
            fontSize: 18,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  color: const Color(0xFFF4F4F5),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    hintText: '이메일',
                    hintStyle: TextStyle(
                      color: Color(0xFF878787),
                      fontSize: 14,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                '@',
                style: TextStyle(
                  color: Color(0xFF878787),
                  fontSize: 14,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: 45,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFFF4F4F5),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedEmailDomain,
                    isExpanded: true,
                    hint: const Text('선택',
                        style: TextStyle(color: Color(0xFF878787))),
                    icon: const Icon(Icons.arrow_drop_down),
                    items: _emailDomains.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _selectedEmailDomain = newValue;
                      });
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNextButton() {
    return Positioned(
      left: 20,
      bottom: 34,
      child: GestureDetector(
        onTap: () {
          if (_idController.text.isEmpty ||
              _passwordController.text.isEmpty ||
              _confirmPasswordController.text.isEmpty ||
              _emailController.text.isEmpty ||
              _selectedEmailDomain == null ||
              _phoneController.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('모든 필드를 채워주세요.'),
                duration: Duration(seconds: 2),
                backgroundColor: Colors.red,
              ),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => IndividualsRegistrationPage3()),
            );
          }
        },
        child: Container(
          width: 350,
          height: 44,
          decoration: BoxDecoration(
            color: const Color(0xFF878787),
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Center(
            child: Text(
              '다음 단계로',
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
}
