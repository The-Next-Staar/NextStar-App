import 'package:flutter/material.dart';
import '../registration/registration_selection_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isIndividualSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            Positioned(
              left: 151,
              top: 180,
              child: Container(
                width: 84,
                height: 84,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/the_next_star_logo.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 351,
              child: _buildInputField('아이디를 입력하세요.', false),
            ),
            Positioned(
              left: 20,
              top: 411,
              child: _buildInputField('비밀번호를 입력하세요.', true),
            ),
            Positioned(
              left: 79,
              top: 283,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isIndividualSelected = true;
                  });
                },
                child: Text(
                  '개인회원',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isIndividualSelected
                        ? const Color(0xFF414141)
                        : const Color(0xFFD9D9D9),
                    fontSize: 18,
                    fontFamily: 'Pretendard',
                    fontWeight: isIndividualSelected
                        ? FontWeight.w700
                        : FontWeight.w400,
                    height: 1.5,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 253,
              top: 283,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isIndividualSelected = false;
                  });
                },
                child: Text(
                  '기업회원',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isIndividualSelected
                        ? const Color(0xFFD9D9D9)
                        : const Color(0xFF414141),
                    fontSize: 18,
                    fontFamily: 'Pretendard',
                    fontWeight: isIndividualSelected
                        ? FontWeight.w400
                        : FontWeight.w700,
                    height: 1.5,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 476,
              child: _buildLoginButton(),
            ),
            Positioned(
              left: 67,
              top: 544,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildTextButton('아이디찾기'),
                  const SizedBox(width: 25),
                  _buildTextButton('비밀번호찾기'),
                  const SizedBox(width: 25),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegistrationSelectionPage()),
                      );
                    },
                    child: _buildTextButton('회원가입하기'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String hintText, bool isPassword) {
    return Container(
      width: 350,
      height: 45,
      decoration: ShapeDecoration(
        color: const Color(0xFFF4F4F5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return Container(
      width: 350,
      height: 44,
      decoration: ShapeDecoration(
        color: const Color(0xFF878787),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
      child: const Center(
        child: Text(
          '로그인하기',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildTextButton(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xFF434343),
        fontSize: 14,
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
