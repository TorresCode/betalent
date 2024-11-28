# betalent

# Teste Prático Mobile BeTalent

Este é o **Teste Prático Mobile BeTalent** que consiste em construir a visualização de uma tabela com dados provenientes de uma API simulada. O objetivo deste projeto é demonstrar a capacidade de consumir dados de uma API e apresentá-los de forma eficiente e responsiva em um aplicativo Flutter.

## Sobre o Projeto

O aplicativo exibe uma tabela de funcionários, com as seguintes colunas:

- **Imagem**: Um avatar para cada funcionário.
- **Nome**: O nome completo do funcionário.
- **Cargo**: O cargo do funcionário na empresa.
- **Data de Admissão**: A data de admissão do funcionário no formato `dd/MM/yyyy`.
- **Telefone**: O número de telefone do funcionário, formatado no estilo `(##) #####-####`.

Os dados são consumidos de uma API simulada, que está configurada para rodar localmente usando o **json_server** em Dart. A tabela é exibida dentro de um layout responsivo, permitindo que o usuário veja os dados de maneira clara e organizada. A tabela também possui rolagem horizontal para acomodar todas as colunas.

## Pré-requisitos

Antes de rodar o projeto, você precisa ter os seguintes pré-requisitos instalados:

- **Flutter**: O SDK do Flutter instalado no seu ambiente de desenvolvimento.
  - [Instalar o Flutter](https://flutter.dev/docs/get-started/install)
- **Editor de Código**: Um editor de código, como o **VS Code** ou o **Android Studio**.
- **Emulador/Dispositivo Físico**: Um dispositivo Android ou iOS para executar o aplicativo ou um emulador configurado.
- **json_server para Dart**: O **json_server** em Dart é usado para simular a API. Siga as instruções abaixo para instalá-lo.

### Instalar o json_server para Dart

Para rodar a API simulada, você precisa instalar o `json_server` em Dart. Execute o seguinte comando para instalá-lo globalmente:

```bash
dart pub global activate json_rest_server



Instruções para Rodar a Aplicação
Passo 1: Clonar o repositório
Clone este repositório para a sua máquina local:

bash
Copiar código
git clone https://github.com/seu-usuario/teste-pratico-betalent.git
Passo 2: Navegar até o diretório do projeto
Entre no diretório do projeto:

bash
Copiar código
cd teste-pratico-betalent
Passo 3: Instalar as dependências
Execute o seguinte comando para instalar as dependências do Flutter:

bash
Copiar código
flutter pub get
Passo 4: Configurar o Servidor Simulado
O arquivo database.json está localizado na pasta assets/db/ do projeto e contém os dados simulados da API. Para rodar o servidor local que irá servir os dados desse arquivo, siga os seguintes passos:

Navegue até o diretório onde o arquivo database.json está localizado:

bash
Copiar código
cd assets/db
Execute o comando para rodar o servidor com o json_server:

bash
Copiar código
dart pub global run json_rest_server run database.json
Isso irá iniciar um servidor local que fornecerá os dados do arquivo database.json através de uma API REST.

Passo 5: Alterar o IP da URI no Controller
Por padrão, o servidor do json_server irá rodar localmente no endereço http://127.0.0.1:8080. No código do seu projeto Flutter, dentro do arquivo post_controller.dart, você precisará alterar a URI da API para refletir o endereço correto do servidor.

Abra o arquivo post_controller.dart e localize a linha que define o endereço da API. Se estiver rodando o servidor em um emulador ou no seu próprio computador, o endereço padrão é:

dart
Copiar código
final String apiUrl = "http://127.0.0.1:8080/employees";
Se você estiver rodando o aplicativo em um dispositivo físico, você precisará usar o endereço IP local da sua máquina em vez de 127.0.0.1. Para descobrir o seu IP local, você pode rodar o comando ipconfig (no Windows) ou ifconfig (no Linux/Mac) no terminal, e procurar pelo endereço IPv4 (geralmente algo como 192.168.x.x).

Por exemplo, se o seu IP local for 192.168.0.101, a URI no código deve ser alterada para:

dart
Copiar código
final String apiUrl = "http://192.168.0.101:8080/employees";
Isso é necessário para garantir que o dispositivo físico consiga se conectar ao servidor local, pois 127.0.0.1 refere-se à máquina local apenas para o emulador ou no próprio computador.

Passo 6: Executar o Aplicativo
Agora você pode executar o aplicativo em um emulador ou dispositivo físico. Para rodar o aplicativo, execute:

bash
Copiar código
flutter run
O aplicativo será executado em seu dispositivo/emulador, e você poderá visualizar a tabela com os dados vindos da API simulada.

Passo 7: (Opcional) Executar o projeto com Hot Reload
Caso queira testar alterações de forma mais rápida, utilize o comando Hot Reload:

bash
Copiar código
flutter run --hot
Estrutura do Projeto
lib/: Contém o código principal da aplicação.
main.dart: Ponto de entrada do aplicativo.
home_view.dart: A tela principal onde a tabela é exibida.
post_model.dart: Modelo de dados para representar cada funcionário.
post_controller.dart: Controlador responsável por gerenciar a chamada da API e os dados recebidos.
assets/db/: Pasta onde o arquivo database.json está armazenado.
database.json: Contém os dados simulados que serão consumidos pela API.
assets/: Pasta para armazenar imagens ou outros recursos necessários.