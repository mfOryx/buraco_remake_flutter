import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'emoji_definition.dart'; // Assicurati di importare il file corretto
import 'package:provider/provider.dart';
import 'package:buracoplus/common/translation_manager.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  String?
      selectedCategory; // Aggiunto per tenere traccia della categoria selezionata

  void _showEmojiPicker() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Column(
            children: [
              Wrap(
                children: EmojiManager().emojis.keys.map((category) {
                  return ChoiceChip(
                    label: Text(category),
                    selected: selectedCategory == category,
                    onSelected: (bool selected) {
                      setState(() {
                        selectedCategory = selected ? category : null;
                      });
                      Navigator.pop(
                          context); // Chiudi e riapri con la nuova selezione
                      _showEmojiPicker(); // Riapri il picker aggiornato
                    },
                  );
                }).toList(),
              ),
              Expanded(
                child: Wrap(
                  children: selectedCategory == null
                      ? []
                      : EmojiManager().emojis[selectedCategory]!.map((emoji) {
                          return IconButton(
                            icon: Image.asset(emoji),
                            onPressed: () {
                              _controller.text += ' <img src="$emoji"> ';
                              Navigator.pop(context);
                            },
                          );
                        }).toList(),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final translationManager = Provider.of<TranslationManager>(context);
    return Scaffold(
      appBar: AppBar(title: Text(translationManager.translate('txtChat'))),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: TextField(
                controller: _controller,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: translationManager.translate('txtTypeYourMessageHere'),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.emoji_emotions_outlined),
                    onPressed: _showEmojiPicker,
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            child: Text(translationManager.translate('txtSend')),
            onPressed: () {
              // Logic to send message
              if (kDebugMode) {
                print(_controller.text);
              } // Here you would usually send this to your backend or chat service
            },
          )
        ],
      ),
    );
  }
}
