import 'package:flutter/material.dart';
import '../../../models/casting.dart';
import 'dart:async';

class MessagePage extends StatefulWidget {
  final Casting casting;

  const MessagePage({Key? key, required this.casting}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  List<Message> messages = [];
  TextEditingController _messageController = TextEditingController();
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      setState(() {
        messages.add(Message(
          text:
              '안녕하세요 :) 캐스팅 제안에 응해주셔서 감사합니다.\n2차 오디션 관련 정보 전달드립니다.\n\n[2차 오디션 정보]\n일시: 8월 30일(토)/ 13:00\n장소: 서울특별시 강동구 강동대로 205\n준비사항: 1분 내외 가창 확인 용 음원mr\n\n방문 후 1층 안내데스크에서 오디션 지원 방문이라고 말씀 해주시기 바랍니다.\n추가적으로 궁금한 사항 있으면 해당 채팅방으로 연락 남겨주세요.\n캐스팅 담당자 권지영 드림',
          isMe: false,
          timestamp: DateTime.now(),
        ));
      });
      _scrollToBottom();
    });
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildAppBar(context),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return _buildMessageBubble(messages[index]);
              },
            ),
          ),
          _buildInputArea(),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Color(0xFF434343)),
              onPressed: () => Navigator.pop(context),
            ),
            Expanded(
              child: Text(
                widget.casting.company.company,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF434343),
                  fontSize: 16,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(width: 48),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageBubble(Message message) {
    return Align(
      alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: message.isMe ? Color(0xFFEF69A6) : Color(0xFFFFE4EE),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message.text,
              style: TextStyle(
                color: message.isMe ? Colors.white : Color(0xFF525252),
                fontSize: 14,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 4),
            Text(
              _formatTimestamp(message.timestamp),
              style: TextStyle(
                color: Color(0xFF9E9E9E),
                fontSize: 12,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: EdgeInsets.all(8),
      color: Color(0xFFF5F5F5),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Color(0xFFD9D9D9)),
              ),
              child: TextField(
                controller: _messageController,
                decoration: InputDecoration(
                  hintText: '메시지 입력',
                  hintStyle: TextStyle(color: Color(0xFFCBCBCB)),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
          ElevatedButton(
            onPressed: _sendMessage,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFEF69A6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text('전송', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        messages.add(Message(
          text: _messageController.text,
          isMe: true,
          timestamp: DateTime.now(),
        ));
        _messageController.clear();
      });
      _scrollToBottom();
    }
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inMinutes < 1) {
      return '방금 전';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes}분 전';
    } else if (difference.inDays < 1) {
      return '${difference.inHours}시간 전';
    } else {
      return '${timestamp.month}/${timestamp.day} ${timestamp.hour}:${timestamp.minute.toString().padLeft(2, '0')}';
    }
  }
}

class Message {
  final String text;
  final bool isMe;
  final DateTime timestamp;

  Message({required this.text, required this.isMe, required this.timestamp});
}
