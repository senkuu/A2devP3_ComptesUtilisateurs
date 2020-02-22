<?php
namespace NWS\liMetier;

interface IComptesRepo {

    /**
     * @return bool vrai si le mail existe déjà en stockage
     */
	public function estCeQueLEmailExiste(string $email) : bool;

    /** 
     * @return bool vrai si le login/mdp existe 
    */
	public function estCeQueLeMotDePasseEstValide(string $email, string $mdp) : bool;

    /**
     * @return null|Error 
     * null si l'ajout a réussi
     * ou une instance d'erreur en cas d'échec
     */ 
    public function ajouterCompte(string $email, string $mdp, string $affichage): Error; 

    /**
     * @return int le nombre de comptes en base 
     */
    public function nombreComptes() : int;

    /**
     * @param string $email
     * @param string $nouveauRole
     * @return Error|null
     */
    public function modifierRole(string $email, string $nouveauRole) : Error;

}

?>