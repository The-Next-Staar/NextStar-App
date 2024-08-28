import 'package:flutter/material.dart';
import 'package:nextstar_app/pages/individuals/individuals_mainpage/application_management_page.dart';
import 'package:nextstar_app/pages/individuals/individuals_mainpage/main_page.dart';
import 'dart:io';
import '../../../models/company.dart';

class ApplyPage3 extends StatefulWidget {
  final Company? company;
  final Audition? audition;
  final String name;
  final File? facePicture;
  final File? fullBodyPicture;
  final File? danceVideo;
  final File? introductionVideo;
  final File? songFile;

  const ApplyPage3({
    Key? key,
    required this.company,
    required this.audition,
    required this.name,
    this.facePicture,
    this.fullBodyPicture,
    this.danceVideo,
    this.introductionVideo,
    this.songFile,
  }) : super(key: key);

  @override
  _ApplyPage3State createState() => _ApplyPage3State();
}

class _ApplyPage3State extends State<ApplyPage3> {
  final TextEditingController _snsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildAppBar(),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '선택 정보',
                    style: TextStyle(
                      color: Color(0xFF434343),
                      fontSize: 18,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'SNS 아이디',
                    style: TextStyle(
                      color: Color(0xFF434343),
                      fontSize: 18,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '인스타그램 등 SNS 아이디가 있으면 적어주세요.',
                    style: TextStyle(
                      color: Color(0xFF434343),
                      fontSize: 14,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _snsController,
                    decoration: InputDecoration(
                      hintText: 'SNS 계정을 입력하세요.',
                      hintStyle: const TextStyle(color: Color(0xFFCBCBCB)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: const BorderSide(color: Color(0xFFD9D9D9)),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 13),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildSubmitButton(),
    );
  }

  Widget _buildAppBar() {
    return Container(
      width: double.infinity,
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            Image.asset(
              'assets/images/the_next_star_logo_line.png',
              width: 120,
              height: 36,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 48),
          ],
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFEF69A6),
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        onPressed: () {
          // TODO: Implement submission logic
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('지원이 완료되었습니다.')),
          );
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const MainPage()));
        },
        child: const Text('지원 완료하기',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white)),
      ),
    );
  }
}
