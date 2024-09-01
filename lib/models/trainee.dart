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
    traits: [
      '아름다운 얼굴',
      '미소',
      'V자형 얼굴',
      '뾰족한 턱',
      '높은 콧대',
      '고양이 눈매, 도톰한 입술',
      '아몬드형 눈, 도톰한 입술',
      '맑고 창백한 피부',
      '도톰한 입술',
      '귀여운 작은 코',
      '긴 검은 머리',
      '옆으로 넘긴 머리',
      '섬세한 흰색 목걸이',
      '신선한 분위기',
      '젊은 분위기',
      '우아한 분위기',
      '차분한 이미지',
      '고양이 눈매',
      '귀여운'
    ],
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
    traits: [
      '뾰족한 머리',
      '두드러진 얼굴 특징',
      '뚜렷한 코',
      '약간 뾰족한 턱',
      '엣지 있는 분위기',
      '아몬드형 눈, 도톰한 입술',
      '균형 잡힌 얼굴 구조',
      '평균적인 피부 질감',
      '얇고 잘 정의된 입술',
      '젊음',
      '자신감',
      'KPOP 아이돌 연습생 후보',
      '깔끔한 스타일',
      '강한 인상',
      '확신에 찬 태도'
    ],
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
    traits: [
      '흐릿한 눈',
      '쌍꺼풀',
      '넓은 얼굴 부위',
      '뾰족한 턱',
      '도톰한 아래입술',
      '꽉 찬 윗입술',
      '작은 눈',
      '짧은 눈',
      '아몬드형 눈, 도톰한 입술',
      '긴 코',
      '고양이 눈매, 도톰한 입술',
      '넓은 콧구멍',
      '둥근 코끝',
      '어두운 피부',
      '넓은 이마',
      '불명확한 특징',
      '작은 동공',
      '단발 머리',
      '시크한',
      '도전적인',
      '강한 인상',
      '자신감 넘치는 태도'
    ],
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
    traits: [
      '또렷한 눈',
      '부드러운 쌍꺼풀',
      '잘 정의된 얼굴형',
      '자연스러운 측면 광대뼈',
      '뚜렷한 앞 광대뼈',
      '매끄러운 피부',
      '얇은 윗입술',
      '균형 잡힌 아랫입술',
      '날렵한 턱',
      '명확한 턱선',
      '고른 이마',
      '매끄러운 후면 광대뼈',
      '뚜렷한 얼굴 특징',
      '세밀한 얼굴 세부 사항',
      '부드러운 얼굴 질감',
      '젊고 생기 있는 얼굴 표정',
      '상쾌하고 자신감 넘치는 분위기',
      '활기찬 이미지',
      '정돈된 외모',
      '선한 인상'
    ],
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
    traits: [
      '아름다운 얼굴',
      '미소',
      '고양이 눈매, 도톰한 입술',
      '뚜렷한 코',
      '뚜렷한 눈',
      '위를 바라보는 눈',
      '피어싱된 귀',
      '목걸이',
      '잘 차려입은 모습',
      '자신감',
      '우아한 분위기',
      '긴 머리',
      '차분한',
      '세련된 스타일',
      '맑고 깨끗한 피부',
      '섬세한 분위기'
    ],
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
    traits: [
      '또렷한 눈',
      '자연스러운 쌍꺼풀',
      '타원형 얼굴형',
      '부드러운 측면 광대뼈',
      '고양이 눈매, 도톰한 입술',
      '뚜렷한 앞 광대뼈',
      '매끄러운 피부',
      '균형 잡힌 윗입술',
      '도톰한 아랫입술',
      '둥근 턱',
      '부드러운 턱선',
      '자연스러운 이마',
      '매끄러운 후면 광대뼈',
      '뚜렷한 얼굴 특징',
      '세밀한 얼굴 세부 사항',
      '부드러운 얼굴 질감',
      '밝고 상냥한 얼굴 표정',
      '따뜻하고 친근한 분위기',
      '귀여운 인상',
      '친근감 넘치는 이미지',
      '활발한 성격'
    ],
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
    traits: [
      '선명한 눈',
      '아몬드형 눈, 도톰한 입술',
      '균형 잡힌 쌍꺼풀',
      '좁지 않은 얼굴형',
      '발달된 측면 광대뼈',
      '발달된 앞 광대뼈',
      '매끄러운 상부 광대뼈',
      '발달된 하부 광대뼈',
      '균형 잡힌 윗입술',
      '도톰한 아랫입술',
      '균형 잡힌 턱',
      '명확한 턱선',
      '부드러운 이마',
      '매끄러운 후면 광대뼈',
      '뚜렷한 얼굴 특징',
      '세밀한 얼굴 세부 사항',
      '부드러운 얼굴 질감',
      '밝고 우아한 얼굴 표정',
      '신선하고 젊은 분위기',
      '친근한 이미지',
      '자연스러운 미소'
    ],
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
    traits: [
      '또렷한 눈',
      '자연스러운 쌍꺼풀',
      'V자형 얼굴',
      '고양이 눈매, 도톰한 입술',
      '뚜렷한 측면 광대뼈',
      '부드러운 앞 광대뼈',
      '매끄러운 피부',
      '도톰한 윗입술',
      '균형 잡힌 아랫입술',
      '뾰족한 턱',
      '명확한 턱선',
      '고운 이마',
      '매끄러운 후면 광대뼈',
      '뚜렷한 얼굴 특징',
      '세련된 얼굴 세부 사항',
      '부드러운 얼굴 질감',
      '자신감 있고 우아한 얼굴 표정',
      '신선하고 현대적인 분위기',
      '지적인 이미지',
      '고양이 눈매',
      '우아한 미소'
    ],
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
    traits: [
      '부드러운 눈',
      '균형 잡힌 쌍꺼풀',
      '넓지 않은 얼굴형',
      '뚜렷한 측면 광대뼈',
      '자연스러운 앞 광대뼈',
      '부드러운 피부',
      '얇은 윗입술',
      '균형 잡힌 아랫입술',
      '둥근 턱',
      '부드러운 턱선',
      '고른 이마',
      '매끄러운 후면 광대뼈',
      '뚜렷한 얼굴 특징',
      '세밀한 얼굴 세부 사항',
      '부드러운 얼굴 질감',
      '따뜻하고 친근한 얼굴 표정',
      '편안하고 친근한 분위기',
      '정돈된 외모',
      '우호적인 이미지',
      '남성적 매력'
    ],
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
    traits: [
      '선명한 눈',
      '균형 잡힌 쌍꺼풀',
      '각진 얼굴형',
      '발달된 측면 광대뼈',
      '뚜렷한 앞 광대뼈',
      '매끄러운 상부 광대뼈',
      '발달된 하부 광대뼈',
      '균형 잡힌 윗입술',
      '도톰한 아랫입술',
      '각진 턱',
      '명확한 턱선',
      '부드러운 이마',
      '매끄러운 후면 광대뼈',
      '뚜렷한 얼굴 특징',
      '세밀한 얼굴 세부 사항',
      '부드러운 얼굴 질감',
      '차분하고 자신감 있는 얼굴 표정',
      '신뢰감 있는 분위기',
      '남성적 이미지',
      '강한 존재감'
    ],
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
    traits: [
      '활짝 웃는 눈',
      '눈에 띄는 쌍꺼풀',
      '적당한 얼굴형',
      '뚜렷한 측면 광대뼈',
      '부드러운 앞 광대뼈',
      '매끄러운 피부',
      '얇은 윗입술',
      '도톰한 아랫입술',
      '둥근 턱',
      '부드러운 턱선',
      '고른 이마',
      '매끄러운 후면 광대뼈',
      '깊은 보조개',
      '뚜렷한 얼굴 특징',
      '세밀한 얼굴 세부 사항',
      '부드러운 얼굴 질감',
      '밝고 행복한 얼굴 표정',
      '긍정적이고 에너지 넘치는 분위기',
      '활발한 이미지',
      '웃음이 많은 성격',
      '친근한 미소'
    ],
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
  Trainee(
    name: 'Sara',
    age: 23,
    birthYear: 2003,
    imageUrl: 'assets/images/trainees/sara/profile.png',
    traits: [
      '놀란 표정',
      '호기심 있는 표정',
      '옆으로 넘긴 짙은 머리',
      '아몬드형 눈, 도톰한 입술',
      '바깥쪽 주름',
      '곧은 코',
      '약간 올라간 코',
      '얇은 입술',
      '살짝 도톰한 입술',
      '윗입술 위 작은 점',
      '매끄러운 피부',
      '깨끗한 피부',
      '신선한 분위기',
      '젊은 분위기',
      '신비로움',
      '호기심을 자아내는 눈빛',
      '섬세한 외모'
    ],
    gender: '남자',
    height: 185,
    weight: 85,
    specialty: '연기',
    experience: '연극배우 2년',
    introduction: '연기를 좋아하는 sara입니다. 연기를 통해 여러분에게 감동을 전달하고 싶습니다.',
    photos: [
      'assets/images/trainees/sara/photo1.png',
    ],
    videos: [
      'assets/videos/trainees/sara/video1.mp4',
      'assets/videos/trainees/sara/video2.mp4',
    ],
  ),
  Trainee(
    name: 'Chun hui',
    age: 23,
    birthYear: 2003,
    imageUrl: 'assets/images/trainees/chunhui/profile.png',
    traits: [
      '흐릿한 눈',
      '쌍꺼풀',
      '넓은 얼굴 부위',
      '발달된 측면 광대뼈',
      '발달된 앞 광대뼈',
      '발달된 상부 광대뼈',
      '발달된 하부 광대뼈',
      '발달된 윗입술',
      '발달된 아랫입술',
      '발달된 턱',
      '발달된 턱선',
      '발달된 이마',
      '발달된 후면 광대뼈',
      '얼굴 특징 없음',
      '얼굴 세부 사항 없음',
      '얼굴 질감 없음',
      '얼굴 표정 없음',
      '얼굴 분위기 없음',
      '평범한 외모'
    ],
    gender: '남자',
    height: 185,
    weight: 85,
    specialty: '작곡',
    experience: '음악학원 5년',
    introduction: '작곡을 좋아하는 아이돌 지망생 천휘입니다. 대만에서 왔습니다.',
    photos: [
      'assets/images/trainees/chunhui/photo1.png',
    ],
    videos: [
      'assets/videos/trainees/sara/video1.mp4',
      'assets/videos/trainees/sara/video2.mp4',
    ],
  ),
];
