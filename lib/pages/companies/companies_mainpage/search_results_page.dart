import 'package:flutter/material.dart';
import '../../../models/trainee.dart';
import '../trainee_info_page.dart';

class SearchResultsPage extends StatefulWidget {
  final List<String> initialSearchQueries;

  const SearchResultsPage({Key? key, required this.initialSearchQueries})
      : super(key: key);

  @override
  _SearchResultsPageState createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  List<Trainee> _searchResults = [];
  String _selectedFilter = '전체';
  late TextEditingController _searchController;
  List<String> _searchTags = [];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchTags = List.from(widget.initialSearchQueries);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _performSearch();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _performSearch() {
    setState(() {
      _searchResults = trainees.where((trainee) {
        return _searchTags.every((tag) => trainee.traits
            .any((trait) => trait.toLowerCase().contains(tag.toLowerCase())));
      }).toList();

      if (_selectedFilter != '전체') {
        _searchResults = _searchResults
            .where((trainee) => trainee.gender == _selectedFilter)
            .toList();
      }
    });
  }

  void _addSearchTag(String tag) {
    if (tag.isNotEmpty && !_searchTags.contains(tag)) {
      setState(() {
        _searchTags.add(tag);
        _searchController.clear();
      });
      _performSearch();
    }
  }

  void _removeSearchTag(String tag) {
    setState(() {
      _searchTags.remove(tag);
    });
    _performSearch();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SearchFormResults(
              searchController: _searchController,
              onSearch: () => _addSearchTag(_searchController.text),
            ),
            const SizedBox(height: 20),
            const Text(
              '프로필 리스트 보기',
              style: TextStyle(
                color: Color(0xFF434343),
                fontSize: 18,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                _buildFilterChip('전체'),
                const SizedBox(width: 10),
                _buildFilterChip('여자'),
                const SizedBox(width: 10),
                _buildFilterChip('남자'),
              ],
            ),
            const SizedBox(height: 15),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children:
                  _searchTags.map((tag) => _buildHashtagBlock(tag)).toList(),
            ),
            const SizedBox(height: 15),
            Text(
              '에 해당하는 지원자 ${_searchResults.length}명',
              style: const TextStyle(
                color: Color(0xFF434343),
                fontSize: 14,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 15),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 165 / 229,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                return _buildTraineeCard(_searchResults[index]);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    bool isSelected = _selectedFilter == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedFilter = label;
          _performSearch();
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          border: Border.all(
            color:
                isSelected ? const Color(0xFFEF69A6) : const Color(0x3870737C),
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          label,
          style: TextStyle(
            color:
                isSelected ? const Color(0xFFED72C6) : const Color(0xFF878787),
            fontSize: 14,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildHashtagBlock(String tag) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF3F8),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            tag.length > 10 ? '${tag.substring(0, 10)}...' : tag,
            style: const TextStyle(
              color: Color(0xFFA139B2),
              fontSize: 14,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () => _removeSearchTag(tag),
            child: Container(
              width: 14,
              height: 14,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(
                  Icons.close,
                  size: 10,
                  color: Color(0xFFA139B2),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTraineeCard(Trainee trainee) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TraineeInfoPage(trainee: trainee),
          ),
        );
      },
      child: Container(
        width: 165,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFD9D9D9)),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1, // This will make the image square
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFBBBBBB),
                  image: DecorationImage(
                    image: AssetImage(trainee.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    trainee.name,
                    style: const TextStyle(
                      color: Color(0xFF434343),
                      fontSize: 14,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '만 ${trainee.age}세(${trainee.birthYear}년 생)',
                    style: const TextStyle(
                      color: Color(0xFF434343),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchFormResults extends StatelessWidget {
  final TextEditingController searchController;
  final VoidCallback onSearch;

  const _SearchFormResults({
    required this.searchController,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 91,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 41,
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFFD9D9D9)),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: const InputDecoration(
                        hintText: '고양이 눈매 라고 검색해보세요!',
                        hintStyle: TextStyle(
                          color: Color(0xFFCBCBCB),
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      ),
                      onSubmitted: (_) => onSearch(),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search, color: Color(0xFFEF69A6)),
                    onPressed: onSearch,
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            left: 0,
            top: 0,
            child: Text(
              '원하는 지원자 이미지 검색하기',
              style: TextStyle(
                color: Color(0xFF434343),
                fontSize: 18,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
