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
    imageUrl: 'assets/images/trainees/kim_areum/profile.png',
    traits: ['고양이 눈매', '긴 머리', '귀여운'],
    gender: '여자',
    height: 162,
    weight: 43,
    specialty: '사투리 연기',
    experience: '해당사항 없음',
    introduction:
        '안녕하세요, 저는 호주에서 온 김아름이라고 합니다. 어릴적부터 태권도를 배워 체력이 좋습니다. 제 강아지 이름 밀리와 미아이며 무척 귀엽습니다.',
    photos: [
      'assets/images/trainees/kim_areum/photo1.png',
      'assets/images/trainees/kim_areum/photo2.png',
      'assets/images/trainees/kim_areum/photo3.png',
      'assets/images/trainees/kim_areum/photo4.png',
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
    imageUrl: 'assets/images/trainees/lee_junho/profile.png',
    traits: ['강아지 상', '짧은 머리', '귀여운'],
    gender: '남자',
    height: 175,
    weight: 65,
    specialty: '노래',
    experience: '고등학교 합창단 3년',
    introduction: '안녕하세요, 저는 노래를 사랑하는 이준호입니다. 언제나 밝고 긍정적인 에너지를 가지고 있습니다.',
    photos: [
      'assets/images/trainees/lee_junho/photo1.png',
      'assets/images/trainees/lee_junho/photo2.png',
      'assets/images/trainees/lee_junho/photo3.png',
    ],
    videos: [
      'assets/videos/trainees/lee_junho/video1.mp4',
      'assets/videos/trainees/lee_junho/video2.mp4',
    ],
  ),
  Trainee(
    name: 'Jessica',
    age: 20,
    birthYear: 2003,
    imageUrl: 'assets/images/trainees/jessica/profile.png',
    traits: ['고양이 눈매', '단발 머리', '시크한'],
    gender: '여자',
    height: 160,
    weight: 48,
    specialty: '댄스',
    experience: '지역 댄스 대회 1등',
    introduction: '안녕하세요, 저는 춤을 좋아하는 Jessica입니다. 제 자신을 무대에서 표현하는 것이 가장 즐겁습니다.',
    photos: [
      'assets/images/trainees/jessica/photo1.png',
      'assets/images/trainees/jessica/photo2.png',
    ],
    videos: [
      'assets/videos/trainees/jessica/video1.mp4',
      'assets/videos/trainees/jessica/video2.mp4',
    ],
  ),
  Trainee(
    name: '정민수',
    age: 23,
    birthYear: 2000,
    imageUrl: 'assets/images/trainees/jung_minsoo/profile.png',
    traits: ['강아지 상', '곱슬 머리', '친근한'],
    gender: '남자',
    height: 178,
    weight: 70,
    specialty: '기타 연주',
    experience: '밴드 활동 2년',
    introduction: '안녕하세요, 기타를 치며 노래하는 것을 좋아하는 정민수입니다. 사람들과 소통하는 것을 좋아합니다.',
    photos: [
      'assets/images/trainees/jung_minsoo/photo1.png',
      'assets/images/trainees/jung_minsoo/photo2.png',
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
    imageUrl: 'assets/images/trainees/choi_yuna/profile.png',
    traits: ['고양이 눈매', '긴 머리', '차분한'],
    gender: '여자',
    height: 165,
    weight: 50,
    specialty: '피아노',
    experience: '피아노 학원 10년',
    introduction: '안녕하세요, 음악을 통해 감정을 표현하는 최유나입니다. 클래식 음악을 좋아합니다.',
    photos: [
      'assets/images/trainees/choi_yuna/photo1.png',
      'assets/images/trainees/choi_yuna/photo2.png',
    ],
    videos: [
      'assets/videos/trainees/choi_yuna/video1.mp4',
      'assets/videos/trainees/choi_yuna/video2.mp4',
    ],
  ),
  Trainee(
    name: 'Hanni Pahm',
    age: 25,
    birthYear: 1998,
    imageUrl: 'assets/images/trainees/hanni_pahm/profile.png',
    traits: ['강아지 상', '짧은 머리', '활발한'],
    gender: '여자',
    height: 172,
    weight: 46,
    specialty: '댄스, 노래',
    experience: '모 기업 연습생 7년',
    introduction: '안녕하세요, 댄스와 노래를 좋아하는 Hanni Pahm입니다. 언제나 긍정적인 에너지를 가지고 있습니다.',
    photos: [
      'assets/images/trainees/hanni_pahm/photo1.png',
      'assets/images/trainees/hanni_pahm/photo2.png',
      'assets/images/trainees/hanni_pahm/photo3.png',
    ],
    videos: [
      'assets/videos/trainees/sara/video1.mp4',
      'assets/videos/trainees/sara/video2.mp4',
    ],
  ),
  Trainee(
    name: '이채영',
    age: 18,
    birthYear: 2007,
    imageUrl: 'assets/images/trainees/chaeyoung/profile.png',
    traits: ['강아지 상', '짧은 머리', '활발한'],
    gender: '여자',
    height: 165,
    weight: 49,
    specialty: '랩',
    experience: '쇼미더머니 출연 (예선 합격, 본선 2차 탈락)',
    introduction: '힙합을 사랑하는 이채영입니다. 랩을 통해 제 이야기를 전달하고 싶습니다.',
    photos: [
      'assets/images/trainees/chaeyoung/photo1.png',
      'assets/images/trainees/chaeyoung/photo2.png',
    ],
    videos: [
      'assets/videos/trainees/sara/video1.mp4',
      'assets/videos/trainees/sara/video2.mp4',
    ],
  ),
  Trainee(
    name: '김현지',
    age: 20,
    birthYear: 2005,
    imageUrl: 'assets/images/trainees/hyunji/profile.png',
    traits: ['강아지 상', '짧은 머리', '활발한'],
    gender: '여자',
    height: 162,
    weight: 42,
    specialty: '댄스',
    experience: '학교 댄스 동아리 3년',
    introduction: '안녕하세요, 댄스를 좋아하는 김현지입니다. 무대 위에서 빛나는 모습을 보여드리고 싶습니다.',
    photos: [
      'assets/images/trainees/hyunji/photo1.png',
      'assets/images/trainees/hyunji/photo2.png',
    ],
    videos: [
      'assets/videos/trainees/sara/video1.mp4',
      'assets/videos/trainees/sara/video2.mp4',
    ],
  ),
  Trainee(
    name: '남지성',
    age: 19,
    birthYear: 2006,
    imageUrl: 'assets/images/trainees/jisung/profile.png',
    traits: ['강아지 상', '짧은 머리', '활발한'],
    gender: '남자',
    height: 182,
    weight: 79,
    specialty: '연기, 노래',
    experience: '유튜브 단편 영화 출연',
    introduction: '저의 연기를 통해 여러분에게 감동을 전달하고 싶습니다. 노래도 잘 부릅니다.',
    photos: [
      'assets/images/trainees/jisung/photo1.png',
    ],
    videos: [
      'assets/videos/trainees/sara/video1.mp4',
      'assets/videos/trainees/sara/video2.mp4',
    ],
  ),
  Trainee(
    name: '박철중',
    age: 23,
    birthYear: 2003,
    imageUrl: 'assets/images/trainees/chul/profile.png',
    traits: ['강아지 상', '짧은 머리', '활발한'],
    gender: '남자',
    height: 185,
    weight: 85,
    specialty: '연기',
    experience: '연극배우 2년',
    introduction: '운동을 좋아하는 박철중입니다. 연기를 통해 여러분에게 감동을 전달하고 싶습니다.',
    photos: [
      'assets/images/trainees/chul/photo1.png',
    ],
    videos: [
      'assets/videos/trainees/sara/video1.mp4',
      'assets/videos/trainees/sara/video2.mp4',
    ],
  ),
  Trainee(
    name: '이정민',
    age: 17,
    birthYear: 2009,
    imageUrl: 'assets/images/trainees/jungmin/profile.png',
    traits: ['강아지 상', '짧은 머리', '활발한'],
    gender: '남자',
    height: 175,
    weight: 70,
    specialty: '댄스, 연기',
    experience: '모델 활동 1년',
    introduction: '연기에 입문한지 얼마 안되었지만, 노력하는 이정민입니다. 카메라 앞에 서는 것을 두려워하지 않습니다.',
    photos: [
      'assets/images/trainees/jungmin/photo1.png',
    ],
    videos: [
      'assets/videos/trainees/sara/video1.mp4',
      'assets/videos/trainees/sara/video2.mp4',
    ],
  ),
];
