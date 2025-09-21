# RA1---Prolog
PONTIFÍCIA UNIVERSIDADE CATÓLICA DO PARANÁ

Matéria/Curso: Programação Lógica e Funcional – CIÊNCIA DA COMPUTAÇÃO

Professor: Frank Coelho de Alcantara	 

Nome dos Estudantes/Nome Github: 
Gustavo Lisboa Prestes – Legarde2
Vinícius Edivaldo Souza Penhorato - ViniCodemosSZ

Esse é um trabalho Discente Acadêmico, de um sistema Prolog que recomenda trilhas acadêmicas baseado em respostas do usuário através de pontuação.

Como rodar o projeto:
Pra rodar, você vai precisar do SWISH instalado em sua maquina ou rodando de forma online.

Modo Interativo:
Nesse modo, o programa vai te fazer as perguntas no terminal.

1.  Coloque todos os arquivos `.pl` na mesma pasta.
2.  Abra o terminal do Prolog (SWI-Prolog) nessa pasta.
3.  Carregue o arquivo principal da interface:
    ```prolog
    ?- [interfaceFINAL].
    ```
4.  Depois de carregar, é só chamar o comando `iniciar.` na consulta:
    ```prolog
    ?- iniciar.
    ```
5.  Agora é só responder com `s.` (sim) ou `n.` (não) para cada pergunta.

Modo de Teste:

Nesse modo, o programa lê as respostas de um dos arquivos de teste e já mostra o resultado final.

1.  Siga os passos 1 a 3 do modo interativo para carregar o sistema.
2.  Para rodar um teste, use o comando `rodar_teste/1` com o nome do arquivo entre aspas. Por exemplo:
    ```prolog
    ?- rodar_teste('teste1_dados.pl').
    ```
O sistema vai mostrar o ranking de trilhas recomendado para aquele perfil de teste.
