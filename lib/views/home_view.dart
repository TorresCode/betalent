import 'package:flutter/material.dart';
import 'package:betalent/models/post_model.dart';
import 'package:betalent/controllers/post_controller.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final PostController _controller = PostController();
  final phoneFormatter = MaskTextInputFormatter(mask: '(##) #####-####');

  @override
  void initState() {
    super.initState();
    _controller.callApi();
  }

  String formatDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    return DateFormat('dd/MM/yyyy').format(dateTime); // Exemplo de formatação: "02/12/2019"
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text('CG'),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.notifications),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Funcionários',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
              ),
              const SizedBox(height: 10),
              TextFormField(
                onChanged: _controller.onChanged,
                decoration: InputDecoration(
                  hintStyle: const TextStyle(color: Colors.grey),
                  hintText: 'Pesquisar',
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ValueListenableBuilder<List<PostModel>>(
                valueListenable: _controller.posts,
                builder: (_, value, __) {
                  if (value.isEmpty) {
                    // Exibe o loader enquanto os dados não foram carregados
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  // Exibe a tabela de dados
                  return Center(
  child: SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Container(
      //width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 212, 212, 212),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: DataTable(
        columns: const [
          DataColumn(label: Text('Foto')),
          DataColumn(label: Text('Nome')),
          DataColumn(label: Text('Cargo')),
          DataColumn(label: Text('Data de admissão')),
          DataColumn(label: Text('Telefone')),
        ],
        rows: value
            .map(
              (post) => DataRow(
                cells: [
                  // Adicionando o Avatar (Imagem)
                  DataCell(
                    CircleAvatar(
                      backgroundImage: NetworkImage(post.image), // Usando NetworkImage para URL
                      radius: 20, // Tamanho do avatar
                    ),
                  ),
                  DataCell(Text(post.name)),
                  DataCell(Text(post.job)),
                  DataCell(Text(formatDate(post.admission_date))),
                  DataCell(Text(phoneFormatter.maskText(post.phone))),
                ],
              ),
            )
            .toList(),
        headingRowColor: WidgetStateProperty.resolveWith<Color>(
          (states) => const Color(0xFFedeffb),
        ),
        dataRowColor: WidgetStateProperty.resolveWith<Color>(
          (states) => Colors.white,
        ),
        border: null,
      ),
    ),
  ),
);

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
