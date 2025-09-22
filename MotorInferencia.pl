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