%%% Fatos %%%

% Origens da linguagem de programação go segundo a Wikipedia.

baseadaEm(go,	limbo).
baseadaEm(go,	apl).
baseadaEm(go,	oberon).
baseadaEm(go,	occam).
baseadaEm(go,	smalltalk).
baseadaEm(alef,	newsqueak).
baseadaEm(bcpl,	cpl).
baseadaEm(c,	b).
baseadaEm(c,	algol).
baseadaEm(b,	bcpl).
baseadaEm(algol,	fortran).
baseadaEm(limbo,	pascal).
baseadaEm(limbo,	alef).
baseadaEm(pascal,	algol).
baseadaEm(modula,	pascal).
baseadaEm(newsqueak,	c).
baseadaEm(newsqueak,	csp).
baseadaEm(oberon,	modula).
baseadaEm(occam,	csp).
baseadaEm(smalltalk,	simula).
baseadaEm(simula,	algol).

% Paradigmas das linguagens de programação acima segundo a Wikipedia.

paradigma(go,	concorrente).
paradigma(go,	funcional).
paradigma(go,	imperativa).
paradigma(go,	oo).
paradigma(alef,	concorrente).
paradigma(alef,	estruturada).
paradigma(apl,	funcional).
paradigma(apl,	estruturada).
paradigma(apl,	modular).
paradigma(bcpl,	procedural).
paradigma(bcpl,	imperativa).
paradigma(bcpl,	estruturada).
paradigma(c,	procedural).
paradigma(c,	imperativa).
paradigma(c,	estruturada).
paradigma(csp,	concorrente).
paradigma(limbo,	concorrente).
paradigma(modula,	imperativa).
paradigma(modula,	estruturada).
paradigma(modula,	modular).
paradigma(newsqueak,	concorrente).
paradigma(oberon,	imperativa).
paradigma(oberon,	estruturada).
paradigma(oberon,	modular).
paradigma(oberon,	oo).
paradigma(occam,	imperativa).
paradigma(occam,	procedural).
paradigma(occam,	concorrente).
paradigma(smalltalk,	oo).
paradigma(fortran,	estruturada).
paradigma(fortran,	imperativa).
paradigma(fortran,	procedural).
paradigma(fortran,	oo).
paradigma(fortran,	generica).
paradigma(pascal,	imperativa).
paradigma(pascal,	estruturada).
paradigma(algol,	procedural).
paradigma(algol,	imperativa).
paradigma(algol,	estruturada).


% Versões de Go.
versao(go,	1.00,	2012).
versao(go,	1.01,	2013).
versao(go,	1.02,	2013).
versao(go,	1.03,	2014).
versao(go,	1.04,	2014).
versao(go,	1.05,	2015).
versao(go,	1.06,	2016).
versao(go,	1.07,	2016).
versao(go,	1.08,	2017).
versao(go,	1.09,	2017).
versao(go,	1.10,	2018).
versao(go,	1.11,	2018).
versao(go,	1.12,	2019).
versao(go,	1.13,	2019).
versao(go,	1.14,	2020).

versaoMaisRecente(go, 1.14).

%%% Regras %%%

% Descendência transitiva na genealogia das linguagens.
descendente(X, Y) :- baseadaEm(X, Y).
descendente(X, Y) :- baseadaEm(X, A), descendente(A, Y).

% Hiato entre versões.
versaoAnterior(V1, V2) :- V1 is V2 - 0.01.
hiato(LP, Versao, Hiato) :-
    versaoAnterior(VersaoAnterior, Versao),
    versao(LP, VersaoAnterior, AnoAnterior),
    versao(LP, Versao, Ano),
    Hiato is Ano - AnoAnterior.
versaoSeguinte(V2, V1) :- V2 is V1 + 0.01.
hiatoReverso(LP, Versao, Hiato) :-
    versaoSeguinte(VersaoSeguinte, Versao),
    versao(LP, Versao, Ano),
    versao(LP, VersaoSeguinte, AnoSeguinte),
    Hiato is AnoSeguinte - Ano.


%%% Objetivos %%%

% Genealogia de go:
% ?- descendente(go, LP).

% Paradigmas de go:
% ?- paradigma(go, Paradigma).
% concorrente
% funcional
% imperativa
% oo

% De onde go herdou seus paradigmas (substituir 'oo' por outros):
% ?- descendente(go, LP), paradigma(LP, oo).

% Ano da primeira e última versão de go.
% ?- versao(go, 1.00, Ano).
% ?- versaoMaisRecente(go, Versao), versao(go, Versao, Ano).

% Maior hiato entre versões de go.
% ?- hiato(go, 1.01, Hiato).
% ?- hiatoReverso(go, 1.00, Hiato).