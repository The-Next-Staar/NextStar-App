import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  final Function(String) onSearch;

  const SearchPage({super.key, required this.onSearch});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 100.0, 20.0, 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF3F8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'THE NEXT STAR와 지원자 찾기',
                    style: TextStyle(
                      color: Color(0xFFE685B1),
                      fontSize: 13,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Image.asset(
                  'assets/images/search.png',
                  width: 200,
                  height: 97,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 15),
                const Text(
                  '우리 기업에서 원하는\n지원자의 이미지를 검색해보세요.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFEF69A6),
                    fontSize: 18,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFD9D9D9)),
                    borderRadius: BorderRadius.circular(28),
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
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                            ),
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 24),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 8),
                        child: IconButton(
                          icon: const Icon(Icons.search,
                              color: Color(0xFFEF69A6), size: 28),
                          onPressed: () {
                            widget.onSearch(_searchController.text);
                          },
                        ),
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
