class Company {
  String company;
  String description;
  bool isRecruiting;
  int daysLeft;
  String industry;
  String location;
  String detailedDescription;
  List<String> requirements;
  List<Audition> currentAuditions;
  Map<String, String> requirementDetails;
  String imagePath;
  String logoPath;
  bool isFavorite;
  String website;

  Company({
    this.company = 'JYP Entertainment',
    this.description = '차세대 스타를 찾고 있습니다.\n지금 그 주인공이 되어보세요.',
    this.isRecruiting = true,
    this.daysLeft = 1,
    this.industry = '엔터테인먼트',
    this.location = '서울 강동구',
    this.detailedDescription =
        'JYP엔터테인먼트는 K-POP을 선도하는 글로벌 엔터테인먼트 기업입니다. 우리는 음악, 공연, 영상 등 다양한 분야에서 혁신적인 콘텐츠를 제작하고 있습니다.',
    this.requirements = const ['댄스', '보컬', '랩', '작곡'],
    List<Audition>? currentAuditions,
    Map<String, String>? requirementDetails,
    this.imagePath = 'assets/images/details/jyp_entertainment.png',
    this.logoPath = 'assets/images/logos/jyp_logo.png',
    this.isFavorite = false,
    this.website = 'https://www.jype.com',
  })  : currentAuditions = currentAuditions ?? [],
        requirementDetails = requirementDetails ??
            {
              '댄스': '다양한 장르의 댄스를 소화할 수 있는 능력을 요구합니다.',
              '보컬': '넓은 음역대와 풍부한 감정을 전달할 수 있는 보컬 역량을 중시합니다.',
              '랩': '정확한 발음과 창의적인 가사 작성 능력이 필요합니다.',
              '작곡': '멜로디와 리듬을 창작할 수 있는 작곡 능력을 기대합니다.',
            };

  bool get favorite => isFavorite;

  void updateInfo({
    String? company,
    String? description,
    String? industry,
    String? location,
    String? detailedDescription,
    String? website,
    String? imagePath,
    String? logoPath,
    bool? isRecruiting,
    int? daysLeft,
    List<String>? requirements,
    Map<String, String>? requirementDetails,
  }) {
    this.company = company ?? this.company;
    this.description = description ?? this.description;
    this.industry = industry ?? this.industry;
    this.location = location ?? this.location;
    this.detailedDescription = detailedDescription ?? this.detailedDescription;
    this.website = website ?? this.website;
    this.imagePath = imagePath ?? this.imagePath;
    this.logoPath = logoPath ?? this.logoPath;
    this.isRecruiting = isRecruiting ?? this.isRecruiting;
    this.daysLeft = daysLeft ?? this.daysLeft;
    this.requirements = requirements ?? this.requirements;
    this.requirementDetails = requirementDetails ?? this.requirementDetails;
  }
}

class Audition {
  final String title;
  final String deadline;
  final Company company;
  bool isFavorite;

  Audition({
    required this.title,
    required this.deadline,
    required this.company,
    this.isFavorite = false,
  });
}

List<Company> sampleCompanies = [
  Company(
    company: 'JYP Entertainment',
    description: '차세대 스타를 찾고 있습니다.\n지금 그 주인공이 되어보세요.',
    isRecruiting: true,
    daysLeft: 1,
    industry: '엔터테인먼트',
    location: '서울 강동구',
    detailedDescription:
        'JYP엔터테인먼트는 K-POP을 선도하는 글로벌 엔터테인먼트 기업입니다. 우리는 음악, 공연, 영상 등 다양한 분야에서 혁신적인 콘텐츠를 제작하고 있습니다.',
    requirements: ['댄스', '보컬', '랩', '작곡'],
    currentAuditions: [],
    requirementDetails: {
      '댄스': '다양한 장르의 댄스를 소화할 수 있는 능력을 요구합니다.',
      '보컬': '넓은 음역대와 풍부한 감정을 전달할 수 있는 보컬 역량을 중시합니다.',
      '랩': '정확한 발음과 창의적인 가사 작성 능력이 필요합니다.',
      '작곡': '멜로디와 리듬을 창작할 수 있는 작곡 능력을 기대합니다.',
    },
    imagePath: 'assets/images/details/jyp_entertainment.png',
    logoPath: 'assets/images/logos/jyp_logo.png',
    website: 'https://www.jype.com',
  ),
  Company(
    company: 'SM Entertainment',
    description: '글로벌 스타의 꿈을 실현하세요.',
    isRecruiting: true,
    daysLeft: 5,
    industry: '엔터테인먼트',
    location: '서울 강남구',
    detailedDescription:
        'SM엔터테인먼트는 한국을 대표하는 종합 엔터테인먼트 기업입니다. 우리는 음악 제작부터 아티스트 매니지먼트, 콘서트 기획까지 다양한 사업을 영위하고 있습니다.',
    requirements: ['보컬', '댄스', '외국어 능력'],
    currentAuditions: [],
    requirementDetails: {
      '보컬': '강력한 발성과 고유의 음색을 가진 보컬리스트를 선호합니다.',
      '댄스': '독창적이고 에너지 넘치는 퍼포먼스를 보여줄 수 있어야 합니다.',
      '외국어 능력': '글로벌 활동을 위한 영어, 중국어 등의 외국어 능력이 중요합니다.',
    },
    imagePath: 'assets/images/details/sm_entertainment.png',
    logoPath: 'assets/images/logos/sm_logo.png',
    website: 'https://www.smentertainment.com',
  ),
  Company(
    company: 'YG Entertainment',
    description: '새로운 도전을 기다리고 있습니다.',
    isRecruiting: true,
    daysLeft: 10,
    industry: '엔터테인먼트',
    location: '서울 마포구',
    detailedDescription: 'YG엔터테인먼트는 혁신적인 음악과 스타일을 선도하는 엔터테인먼트 기업입니다.',
    requirements: ['작사', '프로듀싱'],
    currentAuditions: [],
    requirementDetails: {
      '작사': '창의적인 가사 작성 능력을 중시합니다.',
      '프로듀싱': '독창적인 음악을 제작할 수 있는 프로듀싱 역량을 기대합니다.',
    },
    imagePath: 'assets/images/details/yg_entertainment.png',
    logoPath: 'assets/images/logos/yg_logo.png',
    website: 'https://www.ygfamily.com',
  ),
  Company(
    company: 'HYBE Entertainment',
    description: '글로벌 무대에 도전하세요.',
    isRecruiting: true,
    daysLeft: 14,
    industry: '엔터테인먼트',
    location: '서울 용산구',
    detailedDescription: 'HYBE 엔터테인먼트는 글로벌 시장을 타겟으로 하는 차세대 아티스트를 발굴합니다.',
    requirements: ['보컬', '댄스', '랩'],
    currentAuditions: [],
    requirementDetails: {
      '보컬': '풍부한 감성과 파워풀한 보컬을 중시합니다.',
      '댄스': '에너지 넘치는 퍼포먼스가 필요합니다.',
      '랩': '정확한 발음과 리드미컬한 랩 능력이 중요합니다.',
    },
    imagePath: 'assets/images/details/hybe_entertainment.png',
    logoPath: 'assets/images/logos/hybe_logo.png',
    website: 'https://www.hybecorp.com',
  ),
  Company(
    company: 'FNC Entertainment',
    description: '함께 성장할 인재를 찾고 있습니다.',
    isRecruiting: false,
    daysLeft: 0,
    industry: '엔터테인먼트',
    location: '서울 강남구',
    detailedDescription: 'FNC엔터테인먼트는 밴드와 연기자 매니지먼트에 강점을 가진 종합 엔터테인먼트 기업입니다.',
    requirements: ['연기', '보컬', '기타 연주'],
    currentAuditions: [],
    requirementDetails: {
      '연기': '감정 전달력이 뛰어난 연기자를 찾고 있습니다.',
      '보컬': '풍부한 감성을 가진 보컬리스트를 선호합니다.',
      '기타 연주': '세련된 기타 연주 능력이 필요합니다.',
    },
    imagePath: 'assets/images/details/fnc_entertainment.png',
    logoPath: 'assets/images/logos/fnc_logo.png',
    website: 'https://www.fncent.com',
  ),
  Company(
    company: 'Pledis Entertainment',
    description: '미래를 함께 할 아티스트를 모집합니다.',
    isRecruiting: false,
    daysLeft: 0,
    industry: '엔터테인먼트',
    location: '서울 강남구',
    detailedDescription: 'Pledis 엔터테인먼트는 아티스트의 성장과 함께하는 글로벌 엔터테인먼트 기업입니다.',
    requirements: ['보컬', '댄스'],
    currentAuditions: [],
    requirementDetails: {
      '보컬': '기본기가 탄탄한 보컬리스트를 선호합니다.',
      '댄스': '무대에서 자신감을 발휘할 수 있는 댄스 실력을 중시합니다.',
    },
    imagePath: 'assets/images/details/pledis_entertainment.png',
    logoPath: 'assets/images/logos/pledis_logo.png',
    website: 'https://www.pledis.co.kr',
  ),
];

void initializeAuditions() {
  sampleCompanies[0].currentAuditions.addAll([
    Audition(
        title: '24년 상반기 오디션 (여자)',
        deadline: '24.08.20',
        company: sampleCompanies[0]),
    Audition(
        title: '24년 상반기 오디션 (남자)',
        deadline: '24.08.20',
        company: sampleCompanies[0]),
  ]);

  sampleCompanies[1].currentAuditions.add(
        Audition(
            title: '24년 하반기 오디션 (여자)',
            deadline: '24.12.20',
            company: sampleCompanies[1]),
      );

  sampleCompanies[2].currentAuditions.add(
        Audition(
            title: '24년 프로듀서 오디션',
            deadline: '24.09.10',
            company: sampleCompanies[2]),
      );

  sampleCompanies[3].currentAuditions.add(
        Audition(
            title: '24년 글로벌 오디션',
            deadline: '24.09.15',
            company: sampleCompanies[3]),
      );
}

void initializeCompanyData() {
  initializeAuditions();
}
