USE DiagnosticLabDB;
GO

DECLARE @ReportDate DATE = CAST(GETDATE()-1 AS DATE);

-- 6. Department-wise revenue

SELECT
    t.Department,
    COUNT(DISTINCT b.BookingID) AS BookingCount,
    SUM(bt.Amount) AS Revenue
FROM lab.Booking b
JOIN lab.BookingTest bt
    ON b.BookingID = bt.BookingID
JOIN lab.Test t
    ON bt.TestID = t.TestID
WHERE CAST(b.BookingDate AS DATE) = @ReportDate
GROUP BY t.Department;

-- 7. Department with highest pending reports

SELECT TOP 1
    t.Department,
    COUNT(*) AS PendingReportCount
FROM lab.Report r
JOIN lab.Booking b
    ON r.BookingID = b.BookingID
JOIN lab.BookingTest bt
    ON b.BookingID = bt.BookingID
JOIN lab.Test t
    ON bt.TestID = t.TestID
WHERE r.Status <> 'Dispatched'
GROUP BY t.Department
ORDER BY PendingReportCount DESC;