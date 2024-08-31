import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../models/company.dart';
import 'individuals_apply/apply_page_1.dart';

class CompanyDetailPage extends StatefulWidget {
  final Company company;

  const CompanyDetailPage({super.key, required this.company});

  @override
  _CompanyDetailPageState createState() => _CompanyDetailPageState();
}

class _CompanyDetailPageState extends State<CompanyDetailPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    initializeAuditions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildAppBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  _buildCompanyInfo(),
                  _buildDetailedDescription(),
                  _buildRequirements(),
                  _buildCurrentAuditions(),
                ],
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
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
            Image.asset(
              'assets/images/the_next_star_logo_line.png',
              width: 140,
              height: 15.07,
              fit: BoxFit.contain,
            ),
            IconButton(
              icon: Icon(
                widget.company.isFavorite ? Icons.star : Icons.star_border,
                color: widget.company.isFavorite ? Colors.yellow : Colors.black,
              ),
              onPressed: () {
                setState(() {
                  widget.company.isFavorite = !widget.company.isFavorite;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Stack(
      children: [
        Image.asset(
          widget.company.imagePath,
          width: double.infinity,
          height: 200,
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 20,
          left: 20,
          child: Text(
            widget.company.company,
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
            '${widget.company.industry} · ${widget.company.location}',
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              if (widget.company.isRecruiting)
                _buildTag('현재 모집 중', const Color(0xFFFF7BB7), Colors.white),
              if (widget.company.isRecruiting) const SizedBox(width: 10),
              if (widget.company.daysLeft > 0)
                _buildTag('${widget.company.daysLeft}일 남음',
                    const Color(0xFFFFF2F8), const Color(0xFFA139B2)),
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
          Text(widget.company.detailedDescription,
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
          const Text('이런 부분을 고려해요',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          ...widget.company.requirements
              .map((req) => _buildRequirementCard(req))
              .toList(),
        ],
      ),
    );
  }

  Widget _buildRequirementCard(String requirement) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(18),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFD9D9D9)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            requirement,
            style: const TextStyle(
              color: Color(0xFF434343),
              fontSize: 16,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            widget.company.requirementDetails[requirement] ?? '',
            style: const TextStyle(
              color: Color(0xFF434343),
              fontSize: 14,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w400,
            ),
          ),
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
          const Text('현재 모집중인 오디션',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          if (widget.company.currentAuditions.isEmpty)
            const Text('현재 진행 중인 오디션이 없습니다.',
                style: TextStyle(fontSize: 16, color: Colors.grey))
          else
            SizedBox(
              height: 136,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.company.currentAuditions.length,
                itemBuilder: (context, index) {
                  return _buildAuditionCard(
                      widget.company.currentAuditions[index]);
                },
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildAuditionCard(Audition audition) {
    return Container(
      width: 155,
      height: 136,
      margin: const EdgeInsets.only(right: 10),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFD9D9D9)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 10, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    audition.title,
                    style: const TextStyle(
                      color: Color(0xFF434343),
                      fontSize: 13.5,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: Icon(
                    audition.isFavorite
                        ? Icons.bookmark
                        : Icons.bookmark_border,
                    color: audition.isFavorite ? Colors.pink : Colors.grey,
                    size: 25,
                  ),
                  onPressed: () {
                    setState(() {
                      audition.isFavorite = !audition.isFavorite;
                    });
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 2),
            child: Text(
              '모집기간: ${audition.deadline}',
              style: const TextStyle(
                color: Color(0xFF878787),
                fontSize: 12,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ApplyPage1(
                    audition: audition,
                    company: Company(),
                  ),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              height: 36,
              decoration: const BoxDecoration(
                color: Color(0xFFEF69A6),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              alignment: Alignment.center,
              child: const Text(
                '지원하기',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
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
