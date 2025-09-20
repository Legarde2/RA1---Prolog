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
perfil(ciencia_de_dados, programacao_em_python, 4).
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
perfil(inteligencia_artificial, , 3).

% Segurança da Informação
perfil(seguranca_da_informacao, resolucao_de_problemas, 2).
perfil(seguranca_da_informacao, pensamento_critico, 5).
perfil(seguranca_da_informacao, administracao_de_sistemas, 4).
perfil(seguranca_da_informacao, investigacao, 3).

% Redes e Infraestrutura
perfil(redes_e_infraestrutura, hardware, 4).
perfil(redes_e_infraestrutura, administracao_de_sistemas, 5).
perfil(redes_e_infraestrutura, trabalho_em_equipe, 3).
perfil(redes_e_infraestrutura, resolucao_problemas, 2).

% Perguntas (Id, Texto, Caracteristica)
% ==========================================================

pergunta(1, 'Você tem afinidade com matemática e estatística?', matematica_estatistica).
pergunta(2, 'Você programa ou gostaria de programar em Python?', programacao_python).
pergunta(3, 'Você gosta de resolver problemas práticos do dia a dia?', resolucao_problemas).
pergunta(4, 'Você gosta de se comunicar e apresentar ideias?', comunicacao).

pergunta(5, 'Você gosta de desenvolver interfaces bonitas e usáveis?', design_visual).
pergunta(6, 'Você prefere programar no lado do cliente (frontend)?', frontend).
pergunta(7, 'Você prefere programar no lado do servidor (backend)?', backend).
pergunta(8, 'Você gosta de trabalhar em equipe em projetos de tecnologia?', trabalho_em_equipe).

pergunta(9, 'Você gosta de resolver problemas usando lógica e programação?', logica_programacao).
pergunta(10, 'Você gosta de pesquisar novas soluções para o mercado de I.A?', pesquisa).

pergunta(12, 'Você gosta de investigar problemas de forma crítica?', pensamento_critico).
pergunta(13, 'Você gosta de gerenciar servidores e redes?', administracao_sistemas).
pergunta(14, 'Você gosta de investigar falhas de segurança em sistemas?', investigacao).

pergunta(15, 'Você tem interesse em hardware e infraestrutura física?', hardware).
