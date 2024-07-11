import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:buracoplus/common/translation_manager.dart';

class NoticesButton extends StatelessWidget {
  final VoidCallback toggleNotices;

  const NoticesButton({
    required this.toggleNotices,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final translationManager = Provider.of<TranslationManager>(context);
    return Positioned(
      top: MediaQuery.of(context).size.height < 550 ? 10.0 : 20.0,
      left: Directionality.of(context) == TextDirection.rtl ? 200 : null,
      right: Directionality.of(context) == TextDirection.rtl ? null : 200,
      width: 70,
      height: 89,
      child: Column(
        children: [
          IconButton(
            icon: const Icon(
              Icons.question_answer,
              color: Colors.green,
            ),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.transparent,
              backgroundColor: Colors.transparent,
            ),
            onPressed: toggleNotices,
          ),
          const SizedBox(
            height: 1,
          ),
          Text(
            translationManager
                .translate(
                  'Notices Barra',
                  //'txtNotices',
                )
                .toUpperCase(),
            style: const TextStyle(
              color: Colors.green,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
