# language: fr

@compte
Fonctionnalité: Créer un compte autre que le premier
    Afin de créer un compte sur le site, autre que le premier
    En tant que visiteur
    je dois fournir des informations valides

Règles:
- un id unique de 13 caractères est généré
- le nom affiché doit comporter au moins 3 caractères et au maximum 16
- le nom affiché peut contenir les caractères suivants : alphanumériques, tiret, espace
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
    | idunique      | nomaffiche   | email            | hashmotdepasse                                               | role         |
    | 5e4fe1a279f79 | joe hart     | joah@twoontwo.fr | $2y$12$5CLix/3DpO5Bsi3ySZY15elb5KNe97c1xVLtwZu1GO5AvEm6emOpS | admin        |
    | 5e4fe425bb565 | manip        | manip@data.com   | $2y$12$4hlMYQBPCGVkn1QF65w6DekrJLcTbUnamlYowSlfHfKKtXKX5h3iW | editeur      |
    | 5e4fe1ba31954 | pat          | pat@ate.com      | $2y$12$SzRdZCmULYW0P/MTWcP/ke7vjJNixkv/yApHFYF/ypNCqYIxICmYi | consultant   | 

Plan du Scénario: Les informations fournies sont valides

    Etant donné que je suis un visiteur
    Lorsque je fournis le nom d'affichage <nom>, l'email <email> et le mot de passe <mdp>
    Alors mon compte est bien créé avec le rôle <role> consutlant et ajouté à la liste des comptes
    
    Exemples:
      | nom       | email             |  mdp                      | role       |
      | toto      | toto@example.com  | 12caracteresAu%moins      | consultant |
      | vance     | vance@ajout.org   | #Aa1#Aa1#Aa1#Aa1#Aa1      | consultant |

Scénario: l'email fourni existe déjà
   Etant donné que je suis un visiteur
    Lorsque je fournis le nom d'affichage "nomok", l'email "vance@ajout.org" et le mot de passe "#Aa1#Aa1#Aa1#Aa1#Aa1"
    Alors un message d'erreur est retourné avec le code d'erreur "EMAIL_DEJA_UTILISE" 

Plan du Scénario: Le nom fourni pour l'affichage n'est pas valide
    Etant donné que je suis un visiteur
    Lorsque je fournis le nom d'affichage <nom>, l'email <email> et le mot de passe <mdp>
    Alors un message d'erreur est retourné avec le code d'erreur <codeerreur>
    
    Exemples:
      | nom                      | email             | mdp                 | codeerreur               |                
      | aa                       | mailok.com        | #Aa1#Aa1#Aa1#Aa1#Aa1 | NOM_MINI_3_CARACTERES    |
      | abcdefghijklmnopqrstuvwa | mailok.com        | #Aa1#Aa1#Aa1#Aa1#Aa1 | NOM_MAXI_16_CARACTERES   |
      | aa  # flkj               | mailok.com        | #Aa1#Aa1#Aa1#Aa1#Aa1 | NOM_CARACTERES_INTERDITS |

Plan du Scénario: L'email fourni pour l'affichage n'est pas valide
    Etant donné que je suis un visiteur
    Lorsque je fournis le nom d'affichage <nom>, l'email <email> et le mot de passe <mdp>
    Alors un message d'erreur est retourné avec le code d'erreur <codeerreur>
    
    Exemples:
      | nom     | email             | mdp                  | codeerreur        |                
      | nom ok  | unemail           | #Aa1#Aa1#Aa1#Aa1#Aa1 | MAIL_MAL_FORME    |
      | nom ok  | un email . com    | #Aa1#Aa1#Aa1#Aa1#Aa1 | MAIL_MAL_FORME    |
 
Plan du Scénario: Le mot de passe fourni pour l'affichage n'est pas valide
    Etant donné que je suis un visiteur
    Lorsque je fournis le nom d'affichage <nom>, l'email <email> et le mot de passe <mdp>
    Alors un message d'erreur est retourné avec le code d'erreur <codeerreur>
    
    Exemples:
      | nom     | email       | mdp                                                                         | codeerreur               |                
      | nom ok  | mailok.com  | <#Aa1#Aa1#Aa1#Aa1#Aa1>                                                      | MDP_CARACTERES_INTERDITS |
      | nom ok  | mailok.com  | #Aa1#Aa1#                                                                   | MDP_MINI_12_CARACTERES   |
      | nom ok  | mailok.com  | #Aa1#Aa1#Aa1#Aa1#Aa1#Aa1#Aa1#Aa1#Aa1#Aa1#Aa1#Aa1#Aa1#Aa1#Aa1#Aa1#Aa1#Aa1et1 | MDP_MAXI_72_CARACTERES   |
      | nom ok  | mailok.com  | Aa1Aa1Aa1Aa1Aa1Aa1Aa1Aa1                                                    | MDP_MANQUE_CARAC_SPECIAL |
      | nom ok  | mailok.com  | #Aa#Aa#Aa#Aa#Aa#Aa#Aa#Aa#Aa#Aa                                              | MDP_MANQUE_CHIFFRE       |
      | nom ok  | mailok.com  | #a1#a1#a1#a1#a1#a1#a1#a1#a1                                                 | MDP_MANQUE_MAJUSCULE     |
      | nom ok  | mailok.com  | #A1#A1#A1#A1#A1#A1#A1#A1#A1#A1#A1                                           | MDP_MANQUE_MINUSCULE     |
     
 
