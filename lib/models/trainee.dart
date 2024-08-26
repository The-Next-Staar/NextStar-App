class Trainee {
  final String name;
  final int age;
  final int birthYear;
  final String imageUrl;
  final List<String> traits;
  final String gender;
  final int height;
  final int weight;
  final String specialty;
  final String experience;
  final String introduction;
  final List<String> photos;
  final List<String> videos;

  Trainee({
    required this.name,
    required this.age,
    required this.birthYear,
    required this.imageUrl,
    required this.traits,
    required this.gender,
    required this.height,
    required this.weight,
    required this.specialty,
    required this.experience,
    required this.introduction,
    required this.photos,
    required this.videos,
  });
}

List<Trainee> trainees = [
  Trainee(
    name: '김아름',
    age: 22,
    birthYear: 2001,
    imageUrl: 'assets/images/trainees/kim_areum/profile.jpg',
    traits: ['고양이 눈매', '긴 머리', '귀여운'],
    gender: '여자',
    height: 162,
    weight: 43,
    specialty: '사투리 연기',
    experience: '해당사항 없음',
    introduction:
        '안녕하세요, 저는 호주에서 온 김아름이라고 합니다. 어릴적부터 태권도를 배워 체력이 좋습니다. 제 강아지 이름 밀리와 미아이며 무척 귀엽습니다.',
    photos: [
      'assets/images/trainees/kim_areum/photo1.jpg',
      'assets/images/trainees/kim_areum/photo2.jpg',
      'assets/images/trainees/kim_areum/photo3.jpg',
      'assets/images/trainees/kim_areum/photo4.jpg',
    ],
    videos: [
      'assets/videos/trainees/kim_areum/video1.mp4',
      'assets/videos/trainees/kim_areum/video2.mp4',
    ],
  ),
  Trainee(
    name: '이준호',
    age: 24,
    birthYear: 1999,
    imageUrl: 'assets/images/trainees/lee_junho/profile.jpg',
    traits: ['강아지 상', '짧은 머리', '귀여운'],
    gender: '남자',
    height: 175,
    weight: 65,
    specialty: '노래',
    experience: '고등학교 합창단 3년',
    introduction: '안녕하세요, 저는 노래를 사랑하는 이준호입니다. 언제나 밝고 긍정적인 에너지를 가지고 있습니다.',
    photos: [
      'assets/images/trainees/lee_junho/photo1.jpg',
      'assets/images/trainees/lee_junho/photo2.jpg',
      'assets/images/trainees/lee_junho/photo3.jpg',
    ],
    videos: [
      'assets/videos/trainees/lee_junho/video1.mp4',
      'assets/videos/trainees/lee_junho/video2.mp4',
    ],
  ),
  Trainee(
    name: '박서연',
    age: 20,
    birthYear: 2003,
    imageUrl: 'assets/images/trainees/park_seoyeon/profile.jpg',
    traits: ['고양이 눈매', '단발 머리', '시크한'],
    gender: '여자',
    height: 160,
    weight: 48,
    specialty: '댄스',
    experience: '지역 댄스 대회 1등',
    introduction: '안녕하세요, 저는 춤을 좋아하는 박서연입니다. 제 자신을 무대에서 표현하는 것이 가장 즐겁습니다.',
    photos: [
      'assets/images/trainees/park_seoyeon/photo1.jpg',
      'assets/images/trainees/park_seoyeon/photo2.jpg',
    ],
    videos: [
      'assets/videos/trainees/park_seoyeon/video1.mp4',
      'assets/videos/trainees/park_seoyeon/video2.mp4',
    ],
  ),
  Trainee(
    name: '정민수',
    age: 23,
    birthYear: 2000,
    imageUrl: 'assets/images/trainees/jung_minsoo/profile.jpg',
    traits: ['강아지 상', '곱슬 머리', '친근한'],
    gender: '남자',
    height: 178,
    weight: 70,
    specialty: '기타 연주',
    experience: '밴드 활동 2년',
    introduction: '안녕하세요, 기타를 치며 노래하는 것을 좋아하는 정민수입니다. 사람들과 소통하는 것을 좋아합니다.',
    photos: [
      'assets/images/trainees/jung_minsoo/photo1.jpg',
      'assets/images/trainees/jung_minsoo/photo2.jpg',
    ],
    videos: [
      'assets/videos/trainees/jung_minsoo/video1.mp4',
      'assets/videos/trainees/jung_minsoo/video2.mp4',
    ],
  ),
  Trainee(
    name: '최유나',
    age: 21,
    birthYear: 2002,
    imageUrl: 'assets/images/trainees/choi_yuna/profile.jpg',
    traits: ['고양이 눈매', '긴 머리', '차분한'],
    gender: '여자',
    height: 165,
    weight: 50,
    specialty: '피아노',
    experience: '피아노 학원 10년',
    introduction: '안녕하세요, 음악을 통해 감정을 표현하는 최유나입니다. 클래식 음악을 좋아합니다.',
    photos: [
      'assets/images/trainees/choi_yuna/photo1.jpg',
      'assets/images/trainees/choi_yuna/photo2.jpg',
    ],
    videos: [
      'assets/videos/trainees/choi_yuna/video1.mp4',
      'assets/videos/trainees/choi_yuna/video2.mp4',
    ],
  ),
  Trainee(
    name: '강태현',
    age: 25,
    birthYear: 1998,
    imageUrl: 'assets/images/trainees/kang_taehyun/profile.jpg',
    traits: ['강아지 상', '짧은 머리', '활발한'],
    gender: '남자',
    height: 180,
    weight: 75,
    specialty: '연기',
    experience: '단편 영화 3편 출연',
    introduction: '안녕하세요, 사람들을 즐겁게 하는 것이 인생의 목표인 강태현입니다. 언제나 최선을 다해 연기합니다.',
    photos: [
      'assets/images/trainees/kang_taehyun/photo1.jpg',
      'assets/images/trainees/kang_taehyun/photo2.jpg',
    ],
    videos: [
      'assets/videos/trainees/kang_taehyun/video1.mp4',
      'assets/videos/trainees/kang_taehyun/video2.mp4',
    ],
  ),
];
