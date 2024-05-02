import 'package:buracoplus/table_list/player_model.dart';
import 'package:buracoplus/table_list/table_model.dart';
import 'package:flutter/material.dart';

class TableWidget extends StatelessWidget {
  final TableObject table;

  const TableWidget({super.key, required this.table});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(table.tableName),
        Text('Durata Turno: ${table.turnDuration} min'),
        Text('Punti Richiesti: ${table.requiredPoints}'),
        Row(
          children: List.generate(table.maxPlayers, (index) {
            Player? player =
                table.players.length > index ? table.players[index] : null;
            return Expanded(
              child: Container(
                height: 100,
                child: player != null
                    ? Image.network(player.imageUrl)
                    : Image.asset('path/to/empty_chair.png'),
              ),
            );
          }),
        ),
      ],
    );
  }
}
