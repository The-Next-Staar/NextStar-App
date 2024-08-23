import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../models/company.dart';
import 'apply_page_2.dart';

class ApplyPage1 extends StatefulWidget {
  final Audition audition;

  const ApplyPage1({super.key, required this.audition});

  @override
  _ApplyPage1State createState() => _ApplyPage1State();
}

class _ApplyPage1State extends State<ApplyPage1> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  String? _gender;
  double? _age;
  double? _height;
  double? _weight;

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
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildAuditionInfo(),
                const SizedBox(height: 20),
                const Text(
                  '기본 정보',
                  style: TextStyle(
                    color: Color(0xFF434343),
                    fontSize: 18,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 20),
                _buildTextFormField('이름', (value) => _name = value),
                _buildDropdownField(
                    '성별', ['남성', '여성'], (value) => _gender = value),
                _buildNumberFormField('나이', (value) => _age = value),
                Row(
                  children: [
                    Expanded(
                      child: _buildNumberFormField(
                          '키 (cm)', (value) => _height = value),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: _buildNumberFormField(
                          '몸무게 (kg)', (value) => _weight = value),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    child: const Text('지원 계속하기'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF878787),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAuditionInfo() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFD9D9D9)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.audition.company.company,
            style: const TextStyle(
              color: Color(0xFF434343),
              fontSize: 16,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            widget.audition.title,
            style: const TextStyle(
              color: Color(0xFF434343),
              fontSize: 18,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            widget.audition.company.description,
            style: const TextStyle(
              color: Color(0xFF434343),
              fontSize: 13,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextFormField(String label, Function(String?) onSaved) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: const Color(0xFFF4F4F5),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide.none,
          ),
        ),
        onSaved: onSaved,
      ),
    );
  }

  Widget _buildNumberFormField(String label, Function(double?) onSaved) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: const Color(0xFFF4F4F5),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide.none,
          ),
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$'))
        ],
        onSaved: (value) => onSaved(double.tryParse(value ?? '')),
      ),
    );
  }

  Widget _buildDropdownField(
      String label, List<String> items, Function(String?) onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: const Color(0xFFF4F4F5),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide.none,
          ),
        ),
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ApplyPage2(
            audition: widget.audition,
            name: _name ?? '',
            gender: _gender ?? '',
            age: _age?.toInt() ?? 0,
            height: _height ?? 0,
            weight: _weight ?? 0,
          ),
        ),
      );
    }
  }
}
