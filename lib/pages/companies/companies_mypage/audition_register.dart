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
  String _selectedGender = '성별 무관';
  bool _isAlwaysRecruiting = false;
  DateTime? _deadline;

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildAppBar(context),
                const SizedBox(height: 10),
                _buildCompanyInfo(),
                const SizedBox(height: 30),
                _buildTitleField(),
                const SizedBox(height: 10),
                _buildGenderSelector(),
                const SizedBox(height: 30),
                _buildRecruitmentPeriod(),
                const SizedBox(height: 30),
                _buildDescriptionField(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildRegisterButton(),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Color(0xFF171719)),
              onPressed: () => Navigator.pop(context),
            ),
            const Text(
              '오디션 공고 등록',
              style: TextStyle(
                color: Color(0xFF171719),
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Pretendard',
              ),
            ),
            const SizedBox(width: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildCompanyInfo() {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage(widget.company.imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
              ),
            ),
          ),
          Positioned(
            left: 20,
            bottom: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.company.company,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Pretendard'),
                ),
                Text(
                  '${widget.company.industry} · ${widget.company.location}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Pretendard'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitleField() {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: const Color(0xFFF4F4F5),
        borderRadius: BorderRadius.circular(6),
      ),
      child: TextFormField(
        controller: _titleController,
        decoration: const InputDecoration(
          hintText: '공고 제목',
          hintStyle: TextStyle(
              color: Color(0xFF434343), fontSize: 14, fontFamily: 'Pretendard'),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '공고 제목을 입력해주세요';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildGenderSelector() {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: const Color(0xFFF4F4F5),
        borderRadius: BorderRadius.circular(6),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedGender,
          icon: const Icon(Icons.arrow_drop_down, color: Color(0xFFD9D9D9)),
          isExpanded: true,
          style: const TextStyle(
              color: Color(0xFF434343), fontSize: 14, fontFamily: 'Pretendard'),
          onChanged: (String? newValue) {
            setState(() {
              _selectedGender = newValue!;
            });
          },
          items: <String>['성별 무관', '남자', '여자']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(value),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildRecruitmentPeriod() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('모집 기간',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Pretendard')),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('상시모집',
                    style: TextStyle(
                        color: Color(0xFF878787),
                        fontSize: 14,
                        fontFamily: 'Pretendard')),
                const SizedBox(width: 8),
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Checkbox(
                    value: _isAlwaysRecruiting,
                    onChanged: (value) {
                      setState(() {
                        _isAlwaysRecruiting = value!;
                      });
                    },
                    activeColor: const Color(0xFFEF69A6),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        Container(
          height: 45,
          decoration: BoxDecoration(
            color: const Color(0xFFF4F4F5),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              TextFormField(
                readOnly: true,
                enabled: !_isAlwaysRecruiting,
                decoration: InputDecoration(
                  hintText: _isAlwaysRecruiting ? '상시 모집' : '기간 설정',
                  hintStyle: const TextStyle(
                      color: Color(0xFF878787),
                      fontSize: 14,
                      fontFamily: 'Pretendard'),
                  border: InputBorder.none,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  suffixIcon: const Icon(Icons.calendar_today,
                      color: Color(0xFFD9D9D9)),
                ),
                onTap: _isAlwaysRecruiting
                    ? null
                    : () async {
                        final pickedDate = await showDatePicker(
                          context: context,
                          initialDate:
                              DateTime.now().add(const Duration(days: 1)),
                          firstDate:
                              DateTime.now().add(const Duration(days: 1)),
                          lastDate:
                              DateTime.now().add(const Duration(days: 365)),
                        );
                        if (pickedDate != null && pickedDate != _deadline) {
                          setState(() {
                            _deadline = pickedDate;
                          });
                        }
                      },
                controller: TextEditingController(
                  text: _isAlwaysRecruiting
                      ? '상시 모집'
                      : (_deadline != null
                          ? "${_deadline!.year}.${_deadline!.month.toString().padLeft(2, '0')}.${_deadline!.day.toString().padLeft(2, '0')}"
                          : ""),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDescriptionField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('공고 내용',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'Pretendard')),
        const SizedBox(height: 10),
        Container(
          height: 150,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0xFFD9D9D9)),
            borderRadius: BorderRadius.circular(6),
          ),
          child: TextFormField(
            controller: _descriptionController,
            decoration: const InputDecoration(
              hintText: '내용을 입력해주세요.',
              hintStyle: TextStyle(
                  color: Color(0xFFCBCBCB),
                  fontSize: 14,
                  fontFamily: 'Pretendard'),
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(20),
            ),
            maxLines: null,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '공고 내용을 입력해주세요';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget _buildRegisterButton() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFD9D9D9))),
      ),
      child: ElevatedButton(
        onPressed: _registerAudition,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFEF69A6),
          minimumSize: const Size(double.infinity, 44),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: const Text(
          '등록하기',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: 'Pretendard',
          ),
        ),
      ),
    );
  }

  void _registerAudition() {
    if (_formKey.currentState!.validate()) {
      final newAudition = Audition(
        title: _titleController.text,
        deadline: _isAlwaysRecruiting
            ? "상시모집"
            : (_deadline != null
                ? "${_deadline!.year}.${_deadline!.month.toString().padLeft(2, '0')}.${_deadline!.day.toString().padLeft(2, '0')}"
                : ""),
        company: widget.company,
      );

      setState(() {
        widget.company.currentAuditions.add(newAudition);
        widget.company.isRecruiting = true;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('오디션 공고가 성공적으로 등록되었습니다.')),
      );

      Navigator.pop(context);
    }
  }
}
