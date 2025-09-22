:- [base_conhecimento, 'MotorInferencia']. % Carrega os codigos anteriores

:- dynamic resposta/2.

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
rodar_teste(ArquivoTeste) :-
    writeln('--- Iniciando modo de teste ---'),
    format('Carregando respostas do arquivo: ~w~n', [ArquivoTeste]),
    % Limpa respostas anteriores da memória
    retractall(resposta(_, _)),
    % Carrega as respostas do arquivo de teste
    consult(ArquivoTeste),
    writeln('Respostas carregadas. Calculando recomendações...'),
    recomenda(Resultados),
    exibe_resultado(Resultados),
    !.

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