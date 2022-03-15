import 'package:data_mans/modules/archived/archived.dart';
import 'package:data_mans/modules/done/done.dart';
import 'package:data_mans/modules/tasks/tasks.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';


class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentindex = 0;
  List<Widget> screens = [
    NewTaskScreen(),
    DoneTaskScreen(),
    ArchivedTaskScreen(),
  ];
  List<String> titels =
  ['New Tasks',
    'Done Tasks',
    'Archived Tasks'
  ];
  late Database database;
  @override
    void initState() {
    super.initState();
    createDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          titels[currentindex],
        ),
      ),
      body: screens[currentindex],
      floatingActionButton: FloatingActionButton(

        onPressed: (){
          // insertToDatabase();
          //insertToDatabase();
        },
        child: Icon(
          Icons.add,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentindex,
        onTap: (index) {
          setState(() {
            currentindex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.menu,
            ),
            label: 'tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.check_circle_outline,
            ),
            label: 'done',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.archive_outlined,
            ),
            label: 'archived',
          ),
        ],
      ),
    );
  }

  Future<String> getName() async {
    return 'Abdallah Hamed';
  }
  void createDatabase() async {
    database = await openDatabase(
        'todo.db',
        version: 1,
        onCreate: (database, version) {
          print('create database');
          database.execute(
              'CREATE TABLE  tasks(id INTEGER PRIMARY KEY , title TEXT,dat TEXT, time TEXT )')
              .then((value) {
            print('table CREATE ');
          }).catchError((error) {
            print('error create table ${error.toString}');
          });
        },


    );
  }

  Future insertToDatabase(// required String date,
    // required String time,
    // required String title,

  )async {
    return  await database.transaction((txn)  async {
      txn
          .rawInsert(
          'INSERT INTO tasks(title,dat,time ) VALUES("title","time","date")')
          .then((value) {
        print('$value insert successfuly');
      }).catchError((error) {
        print('Error  when insert new Record${error.toString()} ');
      });

    });

  }
}
