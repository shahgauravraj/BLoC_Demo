import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './counterBloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Simple BLoC Implementation"),
        ),
        body: BlocProvider(
            create: (BuildContext context) => CounterBloc(),
            child: CounterScreen()),
      ),
    );
  }
}

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _counterBloc = BlocProvider.of<CounterBloc>(context);

    return Center(
      child: Card(
        elevation: 10,
        margin: EdgeInsets.all(50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          side: BorderSide(width: 10, color: Theme.of(context).accentColor),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<CounterBloc, int>(
              builder: (BuildContext context, int state) {
                return Text(
                  "Counter Value : $state",
                  style: TextStyle(fontSize: 30),
                );
              },
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton(
                  elevation: 7,
                  child: Icon(Icons.arrow_upward),
                  onPressed: () {
                    _counterBloc.add(CounterEvents.increment);
                  },
                ),
                FloatingActionButton(
                  elevation: 7,
                  child: Icon(Icons.arrow_downward),
                  onPressed: () {
                    _counterBloc.add(CounterEvents.decrement);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
