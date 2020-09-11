      *|==============================================================|       

       IDENTIFICATION DIVISION.
       PROGRAM-ID. Boucles.

      *|==============================================================|

       DATA DIVISION.
       WORKING-STORAGE SECTION.

           77 val PIC 99.

           77 i PIC 999.

      *|______________________________________________________________|

      *    Instruction de fin de programme.
           77 exitProgramme PIC x(1).

      *|==============================================================|

       SCREEN SECTION.
      
      *    Print val
           1 print-val.
               2 PIC 99 FROM val.

           1 pla-line.
               2 LINE i COL 5 VALUE 'Ligne numero '.
               2 PIC zz FROM i.

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
               2 LINE 12 COL 1 VALUE 'Exit programme avec entree '.
               2 PIC x(1) To exitProgramme REQUIRED.

      *|==============================================================|

       PROCEDURE DIVISION.

           DISPLAY clear.

      *    For 0 to 5 do :
           MOVE 0 TO val.
           PERFORM 5 TIMES
               COMPUTE val = val + 5
           END-PERFORM.

           DISPLAY print-val.
           DISPLAY next-line.

      *|______________________________________________________________|

           DISPLAY clear.

           MOVE 1 TO i.

           PERFORM UNTIL i > 10
               DISPLAY pla-line
               ADD 1 TO i
           END-PERFORM.

      *|______________________________________________________________|

           DISPLAY clear.

           MOVE 42 TO i.

           PERFORM VARYING i FROM 5 BY 2 UNTIL i > 20
               DISPLAY pla-line
           END-PERFORM.

      *|______________________________________________________________|
      
      *    Exit programme.
           DISPLAY next-line.
           DISPLAY s-plg-exit.
           ACCEPT s-plg-exit.
      
      *|==============================================================|
      
      * Fin du programme
       STOP RUN.