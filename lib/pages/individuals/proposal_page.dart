import 'package:flutter/material.dart';
import '../../models/casting.dart';
import 'company_detail_page.dart';

class ProposalPage extends StatefulWidget {
  final Casting casting;

  const ProposalPage({Key? key, required this.casting}) : super(key: key);

  @override
  _ProposalPageState createState() => _ProposalPageState();
}

class _ProposalPageState extends State<ProposalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildAppBar(context),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCastingMessage(),
                    const SizedBox(height: 20),
                    _buildCompanyInfo(),
                    const SizedBox(height: 20),
                    if (widget.casting.status == CastingStatus.pending) ...[
                      _buildApproveButton(context),
                      const SizedBox(height: 10),
                      _buildRejectButton(context),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Color(0xFF434343)),
              onPressed: () => Navigator.pop(context),
            ),
            const Expanded(
              child: Text(
                '제안 내용 확인하기',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF434343),
                  fontSize: 16,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(width: 48),
          ],
        ),
      ),
    );
  }

  Widget _buildCastingMessage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '캐스팅 메시지',
          style: TextStyle(
            color: Color(0xFF434343),
            fontSize: 18,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFFF4F4F5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfoRow('받는사람', widget.casting.contactPerson),
              const Divider(color: Color(0xFFD9D9D9)),
              const SizedBox(height: 10),
              const Text(
                '기본 정보',
                style: TextStyle(
                  color: Color(0xFF434343),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              _buildInfoRow('회사', widget.casting.company.company),
              _buildInfoRow('담당자 연락처', widget.casting.contactPhone),
              Text(
                widget.casting.contactEmail,
                style: const TextStyle(color: Color(0xFF434343)),
              ),
              const Divider(color: Color(0xFFD9D9D9)),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '담당자 메시지',
                    style: TextStyle(
                      color: Color(0xFF878787),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '수정하기',
                    style: TextStyle(
                      color: Color(0xFF878787),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Text(widget.casting.message),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF878787),
            fontSize: 14,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 15),
        Text(
          value,
          style: const TextStyle(
            color: Color(0xFF434343),
            fontSize: 14,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildCompanyInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '기업정보',
          style: TextStyle(
            color: Color(0xFF434343),
            fontSize: 18,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          width: 350,
          height: 129,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage(widget.casting.company.imagePath),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 20,
                top: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.casting.company.company,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${widget.casting.company.industry} · ${widget.casting.company.location}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 20,
                bottom: 20,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CompanyDetailPage(company: widget.casting.company),
                      ),
                    );
                  },
                  child: const Text(
                    '상세보기',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildApproveButton(BuildContext context) {
    return Positioned(
      left: 20,
      top: 676,
      child: SizedBox(
        width: 350,
        height: 44,
        child: ElevatedButton(
          onPressed: () {
            widget.casting.approve();
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF878787),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          child: const Text('승인하기'),
        ),
      ),
    );
  }

  Widget _buildRejectButton(BuildContext context) {
    return Positioned(
      left: 20,
      top: 730,
      child: SizedBox(
        width: 350,
        height: 44,
        child: ElevatedButton(
          onPressed: () {
            widget.casting.reject();
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFD9D9D9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          child: const Text('거절하기'),
        ),
      ),
    );
  }
}
