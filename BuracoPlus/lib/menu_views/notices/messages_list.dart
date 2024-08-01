import 'package:flutter/material.dart'
    show
        BorderRadius,
        BoxDecoration,
        BuildContext,
        Center,
        Color,
        Colors,
        Container,
        Curves,
        EdgeInsets,
        GestureDetector,
        ListView,
        ScrollController,
        State,
        StatefulWidget,
        Text,
        TextStyle,
        Widget;
import 'package:web_socket_channel/web_socket_channel.dart'
    show WebSocketChannel;

class InfiniteScrollNotices extends StatefulWidget {
  const InfiniteScrollNotices({
    super.key,
  });

  @override
  _InfiniteScrollNoticesState createState() {
    return _InfiniteScrollNoticesState();
  }
}

class _InfiniteScrollNoticesState extends State<InfiniteScrollNotices> {
  final List<Message> _messages = [];
  final ScrollController _scrollController = ScrollController();
  late WebSocketChannel _channel;

  @override
  void initState() {
    super.initState();
    _connectToWebSocket();
  }

  void _connectToWebSocket() {
    _channel = WebSocketChannel.connect(
      Uri.parse(
        'ws://15.160.133.85:3001',
      ),
    );
    _channel.stream.listen((message) {
      setState(() {
        _messages.insert(
          0,
          Message(
            text: message,
            isRead: false,
            isNew: true,
          ),
        );
      });
      _scrollToTop();
    });
  }

  void _scrollToTop() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  Color _getMessageColor(Message message) {
    if (message.isNew) {
      return const Color.fromARGB(255, 200, 214, 237);
    } else if (!message.isRead) {
      return const Color.fromARGB(255, 255, 255, 255);
    } else {
      return const Color.fromARGB(255, 215, 215, 215);
    }
  }

  void _onMessageTap(int index) {
    setState(() {
      if (_messages[index].isNew) {
        _messages[index].isNew = false;
      } else {
        _messages[index].isRead = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _messages.length,
      reverse: true,
      itemBuilder: (
        context,
        index,
      ) {
        return GestureDetector(
          onTap: () => _onMessageTap(index),
          child: _buildListItem(_messages[index]),
        );
      },
    );
  }

  Widget _buildListItem(Message message) {
    return Container(
      height: 80,
      margin: const EdgeInsets.symmetric(
        vertical: 3,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: _getMessageColor(message),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          message.text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _channel.sink.close();
    _scrollController.dispose();
    super.dispose();
  }
}

class Message {
  final String text;
  bool isRead;
  bool isNew;

  Message({
    required this.text,
    this.isRead = false,
    this.isNew = true,
  });
}
