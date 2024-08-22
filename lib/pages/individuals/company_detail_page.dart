import 'package:flutter/material.dart';
import '../../models/company.dart';

class CompanyDetailPage extends StatelessWidget {
  final Company company;

  CompanyDetailPage({required this.company});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              _buildCompanyInfo(),
              _buildDetailedDescription(),
              _buildRequirements(),
              _buildCurrentAuditions(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          color: Colors.grey[300],
        ),
        Positioned(
          top: 20,
          left: 20,
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          child: Text(
            company.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCompanyInfo() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${company.industry} · ${company.location}',
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              if (company.isRecruiting)
                _buildTag('현재 모집 중', const Color(0xFFFF7BB7), Colors.white),
              if (company.isRecruiting) const SizedBox(width: 10),
              if (company.daysLeft > 0)
                _buildTag('${company.daysLeft}일 남음', const Color(0xFFFFF2F8),
                    const Color(0xFFA139B2)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailedDescription() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('회사 소개',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text(company.detailedDescription,
              style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  Widget _buildRequirements() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('지원 요건',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          ...company.requirements
              .map((req) => Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Row(
                      children: [
                        const Icon(Icons.check, size: 20, color: Colors.green),
                        const SizedBox(width: 10),
                        Text(req, style: const TextStyle(fontSize: 16)),
                      ],
                    ),
                  ))
              .toList(),
        ],
      ),
    );
  }

  Widget _buildCurrentAuditions() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('현재 모집 중인 오디션',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          if (company.currentAuditions.isEmpty)
            const Text('현재 진행 중인 오디션이 없습니다.',
                style: TextStyle(fontSize: 16, color: Colors.grey))
          else
            ...company.currentAuditions
                .map((audition) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(audition.title,
                              style: const TextStyle(fontSize: 16)),
                          Text('마감: ${audition.deadline}',
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.grey)),
                        ],
                      ),
                    ))
                .toList(),
        ],
      ),
    );
  }

  Widget _buildTag(String label, Color bgColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(color: textColor, fontSize: 12),
      ),
    );
  }
}
