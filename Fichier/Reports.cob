      *|==============================================================|       

       IDENTIFICATION DIVISION.
       PROGRAM-ID. ReportsCob.

      *|==============================================================|

       ENVIRONMENT DIVISION.
           INPUT-OUTPUT SECTION.
           FILE-CONTROL.

               SELECT CustomerReport ASSIGN TO "CustReport.rpt"
                   ORGANIZATION IS LINE SEQUENTIAL.

               SELECT CustomerFile ASSIGN TO "test.dat"
                   ORGANIZATION IS LINE SEQUENTIAL.

      *|==============================================================|

       DATA DIVISION.

           FILE SECTION.

               FD CustomerReport.
                   1 PrintLine PIC X(44).

               FD CustomerFile.
                   1 CustomerData.
                       2 IDNum PIC 9(5).
                       2 CustName.
                           3 FirstName PIC X(15).
                           3 LastName PIC X(15).
                       88 WSEOF VALUE HIGH-VALUE.

           WORKING-STORAGE SECTION.

               1 WSCustomerData.
                   2 WSIDNum PIC 9(5).
                   2 WSCustName.
                       3 WSFirstName PIC X(15).
                       3 WSLastName PIC X(15).

               1 PageHeading.
                   2 FILLER PIC X(13) VALUE "Customer List".
               
               1 PageFooting.
                   2 FILLER PIC X(15) VALUE SPACE.
                   2 FILLER PIC X(7) VALUE "Page : ".
                   2 PrnPageNum PIC Z9.
    
               1 Heads PIC X(36) VALUE "IDNum     FirstName  LastName".
    
               1 CustomerDetailLine.
                   2 FILLER PIC X VALUE SPACE.
                   2 PrnCustId PIC 9(5).
                   2 FILLER PIC X(4) VALUE SPACE.
                   2 PrnFirstName PIC X(15).
                   2 FILLER PIC XX VALUE SPACE.
                   2 PrnLastName PIC X(15).
    
               1 ReportFooting PIC X(13) VALUE "END OF REPORT".
    
               1 LineCount PIC 99 VALUE ZERO.
                   88 NewPageRequired VALUE 40 THRU 99.
    
               1 PageCount PIC 99 VALUE ZERO.

      
      *|==============================================================|
      
       PROCEDURE DIVISION.

           OPEN INPUT CustomerFile.
           OPEN OUTPUT CustomerReport
           PERFORM PrintPageHeading
           READ CustomerFile
               AT END SET WSEOF TO TRUE
           END-READ
           PERFORM PrintReportBody UNTIL WSEOF
           WRITE PrintLine FROM ReportFooting AFTER ADVANCING 5
           LINES
           CLOSE CustomerFile, CustomerReport .
           STOP RUN.

           PrintPageHeading.
           WRITE PrintLine FROM PageHeading AFTER ADVANCING Page
           WRITE PrintLine FROM Heads AFTER ADVANCING 5 LINES
           MOVE 3 TO LineCount
           ADD 1 TO PageCount.

           PrintReportBody.
           IF NewPageRequired
               MOVE PageCount TO PrnPageNum
               WRITE PrintLine FROM PageFooting AFTER
               ADVANCING 5 LINES
               PERFORM PrintPageHeading
           END-IF
           MOVE IDNum TO PrnCustId
           MOVE FirstName TO PrnFirstName
           MOVE LastName TO PrnFirstName
           WRITE PrintLine FROM CustomerDetailLine AFTER
           ADVANCING 1 LINE
           ADD 1 TO LineCount
           READ CustomerFile
               AT END SET WSEOF TO TRUE
           END-READ.

      *|==============================================================|
      * Fin du programme
       STOP RUN.