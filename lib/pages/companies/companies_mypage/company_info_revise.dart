import 'package:flutter/material.dart';
import '../../../models/company.dart';
import 'package:image_picker/image_picker.dart';

class CompanyInfoRevisePage extends StatefulWidget {
  final Company company;

  const CompanyInfoRevisePage({Key? key, required this.company})
      : super(key: key);

  @override
  _CompanyInfoRevisePageState createState() => _CompanyInfoRevisePageState();
}

class _CompanyInfoRevisePageState extends State<CompanyInfoRevisePage> {
  late TextEditingController _companyNameController;
  late TextEditingController _descriptionController;
  late TextEditingController _locationController;
  late TextEditingController _detailedDescriptionController;
  late TextEditingController _websiteController;
  bool _isRecruiting = true;
  int _daysLeft = 1;
  String? _selectedImagePath;
  String? _selectedLogoPath;
  final TextEditingController _hashtagController = TextEditingController();
  List<String> _hashtags = [];
  List<String> _requirements = [];
  Map<String, String> _requirementDetails = {};
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
    _detailedDescriptionController =
        TextEditingController(text: widget.company.detailedDescription);
    _websiteController = TextEditingController(text: widget.company.website);
    _isRecruiting = widget.company.isRecruiting;
    _daysLeft = widget.company.daysLeft;
    _selectedImagePath = widget.company.imagePath;
    _selectedLogoPath = widget.company.logoPath;
    _hashtags = widget.company.industry.split(',');
    _requirements = List.from(widget.company.requirements);
    _requirementDetails = Map.from(widget.company.requirementDetails);
  }

  @override
  void dispose() {
    _companyNameController.dispose();
    _descriptionController.dispose();
    _locationController.dispose();
    _detailedDescriptionController.dispose();
    _websiteController.dispose();
    _hashtagController.dispose();
    super.dispose();
  }

  Future<void> _pickImage({bool isLogo = false}) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

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
                      '기업 정보 수정',
                      style: TextStyle(
                        color: Color(0xFF434343),
                        fontSize: 18,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildTextField('기업 명', _companyNameController),
                    _buildHashtagField(),
                    _buildTextField('위치', _locationController),
                    _buildTextField('기업 사이트', _websiteController),
                    _buildImagePicker('기업 대표이미지', isLogo: false),
                    _buildImagePicker('기업 로고', isLogo: true),
                    _buildRecruitingSwitch(),
                    _buildTextField('간단 소개', _descriptionController,
                        maxLines: 3),
                    _buildTextField('상세 설명', _detailedDescriptionController,
                        maxLines: 5),
                    _buildRequirementsList(),
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

  Widget _buildAppBar() {
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
            const SizedBox(width: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {int maxLines = 1}) {
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
        const SizedBox(height: 10),
        TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: Color(0xFFD9D9D9)),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  Widget _buildImagePicker(String label, {required bool isLogo}) {
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
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () => _pickImage(isLogo: isLogo),
          child: Container(
            width: double.infinity,
            height: 45,
            decoration: BoxDecoration(
              color: const Color(0xFFF4F4F5),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    isLogo
                        ? (_selectedLogoPath?.split('/').last ?? '로고 선택')
                        : (_selectedImagePath?.split('/').last ?? '이미지 선택'),
                    style: const TextStyle(
                      color: Color(0xFF878787),
                      fontSize: 14,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                if (isLogo
                    ? _selectedLogoPath != null
                    : _selectedImagePath != null)
                  const Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Icon(Icons.check, color: Color(0xFF434343)),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  Widget _buildRecruitingSwitch() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          '모집 중',
          style: TextStyle(
            color: Color(0xFF434343),
            fontSize: 18,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w700,
          ),
        ),
        Switch(
          value: _isRecruiting,
          onChanged: (value) {
            setState(() {
              _isRecruiting = value;
            });
          },
        ),
      ],
    );
  }

  Widget _buildHashtagChip(String tag) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: ShapeDecoration(
        color: const Color(0xFFD9D9D9),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '#$tag',
            style: const TextStyle(
              color: Color(0xFF878787),
              fontSize: 14,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w600,
              height: 1.2,
              letterSpacing: 0.35,
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () {
              setState(() {
                _hashtags.remove(tag);
              });
            },
            child: Container(
              width: 14,
              height: 14,
              decoration: const ShapeDecoration(
                color: Color(0xFFF4F4F5),
                shape: OvalBorder(),
              ),
              child: const Icon(
                Icons.close,
                size: 10,
                color: Color(0xFF878787),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHashtagField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '업종 (해시태그)',
          style: TextStyle(
            color: Color(0xFF434343),
            fontSize: 18,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: 350,
          height: 45,
          decoration: ShapeDecoration(
            color: const Color(0xFFF4F4F5),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ..._hashtags.map(_buildHashtagChip),
                      SizedBox(
                        width: 100,
                        child: TextField(
                          controller: _hashtagController,
                          decoration: const InputDecoration(
                            hintText: '해시태그...',
                            hintStyle: TextStyle(color: Color(0xFF878787)),
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                          ),
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
    );
  }

  Widget _buildRequirementsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '요구사항',
          style: TextStyle(
            color: Color(0xFF434343),
            fontSize: 18,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 10),
        ..._requirements.map(_buildRequirementItem),
        const SizedBox(height: 10),
        _buildAddRequirementButton(),
      ],
    );
  }

  Widget _buildRequirementItem(String requirement) {
    bool isCustom = !_requirementOptions.contains(requirement);
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                height: 45,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFFD9D9D9)),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: isCustom
                    ? TextField(
                        controller: TextEditingController(text: requirement),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '요구사항을 입력하세요',
                        ),
                        onChanged: (value) {
                          setState(() {
                            int index = _requirements.indexOf(requirement);
                            if (index != -1) {
                              String oldRequirement = _requirements[index];
                              _requirements[index] = value;
                              if (_requirementDetails
                                  .containsKey(oldRequirement)) {
                                String detail =
                                    _requirementDetails[oldRequirement]!;
                                _requirementDetails.remove(oldRequirement);
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
                                int index = _requirements.indexOf(requirement);
                                if (index != -1) {
                                  String oldRequirement = _requirements[index];
                                  _requirements[index] = newValue;
                                  if (_requirementDetails
                                      .containsKey(oldRequirement)) {
                                    String detail =
                                        _requirementDetails[oldRequirement]!;
                                    _requirementDetails.remove(oldRequirement);
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
            SizedBox(width: 10),
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
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFD9D9D9),
                ),
                child: Center(
                  child: Icon(Icons.close, size: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        TextField(
          controller: TextEditingController(
              text: _requirementDetails[requirement] ?? ''),
          decoration: InputDecoration(
            hintText: '구체적인 설명을 적어주세요.',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Color(0xFFD9D9D9)),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          ),
          onChanged: (value) {
            setState(() {
              _requirementDetails[requirement] = value;
            });
          },
        ),
        SizedBox(height: 15),
        Divider(color: Color(0xFFE0E0E0), height: 1),
        SizedBox(height: 15),
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
        width: 350,
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
      width: double.infinity,
      height: 44,
      child: ElevatedButton(
        onPressed: _saveCompanyInfo,
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

  void _saveCompanyInfo() {
    widget.company.updateInfo(
      company: _companyNameController.text,
      description: _descriptionController.text,
      industry: _hashtags.join(','),
      location: _locationController.text,
      detailedDescription: _detailedDescriptionController.text,
      website: _websiteController.text,
      imagePath: _selectedImagePath,
      logoPath: _selectedLogoPath,
      isRecruiting: _isRecruiting,
      daysLeft: _daysLeft,
      requirements: _requirements,
      requirementDetails: _requirementDetails,
    );
    Navigator.pop(context, widget.company);
  }
}
