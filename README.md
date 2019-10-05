# Prática: Criando um ToDo App

Nessa prática abordaremos criaremos nosso primeiro app em Flutter. 

A ideia aqui é fazer algo prático e do conhecimento da maioria, aproveitando para explanar alguns conceitos que serão úteis no desenvolvimento das suas aplicações.

# Objetivo da prática
Nosso app final deve ser algo parecidoo com 

![Tela Inicial](https://raw.githubusercontent.com/username/projectname/branch/path/to/img.png)



## 1. Baixando o Flutter
Para inciarmos nossa prática vamos fazer o download da SDK. Acesse o link abaixo e faça o download.

[Download Flutter](https://flutter.dev/docs/get-started/install)

**NOTA:** Enquanto baixamos o Flutter já podemos ir abrindo a IDE do Android Studio, para ela baixe algumas coisas.


### 1.1 Selecione uma pasta
Devemos escolher uma pasta para que deixemos a nossa SDK do Flutter.

**NOTA:** É recomendado que não se coloque dentro de pastas que requerem acessos privilegiados.

### 1.2 Adicionar ao `PATH`
Nosso Flutter já funciona, se acessarmos diretamente pela pasta `/bin` já poderemos executar alguns comandos, mas é interessante que adicionemos ao PATH, para que possamos acessar pelo terminal sem ter de direcionar para a pasta.

#### No Windows
----

No menu iniciar vamos procurar pelo item "Edita variáveis de ambiente para esta conta". Procuraremos pelo `PATH` e adicionaremos mais uma entrada, que será direcionada para a pasta `bin` dentro dos arquivos que baixamos do Flutter.

Por exemplo, suponhamos que os arquivos do Flutter encontram-se no caminho `C:\opt\flutter`. Em nosso `PATH` vamos adicionar a entrada `C:\opt\flutter\bin`.

Após isso basta reiniciar e o comando já estará acessível pelo PowerShell.

Para testar podemos executar o comando `flutter --version`

#### No Linux 
----

Em breve....

## O Emulador
Antes de criarmos o projeto e começar a escrever código de fato, é importante que criemos o emulador. Isso a gente vai poder fazer pelo `AVD Manager` do Android Studio. 

Então no Android Studio em Tools > AVD Manager vamos criar um novo device.

Podemos deixar a configuração padrão mesmo e vamos baixar uma imagem do Android, para que nosso emulador funcione. (PODEMOS DEIXAR BAIXANDO E SEGUIR)

**Quem quieser utilizar o próprio celular pode ficar a vontade, na verdade é até melhor. Você pode levar pra casa o que você fez**

Para isso vamos só ativar a função desenvolvedor. Acesse as configurações > Sistema > Sobre o dispositivo.

Toque sobre o número da versão 7 vezes.

Habilite a depuração via USB e pode conectar seu dispositivo. 

Execute o comando `flutter doctor` para ver se seu dispositivo foi reconhecido

## 2. Criando o projeto
Agora que já temos o comando `flutter` acessível, vamos então criar o nosso projeto. Para isso vamos executar o comando:

    flutter create todo_app

Após a execução desse comando, uma pasta com alguns arquivos será criada.

Já podemos testar. Se nosso emulador já está ativo ou nosso celula já conectado vamos então executar.

No VS Code tecle F5 para iniciar a depuração. Veja que o app será executado. Isso pode levar um tempinho.

## 3. Vamos organizar um pouco as coisas
Como podemos perceber nosso arquivo `main.dart` está um pouquinho "poluído". Vamos organizar nosso código com uma estrutura bem simples. Como segue:

- **lib/**
    - **models/**
        - `todo.model.dart`
    - **pages/**
        - `home.page.dart`
    - `app.dart`
    - `main.dart`

Em nosso arquivo main.dart devemos ter somente o seguinte conteúdo:

```dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app.dart';

void main() {
  // Mantém o app funcionando sempre na vertical
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(TodoApp());
}

```

O resto do conteúdo que tinha aqui vai ser distribuído no arquivo `pages/home.page.dart` e no arquivo `app.dart`.

## 4. Nossa tela (Stateless ou Stateful?)
Nossa árvore será algo parecido com:

    Scaffold
        AppBar
            [action] IconButton
        ListView
            Dismissible
                Card
                    Container
                        ListTile

E esse negócio de Stateful ou Stateless? Bom, essa divisão é basicamente sobre se o nosso widget vai ter gerenciamento de estado ou não.

Em nosso caso teremos, pois precisaremos ter uma lista de tarefas, que é dinâmica.


## 5. Nosso modelo
Nosso modelo é uma simples classe com dois atributos apenas, `id` e `descricao`.

## 6. O método `setState()`
Quem já trabalhou com o React Native sabe mais ou menos com este método funciona.

O método setState() faz a atualização de estado e redesenha a tela com as modificações necessárias.

Aqui estaremos utilizando para adicionar e remover elementos da lista, assim a nossa `ListView` precisará ser redesenhada.

## 7. `showAlert()` e `AlertDialog()`

Agora que estamos com a tela criada, vamos adicionar um alert para o registro de uma nova tarefa.

Vamos então criar um método `addTarefa()`. Veja o conteúdo do método:

```dart

    void _addTarefa(context){
    showDialog(
      context: context,
      builder: (BuildContext c) {
        return AlertDialog(
          actions: <Widget>[
            FlatButton(
              child: Text('CANCELAR', style: TextStyle(color: Colors.grey),),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),

            FlatButton(
              child: Text('ADICIONAR'),
              onPressed: (){
                if(_controllerDescricao.text.isNotEmpty) {
                  int id = DateTime.now().millisecond;
                  setState(() {
                    _todoList.add(Todo(
                      id: id,
                      descricao: _controllerDescricao.text
                    ));
                  });

                  _controllerDescricao.clear();
                  Navigator.of(context).pop();
                }
              },
            )
          ],
          title: Text('NOVA TAREFA'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  focusNode: _focusNode,
                  controller: _controllerDescricao,
                  decoration: InputDecoration(
                    labelText: 'Descrição',
                    // border: OutlineInputBorder()
                  ),
                ),

                SizedBox(height: 10.0,),

              ],
            ),
          ),
        );
      }
    );
  }

```

## 8. Testando a nossa aplicação
Já estamos com tudo pronto. Nossa aplicação de ToDo já tem tudo o que precisamos.

Vamso ver se tudo está OK.


## EXTRA: Chega de Android Studio
Se você não quiser utilizar a IDE do Android Studio você não precisa. Para criar estes emuladores você só precisa de verdade da SDK do Android e não da IDE completa.

Tudo que fizemos com os emuladores, podemos fazer via terminal. Vamos então reabrir o nosso emulador via terminal.

Em `AppData\Local\Android\Sdk\` podemos ver os arquivo que compõem a SDK do Android. Executaremos o binário `emulator` para abrir nosso AVD. O comando é o seguinte:

    emulator -avd AVDNAME

