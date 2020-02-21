# language : fr

@compte
Fonctionnalité: Créer un compte
    Afin de créer un compte sur le site
    En tant que visiteur
    je dois fournir des informations valides

Règles:
- l'identifiant ne doit comporter que des caractères alphanumériques
- l'identifiant doit être unique dans la liste des comptes
- l'email doit respecter la syntaxe de la RFC 822 sans folding et avec un point, tel que pratiqué par le filtre de validation PHP
- l'email doiy être unique dans la liste des comptes
- le mot de passe doit comporter un minimum de 12 caractères et un maximum de 72 dans l'alphabet ANSSI de 70 symboles
- le mot de passe doit contenir au moins une majuscule, une minuscule, un chiffre et un caractère spécial parmi ! # $ * % ?
- le mot de passe ne peut contenir que les caractères de l'aphabet de 70 symboles de l'ANSSI 
- le mot de passe est hashé avec l'algorithme bcrypt/blowfish
- le hash du mot de passe a nécessairement une taille de 60 caractères

Contexte:
Etant donné que les comptes suivants existent:
    | identifiant | email            | hashmotdepasse                                               | 
    | joah        | joah@twoontwo.fr | $2y$10$.vGA1O9wmRjrwAVXD98HNOgsNpDczlqm3Jq7KnEd1rVAGv3Fykk1a |
    | pat         | par@ate.com      | $2y$12$QjSH496pcT5CEbzjD/vtVeH03tfHKFy36d4J0Ltp3lRtee9HDxY3K |

Plan du Scénario: Les informations fournies sont valides
    Etant donné que je suis un visiteur
    Lorsque je fournis l'identifiant <id>, l'email <email> et le mot de passe <mdp>
    Alors mon compte est bien créé et ajouté à la liste des comptes
    
    Exemples:
    | id        | email             |  mdp                     |
    | toto      | toto@example.com  | 12caracteresAu%moins      |



