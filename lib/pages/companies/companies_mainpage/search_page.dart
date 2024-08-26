import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  final Function(String) onSearch;

  const SearchPage({Key? key, required this.onSearch}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF3F8),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'THE NEXT STAR와 지원자 찾기',
                    style: TextStyle(
                      color: Color(0xFFE685B1),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Image.asset(
                  'assets/images/search.png',
                  width: 200,
                  height: 97,
                ),
                const SizedBox(height: 20),
                const Text(
                  '우리 기업에서 원하는\n지원자의 이미지를 검색해보세요.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFEF69A6),
                    fontSize: 18,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFD9D9D9)),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          decoration: const InputDecoration(
                            hintText: '고양이 눈매 라고 검색해보세요!',
                            hintStyle: TextStyle(
                              color: Color(0xFFCBCBCB),
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                            ),
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20),
                          ),
                        ),
                      ),
                      IconButton(
                        icon:
                            const Icon(Icons.search, color: Color(0xFFEF69A6)),
                        onPressed: () {
                          widget.onSearch(_searchController.text);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
