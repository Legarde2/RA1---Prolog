:- dynamic resposta/2.

% Trilhas Acadêmicas
% ==========================================================
trilha(ciencia_de_dados, 'Análise e interpretação de grandes volumes de dados para extrair conhecimento.').
trilha(desenvolvimento_web, 'Criação de aplicações web.').
trilha(inteligencia_artificial, 'Criação de sistemas com algoritmos inteligentes.').
trilha(seguranca_da_informacao, 'Proteção de dados sensíveis.').
trilha(redes_e_infraestrutura, 'Gerenciamento de conexões entre redes e servidores.').

% Formato: perfil(Trilha, Caracteristica, Peso).
% ==========================================================

% Ciência de Dados
perfil(ciencia_de_dados, matematica_estatistica, 5).
perfil(ciencia_de_dados, programacao_python, 4).
perfil(ciencia_de_dados, resolucao_de_problemas, 3).
perfil(ciencia_de_dados, comunicacao, 2).

% Desenvolvimento Web
perfil(desenvolvimento_web, design_visual, 5).
perfil(desenvolvimento_web, frontend, 4).
perfil(desenvolvimento_web, backend, 3).
perfil(desenvolvimento_web, trabalho_em_equipe, 2).

% Inteligência Artificial
perfil(inteligencia_artificial, logica_programacao, 5).
perfil(inteligencia_artificial, matematica_estatistica, 4).
perfil(inteligencia_artificial, pesquisa, 2).
perfil(inteligencia_artificial, resolucao_de_problemas, 3).

% Segurança da Informação
perfil(seguranca_da_informacao, resolucao_de_problemas, 2).
perfil(seguranca_da_informacao, pensamento_critico, 5).
perfil(seguranca_da_informacao, administracao_de_sistemas, 4).
perfil(seguranca_da_informacao, investigacao, 3).

% Redes e Infraestrutura
perfil(redes_e_infraestrutura, hardware, 4).
perfil(redes_e_infraestrutura, administracao_de_sistemas, 5).
perfil(redes_e_infraestrutura, trabalho_em_equipe, 3).
perfil(redes_e_infraestrutura, resolucao_de_problemas, 2).

% Perguntas (Id, Texto, Caracteristica)
% ==========================================================

pergunta(1, 'Você tem afinidade com matemática e estatística?', matematica_estatistica).
pergunta(2, 'Você programa ou gostaria de programar em Python?', programacao_python).
pergunta(3, 'Você gosta de resolver problemas práticos do dia a dia?', resolucao_de_problemas).
pergunta(4, 'Você gosta de se comunicar e apresentar ideias?', comunicacao).
pergunta(5, 'Você gosta de desenvolver interfaces bonitas e usáveis?', design_visual).
pergunta(6, 'Você prefere programar no lado do cliente (frontend)?', frontend).
pergunta(7, 'Você prefere programar no lado do servidor (backend)?', backend).
pergunta(8, 'Você gosta de trabalhar em equipe em projetos de tecnologia?', trabalho_em_equipe).
pergunta(9, 'Você gosta de resolver problemas usando lógica e programação?', logica_programacao).
pergunta(10, 'Você gosta de pesquisar novas soluções para o mercado de I.A?', pesquisa).
pergunta(11, 'Você gosta de investigar problemas de forma crítica?', pensamento_critico).
pergunta(12, 'Você gosta de gerenciar servidores e redes?', administracao_de_sistemas).
pergunta(13, 'Você gosta de investigar falhas de segurança em sistemas?', investigacao).
pergunta(14, 'Você tem interesse em hardware e infraestrutura física?', hardware).

% Predicado principal para gerar o ranking final de todas as trilhas.
recomenda(RankingFinal) :-
    findall(Trilha, trilha(Trilha, _), ListaTrilhas),
    calcular_pontuacao_total(ListaTrilhas, ListaPontuacoes),
    keysort(ListaPontuacoes, ListaOrdenada),
    reverse(ListaOrdenada, RankingFinal).

% Predicado para transformar a lista de nomes de trilhas em uma lista de pares (Pontuacao-Trilha).
calcular_pontuacao_total([], []).
calcular_pontuacao_total([Trilha | RestoTrilha], [(Pontuacao-Trilha) | RestoPontuacao]) :-
    calcular_pontuacao_trilha(Trilha, Pontuacao),
    calcular_pontuacao_total(RestoTrilha, RestoPontuacao).

% Predicado que calcula a pontuação para uma única trilha.
calcular_pontuacao_trilha(Trilha, Pontuacao) :-
    findall((Caracteristica, Peso),
        perfil(Trilha, Caracteristica, Peso),
        ListaDeCriterios
    ),
    calcular_pontuacao(ListaDeCriterios, Pontuacao).

% Predicado que soma os pontos de uma lista de critérios (caracteristicas).
calcular_pontuacao([], 0).
calcular_pontuacao([(Caracteristica, Peso) | Resto], PontuacaoTotal) :-
    calcular_pontuacao(Resto, SomaResto),
    calcular_cabeca(Caracteristica, Peso, SomaAtual),
    PontuacaoTotal is SomaResto + SomaAtual.

% Predicado que verifica se a resposta para a caracteristica foi 's' e atribui o peso.
% Se a resposta for 's', o total é o peso. Caso contrário, é 0.
calcular_cabeca(Caracteristica, Peso, TotalCabeça) :-
    pergunta(ID, _, Caracteristica),
    resposta(ID, s), !, % impede backtracking desnecessário
    TotalCabeça = Peso.
calcular_cabeca(_, _, 0).

% Modo Interativo
iniciar :-
    writeln('  Sistema de Recomendação de Trilhas '),
    writeln('Responda as perguntas com s. para sim ou n. para não.'),
    writeln(''),
    retractall(resposta(_, _)), 
    faz_perguntas,
    recomenda(Resultados),
    exibe_resultado(Resultados),
    !.

faz_perguntas :-
    forall(
        pergunta(Id, Texto, _),
        (
            repeat,
                format('~w (s/n): ', [Texto]),
                read(Resp),
                (Resp == s ; Resp == n), !,
            assertz(resposta(Id, Resp))
        )
    ).

% Modo para ler arquivo teste
rodar_teste(NumeroDoTeste) :-
    writeln('--- Iniciando modo de teste ---'),
    format('Carregando respostas do Teste #~w~n', [NumeroDoTeste]),
    % Limpa respostas anteriores da memória
    retractall(resposta(_, _)),
    carregar_respostas_teste(NumeroDoTeste),
    writeln('Respostas carregadas. Calculando recomendações...'),
    recomenda(Resultados),
    exibe_resultado(Resultados),
    !.

carregar_respostas_teste(1) :-
    % Perfil: Aluno com forte inclinação para matemática, lógica e dados.
    assertz(resposta(1, s)),  assertz(resposta(2, s)),  assertz(resposta(3, s)),
    assertz(resposta(4, n)),  assertz(resposta(5, n)),  assertz(resposta(6, n)),
    assertz(resposta(7, n)),  assertz(resposta(8, n)),  assertz(resposta(9, s)),
    assertz(resposta(10, s)), assertz(resposta(11, s)), assertz(resposta(12, n)),
    assertz(resposta(13, n)), assertz(resposta(14, n)).

carregar_respostas_teste(2) :-
    % Perfil: Aluno com forte interesse na criação de aplicações web, design e trabalho em equipe.
    assertz(resposta(1, n)),  assertz(resposta(2, n)),  assertz(resposta(3, s)),
    assertz(resposta(4, s)),  assertz(resposta(5, s)),  assertz(resposta(6, s)),
    assertz(resposta(7, s)),  assertz(resposta(8, s)),  assertz(resposta(9, n)),
    assertz(resposta(10, n)), assertz(resposta(11, n)), assertz(resposta(12, n)),
    assertz(resposta(13, n)), assertz(resposta(14, n)).

carregar_respostas_teste(3) :-
    % Perfil: Aluno com interesse em pensamento crítico, investigação e administração de sistemas.
    assertz(resposta(1, n)),  assertz(resposta(2, n)),  assertz(resposta(3, s)),
    assertz(resposta(4, n)),  assertz(resposta(5, n)),  assertz(resposta(6, n)),
    assertz(resposta(7, n)),  assertz(resposta(8, s)),  assertz(resposta(9, n)),
    assertz(resposta(10, n)), assertz(resposta(11, s)), assertz(resposta(12, s)),
    assertz(resposta(13, s)), assertz(resposta(14, s)).

%  EXIBIÇÃO DE RESULTADOS E JUSTIFICATIVAS 
exibe_resultado(Resultados) :-
    writeln('\n--- Recomendações de Trilhas ---'),
    forall(
        member((Pontuacao-Trilha), Resultados),
        (
            trilha(Trilha, Descricao),
            format('~w (~w pontos): ~w~n', [Trilha, Pontuacao, Descricao]),
            exibe_justificativa(Trilha), 
            writeln('')
        )
    ).

% Predicado pra justificar a recomendação
exibe_justificativa(Trilha) :-
    write('   -> Justificativa: Pontos obtidos por afinidade com '),
    findall(
        Caracteristica,
        (perfil(Trilha, Caracteristica, _), pergunta(ID, _, Caracteristica), resposta(ID, s)),
        ListaDeAfinidades
    ),
    ( ListaDeAfinidades = [] ->
        write('nenhuma característica específica respondida com "sim".')
    ;
        atomic_list_concat(ListaDeAfinidades, ', ', AfinidadesString),
        write(AfinidadesString), write('.')
    ).