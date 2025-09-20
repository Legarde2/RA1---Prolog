:- dynamic resposta/2.

iniciar :-
    writeln('  Sistema de Recomendação de Trilhas '),
    writeln('Responda as perguntas com s. para sim ou n. para não.'),
    writeln(''),
    faz_perguntas,
    recomenda(Resultados),
    exibe_resultado(Resultados).

faz_perguntas :-
    pergunta(Id, Texto, _),
    format('~w (s/n): ', [Texto]),
    read(Resp),
    (Resp == s ; Resp == n),
    assertz(resposta(Id, Resp)),
    fail.
faz_perguntas.


exibe_resultado(Resultados) :-
    writeln('\n--- Recomendações de Trilhas ---'),
    forall(
        member((Trilha, Pontuacao), Resultados),
        (trilha(Trilha, Descricao),
         format('~w (~w pontos): ~w~n', [Trilha, Pontuacao, Descricao]))
    ).
