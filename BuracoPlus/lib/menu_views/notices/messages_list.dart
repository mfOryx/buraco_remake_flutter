import 'package:flutter/material.dart'
    show
        AlwaysStoppedAnimation,
        BuildContext,
        Center,
        CircularProgressIndicator,
        Color,
        Column,
        EdgeInsets,
        Expanded,
        ListTile,
        ListView,
        Padding,
        ScrollController,
        State,
        StatefulWidget,
        Text,
        Widget;

class InfiniteScrollNotices extends StatefulWidget {
  final List<Map<String, dynamic>> getNotices;

  const InfiniteScrollNotices({
    required this.getNotices,
    super.key,
  });

  @override
  _InfiniteScrollNoticesState createState() {
    return _InfiniteScrollNoticesState();
  }
}

class _InfiniteScrollNoticesState extends State<InfiniteScrollNotices> {
  final ScrollController _scrollController = ScrollController();
  late List<Map<String, dynamic>> _notices;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _notices = List.from(widget.getNotices);
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        !_isLoading) {
      _loadMoreNotices();
    }
  }

  Future<void> _loadMoreNotices() async {
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));
    List<Map<String, dynamic>> newNotices = List.generate(
        10,
        (index) => {
              'title': 'Notice ${_notices.length + index + 1}',
              'message': 'Content ${_notices.length + index + 1}',
              // 'date': '2024-08-05',
              // 'time': '12:00',
              // 'isRead': false
            },
        growable: false);

    setState(() {
      _notices.addAll(newNotices);
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            itemCount: _notices.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Center(
                  child: Text(
                    _notices[index]['title'] ?? 'No Title',
                  ),
                ),
                subtitle: Center(
                  child: Text(
                    _notices[index]['message'] ?? 'No Message',
                  ),
                ),
              );
            },
          ),
        ),
        if (_isLoading)
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Color.fromARGB(115, 117, 36, 120),
              ),
              strokeAlign: CircularProgressIndicator.strokeAlignCenter,
              strokeWidth: 5.0,
            ),
          ),
      ],
    );
  }
}
