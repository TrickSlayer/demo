import 'package:flutter/material.dart';
import 'count.dart';

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

const String _name = "Thuy Tien";

class RightB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Friendlychat",
      home: new ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  //modified
  @override //new
  State createState() => new ChatScreenState(); //new
}

// Add the ChatScreenState class definition in main.dart.
class ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = new TextEditingController();
  bool _isComposing = false;
  late ScrollController _controller;

  @override
  void dispose() {
    for (ChatMessage message in _messages)
      message.animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      //"reach the bottom"
      setState(() {});
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      // "reach the top";
      setState(() {});
    }
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(width: 1.0, color: Colors.black38),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    );
  }

  Widget _buildTextInput() => Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.only(left: 8.0),
        decoration: myBoxDecoration(),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                controller: _textController,
                onChanged: (String text) {
                  setState(() {
                    _isComposing = text.length > 0;
                  });
                },
                keyboardType: TextInputType.multiline,
                maxLines: 10,
                minLines: 1,
                decoration:
                    new InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            new Container(
              child: new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: _isComposing
                      ? () => _handleSubmitted(_textController.text)
                      : null),
            ),
          ],
        ),
      );

  Widget _buildTextComposer() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: new IconTheme(
        data: IconThemeData(color: Theme.of(context).accentColor),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: _buildTextInput(),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      _isComposing = false;
    });
    if (text.length > 0) {
      ChatMessage message = new ChatMessage(
        text: text,
        animationController: new AnimationController(
          duration: new Duration(milliseconds: 700),
          vsync: this,
        ),
      );
      setState(() {
        _messages.insert(0, message);
      });
      message.animationController.forward();
    }
  }

  @override //new
  Widget build(BuildContext context) {
    return SafeArea(
      child: new Scaffold(
        backgroundColor: Colors.white.withOpacity(0.3),
        body: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: new Column(
            children: <Widget>[
              new Flexible(
                child: new ListView.builder(
                  controller: _controller,
                  padding: new EdgeInsets.all(8.0),
                  reverse: true,
                  itemBuilder: (_, int index) => _messages[index],
                  itemCount: _messages.length,
                ),
              ),
              // new Divider(height: 1.0),
              new Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                ),
                child: SafeArea(
                  bottom: true,
                  child: _buildTextComposer(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage(
      {required this.text, required this.animationController}); //modified
  final String text;
  final AnimationController animationController;
  @override
  Widget build(BuildContext context) {
    return new SizeTransition(
      sizeFactor: new CurvedAnimation(
          parent: animationController, curve: Curves.easeOut),
      axisAlignment: 0.0,
      child: new Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: new CircleAvatar(child: new Text(_name[0])),
            ),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(_name, style: Theme.of(context).textTheme.subtitle1),
                new Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: new Text(text),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
