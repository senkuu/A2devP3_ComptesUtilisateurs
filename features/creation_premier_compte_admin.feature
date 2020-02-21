# language: fr

@compte
Fonctionnalité: Créer le premier compte administrateur
    Afin de créer le premier compte administrateur
    En tant que premier utilisateur
    je dois effectuer la première inscription

Scénario: création du premier compte
    Etant donné qu' aucun compte n'existe
    Lorsque je crée un compte
    Alors mon compte est créé avec le rôle admin
