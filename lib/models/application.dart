class Application {
  final String companyName;
  final String audititionName;
  final String recruitmentPeriod;
  final String name;
  final String gender;
  final String birthDate;
  final String height;
  final String weight;
  final String education;
  final String address;
  final String phone;
  final String email;
  bool isViewed;

  Application({
    required this.companyName,
    required this.audititionName,
    required this.recruitmentPeriod,
    required this.name,
    required this.gender,
    required this.birthDate,
    required this.height,
    required this.weight,
    required this.education,
    required this.address,
    required this.phone,
    required this.email,
    required this.isViewed,
  });
}

Application emptyApplication = Application(
  companyName: '',
  audititionName: '',
  recruitmentPeriod: '',
  name: '',
  gender: '',
  birthDate: '',
  height: '',
  weight: '',
  education: '',
  address: '',
  phone: '',
  email: '',
  isViewed: false,
);

List<Application> applications = [
  Application(
    companyName: 'JYP Entertainment',
    audititionName: '24년 상반기 오디션 (여자)',
    recruitmentPeriod: '24.08.20',
    name: '팜하니',
    gender: '여자',
    birthDate: '2006/07/02',
    height: '163cm',
    weight: '43kg',
    education: '중학교 졸업',
    address: '서울 용산구 한강대로 42',
    phone: '010-0000-0000',
    email: 'hanni72@gmail.com',
    isViewed: false,
  ),
  Application(
    companyName: 'SM Entertainment',
    audititionName: '24년 상반기 오디션 (남자)',
    recruitmentPeriod: '24.08.25',
    name: '김민수',
    gender: '남자',
    birthDate: '2005/09/15',
    height: '178cm',
    weight: '68kg',
    education: '고등학교 졸업',
    address: '서울 강남구 테헤란로 84',
    phone: '010-1111-1111',
    email: 'minsu05@gmail.com',
    isViewed: true,
  ),
  Application(
    companyName: 'YG Entertainment',
    audititionName: '24년 하반기 오디션 (여자)',
    recruitmentPeriod: '24.11.01',
    name: '최지은',
    gender: '여자',
    birthDate: '2008/02/12',
    height: '160cm',
    weight: '50kg',
    education: '고등학교 재학 중',
    address: '서울 마포구 연남동 23',
    phone: '010-2222-2222',
    email: 'jieun08@gmail.com',
    isViewed: false,
  ),
  Application(
    companyName: 'BigHit Entertainment',
    audititionName: '24년 하반기 오디션 (남자)',
    recruitmentPeriod: '24.12.15',
    name: '박준영',
    gender: '남자',
    birthDate: '2004/11/22',
    height: '182cm',
    weight: '74kg',
    education: '대학교 재학 중',
    address: '서울 서대문구 신촌로 15',
    phone: '010-3333-3333',
    email: 'junyoung04@gmail.com',
    isViewed: true,
  ),
  Application(
    companyName: 'JYP Entertainment',
    audititionName: '24년 상반기 오디션 (여자)',
    recruitmentPeriod: '24.08.20',
    name: '이수진',
    gender: '여자',
    birthDate: '2007/03/10',
    height: '165cm',
    weight: '47kg',
    education: '고등학교 재학 중',
    address: '서울 송파구 잠실로 8',
    phone: '010-4444-4444',
    email: 'soojin07@gmail.com',
    isViewed: false,
  ),
];
