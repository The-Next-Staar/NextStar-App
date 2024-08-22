class Company {
  final String name;
  final String description;
  final bool isRecruiting;
  final int daysLeft;
  final String industry;
  final String location;
  final String detailedDescription;
  final List<String> requirements;
  final List<Audition> currentAuditions;

  Company({
    required this.name,
    required this.description,
    required this.isRecruiting,
    required this.daysLeft,
    required this.industry,
    required this.location,
    required this.detailedDescription,
    required this.requirements,
    required this.currentAuditions,
  });
}

class Audition {
  final String title;
  final String deadline;

  Audition({required this.title, required this.deadline});
}

final List<Company> sampleCompanies = [
  Company(
    name: 'JYP Entertainment',
    description: '차세대 스타를 찾고 있습니다.\n지금 그 주인공이 되어보세요.',
    isRecruiting: true,
    daysLeft: 7,
    industry: '엔터테인먼트',
    location: '서울 강동구',
    detailedDescription:
        'JYP엔터테인먼트는 K-POP을 선도하는 글로벌 엔터테인먼트 기업입니다. 우리는 음악, 공연, 영상 등 다양한 분야에서 혁신적인 콘텐츠를 제작하고 있습니다.',
    requirements: ['댄스', '보컬', '랩', '작곡'],
    currentAuditions: [
      Audition(title: '24년 상반기 오디션 (여자)', deadline: '24.08.20'),
      Audition(title: '24년 상반기 오디션 (남자)', deadline: '24.08.20'),
    ],
  ),
  Company(
    name: 'SM Entertainment',
    description: '글로벌 스타의 꿈을 실현하세요.',
    isRecruiting: false,
    daysLeft: 0,
    industry: '엔터테인먼트',
    location: '서울 강남구',
    detailedDescription:
        'SM엔터테인먼트는 한국을 대표하는 종합 엔터테인먼트 기업입니다. 우리는 음악 제작부터 아티스트 매니지먼트, 콘서트 기획까지 다양한 사업을 영위하고 있습니다.',
    requirements: ['보컬', '댄스', '외국어 능력'],
    currentAuditions: [],
  ),
];
