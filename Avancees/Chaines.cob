      *|==============================================================|       

       IDENTIFICATION DIVISION.
       PROGRAM-ID. Chaines.

      *|==============================================================|

       DATA DIVISION.
       WORKING-STORAGE SECTION.

           77 chaine PIC x(100).

           78 ma-constante VALUE 'Constante'.

      *|==============================================================|

       SCREEN SECTION.

      *|==============================================================|

       PROCEDURE DIVISION.

           MOVE 'Ma chaine' TO chaine.
      
      *|==============================================================|
      
      * Fin du programme
       STOP RUN.