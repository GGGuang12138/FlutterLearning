import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({
    Key key,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool invalidName = false;
  bool invalidPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('世界时钟'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(children: [
          Container(
            padding: EdgeInsets.fromLTRB(15, 35, 15, 0),
            child: TextField(
              style: TextStyle(fontSize: 20),
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '用户名',
                errorText: invalidName ? '用户名不能为空' : null,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 15, 15, 0),
            child: TextField(
              obscureText: true,
              style: TextStyle(fontSize: 20),
              controller: passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '密码',
                errorText: invalidPassword ? '密码不能为空' : null,
              ),
            ),
          ),
          FlatButton(
            onPressed: () {},
            textColor: Colors.blue,
            child: Text('忘记密码'),
          ),
          Container(
            height: 50,
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: RaisedButton(
              onPressed: () {
                if (nameController.text == null ||
                    nameController.text.isEmpty) {
                  setState(() {
                    invalidName = true;
                  });
                } else {
                  setState(() {
                    invalidName = false;
                  });
                }
                if (passwordController.text == null ||
                    passwordController.text.isEmpty) {
                  setState(() {
                    invalidPassword = true;
                  });
                } else {
                  setState(() {
                    invalidPassword = false;
                  });
                }
                print(invalidName);
                print(invalidPassword);
                if (!invalidPassword && !invalidName) {
                  Navigator.pushNamed(context, '/Loading');
                }
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text('登陆'),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('如果没有账号？'),
                Container(
                  width: 62,
                  height: 40,
                  margin: EdgeInsets.all(0),
                  child: FlatButton(
                    textColor: Colors.blue,
                    child: Text('注册', style: TextStyle(fontSize: 15)),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
