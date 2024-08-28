import 'package:flutter/material.dart';
import '../../../models/company.dart';
import 'apply_page_2.dart';

class ApplyPage1 extends StatefulWidget {
  final Company? company;
  final Audition? audition;

  const ApplyPage1({super.key, required this.company, required this.audition});

  @override
  _ApplyPage1State createState() => _ApplyPage1State();
}

class _ApplyPage1State extends State<ApplyPage1> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _heightController;
  late TextEditingController _weightController;
  late TextEditingController _addressController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  String _selectedGender = '성별을 선택하세요.';
  final List<String> _genderOptions = ['남자', '여자'];
  DateTime? _birthDate;
  String _selectedEducation = '최종학력을 선택하세요.';

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _heightController = TextEditingController();
    _weightController = TextEditingController();
    _addressController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildAuditionInfo(),
                      const SizedBox(height: 20),
                      _buildDivider(),
                      const SizedBox(height: 20),
                      _buildBasicInfo(),
                      const SizedBox(height: 20),
                      ..._buildFormFields(),
                    ],
                  ),
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

  Widget _buildAuditionInfo() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFD9D9D9)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.company!.company,
                style: const TextStyle(
                  color: Color(0xFFD9D9D9),
                  fontSize: 14,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.audition!.title,
                    style: const TextStyle(
                      color: Color(0xFFEF69A6),
                      fontSize: 18,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '모집기간: ${widget.audition?.deadline}',
                    style: const TextStyle(
                      color: Color(0xFF434343),
                      fontSize: 13,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Image.asset(
                'assets/images/star_image.png',
                width: 80,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      width: double.infinity,
      height: 1,
      color: const Color(0xFFD9D9D9),
    );
  }

  Widget _buildBasicInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          '기본 정보',
          style: TextStyle(
            color: Color(0xFF434343),
            fontSize: 18,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w700,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFFFFF5FC),
            border: Border.all(color: const Color(0xFFFFE9F3)),
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Text(
            '프로필에서 불러오기',
            style: TextStyle(
              color: Color(0xFFEF69A6),
              fontSize: 14,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildFormFields() {
    return [
      _buildTextField('이름', _nameController, '이름을 입력하세요'),
      _buildDropdownField('성별', _selectedGender, ['남자', '여자'],
          (value) => setState(() => _selectedGender = value!)),
      _buildDateField(
          '생년월일', _birthDate, (date) => setState(() => _birthDate = date)),
      _buildSpecFields(),
      _buildDropdownField(
          '최종학력',
          _selectedEducation,
          ['고등학교 졸업', '대학교 재학', '대학교 졸업'],
          (value) => setState(() => _selectedEducation = value!)),
      _buildDropdownField(
          '성별',
          _selectedGender,
          _genderOptions,
          (value) =>
              setState(() => _selectedGender = value ?? _selectedGender)),
      _buildTextField('주소', _addressController, '주소를 입력하세요.'),
      _buildTextField('연락처', _phoneController, '연락처를 입력하세요.'),
      _buildTextField('이메일', _emailController, '이메일을 입력하세요.'),
    ];
  }

  Widget _buildTextField(
      String label, TextEditingController controller, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                fontFamily: 'Pretendard')),
        const SizedBox(height: 10),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Color(0xFFCBCBCB)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  Widget _buildDropdownField(String label, String value, List<String> items,
      Function(String?) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                fontFamily: 'Pretendard')),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: const Color(0xFFF4F4F5),
            borderRadius: BorderRadius.circular(6),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: items.contains(value) ? value : null,
              isExpanded: true,
              hint: Text(value),
              items: items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  Widget _buildDateField(
      String label, DateTime? value, Function(DateTime?) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                fontFamily: 'Pretendard')),
        const SizedBox(height: 10),
        InkWell(
          onTap: () async {
            final DateTime? picked = await showDatePicker(
              context: context,
              initialDate: value ?? DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );
            if (picked != null && picked != value) onChanged(picked);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFFF4F4F5),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  value != null
                      ? "${value.year}.${value.month.toString().padLeft(2, '0')}.${value.day.toString().padLeft(2, '0')}"
                      : '생년월일을 선택하세요',
                  style: TextStyle(
                      color: value != null
                          ? Colors.black
                          : const Color(0xFF878787)),
                ),
                const Icon(Icons.calendar_today, color: Color(0xFFCBCBCB)),
              ],
            ),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  Widget _buildSpecFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('스펙',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                fontFamily: 'Pretendard')),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('키',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF878787))),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: _heightController,
                    decoration: InputDecoration(
                      hintText: '키를 입력하세요.',
                      hintStyle: const TextStyle(color: Color(0xFFCBCBCB)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6)),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('몸무게',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF878787))),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: _weightController,
                    decoration: InputDecoration(
                      hintText: '몸무게를 입력하세요.',
                      hintStyle: const TextStyle(color: Color(0xFFCBCBCB)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6)),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
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
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ApplyPage2(
                  company: widget.company,
                  audition: widget.audition,
                  name: _nameController.text)));
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
