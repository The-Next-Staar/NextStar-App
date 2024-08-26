import 'package:flutter/material.dart';
import '../../../models/proposal.dart';

class ProposalManagementPage extends StatefulWidget {
  const ProposalManagementPage({Key? key}) : super(key: key);

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
      _proposals = sampleProposals;
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
          _buildCompanyCount(),
          Expanded(
            child: _isProposalList ? _buildProposalList() : _buildCastingList(),
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
          _buildToggleButton(
              '지원자 리스트', _isProposalList, () => _setListType(true)),
          _buildToggleButton(
              '캐스팅한 지원자', !_isProposalList, () => _setListType(false)),
        ],
      ),
    );
  }

  void _setListType(bool isProposalList) {
    setState(() {
      _isProposalList = isProposalList;
      _selectedFilter = '전체';
    });
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
                  : const Color(0xFFCBCBCB),
              fontSize: 16,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFilterChips() {
    List<String> filters =
        _isProposalList ? ['전체', '여자', '남자'] : ['전체', '제안 확인 중', '승인', '거절'];
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

  Widget _buildCompanyCount() {
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
        ),
      ),
    );
  }

  List<Proposal> _getFilteredProposals() {
    if (_selectedFilter == '전체') return _proposals;
    return _proposals.where((proposal) {
      if (_isProposalList) {
        return proposal.trainee?.gender == _selectedFilter;
      } else {
        switch (_selectedFilter) {
          case '제안 확인 중':
            return proposal.status == ProposalStatus.pending;
          case '승인':
            return proposal.status == ProposalStatus.approved;
          case '거절':
            return proposal.status == ProposalStatus.rejected;
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
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(
                      proposal.trainee?.imageUrl ?? 'assets/default_image.png'),
                  radius: 30,
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      proposal.trainee?.name ?? 'Unknown Trainee',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${proposal.trainee?.age ?? 0}세 | ${proposal.trainee?.height ?? 0}cm ${proposal.trainee?.weight ?? 0}kg',
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              proposal.company?.company ?? 'Unknown Company',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(proposal.message),
            const SizedBox(height: 8),
            Text('마감일: ${proposal.formattedDate}'),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      proposal.approve();
                    });
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text('승인'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      proposal.reject();
                    });
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text('거절'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCastingCard(Proposal proposal) {
    return Column(
      children: [
        Container(
          width: 350,
          height: 123,
          margin: const EdgeInsets.only(bottom: 8),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0xFFD9D9D9)),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 97,
                height: 97,
                margin: const EdgeInsets.all(13),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  image: DecorationImage(
                    image: AssetImage(proposal.company?.company ??
                        'assets/default_image.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      proposal.company?.company ?? 'Unknown Company',
                      style: const TextStyle(
                        color: Color(0xFF434343),
                        fontSize: 18,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Divider(color: Color(0xFFD9D9D9)),
                    Text(
                      proposal.message,
                      style: const TextStyle(
                        color: Color(0xFF434343),
                        fontSize: 13,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '마감일: ${proposal.formattedDate}',
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
              const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      '상세보기',
                      style: TextStyle(
                        color: Color(0xFF878787),
                        fontSize: 12,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          width: 350,
          height: 44,
          decoration: ShapeDecoration(
            color: proposal.status == ProposalStatus.pending
                ? const Color(0xFFD9D9D9)
                : const Color(0xFF434343),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          ),
          child: Center(
            child: Text(
              _getStatusText(proposal.status),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  String _getStatusText(ProposalStatus status) {
    switch (status) {
      case ProposalStatus.pending:
        return '제안 확인 중';
      case ProposalStatus.approved:
        return '승인';
      case ProposalStatus.rejected:
        return '거절';
    }
  }
}
