# RA1---Prolog
### PONTIFÍCIA UNIVERSIDADE CATÓLICA DO PARANÁ

**Matéria/Curso:** Programação Lógica e Funcional – CIÊNCIA DA COMPUTAÇÃO
**Professor:** Frank Coelho de Alcantara

**Nome dos Estudantes/Nome Github:**
* Gustavo Lisboa Prestes – Legarde2
* Vinícius Edivaldo Souza Penhorato - ViniCodemosSZ

---

Esse é um trabalho Discente Acadêmico, de um sistema Prolog que recomenda trilhas acadêmicas baseado em respostas do usuário através de pontuação.

## Como Rodar o Projeto (Online)

Para rodar o projeto, você vai precisar apenas de um navegador de internet para acessar o ambiente online SWISH. Este método utiliza o arquivo `sistema_completo.pl`, que une todo o código do projeto em um só lugar para garantir a compatibilidade, mas é possivel tambem juntar todos os codigos do projeto em um unico arquivo manualmente e rodar da mesma maneira.

### Passo a Passo

1.  **Acesse o site do SWISH:**
    * [https://swish.swi-prolog.org/](https://swish.swi-prolog.org/)

2.  **Prepare o Ambiente:**
    * Na janela de código ("Program", à esquerda), apague todo o conteúdo de exemplo.

3.  **Carregue o Código do Projeto:**
    * Copie o conteúdo **inteiro** do arquivo `sistema_completo.pl`.
    * Cole o código copiado na janela "Program" do SWISH.

4.  **Execute o Sistema:**
    * Na janela da direita ("Query"), digite os comandos para rodar o sistema.

---

### Executando o Modo Interativo

Neste modo, o sistema fará as perguntas diretamente para você.

* Na janela "Query", digite o comando e pressione "Run":
    ```prolog
    iniciar.
    ```
* Responda às perguntas com `s.` ou `n.` na própria área de consulta.

### Executando o Modo de Teste

Neste modo, o sistema usa perfis de teste pré-definidos para gerar um resultado automaticamente.

* Na janela "Query", digite um dos seguintes comandos e pressione "Run":

    * Para o perfil de Ciência de Dados:
        ```prolog
        rodar_teste(1).
        ```
    * Para o perfil de Desenvolvimento Web:
        ```prolog
        rodar_teste(2).
        ```
    * Para o perfil de Segurança e Infraestrutura:
        ```prolog
        rodar_teste(3).
        ```
