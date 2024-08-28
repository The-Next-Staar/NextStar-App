import 'company.dart';
import 'trainee.dart';

enum ProposalStatus { pending, approved, rejected }

class Proposal {
  final String id;
  final Company company;
  final Trainee trainee;
  final String message;
  final DateTime date;
  final DateTime deadline;
  final String contactPerson;
  final String contactEmail;
  final String contactPhone;
  ProposalStatus status;

  Proposal({
    required this.id,
    required this.company,
    required this.trainee,
    required this.message,
    required this.date,
    required this.deadline,
    required this.contactPerson,
    required this.contactEmail,
    required this.contactPhone,
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
    Company company,
    Trainee trainee, {
    required String id,
    required String message,
    required DateTime date,
    required DateTime deadline,
    required String contactPerson,
    required String contactEmail,
    required String contactPhone,
    ProposalStatus status = ProposalStatus.pending,
  }) {
    proposals.add(Proposal(
      id: id,
      company: company,
      trainee: trainee,
      message: message,
      date: date,
      deadline: deadline,
      contactPerson: contactPerson,
      contactEmail: contactEmail,
      contactPhone: contactPhone,
      status: status,
    ));
  }

  Company jypEntertainment =
      sampleCompanies.firstWhere((c) => c.company == 'JYP Entertainment');

  addProposal(
    jypEntertainment,
    trainees[0],
    id: '1',
    message:
        '안녕하세요, ${trainees[0].name}님. JYP Entertainment에서 당신의 재능에 깊은 인상을 받아 연락드립니다. 오디션에 참여해 주시겠습니까?',
    date: DateTime(2024, 8, 18),
    deadline: DateTime(2024, 8, 25),
    contactPerson: '김캐스팅',
    contactEmail: 'casting1@jyp.com',
    contactPhone: '010-0000-0000',
  );

  addProposal(
    jypEntertainment,
    trainees[1],
    id: '2',
    message:
        '${trainees[1].name}님, JYP Entertainment입니다. 당신의 춤 실력이 인상적이었습니다. 우리와 함께 꿈을 키워나가지 않으시겠습니까?',
    date: DateTime(2024, 8, 19),
    deadline: DateTime(2024, 9, 1),
    contactPerson: '박매니저',
    contactEmail: 'casting2@jyp.com',
    contactPhone: '010-1111-1111',
  );

  addProposal(
    jypEntertainment,
    trainees[2],
    id: '3',
    message:
        '안녕하세요, ${trainees[2].name}님. JYP Entertainment 캐스팅 팀입니다. 귀하의 보컬 능력이 우수하다고 판단되어 연락드립니다.',
    date: DateTime(2024, 8, 15),
    deadline: DateTime(2024, 8, 30),
    contactPerson: '이디렉터',
    contactEmail: 'casting3@jyp.com',
    contactPhone: '010-2222-2222',
    status: ProposalStatus.rejected,
  );

  addProposal(
    jypEntertainment,
    trainees[3],
    id: '4',
    message:
        '${trainees[3].name}님, JYP Entertainment에서 연락드립니다. 당신의 재능을 더욱 발전시킬 수 있는 기회를 제공하고 싶습니다.',
    date: DateTime(2024, 8, 10),
    deadline: DateTime(2024, 8, 24),
    contactPerson: '정프로듀서',
    contactEmail: 'casting4@jyp.com',
    contactPhone: '010-3333-3333',
    status: ProposalStatus.approved,
  );

  addProposal(
    jypEntertainment,
    trainees[4],
    id: '5',
    message:
        '안녕하세요, ${trainees[4].name}님. JYP Entertainment입니다. 당신의 끼와 재능이 돋보여 연락드립니다. 함께 성장할 기회를 갖고 싶습니다.',
    date: DateTime(2024, 8, 12),
    deadline: DateTime(2024, 8, 27),
    contactPerson: '최매니저',
    contactEmail: 'casting5@jyp.com',
    contactPhone: '010-4444-4444',
  );

  return proposals;
}

List<Proposal> sampleProposals = generateSampleProposals();
