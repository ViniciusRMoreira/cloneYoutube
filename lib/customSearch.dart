import 'package:flutter/material.dart';

class CustomSearchDelete extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, "");
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> lista = [];

    if (query.isNotEmpty) {
      lista = [
        "Sitios",
        "Lotes",
        "Fazendas",
        "Chácaras",
        "JR Imóveis",
        "Cód",
        "Sítio 30.000",
      ].where((texto) => texto.toLowerCase().startsWith(query)).toList();
    } else {
      return Center(
        child: Text("Nenhum resultado encontrado"),
      );
    }
    return ListView.builder(
      itemCount: lista.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            close(context, lista[index]);
          },
          title: Text(lista[index]),
        );
      },
    );
  }
}
