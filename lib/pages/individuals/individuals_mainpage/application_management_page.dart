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
  String _castingFilter = '전체';
  List<Casting> _filteredCastings = [];

  @override
  void initState() {
    super.initState();
    _filterCastings();
  }

  void _filterCastings() {
    setState(() {
      switch (_castingFilter) {
        case '승인':
          _filteredCastings = sampleCastings
              .where((casting) => casting.status == CastingStatus.approved)
              .toList();
          break;
        case '거절':
          _filteredCastings = sampleCastings
              .where((casting) => casting.status == CastingStatus.rejected)
              .toList();
          break;
        case '대기중':
          _filteredCastings = sampleCastings
              .where((casting) => casting.status == CastingStatus.pending)
              .toList();
          break;
        default:
          _filteredCastings = List.from(sampleCastings);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildToggleButtons(),
          _buildCompanyCount(),
          if (!_isAppliedCompanies) _buildCastingFilter(),
          const SizedBox(height: 20),
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
    return Center(
      child: Container(
        height: 45,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: 2,
                    color: const Color(0xFFCBCBCB),
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  left: _isAppliedCompanies ? 0 : constraints.maxWidth / 2,
                  bottom: 0,
                  child: Container(
                    width: constraints.maxWidth / 2,
                    height: 2,
                    color: const Color(0xFFEF69A6),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () => setState(() => _isAppliedCompanies = true),
                      child: Text(
                        '내가 지원한 기업',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: _isAppliedCompanies
                              ? const Color(0xFFEF69A6)
                              : const Color(0xFFCBCBCB),
                          fontSize: 16,
                          fontFamily: 'Pretendard',
                          fontWeight: _isAppliedCompanies
                              ? FontWeight.w700
                              : FontWeight.w400,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => setState(() => _isAppliedCompanies = false),
                      child: Text(
                        '캐스팅 받은 기업',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: !_isAppliedCompanies
                              ? const Color(0xFFEF69A6)
                              : const Color(0xFFCBCBCB),
                          fontSize: 16,
                          fontFamily: 'Pretendard',
                          fontWeight: !_isAppliedCompanies
                              ? FontWeight.w700
                              : FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildCompanyCount() {
    final count =
        _isAppliedCompanies ? applications.length : _filteredCastings.length;
    final unreadCount = _isAppliedCompanies
        ? applications.where((app) => !app.isViewed).length
        : _filteredCastings.where((casting) => !casting.isRead).length;

    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
      child: Text(
        _isAppliedCompanies
            ? '지원 기업 총 $count곳 (미열람 제안 $unreadCount곳)'
            : '제안한 기업 총 $count곳 (안읽은 제안 $unreadCount곳)',
        style: const TextStyle(
          color: Color(0xFF878787),
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildCastingFilter() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildFilterButton('전체'),
          const SizedBox(width: 8),
          _buildFilterButton('승인'),
          const SizedBox(width: 8),
          _buildFilterButton('거절'),
          const SizedBox(width: 8),
          _buildFilterButton('대기중'),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String label) {
    final isSelected = _castingFilter == label;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color:
                isSelected ? const Color(0xFFEF69A6) : const Color(0x3870737C),
          ),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: InkWell(
        onTap: () {
          setState(() {
            _castingFilter = label;
            _filterCastings();
          });
        },
        child: Center(
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected
                  ? const Color(0xFFED72C6)
                  : const Color(0xFF878787),
              fontSize: 14,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w600,
              height: 1.2,
              letterSpacing: 0.35,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCompanyCard({
    required String title,
    required String subtitle,
    required String date,
    required String status,
    required VoidCallback onViewDetails,
  }) {
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
                title,
                style: const TextStyle(
                  color: Color(0xFF434343),
                  fontSize: 18,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                ),
              ),
              _buildStatusChip(status),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: const TextStyle(
              color: Color(0xFF434343),
              fontSize: 13,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                date,
                style: const TextStyle(
                  color: Color(0xFF878787),
                  fontSize: 13,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                ),
              ),
              GestureDetector(
                onTap: onViewDetails,
                child: const Text(
                  '제안 내용 보기',
                  style: TextStyle(
                    color: Color(0xFF878787),
                    fontSize: 13,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAppliedCompaniesList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: applications.length,
      itemBuilder: (context, index) {
        final application = applications[index];
        return _buildCompanyCard(
          title: application.companyName,
          subtitle: application.audititionName,
          date: application.recruitmentPeriod,
          status: application.isViewed ? '열람' : '미열람',
          onViewDetails: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ApplicationsPage(application: application),
              ),
            ).then((_) {
              setState(() {
                application.isViewed = true;
              });
            });
          },
        );
      },
    );
  }

  Widget _buildCastingCompaniesList() {
    List<Casting> unreadCastings =
        _filteredCastings.where((casting) => !casting.isRead).toList();

    List<Casting> readCastings =
        _filteredCastings.where((casting) => casting.isRead).toList();

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        if (unreadCastings.isNotEmpty) ...[
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              '최근 제안',
              style: TextStyle(
                color: Color(0xFF434343),
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          ...unreadCastings.map((casting) => _buildCompanyCard(
                title: casting.company.company,
                subtitle: casting.message,
                date: casting.date,
                status: _getCastingStatusText(casting.status),
                onViewDetails: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProposalPage(casting: casting),
                    ),
                  ).then((_) {
                    setState(() {
                      casting.markAsRead();
                      _filterCastings();
                    });
                  });
                },
              )),
          const SizedBox(height: 20),
        ],
        if (readCastings.isNotEmpty) ...[
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              '내가 이미 확인한 제안',
              style: TextStyle(
                color: Color(0xFF434343),
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          ...readCastings.map((casting) => _buildCompanyCard(
                title: casting.company.company,
                subtitle: casting.message,
                date: casting.date,
                status: _getCastingStatusText(casting.status),
                onViewDetails: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProposalPage(casting: casting),
                    ),
                  ).then((_) {
                    setState(() {
                      casting.markAsRead();
                      _filterCastings();
                    });
                  });
                },
              )),
        ],
      ],
    );
  }

  Widget _buildStatusChip(String status) {
    Color color;
    Color textColor;
    switch (status) {
      case '승인':
        color = const Color(0xFFEF69A6);
        textColor = Colors.white;
        break;
      case '거절':
        color = const Color(0xFF878787);
        textColor = Colors.white;
        break;
      case '대기중':
        color = Colors.orange;
        textColor = Colors.white;
        break;
      case '열람':
        color = const Color(0xFFEF69A6).withOpacity(0.1);
        textColor = const Color(0xFFEF69A6);
        break;
      case '미열람':
        color = const Color(0xFF878787).withOpacity(0.1);
        textColor = const Color(0xFF878787);
        break;
      default:
        color = const Color(0xFF878787).withOpacity(0.1);
        textColor = const Color(0xFF878787);
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  String _getCastingStatusText(CastingStatus status) {
    switch (status) {
      case CastingStatus.approved:
        return '승인';
      case CastingStatus.rejected:
        return '거절';
      case CastingStatus.pending:
        return '대기중';
    }
  }
}
