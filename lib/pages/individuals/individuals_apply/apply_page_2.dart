import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import '../../../models/company.dart';
import 'apply_page_3.dart';

class ApplyPage2 extends StatefulWidget {
  final Company? company;
  final Audition? audition;
  final String name;

  const ApplyPage2(
      {super.key,
      required this.company,
      required this.audition,
      required this.name});

  @override
  _ApplyPage2State createState() => _ApplyPage2State();
}

class _ApplyPage2State extends State<ApplyPage2> {
  File? _facePicture;
  File? _fullBodyPicture;
  File? _danceVideo;
  File? _introductionVideo;
  File? _songFile;

  Future<void> _pickImage(String type) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        if (type == 'face') {
          _facePicture = File(image.path);
        } else if (type == 'fullBody') {
          _fullBodyPicture = File(image.path);
        }
      });
    }
  }

  Future<void> _pickVideo(String type) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? video = await _picker.pickVideo(source: ImageSource.gallery);
    if (video != null) {
      setState(() {
        if (type == 'dance') {
          _danceVideo = File(video.path);
        } else if (type == 'introduction') {
          _introductionVideo = File(video.path);
        }
      });
    }
  }

  Future<void> _pickAudio() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp3', 'wav', 'wma'],
    );
    if (result != null) {
      setState(() {
        _songFile = File(result.files.single.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildAppBar(),
          Expanded(
            child: SingleChildScrollView(
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
                    _buildFileUploadSection(
                        '얼굴 정면 사진', _facePicture, () => _pickImage('face')),
                    _buildFileUploadSection('전신 사진', _fullBodyPicture,
                        () => _pickImage('fullBody')),
                    _buildFileUploadSection(
                        '댄스 영상', _danceVideo, () => _pickVideo('dance')),
                    _buildFileUploadSection('자기소개 영상', _introductionVideo,
                        () => _pickVideo('introduction')),
                    _buildFileUploadSection('노래 음원', _songFile, _pickAudio),
                  ],
                ),
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
              width: 150,
              height: 36,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 48),
          ],
        ),
      ),
    );
  }

  Widget _buildFileUploadSection(String title, File? file, VoidCallback onTap) {
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
          '파일을 첨부해주세요. (JPG, PNG, MP4, MP3 형식)',
          style: TextStyle(
            color: Color(0xFF434343),
            fontSize: 14,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: const Color(0xFFF4F4F5),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              file != null ? '파일이 첨부되었습니다.' : '파일 첨부하기',
              style: const TextStyle(
                color: Color(0xFF878787),
                fontSize: 14,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ApplyPage3(
                company: widget.company,
                audition: widget.audition,
                name: widget.name,
                facePicture: _facePicture,
                fullBodyPicture: _fullBodyPicture,
                danceVideo: _danceVideo,
                introductionVideo: _introductionVideo,
                songFile: _songFile,
              ),
            ),
          );
        },
        child: const Text('지원 계속하기',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white)),
      ),
    );
  }
}
