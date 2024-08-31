import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../models/company.dart';
import 'companies_mainpage/main_page.dart';

class CompanyCreatePage extends StatefulWidget {
  const CompanyCreatePage({super.key, required this.company});
  final Company company;

  @override
  _CompanyCreatePageState createState() => _CompanyCreatePageState();
}

class _CompanyCreatePageState extends State<CompanyCreatePage> {
  late TextEditingController _companyNameController;
  late TextEditingController _descriptionController;
  late TextEditingController _locationController;
  late TextEditingController _websiteController;
  String? _selectedImagePath;
  String? _selectedLogoPath;
  final TextEditingController _hashtagController = TextEditingController();
  final List<String> _hashtags = [];
  late List<String> _requirements;
  late Map<String, String> _requirementDetails;
  final List<String> _requirementOptions = [
    '댄스',
    '보컬',
    '랩',
    '작곡',
    '외국어 능력',
    '작사',
    '프로듀싱',
    '기타'
  ];

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    _companyNameController =
        TextEditingController(text: widget.company.company);
    _descriptionController =
        TextEditingController(text: widget.company.description);
    _locationController = TextEditingController(text: widget.company.location);
    _websiteController = TextEditingController(text: widget.company.website);
    _selectedImagePath = widget.company.imagePath;
    _selectedLogoPath = widget.company.logoPath;
    _requirements = List.from(widget.company.requirements);
    _requirementDetails = Map.from(widget.company.requirementDetails);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildAppBar(context),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        '기업 등록하기',
                        style: TextStyle(
                          color: Color(0xFF434343),
                          fontSize: 18,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildInputField(
                        '기업 명', _companyNameController, '기업 명을 입력해주세요.'),
                    _buildHashtagField(),
                    _buildInputField('위치', _locationController, '위치를 입력해주세요.'),
                    _buildInputField(
                        '기업 사이트', _websiteController, '기업 링크를 입력해주세요.'),
                    _buildImagePicker('기업 대표이미지', isLogo: false),
                    _buildImagePicker('기업 로고', isLogo: true),
                    _buildDescriptionField(),
                    _buildRequirementField(),
                    const SizedBox(height: 20),
                    _buildSaveButton(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Color(0xFF171719)),
              onPressed: () => Navigator.pop(context),
            ),
            Image.asset(
              'assets/images/the_next_star_logo_line.png',
              width: 150,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 48),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(
      String label, TextEditingController controller, String hintText) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
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
          const SizedBox(height: 10),
          Container(
            height: 45,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0xFFD9D9D9)),
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: Color(0xFFCBCBCB),
                  fontSize: 14,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHashtagField() {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '업종',
            style: TextStyle(
              color: Color(0xFF434343),
              fontSize: 18,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 45,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0xFFD9D9D9)),
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ..._hashtags.map((tag) => _buildHashtagChip(tag)),
                        SizedBox(
                          width: 100,
                          child: TextField(
                            controller: _hashtagController,
                            decoration: const InputDecoration(
                              hintText: '해시태그...',
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                            ),
                            textInputAction: TextInputAction.done,
                            onChanged: (value) {
                              if (value.endsWith(' ')) {
                                setState(() {
                                  _hashtags.add(value.trim());
                                  _hashtagController.clear();
                                });
                              }
                            },
                            onSubmitted: (value) {
                              if (value.isNotEmpty) {
                                setState(() {
                                  _hashtags.add(value);
                                  _hashtagController.clear();
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHashtagChip(String tag) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      margin: const EdgeInsets.only(left: 5),
      decoration: ShapeDecoration(
        color: const Color(0xFFFFF3F8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            tag,
            style: const TextStyle(
              color: Color(0xFFA139B2),
              fontSize: 14,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 5),
          GestureDetector(
            onTap: () {
              setState(() {
                _hashtags.remove(tag);
              });
            },
            child: const Icon(Icons.close, size: 14, color: Color(0xFFA139B2)),
          ),
        ],
      ),
    );
  }

  Widget _buildImagePicker(String label, {required bool isLogo}) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
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
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () => _pickImage(isLogo: isLogo),
            child: Container(
              width: MediaQuery.of(context).size.width - 40,
              height: 45,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: ShapeDecoration(
                color: const Color(0xFFF4F4F5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
              ),
              child: Row(
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(4),
                      image: _getImageProvider(isLogo),
                    ),
                    child: _getImageChild(isLogo),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      _getImageText(isLogo),
                      style: const TextStyle(
                        color: Color(0xFF878787),
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  DecorationImage? _getImageProvider(bool isLogo) {
    final String? path = isLogo ? _selectedLogoPath : _selectedImagePath;
    if (path != null && path.isNotEmpty) {
      final file = File(path);
      if (file.existsSync()) {
        return DecorationImage(
          image: FileImage(file),
          fit: BoxFit.cover,
        );
      }
    }
    return null;
  }

  String _getImageText(bool isLogo) {
    final String? path = isLogo ? _selectedLogoPath : _selectedImagePath;
    if (path != null && path.isNotEmpty) {
      final file = File(path);
      if (file.existsSync()) {
        return _truncateFileName(file.uri.pathSegments.last);
      }
    }
    return '눌러서 파일을 업로드하세요';
  }

  String _truncateFileName(String fileName) {
    return fileName.length > 20 ? '${fileName.substring(0, 17)}...' : fileName;
  }

  Widget? _getImageChild(bool isLogo) {
    final String? path = isLogo ? _selectedLogoPath : _selectedImagePath;
    if (path == null || path.isEmpty) {
      return const Icon(Icons.add_photo_alternate,
          size: 20, color: Colors.white);
    }
    return null;
  }

  Widget _buildDescriptionField() {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '기업 설명',
            style: TextStyle(
              color: Color(0xFF434343),
              fontSize: 18,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 87,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0xFFD9D9D9)),
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: TextField(
              controller: _descriptionController,
              maxLines: 3,
              decoration: const InputDecoration(
                hintText: '기업 소개 글을 적어주세요.',
                hintStyle: TextStyle(
                  color: Color(0xFFCBCBCB),
                  fontSize: 14,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(15),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRequirementField() {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 40,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '이런 부분을 고려해요',
            style: TextStyle(
              color: Color(0xFF434343),
              fontSize: 18,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          ..._requirements
              .map((requirement) => _buildRequirementItem(requirement)),
          const SizedBox(height: 10),
          _buildAddRequirementButton(),
        ],
      ),
    );
  }

  Widget _buildRequirementItem(String requirement) {
    bool isCustom = !_requirementOptions.contains(requirement);
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 45,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 1, color: Color(0xFFD9D9D9)),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: isCustom
                      ? TextField(
                          controller: TextEditingController(text: requirement),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: '요구사항을 입력하세요',
                          ),
                          onChanged: (value) {
                            setState(() {
                              int index = _requirements.indexOf(requirement);
                              if (index != -1) {
                                _requirements[index] = value;
                                if (_requirementDetails
                                    .containsKey(requirement)) {
                                  String detail =
                                      _requirementDetails[requirement]!;
                                  _requirementDetails.remove(requirement);
                                  _requirementDetails[value] = detail;
                                }
                              }
                            });
                          },
                        )
                      : DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: requirement,
                            items: _requirementOptions.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                setState(() {
                                  int index =
                                      _requirements.indexOf(requirement);
                                  if (index != -1) {
                                    _requirements[index] = newValue;
                                    if (_requirementDetails
                                        .containsKey(requirement)) {
                                      String detail =
                                          _requirementDetails[requirement]!;
                                      _requirementDetails.remove(requirement);
                                      _requirementDetails[newValue] = detail;
                                    }
                                  }
                                });
                              }
                            },
                          ),
                        ),
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _requirements.remove(requirement);
                    _requirementDetails.remove(requirement);
                  });
                },
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFD9D9D9),
                  ),
                  child: const Center(
                    child: Icon(Icons.close, size: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: TextField(
            controller: TextEditingController(
                text: _requirementDetails[requirement] ?? ''),
            decoration: InputDecoration(
              hintText: '구체적인 설명을 적어주세요.',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(color: Color(0xFFD9D9D9)),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            ),
            onChanged: (value) {
              setState(() {
                _requirementDetails[requirement] = value;
              });
            },
          ),
        ),
        const Divider(color: Color(0xFFE0E0E0), height: 1),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildAddRequirementButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          String newRequirement = _requirementOptions.first;
          _requirements.add(newRequirement);
          _requirementDetails[newRequirement] = '';
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: ShapeDecoration(
                color: const Color(0xFFD9D9D9),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
              ),
              child: const Text(
                '추가하기',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.35,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSaveButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 40,
      height: 44,
      child: ElevatedButton(
        onPressed: () {
          // TODO: Implement save functionality
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const MainPage()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFEF69A6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: const Text(
          '등록하기',
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

  Future<void> _pickImage({required bool isLogo}) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        if (isLogo) {
          _selectedLogoPath = image.path;
        } else {
          _selectedImagePath = image.path;
        }
      });
    }
  }
}
