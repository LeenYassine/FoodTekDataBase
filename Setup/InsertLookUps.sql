INSERT INTO [Status] (StatusEN,StatusAR,StatusCode)
VALUES
('Blocked','تم الحظر','01'),
('Active','نشط','02'),
('Not Activated Yet',' لم يتم تنشيطه بعد','03'),
('Forbidden','محروم','04'),
('Open','فتح','05'),
('Pending','قيد الانتظار ','06'),
('Waiting Customer Response','رد العميل المنتظر','07'),
('Closed','مغلق','08'),
('Canceled','إلغاء','09'),
('Complete','اكتملت','010'),
('On Shipment','تنتظر الشحن','011')


INSERT INTO NotificationTypes (NotificationCode , TypeNameEN , TypeNameAR)
VALUES
('001','Issue','مشكلة'),
('002','Support','دعم'),
('003','New Order','طلب جديد '),
('004','New System Action','إجراء جديد للنظام')  
