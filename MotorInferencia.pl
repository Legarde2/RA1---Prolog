calcular_pontuacao_Trilha(Trilha,Pontuacao) :-
% Recebe a trilha, encontra todos os perfis correspondentes
%Cria a ListaDeCriterios com pares (Caracteristica, Peso)
    findall((Caracteristica, Peso),
        perfil(Trilha, Caracteristica, Peso),
        ListaDeCriterios
        
),
calcular_pontuacao(ListaDeCriterios, Pontuacao).

%Parte principal para fazer o calculo da pontuação
calcular_cabeça(Caracteristica, Peso, TotalCabeça) :-
    pergunta(ID, _, Caracteristica),
    resposta(ID, s),
    TotalCabeça = Peso.
calcular_cabeça(_, _, 0).

calcular_pontuacao([(Caracteristica, Peso) | Resto], PontuacaoTotal) :-

    calcular_pontuacao(Resto, SomaResto),
    calcular_cabeça(Caracteristica, Peso, SomaAtual),
    PontuacaoTotal is SomaResto + SomaAtual.
calcular_pontuacao([],0).