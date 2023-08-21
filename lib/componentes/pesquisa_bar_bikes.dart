import 'package:flutter/material.dart';

class PesquisaBarBikes extends StatefulWidget {
  const PesquisaBarBikes({Key? key}) : super(key: key);

  @override
  PesquisaBarBikesState createState() => PesquisaBarBikesState();
}

class PesquisaBarBikesState extends State<PesquisaBarBikes> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 500,
        height: 60,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          // borderRadius: BorderRadius.circular(50),
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 8, 188, 138),
              Color.fromARGB(255, 4, 18, 20),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  color: Colors.white,
                  icon: const Icon(Icons.search),
                  iconSize: 30,
                  onPressed: () {}),
              const SizedBox(
                width: 200,
                child: TextField(
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.white,  fontSize: 18),
                    hintText: 'Pesquisar',
                    isCollapsed: true,
                  ),
                ),
              ),
              const VerticalDivider(
                color: Colors.white,
                width: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: DropdownButton(
                  onChanged: (value) {},
                  items: const [
                    DropdownMenuItem(
                      value: "bikes",
                      child: Text("Bikes"),
                    ),
                    DropdownMenuItem(
                      value: "peças",
                      child: Text("Peças"),
                    ),
                    DropdownMenuItem(
                      value: "acessorios",
                      child: Text("Acessórios"),
                    ),
                  ],
                  isExpanded: false,
                  hint: const Text(
                    "Itens",
                    style: TextStyle(color: Colors.white),
                  ),

                  underline: Container(), //empty line
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                  dropdownColor: const Color(0xFF006B5A),
                  iconEnabledColor: Colors.white,
                  icon: const Icon(Icons.filter_list_sharp),
                  iconSize: 20, //Icon color
                ),
              )
            ]));
  }
}
