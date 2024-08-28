import 'package:flutter/material.dart';
import '../../../models/company.dart';

class CompanyInfoPage extends StatelessWidget {
  final Company company;

  const CompanyInfoPage({Key? key, required this.company}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAppBar(context),
            _buildCompanyHeader(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCompanyDetails(),
                  const SizedBox(height: 20),
                  _buildRequirements(),
                  const SizedBox(height: 20),
                  _buildCurrentAuditions(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
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

  Widget _buildCompanyHeader() {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(company.imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
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
              company.company,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${company.industry} · ${company.location}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCompanyDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '기업 소개',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF434343),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          company.detailedDescription,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFF434343),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          '웹사이트: ${company.website}',
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFF434343),
          ),
        ),
      ],
    );
  }

  Widget _buildRequirements() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '요구사항',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF434343),
          ),
        ),
        const SizedBox(height: 10),
        ...company.requirements
            .map((req) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        req,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF434343),
                        ),
                      ),
                      Text(
                        company.requirementDetails[req] ?? '',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFF434343),
                        ),
                      ),
                    ],
                  ),
                ))
            .toList(),
      ],
    );
  }

  Widget _buildCurrentAuditions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '현재 모집 중인 오디션',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF434343),
          ),
        ),
        const SizedBox(height: 10),
        ...company.currentAuditions
            .map((audition) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            audition.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF434343),
                            ),
                          ),
                          Text(
                            '마감일: ${audition.deadline}',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xFF878787),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ))
            .toList(),
      ],
    );
  }
}
