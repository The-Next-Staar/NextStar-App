import 'package:flutter/material.dart';
import '../../../models/casting.dart';
import '../../../models/proposal.dart';
import '../message/message.dart';
import '../trainee_info_page.dart';

class ProposalManagementPage extends StatefulWidget {
  const ProposalManagementPage({super.key});

  @override
  _ProposalManagementPageState createState() => _ProposalManagementPageState();
}

class _ProposalManagementPageState extends State<ProposalManagementPage> {
  bool _isProposalList = true;
  String _selectedFilter = '전체';
  List<Proposal> _proposals = [];

  @override
  void initState() {
    super.initState();
    _loadProposals();
  }

  void _loadProposals() {
    setState(() {
      _proposals = sampleProposals
          .where((proposal) => proposal.company?.company == 'JYP Entertainment')
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          _buildToggleButtons(),
          _buildFilterChips(),
          _buildTraineeCount(),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                _loadProposals();
              },
              child:
                  _isProposalList ? _buildProposalList() : _buildCastingList(),
            ),
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
                  left: _isProposalList ? 0 : constraints.maxWidth / 2,
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
                      onTap: () => _setListType(true),
                      child: Text(
                        '지원자 리스트',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: _isProposalList
                              ? const Color(0xFFEF69A6)
                              : const Color(0xFFCBCBCB),
                          fontSize: 16,
                          fontFamily: 'Pretendard',
                          fontWeight: _isProposalList
                              ? FontWeight.w700
                              : FontWeight.w400,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _setListType(false),
                      child: Text(
                        '캐스팅한 지원자',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: !_isProposalList
                              ? const Color(0xFFEF69A6)
                              : const Color(0xFFCBCBCB),
                          fontSize: 16,
                          fontFamily: 'Pretendard',
                          fontWeight: !_isProposalList
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

  void _setListType(bool isProposalList) {
    setState(() {
      _isProposalList = isProposalList;
      _selectedFilter = '전체';
    });
  }

  Widget _buildFilterChips() {
    List<String> filters =
        _isProposalList ? ['전체', '여자', '남자'] : ['전체', '승인', '거절', '대기중'];
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 15, bottom: 15),
      child: Wrap(
        spacing: 10,
        children: filters.map((filter) => _buildFilterChip(filter)).toList(),
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    bool isSelected = _selectedFilter == label;
    return GestureDetector(
      onTap: () => setState(() => _selectedFilter = label),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFFF3F8) : Colors.transparent,
          border: Border.all(
            color:
                isSelected ? const Color(0xFFEF69A6) : const Color(0x3870737C),
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          label,
          style: TextStyle(
            color:
                isSelected ? const Color(0xFFED72C6) : const Color(0xFF878787),
            fontSize: 14,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildTraineeCount() {
    int count = _getFilteredProposals().length;
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 15),
      child: Text(
        _isProposalList ? '지원자 총 $count명' : '캐스팅 한 지원자 총 $count명',
        style: const TextStyle(
          color: Color(0xFF878787),
          fontSize: 12,
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w400,
          letterSpacing: 0.30,
        ),
      ),
    );
  }

  List<Proposal> _getFilteredProposals() {
    if (_selectedFilter == '전체') return _proposals;
    return _proposals.where((proposal) {
      if (_isProposalList) {
        return proposal.trainee.gender == _selectedFilter;
      } else {
        switch (_selectedFilter) {
          case '승인':
            return proposal.status == ProposalStatus.approved;
          case '거절':
            return proposal.status == ProposalStatus.rejected;
          case '대기중':
            return proposal.status == ProposalStatus.pending;
          default:
            return true;
        }
      }
    }).toList();
  }

  Widget _buildProposalList() {
    final filteredProposals = _getFilteredProposals();
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: filteredProposals.length,
      itemBuilder: (context, index) =>
          _buildProposalCard(filteredProposals[index]),
    );
  }

  Widget _buildCastingList() {
    final filteredProposals = _getFilteredProposals();
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: filteredProposals.length,
      itemBuilder: (context, index) =>
          _buildCastingCard(filteredProposals[index]),
    );
  }

  Widget _buildProposalCard(Proposal proposal) {
    return Container(
      width: 350,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFD9D9D9)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 123,
            padding: const EdgeInsets.all(13),
            child: Row(
              children: [
                Container(
                  width: 97,
                  height: 97,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    image: DecorationImage(
                      image: AssetImage(proposal.trainee.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        proposal.trainee.name,
                        style: const TextStyle(
                          color: Color(0xFF434343),
                          fontSize: 18,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Divider(color: Color(0xFFD9D9D9)),
                      Text(
                        '${proposal.trainee.gender} | 만 ${proposal.trainee.age}세 (${proposal.trainee.birthYear}년 생)',
                        style: const TextStyle(
                          color: Color(0xFF434343),
                          fontSize: 13,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '${proposal.trainee.height}cm | ${proposal.trainee.weight}kg',
                        style: const TextStyle(
                          color: Color(0xFF434343),
                          fontSize: 13,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 13, bottom: 13),
            child: Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        TraineeInfoPage(trainee: proposal.trainee),
                  ),
                ),
                child: const Text(
                  '상세보기',
                  style: TextStyle(
                    color: Color(0xFF878787),
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCastingCard(Proposal proposal) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFD9D9D9)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 123,
            padding: const EdgeInsets.all(13),
            child: Row(
              children: [
                Container(
                  width: 97,
                  height: 97,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    image: DecorationImage(
                      image: AssetImage(proposal.trainee.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        proposal.trainee.name,
                        style: const TextStyle(
                          color: Color(0xFF434343),
                          fontSize: 18,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Divider(color: Color(0xFFD9D9D9)),
                      Text(
                        '${proposal.trainee.gender} | 만 ${proposal.trainee.age}세 (${proposal.trainee.birthYear}년 생)',
                        style: const TextStyle(
                          color: Color(0xFF434343),
                          fontSize: 13,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '${proposal.trainee.height}cm | ${proposal.trainee.weight}kg',
                        style: const TextStyle(
                          color: Color(0xFF434343),
                          fontSize: 13,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          proposal.status == ProposalStatus.approved
              ? _buildMessageButton(proposal)
              : _buildStatusContainer(proposal.status),
        ],
      ),
    );
  }

  Widget _buildMessageButton(Proposal proposal) {
    return Container(
      width: double.infinity,
      height: 44,
      decoration: const ShapeDecoration(
        color: Color(0xFFEF69A6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
        ),
      ),
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MessagePage(
                casting: Casting(
                  trainee: proposal.trainee,
                  company: proposal.company!,
                  message: '',
                  date: DateTime.now().toString(),
                  contactPerson: '',
                  contactEmail: '',
                  contactPhone: '',
                ),
              ),
            ),
          );
        },
        style: TextButton.styleFrom(
          backgroundColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
          ),
        ),
        child: const Text(
          '메시지 함으로 이동하기',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildStatusContainer(ProposalStatus status) {
    return Container(
      width: double.infinity,
      height: 44,
      decoration: ShapeDecoration(
        color: _getStatusColor(status),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
        ),
      ),
      child: Center(
        child: Text(
          _getStatusText(status),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  String _getStatusText(ProposalStatus status) {
    switch (status) {
      case ProposalStatus.pending:
        return '대기중';
      case ProposalStatus.approved:
        return '승인';
      case ProposalStatus.rejected:
        return '거절';
    }
  }

  Color _getStatusColor(ProposalStatus status) {
    switch (status) {
      case ProposalStatus.pending:
        return const Color(0xFFD9D9D9);
      case ProposalStatus.approved:
        return const Color(0xFFEF69A6);
      case ProposalStatus.rejected:
        return const Color(0xFF878787);
    }
  }
}
