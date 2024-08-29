import 'trainee.dart';
import 'company.dart';
import 'package:intl/intl.dart';

enum CastingStatus { pending, approved, rejected }

Casting getEmptyCasting() {
  return Casting(
    trainee: trainees[0],
    company: Company.empty(),
    message: '',
    date: '',
    contactPerson: '',
    contactEmail: '',
    contactPhone: '',
    daysUntilDeadline: 0,
    isRead: false,
  );
}

class Casting {
  final Trainee trainee;
  final Company company;
  final String message;
  final String date;
  final String contactPerson;
  final String contactEmail;
  final String contactPhone;
  CastingStatus status;
  int? daysUntilDeadline;
  bool isRead = false;

  Casting({
    required this.trainee,
    required this.company,
    required this.message,
    required this.date,
    required this.contactPerson,
    required this.contactEmail,
    required this.contactPhone,
    this.daysUntilDeadline,
    this.status = CastingStatus.pending,
    this.isRead = false,
  });

  void approve() {
    status = CastingStatus.approved;
  }

  void reject() {
    status = CastingStatus.rejected;
  }

  void markAsRead() {
    isRead = true;
  }
}

int? calculateDaysUntilDeadline(String deadlineDate) {
  try {
    final deadline = DateFormat('yyyy.MM.dd').parse(deadlineDate);
    final currentDate = DateTime.now();
    return deadline.difference(currentDate).inDays;
  } catch (e) {
    return 0;
  }
}

List<Casting> sampleCastings = [
  Casting(
    trainee: trainees[0],
    company:
        sampleCompanies.firstWhere((c) => c.company == 'JYP Entertainment'),
    message: '안녕하세요, JYP 캐스팅 담당자입니다. 저희 기업의 이미지와 잘 어울려 제안 보냅니다.',
    date: '2024.08.18',
    contactPerson: '김캐스팅',
    contactEmail: 'casting1@jyp.com',
    contactPhone: '010-0000-0000',
    daysUntilDeadline: calculateDaysUntilDeadline('2024.08.25'),
    isRead: true,
  ),
  Casting(
    trainee: trainees[0],
    company: sampleCompanies.firstWhere((c) => c.company == 'SM Entertainment'),
    message: '안녕하세요! SM 캐스팅 센터입니다. 당신의 재능에 관심이 있습니다.',
    date: '2024.08.18',
    contactPerson: '이매니저',
    contactEmail: 'casting@sm.com',
    contactPhone: '010-1111-1111',
    daysUntilDeadline: calculateDaysUntilDeadline('2024.09.01'),
    isRead: false,
  ),
  Casting(
    trainee: trainees[2],
    company: sampleCompanies.firstWhere((c) => c.company == 'YG Entertainment'),
    message: '안녕하세요, YG 캐스팅 센터입니다. 오디션에 참여해 보시겠어요?',
    date: '2024.08.15',
    contactPerson: '박디렉터',
    contactEmail: 'casting@yg.com',
    contactPhone: '010-2222-2222',
    status: CastingStatus.rejected,
    daysUntilDeadline: calculateDaysUntilDeadline('2024.08.30'),
    isRead: true,
  ),
  Casting(
    trainee: trainees[3],
    company:
        sampleCompanies.firstWhere((c) => c.company == 'HYBE Entertainment'),
    message: '안녕하세요, HYBE 캐스팅 담당자입니다. 당신의 재능을 인정합니다!',
    date: '2024.08.19',
    contactPerson: '최매니저',
    contactEmail: 'casting@bighit.com',
    contactPhone: '010-3333-3333',
    daysUntilDeadline: calculateDaysUntilDeadline('2024.09.05'),
    isRead: false,
  ),
  Casting(
    trainee: trainees[0],
    company:
        sampleCompanies.firstWhere((c) => c.company == 'FNC Entertainment'),
    message: 'FNC Entertainment에서 오디션 제안을 드립니다. 함께 해주세요!',
    date: '2024.08.20',
    contactPerson: '정캐스팅',
    contactEmail: 'casting@cube.com',
    contactPhone: '010-4444-4444',
    daysUntilDeadline: calculateDaysUntilDeadline('2024.09.03'),
    isRead: true,
  ),
  Casting(
    trainee: trainees[0],
    company:
        sampleCompanies.firstWhere((c) => c.company == 'HYBE Entertainment'),
    message: '안녕하세요, HYBE Entertainment에서 캐스팅 제안을 드립니다. 함께 하실까요?',
    date: '2024.08.22',
    contactPerson: '김매니저',
    contactEmail: 'casting@starship.com',
    contactPhone: '010-5555-5555',
    daysUntilDeadline: calculateDaysUntilDeadline('2024.09.07'),
    isRead: false,
  ),
  Casting(
    trainee: trainees[0],
    company:
        sampleCompanies.firstWhere((c) => c.company == 'Pledis Entertainment'),
    message: '안녕하세요, Pledis Entertainment에서 오디션에 참여하시길 제안드립니다.',
    date: '2024.08.21',
    contactPerson: '박캐스팅',
    contactEmail: 'casting@pledis.com',
    contactPhone: '010-6666-6666',
    daysUntilDeadline: calculateDaysUntilDeadline('2024.09.10'),
    isRead: true,
  ),
];
