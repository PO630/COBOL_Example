      *|==============================================================|       

       IDENTIFICATION DIVISION.
       PROGRAM-ID. Tableaux.

      *|==============================================================|

       DATA DIVISION.
       WORKING-STORAGE SECTION.

           77 n PIC 99.

           77 i PIC 99.

      *|______________________________________________________________|

      *    Tableau int 
           1 tab.
               2 entier PIC 99 OCCURS 99.

      *    Matrice
           1 tab-multi.
               2 ligne OCCURS 3.
                   3 cellule PIC 99 OCCURS 5.

      *    Structure tab
           1 tab-struct.
               2 ligne OCCURS 3.
                   3 cellule OCCURS 5.
                       4 prenom PIC x(20).
                       4 nom PIC x(20).

      *|______________________________________________________________|

      *    Instruction de fin de programme.
           77 exitProgramme PIC x(1).

      *|==============================================================|

       SCREEN SECTION.

           1 input-n.
               2 BLANK SCREEN.
               2 LINE 5 COL 8 VALUE 'Valeur de n : '.
               2 PIC 99 TO n REQUIRED.

           1 print-tab.
               2 VALUE " ".
               2 PIC zz FROM entier(i).
               
      *|______________________________________________________________|

      *    Print \n
           1 next-line.
               2 VALUE ' '.
               2 VALUE X'0A'.

      *    Clear screen
           1 clear.
               2 BLANK SCREEN.
               2 LINE 1 COL 1.
      
      *    Exit prog
           1 s-plg-exit.
               2 LINE 10 COL 1 VALUE 'Exit programme avec entree '.
               2 PIC x(1) To exitProgramme REQUIRED.

      *|==============================================================|

       PROCEDURE DIVISION.

      *    Initialisation

           DISPLAY clear.

           INITIALIZE tab.

           DISPLAY input-n.
           ACCEPT input-n.

           DISPLAY clear.

           PERFORM TEST AFTER VARYING i FROM 1 BY 1 UNTIL i = n 
               MOVE i TO entier(i)
               DISPLAY print-tab
           END-PERFORM.

           

      *|______________________________________________________________|
      
      *    Exit programme.
           DISPLAY next-line.
           DISPLAY s-plg-exit.
           ACCEPT s-plg-exit.
      
      *|==============================================================|
      
      * Fin du programme
       STOP RUN.