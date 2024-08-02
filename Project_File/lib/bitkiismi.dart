import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _controller = TextEditingController();
  final _database = FirebaseDatabase.instance
      .reference()
      .child('test')
      .child('json')
      .child('name')
      .child('plant');

  void _saveName(String name) async {
    await _database.set(name);
  }

  Future<String> _getName() async {
    final snapshot = await _database.once();
    return snapshot.value.toString();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.lightGreen[500],
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.lightGreen[500],
        middle: Column(
          children: [
            Text(
              'Eco-Guardian',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green[900],
              ),
            ),
            Text(
              'İsim Ekle',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ],
        ),
        border: null,
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage('assets/bitki.png'),
                   // fit: BoxFit.cover,
                  ),
                ),
                height: 200,
                width: 200,
              ),
              SizedBox(height: 20),
              Text(
                'Lütfen Bitkinizin Sizi Daha İyi Tanıması İçin İsminizi Giriniz.',
                textAlign: TextAlign.center,
                style: CupertinoTheme.of(context)
                    .textTheme
                    .navLargeTitleTextStyle
                    .copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: CupertinoColors.black,
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: CupertinoColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: CupertinoTextField(
                    controller: _controller,
                    placeholder: 'İsmim...',
                    style: CupertinoTheme.of(context)
                        .textTheme
                        .textStyle
                        .copyWith(
                      color: CupertinoColors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              CupertinoButton(
                color: CupertinoColors.systemGreen,
                onPressed: () {
                  _saveName(_controller.text);
                  showCupertinoDialog(
                    context: context,
                    builder: (context) => CupertinoAlertDialog(
                      title: Text(
                        'İsim Kayıt Edildi.',
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .textStyle
                            .copyWith(
                          color: CupertinoColors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      actions: [
                        CupertinoDialogAction(
                          child: Text(
                            'Tamam',
                            style: CupertinoTheme.of(context)
                                .textTheme
                                .actionTextStyle
                                .copyWith(
                              color: CupertinoColors.systemGreen,
                            ),
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  );
                },
                child: Text(
                  'Kaydet',
                  style: CupertinoTheme.of(context)
                      .textTheme
                      .textStyle
                      .copyWith(
                    color: CupertinoColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              FutureBuilder(
                future: _getName(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final name = snapshot.data;
                    return Text(
                      'Merhaba, $name.',
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .textStyle
                          .copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: CupertinoColors.black,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text(
                      'Hata: ${snapshot.error}',
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .textStyle
                          .copyWith(
                        color: CupertinoColors.black,
                      ),
                    );
                  }
                  return SizedBox(
                    height: 22,
                    child: CupertinoActivityIndicator(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
