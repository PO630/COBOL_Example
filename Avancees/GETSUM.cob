      *    cobc -m GETSUM.cob
 
       IDENTIFICATION DIVISION.
       PROGRAM-ID. GETSUM.
       
       DATA DIVISION.
           LINKAGE SECTION.

           1 LNum1 PIC 99.
           1 LNum2 PIC 99.

           1 LSum1 PIC 99.

       PROCEDURE DIVISION USING LNum1, LNum2, LSum1.
           
           COMPUTE LSum1 = LNum1 + LNum2.

       EXIT PROGRAM.