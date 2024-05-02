import 'package:buracoplus/table_list/table_model.dart';
import 'package:buracoplus/table_list/table_widget.dart';
import 'package:flutter/material.dart';

class TablesListView extends StatelessWidget {
  final List<TableObject> tables;

  const TablesListView({super.key, required this.tables});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: tables.length,
      itemBuilder: (context, index) {
        return TableWidget(table: tables[index]);
      },
    );
  }
}
