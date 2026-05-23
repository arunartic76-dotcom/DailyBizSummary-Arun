DECLARE @ReportDate DATE = CAST(GETDATE()-1 AS DATE);

-- 1. Total bookings

SELECT COUNT(*) AS TotalBookings
FROM lab.Booking
WHERE CAST(BookingDate AS DATE) = @ReportDate;

-- 2. Total revenue

SELECT SUM(PaidAmount) AS TotalRevenue
FROM lab.Payment
WHERE CAST(PaidOn AS DATE) = @ReportDate;

-- 3. Revenue by payment mode

SELECT
    PaymentMode,
    SUM(PaidAmount) AS Revenue
FROM lab.Payment
WHERE CAST(PaidOn AS DATE) = @ReportDate
GROUP BY PaymentMode;

-- 4. Average booking value

SELECT
    AVG(TotalAmount) AS AvgBookingValue
FROM lab.Booking
WHERE CAST(BookingDate AS DATE) = @ReportDate;

-- 5. Top 3 tests by revenue

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