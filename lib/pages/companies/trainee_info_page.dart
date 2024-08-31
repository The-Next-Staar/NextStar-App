import 'package:flutter/material.dart';
import '../../models/casting.dart';
import '../../models/company.dart';
import '../../models/trainee.dart';
import 'message/message.dart';

class TraineeInfoPage extends StatefulWidget {
  final Trainee trainee;

  const TraineeInfoPage({Key? key, required this.trainee}) : super(key: key);

  @override
  _TraineeInfoPageState createState() => _TraineeInfoPageState();
}

class _TraineeInfoPageState extends State<TraineeInfoPage> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildAppBar(context),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTraineeHeader(),
                  _buildTraineeImage(),
                  _buildTabBar(),
                  _buildTabContent(),
                ],
              ),
            ),
          ),
          _buildCastingButton(),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Color(0xFF171719)),
              onPressed: () => Navigator.pop(context),
            ),
            Image.asset(
              'assets/images/the_next_star_logo_line.png',
              width: 150,
              fit: BoxFit.contain,
            ),
            IconButton(
              icon: const Icon(Icons.favorite_border, color: Color(0xFF171719)),
              onPressed: () {
                // TODO: Implement favorite functionality
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTraineeHeader() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Text(
            widget.trainee.name,
            style: const TextStyle(
              color: Color(0xFF434343),
              fontSize: 20,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(width: 2),
          const Text(
            '의 프로필',
            style: TextStyle(
              color: Color(0xFF878787),
              fontSize: 20,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTraineeImage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        width: double.infinity,
        height: 333,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(widget.trainee.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFFCBCBCB)),
        ),
      ),
      child: Row(
        children: [
          _buildTabItem('기본 정보', 0),
          _buildTabItem('사진 및 영상', 1),
        ],
      ),
    );
  }

  Widget _buildTabItem(String title, int index) {
    bool isSelected = _selectedTabIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTabIndex = index;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? const Color(0xFFEF69A6) : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color:
                isSelected ? const Color(0xFFEF69A6) : const Color(0xFF878787),
            fontSize: 18,
            fontFamily: 'Pretendard',
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    if (_selectedTabIndex == 0) {
      return _buildBasicInfo();
    } else {
      return _buildPhotosAndVideos();
    }
  }

  Widget _buildBasicInfo() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoSection('정보', [
            {'label': '이름', 'value': widget.trainee.name},
            {
              'label': '나이',
              'value':
                  '만 ${widget.trainee.age}세 (${widget.trainee.birthYear}년 생)'
            },
            {'label': '신장', 'value': '${widget.trainee.height} cm'},
            {'label': '체중', 'value': '${widget.trainee.weight} Kg'},
            {'label': '특기', 'value': widget.trainee.specialty},
            {'label': '주요경력', 'value': widget.trainee.experience},
          ]),
          const SizedBox(height: 30),
          _buildInfoSection('자기소개', [
            {'value': widget.trainee.introduction},
          ]),
        ],
      ),
    );
  }

  Widget _buildInfoSection(String title, List<Map<String, String>> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF434343),
            fontSize: 18,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 15),
        ...items.map((item) => _buildInfoItem(item['label'], item['value'])),
      ],
    );
  }

  Widget _buildInfoItem(String? label, String? value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null)
            Text(
              label,
              style: const TextStyle(
                color: Color(0xFF878787),
                fontSize: 16,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w600,
              ),
            ),
          if (label != null) const SizedBox(width: 15),
          Expanded(
            child: Text(
              value ?? '',
              style: const TextStyle(
                color: Color(0xFF434343),
                fontSize: 16,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhotosAndVideos() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '사진',
            style: TextStyle(
              color: Color(0xFF434343),
              fontSize: 18,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 15),
          _buildPhotoGrid(),
          const SizedBox(height: 30),
          const Text(
            '영상',
            style: TextStyle(
              color: Color(0xFF434343),
              fontSize: 18,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 15),
          _buildVideoGrid(),
        ],
      ),
    );
  }

  Widget _buildPhotoGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: widget.trainee.photos.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            image: DecorationImage(
              image: AssetImage(widget.trainee.photos[index]),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }

  Widget _buildVideoGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: widget.trainee.videos.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.black,
          ),
          child: const Center(
            child: Icon(
              Icons.play_circle_outline,
              color: Colors.white,
              size: 50,
            ),
          ),
        );
      },
    );
  }

  Widget _buildCastingButton() {
    return Container(
      width: double.infinity,
      height: 110,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 29),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Color(0xFFD9D9D9)),
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFEF69A6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        onPressed: () {
          Casting casting = Casting(
            trainee: widget.trainee,
            company: Company(
                company: 'example', logoPath: 'assets/images/example.png'),
            message: '',
            date: DateTime.now().toString(),
            contactPerson: '',
            contactEmail: '',
            contactPhone: '',
          );

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MessagePage(casting: casting),
            ),
          );
        },
        child: const Text(
          '캐스팅하기',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
