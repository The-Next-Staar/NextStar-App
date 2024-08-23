import 'package:flutter/material.dart';

import '../../../models/company.dart';
import '../company_detail_page.dart';

class CompanyListPage extends StatefulWidget {
  @override
  _CompanyListPageState createState() => _CompanyListPageState();
}

class _CompanyListPageState extends State<CompanyListPage> {
  bool showOnlyRecruiting = false;
  Set<String> favorites = {};
  List<Company> companies = sampleCompanies;

  @override
  Widget build(BuildContext context) {
    List<Company> filteredCompanies = showOnlyRecruiting
        ? companies.where((company) => company.isRecruiting).toList()
        : companies;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildPageTitle(),
              _buildFilterChip(),
            ],
          ),
          const SizedBox(height: 26),
          _buildTotalCompaniesCount(filteredCompanies.length),
          Expanded(
            child: ListView.builder(
              itemCount: filteredCompanies.length,
              itemBuilder: (context, index) =>
                  _buildCompanyCard(filteredCompanies[index]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageTitle() {
    return const Text(
      '기업 리스트 보기',
      style: TextStyle(
        color: Color(0xFF434343),
        fontSize: 20,
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _buildFilterChip() {
    return GestureDetector(
      onTap: () {
        setState(() {
          showOnlyRecruiting = !showOnlyRecruiting;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: ShapeDecoration(
          color: showOnlyRecruiting
              ? const Color(0xFFFF87BD)
              : const Color(0xFFFFF5FC),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFFFFE9F3)),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: Text(
          '모집 중인 기업만 보기',
          style: TextStyle(
            color: showOnlyRecruiting ? Colors.white : const Color(0xFFEF69A6),
            fontSize: 14,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget _buildTotalCompaniesCount(int count) {
    return Text(
      '전체 기업 ${count}곳',
      style: const TextStyle(
        color: Color(0xFF878787),
        fontSize: 12,
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _buildCompanyCard(Company company) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFD9D9D9)),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                company.name,
                style: const TextStyle(
                  color: Color(0xFF434343),
                  fontSize: 18,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                ),
              ),
              _buildFavoriteButton(company),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            company.description,
            style: const TextStyle(
              color: Color(0xFF434343),
              fontSize: 13,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              if (company.isRecruiting)
                _buildTag('현재 모집 중', const Color(0xFFFF7BB7), Colors.white),
              if (company.isRecruiting) const SizedBox(width: 8),
              if (company.daysLeft > 0)
                _buildTag('${company.daysLeft}일 남음', const Color(0xFFFFF2F8),
                    const Color(0xFFA139B2)),
              const Spacer(),
              _buildDetailButton(company),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFavoriteButton(Company company) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (favorites.contains(company.name)) {
            favorites.remove(company.name);
          } else {
            favorites.add(company.name);
          }
        });
      },
      child: Icon(
        favorites.contains(company.name) ? Icons.star : Icons.star_border,
        color: const Color(0xFF878787),
      ),
    );
  }

  Widget _buildTag(String label, Color bgColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildDetailButton(Company company) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CompanyDetailPage(company: company),
          ),
        );
      },
      child: const Row(
        children: [
          Text(
            '상세보기',
            style: TextStyle(
              color: Color(0xFF878787),
              fontSize: 12,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w500,
            ),
          ),
          Icon(Icons.chevron_right, size: 16, color: Color(0xFF878787)),
        ],
      ),
    );
  }
}
