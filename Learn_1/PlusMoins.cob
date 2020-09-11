      *|==============================================================|       

       IDENTIFICATION DIVISION.
       PROGRAM-ID. PlusOuMoins.

      *|==============================================================|

       DATA DIVISION.
       WORKING-STORAGE SECTION.

           77 seed PIC 9(8) VALUE 0.

           77 nbAleatoire PIC 999.

           77 nbEntree PIC 999.

           77 nbTest PIC 999.

      *|______________________________________________________________|

      *    Instruction de fin de programme.
           77 exitProgramme PIC x(1).

      *|==============================================================|

       SCREEN SECTION.

      *    Print solution
           1 print-nbAleatoire.
               2 PIC 999 FROM nbAleatoire.

      *    Print nombre de Test
           1 print-nbTest.
               2 PIC 999 FROM nbTest.

      *    Print nombre du joueur.
           1 print-nbEntree.
               2 PIC 999 FROM nbEntree.

      *|______________________________________________________________|

      *    Print plus
           1 print-plus.
               2 BLANK SCREEN.
               2 LINE 5 COL 5 VALUE 'C est plus que '.
               2 PIC 999 FROM nbEntree.
               2 VALUE ' / '.
               2 PIC 999 FROM nbAleatoire.

      *    Print moins
           1 print-moins.
               2 BLANK SCREEN.
               2 LINE 5 COL 5 VALUE 'C est moins que '.
               2 PIC 999 FROM nbEntree.
               2 VALUE ' / '.
               2 PIC 999 FROM nbAleatoire.

      *    Print victoire
           1 print-victoire.
               2 BLANK SCREEN.
               2 LINE 5 COL 5 
                   VALUE 'Bravo le nombre etait bien '
                   FOREGROUND-COLOR 15
                   BACKGROUND-COLOR 4.
               2 PIC 999 FROM nbAleatoire              
                   FOREGROUND-COLOR 15
                   BACKGROUND-COLOR 4.

      *    Print victoire
           1 print-victoire-test.
               2 LINE 7 COL 5 VALUE 'Nombre de test '.
               2 PIC 999 FROM nbTest.

      *|______________________________________________________________|
      
      *    Scanf nbEntree
           1 scanf-nbEntree.
               2 LINE 3 COL 5 VALUE 'Entree un nombre entre 0/100 : '.
               2 PIC 999 To nbEntree REQUIRED.

      *|______________________________________________________________|

      *    Print \n
           1 next-line.
               2 VALUE ' '.
               2 VALUE X'0A'.

      *    Clear screen
           1 clear.
               2 BLANK SCREEN.
               2 LINE 1 COL 0.
      
      *    Exit prog
           1 s-plg-exit.
               2 LINE 10 COL 1 VALUE 'Exit programme avec entree '.
               2 PIC x(1) To exitProgramme REQUIRED.

      *|==============================================================|

       PROCEDURE DIVISION.

      *    Initialisation

           DISPLAY clear.

           INITIALIZE nbEntree.
           INITIALIZE nbTest.

           MOVE FUNCTION CURRENT-DATE(9:8) TO seed.
           COMPUTE nbAleatoire = FUNCTION RANDOM(seed) * 100 + 1.

      *|______________________________________________________________|

      *    Jeu

           PERFORM UNTIL nbEntree = nbAleatoire
               
               ADD 1 TO nbTest

               DISPLAY scanf-nbEntree
               ACCEPT scanf-nbEntree

               DISPLAY next-line

               IF nbEntree < nbAleatoire THEN
                   DISPLAY print-plus
               ELSE 
                   IF nbEntree > nbAleatoire THEN
                       DISPLAY print-moins
                   ELSE
                       DISPLAY print-victoire
                       DISPLAY print-victoire-test
                   END-IF
               END-IF

           END-PERFORM.


           
           


      *|______________________________________________________________|
      
      *    Exit programme.
           DISPLAY next-line.
           DISPLAY s-plg-exit.
           ACCEPT s-plg-exit.
      
      *|==============================================================|
      
      * Fin du programme
       STOP RUN.