import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import '../../../models/company.dart';
import '../individuals_mainpage/main_page.dart';

class ApplyPage2 extends StatefulWidget {
  final Audition audition;
  final String name;
  final String gender;
  final int age;
  final double height;
  final double weight;

  const ApplyPage2({
    Key? key,
    required this.audition,
    required this.name,
    required this.gender,
    required this.age,
    required this.height,
    required this.weight,
  }) : super(key: key);

  @override
  _ApplyPage2State createState() => _ApplyPage2State();
}

class _ApplyPage2State extends State<ApplyPage2> {
  File? _facePicture;
  File? _fullBodyPicture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('오디션 지원하기'),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF434343),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '추가 정보',
                style: TextStyle(
                  color: Color(0xFF434343),
                  fontSize: 18,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 20),
              _buildPictureUploader('얼굴 정면사진', _facePicture,
                  (file) => setState(() => _facePicture = file)),
              const SizedBox(height: 20),
              _buildPictureUploader('전신사진', _fullBodyPicture,
                  (file) => setState(() => _fullBodyPicture = file)),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _submitApplication,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF878787),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: const Text('지원 계속하기'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPictureUploader(
      String title, File? picture, Function(File) onPicturePicked) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF434343),
            fontSize: 18,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          '사진 첨부 시 확장자는 반드시 JPG, GIF, PNG (ai 및 PSD 심사불가) 로 설정하셔야 하며 포토샵 등으로 수정 처리한 사진 또는 손이나 옷 등으로 과도하게 얼굴을 가린 사진은 심사대상에서 제외되오니 참고해주시길 바랍니다.',
          style: TextStyle(
            color: Color(0xFF434343),
            fontSize: 14,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: () async {
            final pickedFile =
                await ImagePicker().pickImage(source: ImageSource.gallery);
            if (pickedFile != null) {
              onPicturePicked(File(pickedFile.path));
            }
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
            decoration: BoxDecoration(
              color: const Color(0xFFF4F4F5),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              picture == null ? '사진 첨부하기' : '사진 변경하기',
              style: const TextStyle(
                color: Color(0xFF434343),
                fontSize: 14,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        if (picture != null)
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Image.file(picture,
                height: 200, width: double.infinity, fit: BoxFit.cover),
          ),
      ],
    );
  }

  void _submitApplication() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('지원 확인'),
          content: const Text('지원을 완료하면 내용 수정이 어렵습니다. 지원하시겠습니까?'),
          actions: <Widget>[
            TextButton(
              child: const Text('아니오'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('예'),
              onPressed: () async {
                Navigator.of(context).pop();
                await _saveApplication();
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('지원 완료'),
                      content: const Text('지원이 완료되었습니다.'),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('확인'),
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => MainPage()),
                              (Route<dynamic> route) => false,
                            );
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _saveApplication() async {
    final applicationData = {
      'audition': widget.audition.title,
      'name': widget.name,
      'gender': widget.gender,
      'age': widget.age,
      'height': widget.height,
      'weight': widget.weight,
      'facePicture': await _savePicture(_facePicture, 'face'),
      'fullBodyPicture': await _savePicture(_fullBodyPicture, 'fullbody'),
    };

    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/application.json');
    await file.writeAsString(json.encode(applicationData));
  }

  Future<String?> _savePicture(File? picture, String prefix) async {
    if (picture == null) return null;
    final directory = await getApplicationDocumentsDirectory();
    final fileName = '${prefix}_${DateTime.now().millisecondsSinceEpoch}.jpg';
    final savedImage = await picture.copy('${directory.path}/$fileName');
    return savedImage.path;
  }
}
