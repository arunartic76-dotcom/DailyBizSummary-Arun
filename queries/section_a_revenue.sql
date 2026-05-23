DECLARE @ReportDate DATE = CAST(GETDATE()-1 AS DATE);

SELECT COUNT(*) AS TotalBookings
FROM lab.Booking
WHERE CAST(BookingDate AS DATE) = @ReportDate;

SELECT SUM(PaidAmount) AS TotalRevenue
FROM lab.Payment
WHERE CAST(PaidOn AS DATE) = @ReportDate;

SELECT
    PaymentMode,
    SUM(PaidAmount) AS Revenue
FROM lab.Payment
WHERE CAST(PaidOn AS DATE) = @ReportDate
GROUP BY PaymentMode;

SELECT
    AVG(TotalAmount) AS AvgBookingValue
FROM lab.Booking
WHERE CAST(BookingDate AS DATE) = @ReportDate;

SELECT TOP 3
    t.TestName,
    SUM(bt.Amount) AS Revenue
FROM lab.BookingTest bt
JOIN lab.Test t
    ON bt.TestID = t.TestID
JOIN lab.Booking b
    ON bt.BookingID = b.BookingID
WHERE CAST(b.BookingDate AS DATE) = @ReportDate
GROUP BY t.TestName
ORDER BY Revenue DESC;
