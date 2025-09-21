:- dynamic resposta/2.

iniciar :-
    writeln('  Sistema de Recomendação de Trilhas '),
    writeln('Responda as perguntas com s. para sim ou n. para não.'),
    writeln(''),
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


exibe_resultado(Resultados) :-
    writeln('\n--- Recomendações de Trilhas ---'),
    forall(
        member((Pontuacao-Trilha), Resultados),
        (trilha(Trilha, Descricao),
         format('~w (~w pontos): ~w~n', [Trilha, Pontuacao, Descricao]))
    ).
