%Predicado pra gerar ranking final de todas as trilhas
recomenda(RankingFinal):-
    findall(Trilha, trilha(Trilha, _), ListaTrilhas),

calcular_pontuacao_total(ListaTrilhas, ListaPontuacoes),

keysort(ListaPontuacoes, ListaOrdenada),

reverse(ListaOrdenada, RankingFinal).

%Predicado Auxiliar pra transformar a lista de nomes de trilhas em uma lista só com (Pontuacao, Trilha)
calcular_pontuacao_total([], []).
calcular_pontuacao_total([Trilha | RestoTrilha], [(Pontuacao, Trilha) | RestoPontuacao]) :-
    calcular_pontuacao_trilha(Trilha, Pontuacao),
    calcular_pontuacao_total(RestoTrilha, RestoPontuacao).

%Predicado que calcula a Pontuação de uma trilha só
calcular_pontuacao_Trilha(Trilha,Pontuacao) :-
    findall((Caracteristica, Peso),
        perfil(Trilha, Caracteristica, Peso),
        ListaDeCriterios
        
),
calcular_pontuacao(ListaDeCriterios, Pontuacao).

%Parte principal para fazer o calculo para um criterio só
calcular_cabeca(Caracteristica, Peso, TotalCabeça) :-
    pergunta(ID, _, Caracteristica),
    resposta(ID, s),
    TotalCabeça = Peso.
calcular_cabeça(_, _, 0).

%Predicado que Soma os pontos de uma lista de criterios
calcular_pontuacao([],0).
calcular_pontuacao([(Caracteristica, Peso) | Resto], PontuacaoTotal) :-

    calcular_pontuacao(Resto, SomaResto),
    calcular_cabeça(Caracteristica, Peso, SomaAtual),
    PontuacaoTotal is SomaResto + SomaAtual.