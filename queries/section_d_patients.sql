USE DiagnosticLabDB;
GO

DECLARE @ReportDate DATE = CAST(GETDATE()-1 AS DATE);

SELECT COUNT(*) AS NewPatients
FROM lab.Patient
WHERE RegisteredDate = @ReportDate;

SELECT COUNT(DISTINCT b1.PatientID) AS RepeatPatients
FROM lab.Booking b1
WHERE
    CAST(b1.BookingDate AS DATE) = @ReportDate
    AND EXISTS (
        SELECT 1
        FROM lab.Booking b2
        WHERE
            b2.PatientID = b1.PatientID
            AND b2.BookingDate < b1.BookingDate
    );
