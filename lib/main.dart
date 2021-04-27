import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: Colors.purple[300]),
    debugShowCheckedModeBanner: false,
    title: 'ListView',
    initialRoute: '/inicio',
    routes: {
      '/inicio': (context) => MenuInicial(),
      '/principal': (context) => MenuPrincipal(),
      '/list1': (context) => Entrar(),
      '/list2': (context) => Cadastro(),
      '/list3': (context) => Sobre(),
      '/list4': (context) => Vagas(),
      '/segunda': (context) => SegundaTela(),
    },
  ));
}

class Mensagem {
  final String nome;
  final String usuario1;
  final String senha1;
  Mensagem(this.nome, this.usuario1, this.senha1);
}

//
//MENU INICIAL
//
class MenuInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Menu Inicial'), centerTitle: true),
      backgroundColor: Colors.purple[50],
      body: Container(
          padding: EdgeInsets.all(40),

          //
          //ListView
          //
          child: ListView(children: [
            Icon(Icons.grading,size: 120, color: Colors.purple),
            Text(
                'Dream Job é uma das ferramentas mais poderosas para garantir sua recolocação no mercado e encontrar aquele “trabalho dos sonhos".',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    color: Colors.black)),
            SizedBox(height: 40),
            OutlinedButton(
              child: Text('Entrar',
                  style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.normal,
                      color: Colors.black)),
              style: OutlinedButton.styleFrom(
                  primary: Colors.black,
                  backgroundColor: Colors.purple[300],
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: EdgeInsets.all(20)),
              onPressed: () {
                Navigator.pushNamed(context, '/list1');
              },
            ),
            SizedBox(height: 15),
            OutlinedButton(
              child: Text('Criar Cadastro',
                  style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.normal,
                      color: Colors.black)),
              style: OutlinedButton.styleFrom(
                  primary: Colors.black,
                  backgroundColor: Colors.purple[200],
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: EdgeInsets.all(20)),
              onPressed: () {
                Navigator.pushNamed(context, '/list2');
              },
            )
          ])),
    );
  }
}

//
//MENU Principal
//
class MenuPrincipal extends StatefulWidget {
  @override
  _MenuPrincipalState createState() => _MenuPrincipalState();
}

class _MenuPrincipalState extends State<MenuPrincipal> {
  var lista = [];
  var rota = [];

  @override
  void initState() {
    super.initState();
    lista.add('Vagas');
    lista.add('Empresas');
    lista.add('Curriculo');
    lista.add('Favoritos');
    lista.add('Sobre');
    rota.add('/list4');
    rota.add('/list6');
    rota.add('/list5');
    rota.add('/list7');
    rota.add('/list3');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('DREAM JOBS'), centerTitle: true),
        backgroundColor: Colors.purple[50],
        body: Column(children: [
          Container(
            padding: EdgeInsets.fromLTRB(40, 40, 20, 0),
            height: 200,
            child: ListView.builder(
              //Orientação
              scrollDirection: Axis.horizontal,

              //Aparencia o item da lista
              itemBuilder: (context, index) {
                return Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(10),
                  width: 200,
                  height: 200,
                  color: Colors.purple[300],
                  child: ListTile(
                      title: Text(lista[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              fontStyle: FontStyle.normal,
                              color: Colors.black)),
                      onTap: () {
                        Navigator.pushNamed(context, rota[index]);
                      }),
                );
              },

              //Quantidade de itens
              itemCount: 5,
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      width: 200,
                      height: 200,
                      color: Colors.purple[300],
                      child: Row(
                        children: [
                          Image.network(
                              'https://picsum.photos/id/${index + 1}/160'),
                          Expanded(
                            child: Container(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                    'Supervisor de Atendimento\n\n'
                                      'Responsável pelos departamentos de crediário e caixa, realizando a gestão da equipe, garantindo a execução dos procedimentos operacionais e entrega dos resultados',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.black
                                )),
                          )
                        
                      )
                        ]
                      )
                      );
                },

                //Quantidade de itens
                itemCount: 5,
              ),
            ),
          )
        ]));
  }
}

//
//Entrar
//
class Entrar extends StatefulWidget {
  @override
  _EntrarState createState() => _EntrarState();
}

class _EntrarState extends State<Entrar> {
  var txtusuario = TextEditingController();
  var txtsenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(40),
        child: Column(children: [
          Icon(Icons.person, size: 120, color: Colors.purple[100]),
          SizedBox(height: 40),
          TextField(
            controller: txtusuario,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple[300])),
              labelText: 'Usuario',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: txtsenha,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple[300])),
              labelText: 'Senha',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 15),
          Container(
            width: double.infinity,
            child: OutlinedButton(
              child: Text('Entrar',
                  style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.normal,
                      color: Colors.black)),
              style: OutlinedButton.styleFrom(
                  primary: Colors.black,
                  backgroundColor: Colors.purple[300],
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: EdgeInsets.all(20)),
              onPressed: () {
                Navigator.pushNamed(context, '/principal');
              },
            ),
          )
        ]),
      ),
    );
  }
}

//
//Vagas
//
class Vagas extends StatefulWidget {
  @override
  _VagasState createState() => _VagasState();
}

class _VagasState extends State<Vagas> {
  var vagas = [];

  @override
  void initState() {
    super.initState();
    vagas.add('Supervisor de Atendimento\n\n'
        'Responsável pelos departamentos de crediário e caixa, realizando a gestão da equipe, garantindo a execução dos procedimentos operacionais e entrega dos resultados');
    vagas.add('Supervisor de Atendimento\n\n'
        'Responsável pelos departamentos de crediário e caixa, realizando a gestão da equipe, garantindo a execução dos procedimentos operacionais e entrega dos resultados');
    vagas.add('Supervisor de Atendimento\n\n'
        'Responsável pelos departamentos de crediário e caixa, realizando a gestão da equipe, garantindo a execução dos procedimentos operacionais e entrega dos resultados');
    vagas.add('Supervisor de Atendimento\n\n'
        'Responsável pelos departamentos de crediário e caixa, realizando a gestão da equipe, garantindo a execução dos procedimentos operacionais e entrega dos resultados');
    vagas.add('Supervisor de Atendimento\n\n'
        'Responsável pelos departamentos de crediário e caixa, realizando a gestão da equipe, garantindo a execução dos procedimentos operacionais e entrega dos resultados');
    vagas.add('Supervisor de Atendimento\n\n'
        'Responsável pelos departamentos de crediário e caixa, realizando a gestão da equipe, garantindo a execução dos procedimentos operacionais e entrega dos resultados');
    vagas.add('Supervisor de Atendimento\n\n'
        'Responsável pelos departamentos de crediário e caixa, realizando a gestão da equipe, garantindo a execução dos procedimentos operacionais e entrega dos resultados');
    vagas.add('Supervisor de Atendimento\n\n'
        'Responsável pelos departamentos de crediário e caixa, realizando a gestão da equipe, garantindo a execução dos procedimentos operacionais e entrega dos resultados');
    vagas.add('Supervisor de Atendimento\n\n'
        'Responsável pelos departamentos de crediário e caixa, realizando a gestão da equipe, garantindo a execução dos procedimentos operacionais e entrega dos resultados');
    vagas.add('Supervisor de Atendimento\n\n'
        'Responsável pelos departamentos de crediário e caixa, realizando a gestão da equipe, garantindo a execução dos procedimentos operacionais e entrega dos resultados');

  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Vagas de emprego'), centerTitle: true),
        backgroundColor: Colors.grey[100],
        body: Column(
          children: [
            //
            //Vertical
            //
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        width: 200,
                        height: 200,
                        color: Colors.purple[300],
                        child: Row(
                          children: [
                            Image.network(
                                'https://picsum.photos/id/${index + 1}/160'),
                            Expanded(
                              child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text(vagas[index],
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.black)

                                      )),
                            )
                          ],
                        ));
                  },

                  //Quantidade de itens
                  itemCount: 10,
                ),
              ),
            )
          ],
        ));
  }
}

//
//Cadastro
//
class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  var txtnome = TextEditingController();
  var txtusuario1 = TextEditingController();
  var txtsenha1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastrar Usuario')),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(40),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Text('Informe seus dados para cadastrar um novo usuario',
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  color: Colors.black)),

          SizedBox(height: 40),
          TextField(
            controller: txtnome,
            decoration: InputDecoration(
              labelText: 'Informe seu nome',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: txtusuario1,
            decoration: InputDecoration(
              labelText: 'Informe seu usuario',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: txtsenha1,
            decoration: InputDecoration(
              labelText: 'Informe sua senha',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),

          //
          //Troca de dados entre as telas
          //

          OutlinedButton(
            child: Text('Cadastrar',
                style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.normal,
                    color: Colors.black)),
            style: OutlinedButton.styleFrom(
                primary: Colors.black,
                backgroundColor: Colors.purple[300],
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                padding: EdgeInsets.all(20)),
            onPressed: () {
              var msg =
                  Mensagem(txtnome.text, txtusuario1.text, txtsenha1.text);
              Navigator.pushNamed(context, '/segunda', arguments: msg);
            },
          ),
        ]),
      ),
    );
  }
}

class SegundaTela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Receber o objeto da classe Mensagem
    Mensagem msg = ModalRoute.of(context).settings.arguments;
    if (msg == null) {
      msg = Mensagem('', '', '');
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Confirmação'),

        //Remover o icone de voltar
        automaticallyImplyLeading: false,
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(40),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(
                child: Text('Editar',
                    style: TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.normal,
                        color: Colors.black)),
                style: OutlinedButton.styleFrom(
                    primary: Colors.black,
                    backgroundColor: Colors.purple[300],
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    padding: EdgeInsets.all(20)),
                onPressed: () {
                  //Voltar para PrimeiraTela()
                  Navigator.pop(context);
                },
              ),
              OutlinedButton(
                child: Text('Proximo',
                    style: TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.normal,
                        color: Colors.black)),
                style: OutlinedButton.styleFrom(
                    primary: Colors.black,
                    backgroundColor: Colors.purple[300],
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    padding: EdgeInsets.all(20)),
                onPressed: () {
                  Navigator.pushNamed(context, '/list1');
                },
              ),
            ],
          ),
          SizedBox(height: 40),
          Text('Nome',
              style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic)),
          Text(msg.nome, style: TextStyle(fontSize: 24)),
          SizedBox(height: 20),
          Text('Login',
              style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic)),
          Text(msg.usuario1, style: TextStyle(fontSize: 24)),
          SizedBox(height: 20),
          Text('Senha',
              style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic)),
          Text(msg.senha1, style: TextStyle(fontSize: 24)),
        ]),
      ),
    );
  }
}

//
//Sobre
//
class Sobre extends StatefulWidget {
  @override
  _SobreState createState() => _SobreState();
}

class _SobreState extends State<Sobre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Sobre'), centerTitle: true),
        backgroundColor: Colors.grey[100],
        body: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        width: 200,
                        height: 200,
                        color: Colors.purple[300],
                        child: Row(
                          children: [
                            Image.network('lib/imagens/foto.jpeg'),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                    'Ana Carolina Alves Batista de Oliveira - 828479.\n\n'
                                    'Esse projeto tem com objetivo desenvolver um aplicativo de buscar por emprego'),
                              ),
                            )
                          ],
                        ));
                  },

                  //Quantidade de itens
                  itemCount: 1,
                ),
              ),
            )
          ],
        ));
  }
}
