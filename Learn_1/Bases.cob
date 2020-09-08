      *|==============================================================|
      
      * Section information du programme
       IDENTIFICATION DIVISION.
       PROGRAM-ID. NomProgramme.
      
      *|==============================================================|
       
       DATA DIVISION.
      * Section de déclaration des variables
       WORKING-STORAGE SECTION.

      *    Exemple de conception de variable.
      *    77 nomVariable PIC type.

      *    Exemple de variable : int variable de 0 a 9.
           77 variable PIC 9.

      *    Exemple de variable : char[25] nom.
           77 nom PIC x(25).

      *    Instruction de fin de programme.
           77 exitProgramme PIC x(1).

      *    Exemple de Structure de données.
           1 personne.
               2 nomPersonne PIC x(30).
               2 prenomPersonne PIC x(30).
               2 adressePersonne.
                   3 numeroAdresse PIC 9(3).
                   3 rueAdresse PIC x(40).
                   3 codepostalAdresse PIC x(5).
                   3 villeAdresse PIC x(20).
      
      *|==============================================================|
      
      * Section Affichage et entrée
       SCREEN SECTION.
           
      *    Nom de la plage qui sera appeler pour l'affichage
           1 a-plg-titre.
               2 BLANK SCREEN.
               2 LINE 3 COL 15 VALUE 'Bonjour'.

      *    Plage de saisie
           1 s-plg-nom.
               2 LINE 5 COL 8 VALUE 'Quel est votre nom : '.
               2 PIC x(25) To nom REQUIRED.

      *    Retour écran
           1 a-plg-nom.
               2 LINE 7 COL 8 VALUE 'Salut'.
               2 COL 15 PIC x(25) FROM nom.

      *    Exit prog
           1 s-plg-exit.
               2 LINE 9 COL 8 VALUE 'Exit programme avec entree'.
               2 PIC x(1) To exitProgramme REQUIRED.
      
      *|==============================================================|
      
      * Section Code/Instruction programme
       PROCEDURE DIVISION.

      * On affiche le nom de notre programme.
       DISPLAY a-plg-titre.

      * Ensuite on affiche le formulaire de saisie.
       DISPLAY s-plg-nom.
       ACCEPT s-plg-nom.
       DISPLAY a-plg-nom.

      * Exit programme.
       DISPLAY s-plg-exit.
       ACCEPT s-plg-exit.
      
      *|==============================================================|
      
      * Fin du programme
       STOP RUN.