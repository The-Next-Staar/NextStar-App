import 'package:flutter/material.dart';
import '../../../models/company.dart';

class AuditionRegisterPage extends StatefulWidget {
  final Company company;

  const AuditionRegisterPage({Key? key, required this.company})
      : super(key: key);

  @override
  _AuditionRegisterPageState createState() => _AuditionRegisterPageState();
}

class _AuditionRegisterPageState extends State<AuditionRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  DateTime? _deadline;
  String _selectedGender = '성별 무관';

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
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
                      _buildCompanyInfo(),
                      const SizedBox(height: 20),
                      _buildTitleField(),
                      _buildGenderSelector(),
                      _buildDeadlinePicker(),
                      _buildDescriptionField(),
                      const SizedBox(height: 20),
                      _buildRegisterButton(),
                    ],
                  ),
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
            const Text(
              '오디션 공고 등록하기',
              style: TextStyle(
                color: Color(0xFF434343),
                fontSize: 18,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildCompanyInfo() {
    return Container(
      width: double.infinity,
      height: 129,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage(widget.company.imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.company.company,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              '${widget.company.industry} · ${widget.company.location}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleField() {
    return TextFormField(
      controller: _titleController,
      decoration: const InputDecoration(labelText: '공고 제목'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '공고 제목을 입력해주세요';
        }
        return null;
      },
    );
  }

  Widget _buildGenderSelector() {
    return DropdownButtonFormField<String>(
      value: _selectedGender,
      decoration: const InputDecoration(labelText: '모집 성별'),
      items: ['성별 무관', '남자', '여자']
          .map((label) => DropdownMenuItem(
                value: label,
                child: Text(label),
              ))
          .toList(),
      onChanged: (value) {
        setState(() {
          _selectedGender = value!;
        });
      },
    );
  }

  Widget _buildDeadlinePicker() {
    return TextFormField(
      readOnly: true,
      decoration: const InputDecoration(labelText: '마감일'),
      controller: TextEditingController(
        text: _deadline != null
            ? "${_deadline!.year}.${_deadline!.month.toString().padLeft(2, '0')}.${_deadline!.day.toString().padLeft(2, '0')}"
            : "",
      ),
      onTap: () async {
        final pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now().add(const Duration(days: 1)),
          firstDate: DateTime.now().add(const Duration(days: 1)),
          lastDate: DateTime.now().add(const Duration(days: 365)),
        );
        if (pickedDate != null) {
          setState(() {
            _deadline = pickedDate;
          });
        }
      },
      validator: (value) {
        if (_deadline == null) {
          return '마감일을 선택해주세요';
        }
        return null;
      },
    );
  }

  Widget _buildDescriptionField() {
    return TextFormField(
      controller: _descriptionController,
      decoration: const InputDecoration(labelText: '공고 내용'),
      maxLines: 5,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '공고 내용을 입력해주세요';
        }
        return null;
      },
    );
  }

  Widget _buildRegisterButton() {
    return Container(
      width: double.infinity,
      height: 44,
      child: ElevatedButton(
        onPressed: _registerAudition,
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

  void _registerAudition() {
    if (_formKey.currentState!.validate()) {
      final newAudition = Audition(
        title: _titleController.text,
        deadline:
            "${_deadline!.year}.${_deadline!.month.toString().padLeft(2, '0')}.${_deadline!.day.toString().padLeft(2, '0')}",
        company: widget.company,
      );

      setState(() {
        widget.company.currentAuditions.add(newAudition);
      });

      Navigator.pop(context, newAudition);
    }
  }
}
