       
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CallLinkage.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.

           1 Num1 PIC 99 VALUE 3.
           1 Num2 PIC 99 VALUE 6.

           1 Sum1 PIC 99.

       PROCEDURE DIVISION.

       CALL 'GETSUM' USING Num1, Num2, Sum1.

       DISPLAY Num1 " + " Num2 " = " Sum1.
           
       STOP RUN.