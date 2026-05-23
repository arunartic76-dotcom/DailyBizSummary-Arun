USE DiagnosticLabDB;
GO

SELECT
    Status,
    COUNT(*) AS CountStatus
FROM lab.Report
GROUP BY Status;

SELECT
    SUM(CASE WHEN Status = 'Dispatched' THEN 1 ELSE 0 END) AS Dispatched,
    COUNT(*) AS TotalReports
FROM lab.Report;

SELECT COUNT(*) AS PendingReports
FROM lab.Report
WHERE Status <> 'Dispatched';
