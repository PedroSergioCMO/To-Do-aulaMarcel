import 'package:flutter/material.dart';
import 'package:todo_list/home_page.dart';
import 'package:todo_list/model/task.dart';

class cadastro_screen extends StatefulWidget {
  const cadastro_screen({super.key});

  @override
  State<cadastro_screen> createState() => _cadastro_screenState();
}

class _cadastro_screenState extends State<cadastro_screen> {
  TextEditingController _controller = TextEditingController();
  GlobalKey<FormState> _formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cadastro To-DO",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue[700],
        centerTitle: true,
      ),
      body: Form(
          key: _formkey,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: _controller,
                  decoration: InputDecoration(label: Text("Descrição: ")),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Preenchimento Obrigatorio";
                    }
                    return null;
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            Task newTask = Task(_controller.text);
                            Navigator.pop(context, newTask);
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => home_page(),
                            //   ),
                            // );
                          }
                        },
                        child: Text(
                          "Confirmar",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green[400]),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Cancelar",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red[400]),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
