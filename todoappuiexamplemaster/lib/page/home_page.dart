import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todoappuiexamplemaster/main.dart';
import 'package:todoappuiexamplemaster/widget/add_todo_dialog_widget.dart';
import 'package:todoappuiexamplemaster/widget/complete_list_widget.dart';
import 'package:todoappuiexamplemaster/widget/todo_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    //koji se tab uzima ide screen na njega ...screenovi dole
    final tabs = [TodoListWidget(), CompletedListWidget()];

    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.title),
      ),
      //defisisanje dva buttna obavezno
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white.withOpacity(0.7),
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        //dodavanje ikona za buttone
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.fact_check_outlined), label: 'Todos'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.done,
                size: 28,
              ),
              label: 'Completed'),
        ],
      ),
      //button + -dodavanje
      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        //border radious na buttun
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.black,
        //na klik otvara se dialog
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AddTodoDialogWidget(),
          barrierDismissible: false,
          /**dialog se ne pomjera ako klikenmo bilo gdje zato je false
           */
        ),
      ),
    );
  }
}
