import smtplib
from email.message import EmailMessage

EMAIL_ADDRESS = "user@gmail.com"
EMAIL_PASSWORD = "mwyinbhbzhbxgppk"

msg = EmailMessage()
msg['Subject'] = 'Daily Business Summary Report'
msg['From'] = EMAIL_ADDRESS
msg['To'] = 'manager@gmail.com'

msg.set_content('Please find attached the daily business summary report.')

with open(r"C:\Users\HP\Desktop\DiagnosticLab_Project\report\DailySummary.pdf", 'rb') as f:
    file_data = f.read()

msg.add_attachment(file_data,
                   maintype='application',
                   subtype='pdf',
                   filename='DailySummary.pdf')

with smtplib.SMTP_SSL('smtp.gmail.com', 465) as smtp:
    smtp.login(EMAIL_ADDRESS, EMAIL_PASSWORD)
    smtp.send_message(msg)

print("Mail Sent Successfully")