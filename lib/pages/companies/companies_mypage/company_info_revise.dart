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
  late TextEditingController _industryController;
  late TextEditingController _locationController;
  late TextEditingController _detailedDescriptionController;
  late TextEditingController _websiteController;
  late List<TextEditingController> _requirementControllers;
  late Map<String, TextEditingController> _requirementDetailControllers;
  bool _isRecruiting = true;
  int _daysLeft = 1;
  String? _selectedImagePath;
  String? _selectedLogoPath;

  @override
  void initState() {
    super.initState();
    _companyNameController =
        TextEditingController(text: widget.company.company);
    _descriptionController =
        TextEditingController(text: widget.company.description);
    _industryController = TextEditingController(text: widget.company.industry);
    _locationController = TextEditingController(text: widget.company.location);
    _detailedDescriptionController =
        TextEditingController(text: widget.company.detailedDescription);
    _websiteController = TextEditingController(text: widget.company.website);
    _isRecruiting = widget.company.isRecruiting;
    _daysLeft = widget.company.daysLeft;
    _selectedImagePath = widget.company.imagePath;
    _selectedLogoPath = widget.company.logoPath;

    _requirementControllers = widget.company.requirements
        .map((req) => TextEditingController(text: req))
        .toList();
    _requirementDetailControllers = Map.fromEntries(
        widget.company.requirementDetails.entries.map((entry) =>
            MapEntry(entry.key, TextEditingController(text: entry.value))));
  }

  @override
  void dispose() {
    _companyNameController.dispose();
    _descriptionController.dispose();
    _industryController.dispose();
    _locationController.dispose();
    _detailedDescriptionController.dispose();
    _websiteController.dispose();
    for (var controller in _requirementControllers) {
      controller.dispose();
    }
    for (var controller in _requirementDetailControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> _pickImage({bool isLogo = false}) async {
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
                      '기업 등록하기',
                      style: TextStyle(
                        color: Color(0xFF434343),
                        fontSize: 18,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildTextField('기업 명', _companyNameController),
                    _buildTextField('업종', _industryController),
                    _buildTextField('위치', _locationController),
                    _buildTextField('기업 사이트', _websiteController),
                    _buildImagePicker('기업 대표이미지', isLogo: false),
                    _buildImagePicker('기업 로고', isLogo: true),
                    _buildRecruitingSwitch(),
                    _buildDaysLeftField(),
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

  Widget _buildDaysLeftField() {
    return Row(
      children: [
        const Text(
          '남은 일수:',
          style: TextStyle(
            color: Color(0xFF434343),
            fontSize: 18,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: 50,
          child: TextField(
            controller: TextEditingController(text: _daysLeft.toString()),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              _daysLeft = int.tryParse(value) ?? 0;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(color: Color(0xFFD9D9D9)),
              ),
            ),
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
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: _requirementControllers.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                TextField(
                  controller: _requirementControllers[index],
                  decoration: InputDecoration(
                    labelText: '요구사항 ${index + 1}',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: const BorderSide(color: Color(0xFFD9D9D9)),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _requirementDetailControllers[
                          _requirementControllers[index].text] ??
                      TextEditingController(),
                  decoration: InputDecoration(
                    labelText: '상세 설명',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: const BorderSide(color: Color(0xFFD9D9D9)),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
              ],
            );
          },
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _requirementControllers.add(TextEditingController());
            });
          },
          child: Text('요구사항 추가'),
        ),
      ],
    );
  }

  Widget _buildSaveButton() {
    return Container(
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
      industry: _industryController.text,
      location: _locationController.text,
      detailedDescription: _detailedDescriptionController.text,
      website: _websiteController.text,
      imagePath: _selectedImagePath,
      logoPath: _selectedLogoPath,
      isRecruiting: _isRecruiting,
      daysLeft: _daysLeft,
      requirements:
          _requirementControllers.map((controller) => controller.text).toList(),
      requirementDetails: Map.fromEntries(_requirementDetailControllers.entries
          .map((entry) => MapEntry(entry.key, entry.value.text))),
    );
    Navigator.pop(context, widget.company);
  }
}
