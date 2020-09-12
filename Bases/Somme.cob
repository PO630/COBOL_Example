      *|==============================================================|       

       IDENTIFICATION DIVISION.
       PROGRAM-ID. Somme.

      *|==============================================================|

       DATA DIVISION.
       WORKING-STORAGE SECTION.
           
           77 valeur-a PIC 99.
           
           77 valeur-b PIC 99.
           
           77 result-a-b PIC 99.

      *|______________________________________________________________|

      *    Instruction de fin de programme.
           77 exitProgramme PIC x(1).

      *|==============================================================|

       SCREEN SECTION.

      *    Print a
           1 print-a.
               2 PIC 99 FROM valeur-a.

      *    Print b
           1 print-b.
               2 PIC 99 FROM valeur-b.
      
      *    Print result
           1 print-result.
               2 PIC 99 FROM result-a-b.
      
      *|______________________________________________________________|

      *    Scanf a
           1 scanf-a.
               2 VALUE 'A = '.
               2 PIC 99 To valeur-a REQUIRED.

      *    Scanf b
           1 scanf-b.
               2 VALUE 'B = '.
               2 PIC 99 To valeur-b REQUIRED.

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
               2 VALUE 'Exit programme avec entree '.
               2 PIC x(1) To exitProgramme REQUIRED.

      *|==============================================================|

       PROCEDURE DIVISION.

           DISPLAY clear.
       
      *    Entree la valeur de a.
           DISPLAY scanf-a.
           ACCEPT scanf-a.

           DISPLAY next-line.

      *    Entree la valeur de b.
           DISPLAY scanf-b.
           ACCEPT scanf-b.

           DISPLAY next-line.

      *|______________________________________________________________|

           COMPUTE result-a-b = valeur-a + valeur-b.

           DISPLAY print-result.

           DISPLAY next-line.

      *|______________________________________________________________|
      
      *    Exit programme.
           DISPLAY next-line.
           DISPLAY s-plg-exit.
           ACCEPT s-plg-exit.
      
      *|==============================================================|
      
      * Fin du programme
       STOP RUN.