import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '计数器扩展'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('计数器扩展',
          textAlign: TextAlign.center,
          style: TextStyle(
              color:Colors.black,
              fontSize:25,
              fontFamily: "Courier"
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  child: const Text("Reset"),
                  onPressed: () {
                    setState(() {
                      _counter = 0;
                    });
                  },
                ),
                ElevatedButton(
                  child: const Text("New Page"),
                  onPressed: () {
                    //导航到新路由
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return NewRoute();
                      }),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class NewRoute extends StatelessWidget {
  final _floatingActioButoon = FloatingActionButton(
    onPressed: () {},
    child: const Icon(Icons.accessibility),
    elevation: 0.0,
    backgroundColor: Colors.orange,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const <Widget>[
                Expanded(
                  flex: 1,
                  child: TabBar(tabs: <Widget>[
                    Tab(text: "故宫"),
                    Tab(text: "岳阳楼"),
                    Tab(text: "长城",)
                  ]),
                )
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            color: Colors.white,
            shape: const CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
            child: Row(
              children: [
                IconButton(icon: const Icon(Icons.home), onPressed: _onAdd),
                const SizedBox(), //中间位置空出
                IconButton(
                  icon: const Icon(Icons.account_balance),
                  onPressed: () {
                    Navigator.pop(context); //从第二个界面返回
                  },
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
            ),
          ),
          floatingActionButton: _floatingActioButoon,
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
          body: TabBarView(
            children: <Widget>[
              ListView(
                children: const <Widget>[
                  Text.rich(TextSpan(
                      children: [
                        TextSpan(
                            text: "故宫\n",
                            style:TextStyle(
                              color:Colors.black,
                              fontSize: 30,
                            )
                        ),
                        TextSpan(
                            text: "https://gugong.cn\n\n",
                            style: TextStyle(
                                color: Colors.blue
                            ),
                        ),
                      ]
                  )),
                  Image(
                    image: AssetImage('images/gugong.png'),
                    width: 200.0,
                    height: 200.0,
                  )
                ],
              ),
              ListView(
                children: const <Widget>[
                  Text.rich(TextSpan(
                      children: [
                        TextSpan(
                            text: "岳阳楼\n",
                            style:TextStyle(
                              color:Colors.black,
                              fontSize: 30,
                            )
                        ),
                        TextSpan(
                          text: "https://yuetanglou.cn\n\n",
                          style: TextStyle(
                              color: Colors.blue
                          ),
                        ),
                      ]
                  )),
                  Image(
                    image: AssetImage('images/yyl.png'),
                    width: 200.0,
                    height: 200.0,
                  )
                ],
              ),
              ListView(
                children: const <Widget>[
                  Text.rich(TextSpan(
                      children: [
                        TextSpan(
                            text: "长城\n",
                            style:TextStyle(
                              color:Colors.black,
                              fontSize: 30,
                            )
                        ),
                        TextSpan(
                          text: "https://changhceng.cn\n\n",
                          style: TextStyle(
                              color: Colors.blue
                          ),
                        ),
                      ]
                  )),
                  Image(
                    image: AssetImage('images/cc.png'),
                    width: 200.0,
                    height: 200.0,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onAdd() {}
}