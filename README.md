# Parser & Analisador Léxico — Compiladores

![C](https://img.shields.io/badge/Language-C-blue.svg)
![Flex](https://img.shields.io/badge/Lexer-Flex-orange.svg)
![Yacc](https://img.shields.io/badge/Parser-Yacc%2FBison-green.svg)
![Linux](https://img.shields.io/badge/OS-Linux-FCC624?logo=linux&logoColor=black)

Analisador léxico e sintático desenvolvido para a disciplina de **Compiladores** (4º período) do curso de Bacharelado em Ciência da Computação na **PUC Minas** (campus Poços de Caldas).

---

## 📌 Sobre o Projeto

O objetivo deste projeto é a construção de um analisador sintático (Parser) capaz de processar uma linguagem estruturada (C-Like), validar a conformidade gramatical do código-fonte e construir a tabela de símbolos para verificação de inconsistências.

O pipeline utiliza ferramentas clássicas de compilação em ambiente Unix/Linux:
* **Flex (Fast Lexical Analyzer Generator):** Responsável pela análise léxica e geração de *tokens*.
* **Yacc / Bison (Yet Another Compiler-Compiler):** Responsável pela análise sintática LR e validação das regras gramaticais.
* **Linguagem C:** Utilizada para a implementação das estruturas de dados do compilador, manipulação da tabela de símbolos e lógica de validação.

---

## 📁 Estrutura do Repositório

```text
├── trab3-start-1/             # Código-fonte principal do projeto
│   ├── analex.l               # Especificação léxica (Flex)
│   ├── sint.y                 # Gramática e ações semânticas/sintáticas (Yacc)
│   ├── Tabsimb.h              # Estrutura de dados da Tabela de Símbolos
│   ├── entradas_saidas/       # Casos de teste e arquivos de verificação
│   └── verifica_inconsistencias.sh # Script de automação e testes
├── .gitignore                 # Regras de exclusão de arquivos gerados
└── README.md                  # Documentação do projeto
