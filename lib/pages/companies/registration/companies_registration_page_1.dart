import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'companies_registration_page_2.dart';

class CompaniesRegistrationPage1 extends StatefulWidget {
  @override
  _CompaniesRegistrationPage1State createState() =>
      _CompaniesRegistrationPage1State();
}

class _CompaniesRegistrationPage1State
    extends State<CompaniesRegistrationPage1> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  DateTime? _selectedDate;
  String? _selectedGender;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900, 1),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = DateFormat('yyyy/MM/dd').format(picked);
      });
    }
  }

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
            _buildPageTitle(),
            _buildRegistrationForm(),
            _buildProgressIndicator(),
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
                '기업회원 회원가입',
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

  Widget _buildPageTitle() {
    return const Positioned(
      left: 20,
      top: 106,
      child: Text(
        '본인인증',
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
      top: 150,
      child: SizedBox(
        width: 350,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildNameField(),
            const SizedBox(height: 20),
            _buildDateField(context),
            const SizedBox(height: 20),
            _buildGenderSelection(),
          ],
        ),
      ),
    );
  }

  Widget _buildNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '이름',
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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: const Color(0xFFF4F4F5),
            borderRadius: BorderRadius.circular(6),
          ),
          child: TextField(
            controller: _nameController,
            style: const TextStyle(
              color: Color(0xFF878787),
              fontSize: 14,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w400,
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: '이름을 입력해주세요',
              hintStyle: TextStyle(color: Color(0xFF878787)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDateField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '생년월일',
          style: TextStyle(
            color: Color(0xFF434343),
            fontSize: 18,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () => _selectDate(context),
          child: Container(
            height: 45,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: const Color(0xFFF4F4F5),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    _dateController.text.isEmpty
                        ? '생년월일을 선택해주세요'
                        : _dateController.text,
                    style: const TextStyle(
                      color: Color(0xFF878787),
                      fontSize: 14,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const Icon(Icons.calendar_today, color: Color(0xFF878787)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGenderSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '성별',
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
            _buildGenderOption('여자'),
            const SizedBox(width: 10),
            _buildGenderOption('남자'),
          ],
        ),
      ],
    );
  }

  Widget _buildGenderOption(String gender) {
    bool isSelected = _selectedGender == gender;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedGender = gender;
          });
        },
        child: Container(
          height: 45,
          decoration: BoxDecoration(
            color:
                isSelected ? const Color(0xFF434343) : const Color(0xFFF4F4F5),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Center(
            child: Text(
              gender,
              style: TextStyle(
                color: isSelected ? Colors.white : const Color(0xFF878787),
                fontSize: 14,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
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
            _buildProgressStep(27, '2', false),
            _buildProgressStep(54, '3', false),
            _buildProgressLine(18, false),
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

  Widget _buildNextButton() {
    return Positioned(
      left: 20,
      bottom: 34,
      child: GestureDetector(
        onTap: () {
          if (_nameController.text.isNotEmpty &&
              _dateController.text.isNotEmpty &&
              _selectedGender != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CompaniesRegistrationPage2()),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('모든 필드를 채워주세요.')),
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
