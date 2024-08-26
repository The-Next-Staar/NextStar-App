import 'trainee.dart';
import 'company.dart';

enum CastingStatus { pending, approved, rejected }

class Casting {
  final Trainee trainee;
  final Company company;
  final String message;
  final String date;
  final String deadline;
  final String contactPerson;
  final String contactEmail;
  final String contactPhone;
  CastingStatus status;

  Casting({
    required this.trainee,
    required this.company,
    required this.message,
    required this.date,
    required this.deadline,
    required this.contactPerson,
    required this.contactEmail,
    required this.contactPhone,
    this.status = CastingStatus.pending,
  });

  void approve() {
    status = CastingStatus.approved;
  }

  void reject() {
    status = CastingStatus.rejected;
  }
}

List<Casting> sampleCastings = [
  Casting(
    trainee: trainees[0],
    company:
        sampleCompanies.firstWhere((c) => c.company == 'JYP Entertainment'),
    message: '안녕하세요, JYP 캐스팅 담당자입니다. 저희 기업의 이미지와 잘 어울려 제안 보냅니다.',
    date: '2024.08.18',
    deadline: '2024.08.25',
    contactPerson: '김캐스팅',
    contactEmail: 'casting1@jyp.com',
    contactPhone: '010-0000-0000',
  ),
  Casting(
    trainee: trainees[1],
    company: sampleCompanies.firstWhere((c) => c.company == 'SM Entertainment'),
    message: '안녕하세요! SM 캐스팅 센터입니다. 당신의 재능에 관심이 있습니다.',
    date: '2024.08.18',
    deadline: '2024.09.01',
    contactPerson: '이매니저',
    contactEmail: 'casting@sm.com',
    contactPhone: '010-1111-1111',
  ),
  Casting(
    trainee: trainees[2],
    company: sampleCompanies.firstWhere((c) => c.company == 'YG Entertainment'),
    message: '안녕하세요, YG 캐스팅 센터입니다. 오디션에 참여해 보시겠어요?',
    date: '2024.08.15',
    deadline: '2024.08.30',
    contactPerson: '박디렉터',
    contactEmail: 'casting@yg.com',
    contactPhone: '010-2222-2222',
    status: CastingStatus.rejected,
  ),
];
