import 'package:flutter/material.dart';
import '../../../models/casting.dart';

class ApplicationManagementPage extends StatefulWidget {
  const ApplicationManagementPage({super.key});

  @override
  _ApplicationManagementPageState createState() =>
      _ApplicationManagementPageState();
}

class _ApplicationManagementPageState extends State<ApplicationManagementPage> {
  bool _isAppliedCompanies = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          _buildToggleButtons(),
          _buildCompanyCount(),
          Expanded(
            child: _isAppliedCompanies
                ? _buildAppliedCompaniesList()
                : _buildCastingCompaniesList(),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleButtons() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFD9D9D9))),
      ),
      child: Row(
        children: [
          _buildToggleButton('내가 지원한 기업', _isAppliedCompanies,
              () => setState(() => _isAppliedCompanies = true)),
          _buildToggleButton('캐스팅 받은 기업', !_isAppliedCompanies,
              () => setState(() => _isAppliedCompanies = false)),
        ],
      ),
    );
  }

  Widget _buildToggleButton(String text, bool isSelected, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color:
                    isSelected ? const Color(0xFF434343) : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected
                  ? const Color(0xFF434343)
                  : const Color(0xFF878787),
              fontSize: 16,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCompanyCount() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, bottom: 5),
      child: Text(
        _isAppliedCompanies ? '지원 기업 총 2곳' : '제안한 기업 총 3곳',
        style: const TextStyle(color: Color(0xFF878787), fontSize: 12),
      ),
    );
  }

  Widget _buildAppliedCompaniesList() {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        _buildAppliedCompanyCard('JYP Online Audition',
            '차세대 스타를 찾고 있습니다.\n지금 그 주인공이 되어보세요.', '2024.08.18', '미열람'),
        _buildAppliedCompanyCard('JYP Online Audition',
            '차세대 스타를 찾고 있습니다.\n지금 그 주인공이 되어보세요.', '2024.08.18', '열람'),
      ],
    );
  }

  Widget _buildCastingCompaniesList() {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        _buildSectionTitle('최근 제안'),
        ...sampleCastings
            .where((casting) => casting.status == CastingStatus.pending)
            .map((casting) => _buildCastingCompanyCard(
                  casting.company.company,
                  casting.message,
                  casting.date,
                  '마감 ${casting.deadline}',
                  casting,
                )),
        const SizedBox(height: 20),
        _buildSectionTitle('내가 이미 확인한 제안'),
        ...sampleCastings
            .where((casting) => casting.status != CastingStatus.pending)
            .map((casting) => _buildCastingCompanyCard(
                  casting.company.company,
                  casting.message,
                  casting.date,
                  casting.status == CastingStatus.approved ? '승인' : '거절',
                  casting,
                )),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xFF434343)),
      ),
    );
  }

  Widget _buildAppliedCompanyCard(
      String title, String description, String date, String status) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      padding: const EdgeInsets.all(20),
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
              Text(title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w700)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFF4F4F5),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(status,
                    style: const TextStyle(
                        fontSize: 12, color: Color(0xFF878787))),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(description,
              style: const TextStyle(fontSize: 13, color: Color(0xFF434343))),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('지원일: $date',
                  style:
                      const TextStyle(fontSize: 13, color: Color(0xFF434343))),
              const Text('지원 내용 보기',
                  style: TextStyle(fontSize: 13, color: Color(0xFF878787))),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCastingCompanyCard(
    String title,
    String description,
    String date,
    String status,
    Casting casting,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      padding: const EdgeInsets.all(20),
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
              Text(title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w700)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: status == '거절'
                      ? const Color(0xFF878787)
                      : const Color(0xFFF4F4F5),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(status,
                    style: TextStyle(
                        fontSize: 12,
                        color: status == '거절'
                            ? Colors.white
                            : const Color(0xFF878787))),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(description,
              style: const TextStyle(fontSize: 13, color: Color(0xFF434343))),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(date,
                  style:
                      const TextStyle(fontSize: 13, color: Color(0xFF434343))),
              GestureDetector(
                onTap: () {
//
                },
                child: const Text('제안 내용 보기',
                    style: TextStyle(fontSize: 13, color: Color(0xFF878787))),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
