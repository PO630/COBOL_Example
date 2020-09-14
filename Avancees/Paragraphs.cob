      *|==============================================================|       

       IDENTIFICATION DIVISION.
       PROGRAM-ID. Paragraph.

      *|==============================================================|

       DATA DIVISION.
       WORKING-STORAGE SECTION.

      *|==============================================================|

       PROCEDURE DIVISION.

      *    Initialisation

           SubOne.
               DISPLAY "In Paragraph 1"
               PERFORM SubTwo
               DISPLAY "Returned to Paragraph 1"
               PERFORM 2 TIMES
                   DISPLAY "Repeat"
               END-PERFORM
               STOP RUN.

           SubThree.
               DISPLAY "In Paragraph 3".

           SubTwo.
               DISPLAY "In Paragraph 2"
               PERFORM SubThree
               DISPLAY "Return to Paragraph 2".
      
      *|==============================================================|
      
      * Fin du programme
       STOP RUN.