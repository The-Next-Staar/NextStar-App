import 'package:flutter/material.dart';
import '../../../models/application.dart';
import '../../../models/casting.dart';
import '../applicaiton_page.dart';
import '../proposal_page.dart';

class ApplicationManagementPage extends StatefulWidget {
  const ApplicationManagementPage({Key? key}) : super(key: key);

  @override
  _ApplicationManagementPageState createState() =>
      _ApplicationManagementPageState();
}

class _ApplicationManagementPageState extends State<ApplicationManagementPage> {
  bool _isAppliedCompanies = false;
  String _castingFilter = '전체';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          _buildToggleButtons(),
          _buildCompanyCount(),
          if (!_isAppliedCompanies) _buildCastingFilter(),
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
              height: 1.2,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCompanyCount() {
    final unreadCount =
        sampleCastings.where((casting) => !casting.isRead).length;
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, bottom: 5),
      child: Text(
        _isAppliedCompanies
            ? '지원 기업 총 ${applications.length}곳'
            : '제안한 기업 총 ${sampleCastings.length}곳 (안읽은 제안 $unreadCount곳)',
        style: const TextStyle(
          color: Color(0xFF878787),
          fontSize: 12,
          height: 1.5,
        ),
      ),
    );
  }

  Widget _buildCastingFilter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          _buildFilterChip('전체'),
          const SizedBox(width: 10),
          _buildFilterChip('승인'),
          const SizedBox(width: 10),
          _buildFilterChip('거절'),
          const SizedBox(width: 10),
          _buildFilterChip('대기중'),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    final isSelected = _castingFilter == label;
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (bool selected) {
        setState(() {
          _castingFilter = selected ? label : '전체';
        });
      },
      selectedColor: const Color(0xFFEF69A6).withOpacity(0.1),
      backgroundColor: Colors.white,
      labelStyle: TextStyle(
        color: isSelected ? const Color(0xFFEF69A6) : const Color(0xFF878787),
        fontWeight: FontWeight.w600,
        fontSize: 14,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: isSelected ? const Color(0xFFEF69A6) : const Color(0xFF878787),
        ),
      ),
    );
  }

  Widget _buildAppliedCompaniesList() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: applications.length,
      itemBuilder: (context, index) {
        final application = applications[index];
        return _buildAppliedCompanyCard(context, application);
      },
    );
  }

  Widget _buildCastingCompaniesList() {
    List<Casting> filteredCastings = sampleCastings;
    if (_castingFilter != '전체') {
      filteredCastings = sampleCastings.where((casting) {
        switch (_castingFilter) {
          case '승인':
            return casting.status == CastingStatus.approved;
          case '거절':
            return casting.status == CastingStatus.rejected;
          case '대기중':
            return casting.status == CastingStatus.pending;
          default:
            return true;
        }
      }).toList();
    }

    final unreadCastings =
        filteredCastings.where((casting) => !casting.isRead).toList();
    final readCastings =
        filteredCastings.where((casting) => casting.isRead).toList();

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        if (unreadCastings.isNotEmpty) ...[
          _buildSectionTitle('최근 제안'),
          ...unreadCastings.map((casting) => _buildCastingCompanyCard(casting)),
        ],
        if (readCastings.isNotEmpty) ...[
          _buildSectionTitle('내가 이미 확인한 제안'),
          ...readCastings.map((casting) => _buildCastingCompanyCard(casting)),
        ],
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF434343),
          fontSize: 18,
          fontWeight: FontWeight.w700,
          height: 1.2,
        ),
      ),
    );
  }

  Widget _buildAppliedCompanyCard(
      BuildContext context, Application application) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: Color(0xFFD9D9D9)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  application.companyName,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                _buildViewStatusChip(application.isViewed),
              ],
            ),
            const SizedBox(height: 10),
            Text(application.audititionName),
            const SizedBox(height: 5),
            Text('모집기간: ${application.recruitmentPeriod}'),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ApplicationsPage(application: application),
                    ),
                  );
                },
                child: const Text('지원 상세보기'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCastingCompanyCard(Casting casting) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: Color(0xFFD9D9D9)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  casting.company.company,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                _buildCastingStatusChip(casting),
              ],
            ),
            const SizedBox(height: 10),
            Text(casting.message),
            const SizedBox(height: 5),
            Text(
              casting.date,
              style: const TextStyle(color: Color(0xFF878787), fontSize: 13),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProposalPage(casting: casting),
                    ),
                  ).then((_) {
                    setState(() {
                      casting.markAsRead();
                    });
                  });
                },
                child: const Text('제안 내용 보기'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildViewStatusChip(bool isViewed) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(
          color: isViewed ? const Color(0xFFEF69A6) : const Color(0xFF878787),
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        isViewed ? '열람' : '미열람',
        style: TextStyle(
          color: isViewed ? const Color(0xFFEF69A6) : const Color(0xFF878787),
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildCastingStatusChip(Casting casting) {
    Color color;
    String text;

    switch (casting.status) {
      case CastingStatus.pending:
        color = Colors.orange;
        text = '대기중';
        break;
      case CastingStatus.approved:
        color = const Color(0xFFEF69A6);
        text = '승인';
        break;
      case CastingStatus.rejected:
        color = const Color(0xFF878787);
        text = '거절';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style:
            TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w600),
      ),
    );
  }
}
