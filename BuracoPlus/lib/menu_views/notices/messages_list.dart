import 'package:flutter/material.dart';

class InfiniteScrollNotices extends StatefulWidget {
  final List getNotices;

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
  late List _notices;
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
    List newNotices =
        List.generate(10, (index) => 'Notice ${_notices.length + index + 1}');

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
                title: Text(_notices[index]),
              );
            },
          ),
        ),
        if (_isLoading)
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircularProgressIndicator(),
          ),
      ],
    );
  }
}
