# Libasm

Bibliotheque de fonctions C reecriture en assembleur x86-64

  

## Description

Ce projet consiste à réécrire certaines fonctions de base de la bibliothèque standard C en langage assembleur (syntaxe Intel, NASM). L'objectif est de comprendre le fonctionnement bas niveau de ces fonctions tout en respectant leurs conventions d'appel et leurs comportements.

## Fonctions implementees

### Mandatory

-	`ft_strlen` - calcule longueur d'une chaine de caracteres
-	`ft_strcpy`	- copy une chaine de caracteres d'une sources vers la destination
-	`ft_strcmp` - compare deux chaines de caracteres
-	`ft_write` - appels systemes d'ecriture
-	`ft_read` - appels systemes de lecture
-	`ft_strdup` - Duplique une chaine de caracteres (avec allocarion memoire)

### Fonction bonus (optionnel)

-	`ft_atoi_base` - Convertie une chaine en entier selon la base donnees
-	`ft_list_push_front` - Ajout un element en debut de liste chainee
-	`ft_list_remove_if` - Retire un element de la liste chainee en fonction d'une fonction
-	`ft_list_size` - Calcul la longueur d'une liste chainee
-	`ft_list_sort` - Trie la liste chainee en fonction d'une fonction donnee (non faite)

## Prerequis

-	**NASM** (Netwide assembler)
-	**GCC** ou autre compilateur c
-	**Make**
-	**Systeme** 64bits (Linux/macOS)

## Installation

```bash

#Cloner le repo ssh
git clone git@github.com:Senkyano/Libasm.git
#Cloner le repo https
git clone https://github.com/Senkyano/Libasm.git

cd libasm

#Compiler la bibliotheque
make

#Compiler les bonus
make bonus
```

## Utilisation

```c
#include "libasm.h"[Votre nom]


int main(void)
{
    char str[] = "Hello, World!";
    char dest[50];
    
    // Utilisation de ft_strlen
    size_t len = ft_strlen(str);
    
    // Utilisation de ft_strcpy
    ft_strcpy(dest, str);
    
    // Utilisation de ft_strcmp
    int cmp = ft_strcmp(str, dest);
    
    return 0;
}
```

Compilation avec votre programme :

```bash
gcc -Wall -Wextra -Werror main.c -L. -lasm -o mon_programme
```

### Structure

```
libasm/
├── Makefile
├── README.md
├── libasm.h          # Header avec prototypes
├── ft_strlen.s
├── ft_strcpy.s
├── ft_strcmp.s
├── ft_write.s
├── ft_read.s
├── ft_strdup.s
├── main.c            # Fichier de test
├── obj/              # Dossier généré lors du make
│   ├── ft_strlen.o
│   ├── ft_strcpy.o
│   └── ...
└── libasm.a          # Bibliothèque générée
```

## Conventions

- **Syntaxe** : Intel (NASM)
- **Calling convention** : System V AMD64 ABI
  - Arguments : `rdi`, `rsi`, `rdx`, `rcx`, `r8`, `r9`
  - Valeur de retour : `rax`
  - Registres à sauvegarder : `rbx`, `rbp`, `r12-r15`


## Gestion des erreurs

Les fonctions gèrent les erreurs de manière identique à leurs équivalents C :

- `ft_write` et `ft_read` retournent -1 en cas d'erreur et positionnent `errno`
- `ft_strdup` retourne NULL en cas d'échec d'allocation
- Les autres fonctions gèrent les pointeurs NULL de manière appropriée

## Auteur

Rithy-Yano HOY