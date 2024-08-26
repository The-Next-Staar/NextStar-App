import 'company.dart';
import 'trainee.dart';

enum ProposalStatus { pending, approved, rejected }

class Proposal {
  final String id;
  final Company? company;
  final String message;
  final DateTime date;
  final DateTime deadline;
  final String contactPerson;
  final String contactEmail;
  final String contactPhone;
  final Trainee? trainee;
  ProposalStatus status;

  Proposal({
    required this.id,
    required this.company,
    required this.message,
    required this.date,
    required this.deadline,
    required this.contactPerson,
    required this.contactEmail,
    required this.contactPhone,
    required this.trainee,
    this.status = ProposalStatus.pending,
  });

  void approve() {
    status = ProposalStatus.approved;
  }

  void reject() {
    status = ProposalStatus.rejected;
  }

  String get formattedDate =>
      "${date.year}.${date.month.toString().padLeft(2, '0')}.${date.day.toString().padLeft(2, '0')}";

  int get remainingDays => deadline.difference(DateTime.now()).inDays;
}

List<Proposal> generateSampleProposals() {
  List<Proposal> proposals = [];

  void addProposal(
    Company? company,
    Trainee? trainee, {
    required String id,
    required String message,
    required DateTime date,
    required DateTime deadline,
    required String contactPerson,
    required String contactEmail,
    required String contactPhone,
    ProposalStatus status = ProposalStatus.pending,
  }) {
    if (company != null && trainee != null) {
      proposals.add(Proposal(
        id: id,
        company: company,
        message: message,
        date: date,
        deadline: deadline,
        contactPerson: contactPerson,
        contactEmail: contactEmail,
        contactPhone: contactPhone,
        trainee: trainee,
        status: status,
      ));
    }
  }

  addProposal(
    sampleCompanies.firstWhere((c) => c.company == 'JYP Entertainment'),
    trainees.isNotEmpty ? trainees[0] : null,
    id: '1',
    message: '안녕하세요, JYP 캐스팅 담당자입니다. 팜하니님의 춤 실력이 인상적이어서 제안 드립니다.',
    date: DateTime(2024, 8, 18),
    deadline: DateTime(2024, 8, 25),
    contactPerson: '김캐스팅',
    contactEmail: 'casting1@jyp.com',
    contactPhone: '010-0000-0000',
  );

  addProposal(
    sampleCompanies.firstWhere((c) => c.company == 'SM Entertainment'),
    trainees.length > 1 ? trainees[1] : null,
    id: '2',
    message: '안녕하세요! SM 캐스팅 센터입니다. 당신의 재능에 관심이 있습니다.',
    date: DateTime(2024, 8, 18),
    deadline: DateTime(2024, 9, 1),
    contactPerson: '이매니저',
    contactEmail: 'casting@sm.com',
    contactPhone: '010-1111-1111',
  );

  addProposal(
    sampleCompanies.firstWhere((c) => c.company == 'YG Entertainment'),
    trainees.length > 2 ? trainees[2] : null,
    id: '3',
    message: '안녕하세요, YG 캐스팅 센터입니다. 오디션에 참여해 보시겠어요?',
    date: DateTime(2024, 8, 15),
    deadline: DateTime(2024, 8, 30),
    contactPerson: '박디렉터',
    contactEmail: 'casting@yg.com',
    contactPhone: '010-2222-2222',
    status: ProposalStatus.rejected,
  );

  addProposal(
    sampleCompanies.firstWhere((c) => c.company == 'Big Hit Entertainment'),
    trainees.length > 3 ? trainees[3] : null,
    id: '4',
    message: '안녕하세요, Big Hit에서 당신의 가능성을 높이 평가하여 연락드립니다.',
    date: DateTime(2024, 8, 10),
    deadline: DateTime(2024, 8, 24),
    contactPerson: '정프로듀서',
    contactEmail: 'casting@bighit.com',
    contactPhone: '010-3333-3333',
    status: ProposalStatus.approved,
  );

  addProposal(
    sampleCompanies.firstWhere((c) => c.company == 'Cube Entertainment'),
    trainees.length > 1 ? trainees[1] : null,
    id: '5',
    message: '안녕하세요, Cube Entertainment입니다. 함께 일할 기회를 드리고 싶습니다.',
    date: DateTime(2024, 8, 12),
    deadline: DateTime(2024, 8, 27),
    contactPerson: '최매니저',
    contactEmail: 'casting@cube.com',
    contactPhone: '010-4444-4444',
  );

  return proposals;
}

List<Proposal> sampleProposals = generateSampleProposals();
