import 'package:flutter/material.dart';
import '../individuals/individual_popup.dart';
import '../companies/company_popup.dart';
import '../registration/registration_selection_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isIndividualSelected = true;
  final Color tnsMainPink = const Color(0xFFEF69A6);

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
              left: 155,
              top: 152,
              child: SizedBox(
                width: 80,
                height: 85,
                child: Image.asset(
                  'assets/images/the_next_star_pink_logo.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
              top: 351,
              child: _buildInputField('아이디를 입력하세요.', false),
            ),
            Positioned(
              left: 20,
              right: 20,
              top: 411,
              child: _buildInputField('비밀번호를 입력하세요.', true),
            ),
            Positioned(
              left: 26,
              right: 26,
              top: 317,
              child: Stack(
                children: [
                  Container(
                    height: 4,
                    decoration: const BoxDecoration(color: Color(0xFFCBCBCB)),
                  ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 300),
                    left: isIndividualSelected ? 0 : 169,
                    child: Container(
                      width: 170,
                      height: 4,
                      decoration: BoxDecoration(color: tnsMainPink),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 80,
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
                        ? tnsMainPink
                        : const Color(0xFFCBCBCB),
                    fontSize: 18,
                    fontFamily: 'Pretendard',
                    fontWeight: isIndividualSelected
                        ? FontWeight.w700
                        : FontWeight.w400,
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
                        ? const Color(0xFFCBCBCB)
                        : tnsMainPink,
                    fontSize: 18,
                    fontFamily: 'Pretendard',
                    fontWeight: isIndividualSelected
                        ? FontWeight.w400
                        : FontWeight.w700,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
              top: 476,
              child: GestureDetector(
                onTap: () {
                  if (isIndividualSelected) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => IndividualPopupPage()),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CompanyPopupPage()),
                    );
                  }
                },
                child: Container(
                  height: 44,
                  decoration: ShapeDecoration(
                    color: tnsMainPink,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
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
                ),
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
              top: 544,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: _buildTextButton('아이디찾기'),
                  ),
                  Flexible(
                    child: _buildTextButton('비밀번호찾기'),
                  ),
                  Flexible(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegistrationSelectionPage(),
                          ),
                        );
                      },
                      child: _buildTextButton('회원가입하기'),
                    ),
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
      width: double.infinity,
      height: 45,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFD9D9D9)),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xFFCBCBCB),
            fontSize: 14,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w400,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildTextButton(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xFF878787),
        fontSize: 14,
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
