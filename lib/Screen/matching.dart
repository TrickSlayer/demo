import 'package:flutter/material.dart';
import 'package:test_font_end/Chat/chat.dart';
import '../Count/count.dart';

class Matching extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/matching.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Colors.blue.shade400.withOpacity(0.3),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: _TitleWidget(),
              ),
              Expanded(
                flex: 6,
                child: _BodyWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: _LeftB(),
          ),
          Expanded(
            flex: 1,
            child: RightB(),
          ),
        ],
      ),
    );
  }
}

class _LeftB extends StatelessWidget {
  const _LeftB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Image(
              image: AssetImage("assets/images/matchWaiting.gif"),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.headphones,
                      color: Colors.white,
                    ),
                    Container(
                      child: Center(
                        child: Text(
                          "Use headphones for the best experience.",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: Center(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(),
                        ),
                        Expanded(
                          child: playerBox(),
                        ),
                        Expanded(
                          child: playerBox(),
                        ),
                        Expanded(
                          child: playerBox(),
                        ),
                        Expanded(
                          child: playerBox(),
                        ),
                        Expanded(
                          child: playerBox(),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(),
                        ),
                        Expanded(
                          child: playerBox(),
                        ),
                        Expanded(
                          child: playerBox(),
                        ),
                        Expanded(
                          child: playerBox(),
                        ),
                        Expanded(
                          child: playerBox(),
                        ),
                        Expanded(
                          child: playerBox(),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(),
          )
        ],
      ),
    );
  }
}

Widget playerBox() {
  return Container(
    width: 50,
    height: 50,
    color: Colors.white,
    margin: EdgeInsets.all(2),
  );
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Scaffold(
              backgroundColor: Colors.white.withOpacity(0.1),
              body: IconButton(
                icon: Icon(Icons.keyboard_return_rounded),
                color: Colors.white,
                onPressed: () {
                  Navigator.pushNamed(context, 'home');
                },
              ),
            ),
          ),
          Expanded(
            flex: 11,
            child: Row(
              children: [
                Expanded(
                  child: Container(),
                  flex: 3,
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    "MATCHING",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: CountDown(),
                ),
                Expanded(
                  child: Container(),
                  flex: 3,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class RightB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Friendlychat",
      home: new ChatScreen(),
    );
  }
}