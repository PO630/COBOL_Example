      *|==============================================================|       

       IDENTIFICATION DIVISION.
       PROGRAM-ID. WriteFile.

      *|==============================================================|

       ENVIRONMENT DIVISION.
           INPUT-OUTPUT SECTION.
           FILE-CONTROL.
               SELECT DataFile ASSIGN TO "test.dat"
                   ORGANIZATION IS LINE SEQUENTIAL
                   ACCESS IS SEQUENTIAL.

      *|==============================================================|

       DATA DIVISION.

           FILE SECTION.

               FD DataFile.
                   1 CustomerData.
                       2 IDNum PIC 9(5).
                       2 CustName.
                           3 FirstName PIC X(15).
                           3 LastName PIC X(15).

           WORKING-STORAGE SECTION.

               1 WSCustomerData.
                   2 WSIDNum PIC 9(5).
                   2 WSCustName.
                       3 WSFirstName PIC X(15).
                       3 WSLastName PIC X(15).

               1 WSEOF PIC A(1).

      *|==============================================================|

       SCREEN SECTION.

      *|==============================================================|

       PROCEDURE DIVISION.

      *     OPEN OUTPUT DataFile.
      *         MOVE 00001 TO IDNum.
      *         MOVE 'Doug' TO FirstName.
      *         MOVE 'Thomas' TO LastName.
      *         WRITE CustomerData
      *         END-WRITE.
      *     CLOSE DataFile.

      *     OPEN EXTEND DataFile.
      *         DISPLAY "Customer Id " WITH NO ADVANCING
      *         ACCEPT IDNum
      *         DISPLAY "Customer First name " WITH NO ADVANCING
      *         ACCEPT FirstName
      *         DISPLAY "Customer Last name " WITH NO ADVANCING
      *         ACCEPT LastName
      *         WRITE CustomerData
      *         END-WRITE.
      *     CLOSE DataFile.


           OPEN INPUT DataFile.
               PERFORM UNTIL WSEOF='Y'
                   READ DataFile INTO WSCustomerData
                       AT END MOVE 'Y' TO WSEOF
                       NOT AT END DISPLAY WSCustomerData
                   END-READ
               END-PERFORM
           CLOSE DataFile.
      
      *|==============================================================|
      
      * Fin du programme
       STOP RUN.