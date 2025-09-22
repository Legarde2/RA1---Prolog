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
rodar_teste(NumeroDoTeste) :-
    writeln('--- Iniciando modo de teste ---'),
    format('Carregando respostas do Teste #~w~n', [NumeroDoTeste]),
    % limpa respostas anteriores da memória
    retractall(resposta(_, _)),
    % Carrega as respostas do teste em questão
    carregar_respostas_teste(NumeroDoTeste),
    writeln('Respostas carregadas. Calculando recomendações...'),
    recomenda(Resultados),
    exibe_resultado(Resultados),
    !.

% RESPOSTAS DOS ARQUIVOS DE TESTE
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
            exibir_justificativa(Trilha), 
            writeln('')
        )
    ).
% Predicado pra justificar a recomendação da trilha
exibir_justificativa(Trilha) :-
    % percore e pega todas as afinidades e seus pesos
    findall(
        Peso-Caracteristica,
        (
            perfil(Trilha, Caracteristica, Peso),
            pergunta(ID, _, Caracteristica),
            resposta(ID, s)
        ),
        ListaDeAfinidades
    ),
    
    ( ListaDeAfinidades \= [] ->
        %Ordena a lista do menor pro maior peso
        keysort(ListaDeAfinidades, ListaOrdenadaAsc),
        
        %Inverte a lista para pegar o maior peso primeiro
        reverse(ListaOrdenadaAsc, [MaiorPeso-PrincipalCaracteristica | _]),
        
        %Exibe a  justificativa
        format('   -> Principal motivo: Sua forte afinidade com ~w (~w pts).', [PrincipalCaracteristica, MaiorPeso])
    ;
        true
    ).