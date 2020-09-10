      *|==============================================================|       

       IDENTIFICATION DIVISION.
       PROGRAM-ID. Conditions.

      *|==============================================================|

       DATA DIVISION.
       WORKING-STORAGE SECTION.

           77 val PIC 999.

      *|______________________________________________________________|

           77 note PIC 99v99.

           88 passable VALUE 10 THRU 11.99.
           88 moyen VALUE 12 THRU 13.99.
           88 bien VALUE 14 THRU 15.99.
           88 parfait VALUE 16 THRU 20.

      *|______________________________________________________________|

      *    Instruction de fin de programme.
           77 exitProgramme PIC x(1).

      *|==============================================================|

       SCREEN SECTION.
      
      *    Print paragraphe
           1 print-paragraphe.
               2 VALUE 'Notion de paragraphe '.

      *|______________________________________________________________|

           1 pla-sup.
               2 VALUE "La valeur de val est superieur ou egale a 100.".

           1 pla-inf.
               2 VALUE "La valeur de val est inferieur a 100.".

      *|______________________________________________________________|

           1 pla-pass.
               2 VALUE 'passable'.
           
           1 pla-moyen.
               2 VALUE 'moyen'.

           1 pla-bien.
               2 VALUE 'bien'.

           1 pla-parfait.
               2 VALUE 'parfait'.

           1 pla-nul.
               2 VALUE 'aucun mention'.

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

           DISPLAY clear.

      *     mon-paragraphe.
      *         DISPLAY print-paragraphe 1.
      *         DISPLAY next-line 2.
               
      *     PERFORM mon-paragraphe.
      *     PERFORM mon-paragraphe.

      *|______________________________________________________________|

           MOVE 50 TO val.

           evaluation.
           IF val < 100 THEN
               DISPLAY pla-inf
           ELSE
               DISPLAY pla-sup
           END-If.

           DISPLAY next-line.

      *|______________________________________________________________|

           MOVE 12 TO note.

           IF passable THEN
               DISPLAY pla-pass
           ELSE
               IF moyen THEN
                   DISPLAY pla-moyen
               ELSE
                   IF bien THEN
                       DISPLAY pla-bien
                   ELSE
                       IF parfait
                           DISPLAY pla-parfait
                       ELSE
                           DISPLAY pla-nul
                       END-IF
                   END-IF
              END-IF
           END-IF.

           DISPLAY next-line.

      *|______________________________________________________________|

      *    Switch sur note : 
      
           EVALUATE note 
           WHEN 10
               DISPLAY pla-pass
           WHEN 12 
               DISPLAY pla-moyen
           WHEN OTHER 
               DISPLAY pla-nul
           END-EVALUATE.

           DISPLAY next-line.

      *|______________________________________________________________|
      
      *    Exit programme.
           DISPLAY next-line.
           DISPLAY s-plg-exit.
           ACCEPT s-plg-exit.
      
      *|==============================================================|
      
      * Fin du programme
       STOP RUN.