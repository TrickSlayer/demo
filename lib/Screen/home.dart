import 'package:flutter/material.dart';
import 'package:test_font_end/controller.dart';

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            Container(
              color: Colors.amber,
              margin: EdgeInsets.all(20),
              width: 150,
              height: 50,
              child: Text(
                "cho nao",
                style: TextStyle(
                  fontSize: 20,
                  decoration: TextDecoration.none,
                  color: Colors.black,
                ),
              ),
              alignment: Alignment.center,
            ),
            Container(
              child: Column(
                children: [
                  // ignore: deprecated_member_use
                  FlatButton(
                    onPressed: () {
                      toMatching(context);
                    },
                    child: Text("Ngẫu Nhiên"),
                    color: Colors.white,
                    minWidth: 150,
                  ),
                  // ignore: deprecated_member_use
                  FlatButton(
                    onPressed: () {},
                    child: Text("Tạo Làng"),
                    color: Colors.white,
                    minWidth: 150,
                  ),
                  // ignore: deprecated_member_use
                  FlatButton(
                    onPressed: () {},
                    child: Text("Hướng Dẫn"),
                    color: Colors.white,
                    minWidth: 150,
                  ),
                  // ignore: deprecated_member_use
                  FlatButton(
                    onPressed: () {},
                    child: Text("Top"),
                    color: Colors.white,
                    minWidth: 150,
                  ),
                ],
              ),
              margin: EdgeInsets.only(left: 500, top: 50),
            ),
          ],
        ),
        decoration: _backGround(),
      ),
    );
  }

  BoxDecoration _backGround() {
    return BoxDecoration(
        image: DecorationImage(
      image: AssetImage("assets/images/vao_choi.jpg"),
      fit: BoxFit.cover,
    ));
  }
}
