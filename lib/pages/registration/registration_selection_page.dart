import 'package:flutter/material.dart';
import '../individuals/registration/individuals_registration_page_1.dart';
import '../companies/registration/companies_registration_page_1.dart';

class RegistrationSelectionPage extends StatefulWidget {
  @override
  _RegistrationSelectionPageState createState() =>
      _RegistrationSelectionPageState();
}

class _RegistrationSelectionPageState extends State<RegistrationSelectionPage> {
  bool isCompanySelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '회원가입',
              style: TextStyle(
                color: Color(0xFF434343),
                fontSize: 25,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '어떤 방식으로 가입하시나요?',
              style: TextStyle(
                color: Color(0xFF878787),
                fontSize: 18,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isCompanySelected = false;
                    });
                  },
                  child: _buildSelectionBox('개인', !isCompanySelected),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isCompanySelected = true;
                    });
                  },
                  child: _buildSelectionBox('기업', isCompanySelected),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (isCompanySelected) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CompaniesRegistrationPage1()),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => IndividualsRegistrationPage1()),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF878787),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: const Text('다음 단계로'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectionBox(String label, bool isSelected) {
    return Container(
      width: 165,
      height: 154,
      decoration: BoxDecoration(
        color: const Color(0xFFF4F4F5),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isSelected ? Colors.black : const Color(0xFFD9D9D9),
          width: 4,
        ),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.black : const Color(0xFF878787),
            fontSize: 30,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
