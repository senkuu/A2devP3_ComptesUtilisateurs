# language: fr

@compte
Fonctionnalité: Me connecter sur le site
    Afin de me connecter
    En tant que visiteur
    je dois fournir un couple email / mot de passe valide

Contexte:
Etant donné que les comptes suivants existent:
    | idunique      | nomaffiche   | email            | hashmotdepasse                                               | role         |
    | 5e4fe1a279f79 | joe hart     | joah@twoontwo.fr | $2y$12$5CLix/3DpO5Bsi3ySZY15elb5KNe97c1xVLtwZu1GO5AvEm6emOpS | admin        |
    | 5e4fe425bb565 | manip        | manip@data.com   | $2y$12$4hlMYQBPCGVkn1QF65w6DekrJLcTbUnamlYowSlfHfKKtXKX5h3iW | editeur      |
    | 5e4fe1ba31954 | pat          | pat@ate.com      | $2y$12$SzRdZCmULYW0P/MTWcP/ke7vjJNixkv/yApHFYF/ypNCqYIxICmYi | consultant   | 


Plan du scénario: Fournir les bons identifiants pour être connecté avec le bon profil 
    Etant donné que je suis déconnecté
    Lorsque je fournis l'email <email> et le mot de passe <mdp>
    Alors je suis connecté avec le rôle <role>
    
    Exemples:
    | email            | mdp          | role       |
    | joah@twoontwo.fr | mdp joe hart | admin      |
    | manip@data.com   | mdp manip    | editeur    |
    | pat@ate.com      | mdp pat      | consultant | 


Scénario: Le mauvais identifiant est fourni
    Etant donné que je suis un visiteur
    Lorsque je fournis l'email inconnu@noone.com
    Alors un message d'erreur est retourné avec le code d'erreur EMAIL_INCONNU et je ne suis pas connecté

Scénario: Le mauvais mot de passe est fourni
    Etant donné que je suis un visiteur
    Lorsque je fournis l'email existant pat@ate.com et le mot de passe erroné motdepasseinconnu
    Alors un message d'erreur est retourné avec le code d'erreur MDP_INCONNU et je ne suis pas connecté