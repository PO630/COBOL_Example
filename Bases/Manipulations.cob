      *|==============================================================|       

       IDENTIFICATION DIVISION.
       PROGRAM-ID. Manipulation.

      *|==============================================================|

       DATA DIVISION.
       WORKING-STORAGE SECTION.
           
           77 a PIC 99.
           
           77 b PIC 99.
           
           77 c PIC 99.

      *|______________________________________________________________|

      *    Instruction de fin de programme.
           77 exitProgramme PIC x(1).

      *|==============================================================|

       SCREEN SECTION.
       
      *    Print c
           1 print-c.
               2 VALUE 'C vaut : '.
               2 PIC 99 FROM c.
      
      *    Print compute
           1 print-compute.
               2 PIC 99 FROM a.
               2 VALUE ' + '.
               2 PIC 99 FROM b.
               2 VALUE ' = '.
               2 PIC 99 FROM c.

      *|______________________________________________________________|

      *    Print \n
           1 next-line.
               2 VALUE X'0A'.

      *    Clear screen
           1 clear.
               2 BLANK SCREEN.
      
      *    Exit prog
           1 s-plg-exit.
               2 LINE 9 COL 8 VALUE 'Exit programme avec entree'.
               2 PIC x(1) To exitProgramme REQUIRED.

      *|==============================================================|

       PROCEDURE DIVISION.
       
      *    int c = 37 + print c
           DISPLAY clear.
           MOVE 37 TO c.
           DISPLAY print-c.

           DISPLAY next-line.
      
      *|______________________________________________________________|

      *    int a = 5
      *    int b = 15
      *    int c = a + b
           MOVE 5 TO a.
           MOVE 15 TO b.
           COMPUTE c = a + b.
           DISPLAY print-compute.

           DISPLAY next-line.

      *|______________________________________________________________|

      *    ADD
           MOVE 5 TO c.
           DISPLAY print-c.

           DISPLAY next-line.

           ADD 2 TO c.
           DISPLAY print-c.

           DISPLAY next-line.

      *|______________________________________________________________|
      
      *    Exit programme.
           DISPLAY next-line.
           DISPLAY s-plg-exit.
           ACCEPT s-plg-exit.
      
      *|==============================================================|
      
      * Fin du programme
       STOP RUN.