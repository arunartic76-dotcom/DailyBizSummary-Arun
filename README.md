# DailyBizSummary

## Problem Summary

This project automates daily business summary reporting for a diagnostic laboratory.
The system tracks bookings, payments, reports, departments, and patient activity using SQL queries and Power BI dashboards.
Automation is implemented to send daily reports through email using Python and Task Scheduler.

---

## Tools Used

- SQL Server Management Studio (SSMS)
- Power BI
- Python
- Windows Task Scheduler
- GitHub

---

## Folder Structure

DailyBizSummary/
├── sql/
├── queries/
├── report/
├── automation/
├── screenshots/
└── README.md

---

## Local Setup

1. Open SQL Server Management Studio
2. Create database: DiagnosticLabDB
3. Run schema.sql
4. Run seed.sql
5. Open Power BI report
6. Configure Python mail automation
7. Schedule automation using Task Scheduler

---

## Running SQL Scripts

- Execute schema.sql first
- Execute seed.sql next
- Run all query files inside /queries

---

## Automation

Python script:
automation/mail_automation.py

Task Scheduler is used for automatic daily execution.

---

## Screenshots

- report_preview.png
- sample_email.png
- flow_run.png

---

## Assumptions

- SQL Server is installed locally
- Python SMTP email is configured
- Power BI Desktop is installed

---

## Limitations

- Local machine dependency
- SMTP authentication required
- Manual Power BI refresh
