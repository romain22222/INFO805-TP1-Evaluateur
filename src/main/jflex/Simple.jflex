/* --------------------------Section de Code Utilisateur---------------------*/
package fr.usmb.m1isc.compilation.simple;
import java_cup.runtime.Symbol;

%%

/* -----------------Section des Declarations et Options----------------------*/
// nom de la class a generer
%class SimpleLexer
%unicode
%line   // numerotation des lignes
%column // numerotation caracteres par ligne

// utilisation avec CUP
// nom de la classe generee par CUP qui contient les symboles terminaux
%cupsym SimpleParserSym
// generation analyser lexical pour CUP
%cup

// code a ajouter dans la classe produite
%{

%}

/* definitions regulieres */
sep       =   [\s\n]
comLigne  =   \/\*[^*]*\*\/
nombre    =   ([1-9][0-9]*)|0
minus     =   \-
plus      =   \+
mult      =   \*
div       =   \/
mod       =   "mod"
endOp     =   ";"
leftBrac  =   "("
rightBrac =   ")"

%% 
/* ------------------------Section des Regles Lexicales----------------------*/

/* regles */
{sep}+           { /* pas d'action */ }
{comLigne}+      { /* pas d'action */ }
{nombre}         { return new Symbol(SimpleParserSym.NOMBRE, yyline, yycolumn, Integer.parseInt(yytext())); }
{endOp}          { return new Symbol(SimpleParserSym.ENDOP, yyline, yycolumn); }
{plus}           { return new Symbol(SimpleParserSym.PLUS, yyline, yycolumn); }
{minus}          { return new Symbol(SimpleParserSym.MINUS, yyline, yycolumn); }
{mult}           { return new Symbol(SimpleParserSym.MULT, yyline, yycolumn); }
{div}            { return new Symbol(SimpleParserSym.DIV, yyline, yycolumn); }
{mod}            { return new Symbol(SimpleParserSym.MOD, yyline, yycolumn); }
{leftBrac}       { return new Symbol(SimpleParserSym.LEFTBRAC, yyline, yycolumn); }
{rightBrac}      { return new Symbol(SimpleParserSym.RIGHTBRAC, yyline, yycolumn); }

