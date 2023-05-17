import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import 'package:odev/screens/todoDatabase.dart';
import 'package:odev/screens/tododetail.dart';
import 'package:odev/utils/drawer.dart';

import '../models/todo.dart';

class TodoListMysql extends StatefulWidget {
  const TodoListMysql({Key? key}) : super(key: key);

  @override
  State<TodoListMysql> createState() => _TodoListMysqlState();
}

class _TodoListMysqlState extends State<TodoListMysql> {
  List<Todo> todolist = [];
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String title = "";
  late MySqlConnection conn;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isObscure = true;
  bool isEdit = false;
  TextEditingController textController = TextEditingController();
  late Todo EditableTodo;
  @override
  void initState() {
    mysqlconn();
    super.initState();
  }

  @override
  void dispose() {
    conn.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isEdit ? Icons.save : Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          isEdit ? updateTodo() : addTodo();
        },
      ),
      drawer: MyDrawer(),
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text("TodoList-DB"),
        actions: const [
          Icon(Icons.settings),
          SizedBox(
            width: 5,
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              color: Colors.grey[300],
              child: Form(
                autovalidateMode: autovalidateMode,
                key: formKey,
                child: TextFormField(
                  obscureText: isObscure,
                  maxLines: 1,
                  controller: textController,
                  onSaved: (newValue) {
                    title = newValue!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Boş geçilemez';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      hintText: 'Başlık',
                      labelText: 'Başlık Giriniz.',
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                        child: Icon(isObscure
                            ? Icons.visibility_off
                            : Icons.visibility),
                      )),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.topCenter,
              child: ListView.builder(
                itemCount: todolist.length,
                itemBuilder: (BuildContext context, int index) {
                  Todo item = todolist[index];
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      tileColor: item.isComplated
                          ?  Colors.green[100]
                          :  Colors.red[100],
                      title: Text(
                        "#${item.id} - ${item.title}",
                        style: TextStyle(
                          decoration: item.isComplated
                              ? TextDecoration.lineThrough
                              : null,
                        ),
                      ),
                      subtitle: InkWell(
                        child: const Text("Bilgi Giriniz."),
                        onTap: () {
                          setState(() {
                            item.isComplated = !item.isComplated;
                            updateIsComplated(item);
                          });
                        },
                      ),
                      leading: item.isComplated
                          ? const Icon(Icons.check_box_outlined)
                          : const Icon(Icons.check_box_outline_blank),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                item.isStar = !item.isStar!;
                                updateIsStar(item);
                              });
                            },
                            icon: Icon(
                              Icons.star,
                              color: item.isStar! ? Colors.amber : Colors.black45,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isEdit = !isEdit;
                                EditableTodo = item;
                                if (isEdit) {
                                  textController.text = item.title;
                                } else {
                                  textController.text = '';
                                }
                              });
                            },
                            child: Icon(Icons.edit,
                                color: isEdit && EditableTodo == item
                                    ? Colors.blue
                                    : Colors.black45),
                          ),
                          InkWell(
                            child: const Icon(Icons.more_vert),
                            onTap: () {
                              setState(() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            TodoDetail(todo: item)));
                              });
                            },
                          ),
                          InkWell(
                              child: const Icon(Icons.close),
                              onTap: () async {
                                setState(() {
                                  todolist.removeAt(index);
                                  deleteTodo(item.id);
                                });
                              })
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  void addTodo() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      alertSuccess("Kayıt Eklendi!");
      final conn = await TodoDatabase.mysqlConn();
      await conn.query(
          'insert into todo (title, iscomplated, isStar) values (?, ?,?)',
          [title, false, false]);
      var results = await conn.query("select * from todo");
      setState(() {
        todolist = [];
        for (var element in results) {
          todolist.add(Todo(
              id: element["id"],
              title: element["title"],
              isComplated: element["iscomplated"] == 1 ? true : false));
        }
      });
  
      debugPrint(todolist.toString());
      formKey.currentState!.reset();
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }

  void updateIsComplated(Todo todo) async {
    final conn = await TodoDatabase.mysqlConn();
    await conn.query('update todo set iscomplated=? where id=?',
        [todo.isComplated, todo.id]);
  }

  Future updateTodo() async {
    alertSuccess("Kayıt Güncellendi!");
    final conn = await TodoDatabase.mysqlConn();
    conn.query("update todo set title =? where id=?",
        [textController.text, EditableTodo.id]);
    todolist
        .map((e) => {
              if (e == EditableTodo)
                {
                  setState(() {
                    e.title = textController.text;
                  })
                }
            })
        .toList();
    textController.text = "";
  }

  void updateIsStar(Todo todo) async {
    final conn = await TodoDatabase.mysqlConn();
    await conn
        .query('update todo set isStar=? where id=?', [todo.isStar!, todo.id]);
  }

  void deleteTodo(int id) async {
    final conn = await TodoDatabase.mysqlConn();
    await conn.query('delete from todo where id = ?', [id]);
  }

  void mysqlconn() async {
    debugPrint("Bağlanıldı");
    final conn = await MySqlConnection.connect(ConnectionSettings(
       host: '94.73.150.186',
        port: 3306,
        user: 'infame_online_deneme',
        db: 'infame_online_todo',
        password: 'A1#-fCrWk?2DXleB8y'));
    var results = await conn.query("select * from todo");
    debugPrint(results.toString());

    setState(() {
      todolist = [];
      for (var element in results) {
        todolist.add(Todo(
            id: element["id"],
            title: element["title"],
            isComplated: element["iscomplated"] == 1 ? true : false));
      }
    });
  }

  void alertSuccess(String message) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Kapat"),
                ),
              ],
              content: SizedBox(
                height: 100,
                child: Column(
                  children: [
                    const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 72,
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: Text(message)),
                  ],
                ),
              ),
            ));
  }
}
