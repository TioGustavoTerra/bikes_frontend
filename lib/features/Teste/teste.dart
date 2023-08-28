import 'dart:io';

import 'package:bikes_frontend/componentes/Dropped_file.dart';
import 'package:flutter/material.dart';

import '../../componentes/Dropzone.dart';

void main() {
  runApp(Teste());
}

class Message {
  final String content;
  final bool isMe;

  Message({required this.content, required this.isMe});
}

class Teste extends StatefulWidget {
  @override
  _TesteState createState() => _TesteState();
}

class _TesteState extends State<Teste> {
  final List<Message> _messages = [];

  void _addMessage(String content, bool isMe) {
    setState(() {
      _messages.add(Message(content: content, isMe: isMe));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Chat')),
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return MessageBubble(message: message);
                },
              ),
            ),
            _MessageInput(
              onSend: (message) => _addMessage(message, true),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final Message message;

  MessageBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(
          color: message.isMe ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          message.content,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class _MessageInput extends StatefulWidget {
  final Function(String) onSend;

  _MessageInput({required this.onSend});

  @override
  __MessageInputState createState() => __MessageInputState();
}

class __MessageInputState extends State<_MessageInput> {
  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    final message = _controller.text;
    if (message.isNotEmpty) {
      widget.onSend(message);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Enter your message'),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: _sendMessage,
          ),
        ],
      ),
    );
  }
}
