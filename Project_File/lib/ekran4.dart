import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Example',
      home: Ekran4(),
    );
  }
}

class Ekran4 extends StatefulWidget {
  @override
  _Ekran4State createState() => _Ekran4State();
}

class _Ekran4State extends State<Ekran4> with SingleTickerProviderStateMixin {
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.reference();
  double _value;
  String _plantType = '';
  final TextEditingController _controller = TextEditingController();
  String _botMessage = '';
  bool _isLoading = false;
  AnimationController _animationController;
  Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0)).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animationController.forward();
      _showPlantTypeDialog();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _showPlantTypeDialog() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          backgroundColor: Colors.transparent,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                padding: EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 20),
                margin: EdgeInsets.only(top: 40),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Bitki Türü Girişi',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    TextField(
                      controller: _controller,
                      decoration: InputDecoration(hintText: "Bitki türünü giriniz"),
                    ),
                    SizedBox(height: 20),
                    TextButton(
                      child: Text('Gönder'),
                      onPressed: () {
                        setState(() {
                          _plantType = _controller.text;
                        });
                        Navigator.of(context).pop();
                        fetchDoubleValue();
                      },
                    ),
                  ],
                ),
              ),
              Container(
                width: 90,
                height: 90,
                child: ClipOval(
                  child: Image.asset(
                    'assets/bitki.png',
                    //fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> fetchDoubleValue() async {
    try {
      setState(() {
        _isLoading = true;
      });
      DataSnapshot snapshot = await _databaseReference.child('test/json/double').once();
      setState(() {
        _value = snapshot.value != null ? snapshot.value.toDouble() : 0.0;
      });
      if (_plantType.isNotEmpty) {
        await _sendMessage();
      }
    } catch (error) {
      print('Firebase veri getirme hatası: $error');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _sendMessage() async {
    String message = "Bitkim $_plantType ve sıcaklığı $_value. Bu bitkimin sağlık durumu nasıldır ve önerilerde bulunur musun? [not: Lütfen cevap verirken karşılıklı soru tarzı verme sadece cevabı ver]";

    final apiUrl = 'https://api.openai.com/v1/chat/completions';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer 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',  // Buraya kendi API anahtarınızı girin
    };
    final body = jsonEncode({
      'model': 'gpt-3.5-turbo',
      'messages': [
        {'role': 'system', 'content': 'You are a helpful assistant.'},
        {'role': 'user', 'content': message}
      ]
    });

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(utf8.decode(response.bodyBytes));
      if (data['choices'] != null && data['choices'].isNotEmpty) {
        setState(() {
          _botMessage = data['choices'][0]['message']['content'];
        });
      } else {
        setState(() {
          _botMessage = 'Bot mesajı alınamadı.';
        });
      }
    } else {
      final errorData = jsonDecode(utf8.decode(response.bodyBytes));
      setState(() {
        _botMessage = 'Bir hata oluştu: ${errorData['error']['message']}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[300],
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[500],
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Column(
          children: [
            Text(
              'Eco-Guardian',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.green[900],
              ),
            ),
            Text(
              'Yapay Zeka ile Bitkin Hakkında Öneri Al',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: SlideTransition(
          position: _animation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _isLoading
                  ? CircularProgressIndicator()
                  : _value != null
                  ? Text('Bitkinizin Sıcaklık Durumu: $_value')
                  : CircularProgressIndicator(),
              SizedBox(height: 20),
              _botMessage.isNotEmpty
                  ? _buildMessageBubble(_botMessage)
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMessageBubble(String message) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.green[100].withOpacity(0.9),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              child: ClipOval(
                child: Image.asset(
                  'assets/bitki.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                message,
                style: TextStyle(color: Colors.black87),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




/*
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Example',
      home: Ekran4(),
    );
  }
}

class Ekran4 extends StatefulWidget {
  @override
  _Ekran4State createState() => _Ekran4State();
}

class _Ekran4State extends State<Ekran4> {
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.reference();
  double _value;
  String _plantType = '';
  final TextEditingController _controller = TextEditingController();
  String _botMessage = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _showPlantTypeDialog());
  }

  Future<void> _showPlantTypeDialog() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Bitki Türü Girişi'),
          content: TextField(
            controller: _controller,
            decoration: InputDecoration(hintText: "Bitki türünü giriniz"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Gönder'),
              onPressed: () {
                setState(() {
                  _plantType = _controller.text;
                });
                fetchDoubleValue();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> fetchDoubleValue() async {
    try {
      DataSnapshot snapshot = await _databaseReference.child('test/json/double').once();
      setState(() {
        _value = snapshot.value != null ? snapshot.value.toDouble() : 0.0;
      });
      if (_plantType.isNotEmpty) {
        _sendMessage();
      }
    } catch (error) {
      print('Firebase veri getirme hatası: $error');
    }
  }

  Future<void> _sendMessage() async {
    String message = "Bitkim $_plantType ve sıcaklığı $_value. Bu bitkimin sağlık durumu nasıldır ve önerilerde bulunur musun?";

    final apiUrl = 'https://api.openai.com/v1/chat/completions';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer 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',  // Buraya kendi API anahtarınızı girin
    };
    final body = jsonEncode({
      'model': 'gpt-3.5-turbo',
      'messages': [
        {'role': 'system', 'content': 'You are a helpful assistant.'},
        {'role': 'user', 'content': message}
      ]
    });

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(utf8.decode(response.bodyBytes));
      if (data['choices'] != null && data['choices'].isNotEmpty) {
        setState(() {
          _botMessage = data['choices'][0]['message']['content'];
        });
      } else {
        setState(() {
          _botMessage = 'Bot mesajı alınamadı.';
        });
      }
    } else {
      final errorData = jsonDecode(utf8.decode(response.bodyBytes));
      setState(() {
        _botMessage = 'Bir hata oluştu: ${errorData['error']['message']}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Verisi Gösterimi ve ChatGPT'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _value != null
                ? Text('Double Değeri: $_value')
                : CircularProgressIndicator(),
            SizedBox(height: 20),
            _botMessage.isNotEmpty
                ? Text('ChatGPT Yanıtı: $_botMessage')
                : Container(),
          ],
        ),
      ),
    );
  }
}
*/

/* import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Example',
      home: Ekran4(),
    );
  }
}

class Ekran4 extends StatefulWidget {
  @override
  _Ekran4State createState() => _Ekran4State();
}

class _Ekran4State extends State<Ekran4> {
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.reference();
  double _value;

  @override
  void initState() {
    super.initState();
    fetchDoubleValue();
  }

  Future<void> fetchDoubleValue() async {
    try {
      DataSnapshot snapshot = await _databaseReference.child('test/json/double').once();
      setState(() {
        _value = snapshot.value != null ? snapshot.value.toDouble() : 0.0;
      });
    } catch (error) {
      print('Firebase veri getirme hatası: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Verisi Gösterimi'),
      ),
      body: Center(
        child: _value != null
            ? Text('Double Değeri: $_value')
            : CircularProgressIndicator(),
      ),
    );
  }
}
*/