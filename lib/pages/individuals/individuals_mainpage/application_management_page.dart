// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import '../../../models/application.dart';
import '../../../models/casting.dart';
import '../applicaiton_page.dart';
import '../proposal_page.dart';

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
                    isSelected ? const Color(0xFFEF69A6) : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected
                  ? const Color(0xFFEF69A6)
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
        _isAppliedCompanies ? '지원 기업 총 ${applications.length}곳' : '제안한 기업 총 3곳',
        style: const TextStyle(color: Color(0xFF878787), fontSize: 12),
      ),
    );
  }

  Widget _buildAppliedCompaniesList() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: applications.length,
      itemBuilder: (context, index) {
        final ApplicationInfo = applications[index];
        return _buildAppliedCompanyCard(context, ApplicationInfo);
      },
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
      BuildContext context, Application Application) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ApplicationsPage(application: Application),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Application.companyName,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Application.isViewed ? Colors.grey : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    Application.audititionName,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '모집기간: ${Application.recruitmentPeriod}',
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.grey),
          ],
        ),
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
                  border: status == '거절'
                      ? Border.all(color: const Color(0xFF888888))
                      : null,
                  color:
                      status == '거절' ? Colors.white : const Color(0xFFEF69A6),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(status,
                    style: TextStyle(
                        fontSize: 12,
                        color: status == '거절'
                            ? const Color(0xFF888888)
                            : Colors.white)),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProposalPage(casting: casting),
                    ),
                  );
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
