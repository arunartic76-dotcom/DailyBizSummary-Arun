USE DiagnosticLabDB;
GO

-- 8. Report status counts

SELECT
    Status,
    COUNT(*) AS CountStatus
FROM lab.Report
GROUP BY Status;

-- 9. Reports dispatched vs total

SELECT
    SUM(CASE WHEN Status = 'Dispatched' THEN 1 ELSE 0 END) AS Dispatched,
    COUNT(*) AS TotalReports
FROM lab.Report;

-- 10. Total pending reports

SELECT COUNT(*) AS PendingReports
FROM lab.Report
WHERE Status <> 'Dispatched';