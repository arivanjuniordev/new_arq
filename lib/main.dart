import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:new_arq/data/cep/repositories/cep_repository_remote.dart';
import 'package:new_arq/data/cep/services/cep_service.dart';
import 'package:new_arq/ui/home_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final Dio dio;
  late final CepService cepService;
  late final CepRepositoryRemote cepRepositoryRemote;
  late final HomeViewModel homeViewModel;

  final _controller = TextEditingController(text: '01001000');

  @override
  void initState() {
    super.initState();
    dio = Dio();
    cepService = CepService(htppClient: dio);
    cepRepositoryRemote = CepRepositoryRemote(cepService: cepService);
    homeViewModel = HomeViewModel(cepRepositoryRemote: cepRepositoryRemote);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListenableBuilder(
          listenable: homeViewModel.getCep,
          builder: (context, child) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    controller: _controller,
                  ),
                  if (homeViewModel.getCep.running)
                    const CircularProgressIndicator(),
                  if (homeViewModel.cepEntity != null)
                    Column(
                      children: [
                        Text(homeViewModel.cepEntity!.cep),
                        Text(homeViewModel.cepEntity!.logradouro),
                        Text(homeViewModel.cepEntity!.bairro),
                        Text(homeViewModel.cepEntity!.localidade),
                        Text(homeViewModel.cepEntity!.uf),
                      ],
                    ),
                ],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await homeViewModel.getCep.execute(_controller.text);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
