import 'package:flutter/material.dart'
    show
        Alignment,
        AlwaysStoppedAnimation,
        BorderRadius,
        BoxConstraints,
        BoxDecoration,
        BuildContext,
        CircularProgressIndicator,
        Color,
        Colors,
        Column,
        ConstrainedBox,
        Container,
        CrossAxisAlignment,
        EdgeInsets,
        Expanded,
        FontWeight,
        ListView,
        MediaQuery,
        Padding,
        ScrollController,
        SingleChildScrollView,
        SizedBox,
        State,
        StatefulWidget,
        Text,
        TextAlign,
        TextStyle,
        Widget;
import 'package:flutter/src/widgets/basic.dart';

class InfiniteScrollNotices extends StatefulWidget {
  final List<Map<String, dynamic>> getNotices;

  const InfiniteScrollNotices({
    required this.getNotices,
  });

  @override
  _InfiniteScrollNoticesState createState() {
    return _InfiniteScrollNoticesState();
  }
}

class _InfiniteScrollNoticesState extends State<InfiniteScrollNotices> {
  final ScrollController _scrollController = ScrollController();
  late final List<Map<String, dynamic>> _notices;
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
    final double maxHeight = MediaQuery.of(context).size.height * 0.33;
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            itemCount: _notices.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(
                  top: 6.0,
                  left: 6.0,
                  right: 6.0,
                  bottom: 3.0,
                ),
                padding: EdgeInsets.all(8.0),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Color.fromARGB(115, 99, 130, 162),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: maxHeight,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _notices[index]['title'] ?? 'No Title',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    _notices[index]['date'] ?? 'No Date',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    _notices[index]['time'] ?? 'No Time',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            _notices[index]['message'] ?? 'No Message',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 11.5,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        if (_isLoading)
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: const CircularProgressIndicator(
              valueColor: const AlwaysStoppedAnimation<Color>(
                const Color.fromARGB(115, 117, 36, 120),
              ),
              strokeAlign: CircularProgressIndicator.strokeAlignCenter,
              strokeWidth: 5.0,
            ),
          ),
      ],
    );
  }
}
