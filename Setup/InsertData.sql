INSERT INTO Users (FirstNameEN, FirstNameAR, LastNameEN, LastNameAR, Username, Email, [Password], RoleEN, RoleAR, JoinDate, BirthDate, UsersRole, CreatedBY, UpdateBY)
VALUES
('John', 'جون', 'Doe', 'دو', 'johndoe', 'john.doe@example.com', 'password123', 'Admin', 'مشرف', GETDATE(), '1990-01-01', 'Admin', 'System', 'System'),
('Sarah', 'سارة', 'Smith', 'سميث', 'sarahsmith', 'sarah.smith@example.com', 'password123', 'Employee', 'موظف', GETDATE(), '1985-05-20', 'Employee', 'System', 'System'),
('Ali', 'علي', 'Khan', 'خان', 'alikhan', 'ali.khan@example.com', 'password123', 'Client', 'عميل', GETDATE(), '1995-07-30', 'Client', 'System', 'System'),
('Ahmed', 'أحمد', 'Ali', 'علي', 'ahmedali', 'ahmed.ali@example.com', 'password123', 'Driver', 'سائق', GETDATE(), '1988-02-15', 'Driver', 'System', 'System');

INSERT INTO PhoneNumbers (UserID, PhoneNumber, CountryCode)
VALUES
(1, '1234567890', '00962'),
(2, '0987654321', '00962'),
(3, '0776543210', '00962'),
(4, '0791234567', '00962');

INSERT INTO DeliveryLocations (UserID, NameEN, NameAR, ProvinceEN, ProvinceAR, RegionEN, RegionAR, AddressHintEN, AddressHintAR, Map)
VALUES
(3, 'Home Address', 'عنوان المنزل', 'Amman', 'عمان', 'Downtown', 'وسط المدينة', 'Near the mall', 'قرب المول', 'https://maps.google.com/?q=Amman'),
(4, 'Work Address', 'عنوان العمل', 'Zarqa', 'الزرقاء', 'Industrial Area', 'المنطقة الصناعية', 'Near the factory', 'قرب المصنع', 'https://maps.google.com/?q=Zarqa');


INSERT INTO Categories (NameEN, NameAR, Image)
VALUES
('Pizza', 'بيتزا', 'pizza_image_url'),
('Burgers', 'برجر', 'burger_image_url');

INSERT INTO Items (NameEN, NameAR, DescriptionEN, DescriptionAR, Price, CategoryID, Quantity, StatusEN, StatusAR)
VALUES
('Pizza', 'بيتزا', 'Delicious cheese pizza', 'بيتزا لذيذة بالجبنة', 10, 1, 100, 'Available', 'متوفر'),
('Burger', 'برجر', 'Juicy beef burger', 'برجر لحم لذيذ', 5, 2, 200, 'Available', 'متوفر');

INSERT INTO Orders (ClientID, StatusID, TotalPrice, Quantity, DriverID)
VALUES
(3, 2, 15, 2, 4),
(4, 1, 20, 4, 4);

INSERT INTO Rates (ClientID, OrderID, DriverID, ItemID, Rating, ReviewEN, ReviewAR)
VALUES
(3, 1, 4, 2, 5, 'Great pizza and fast delivery', 'بيتزا رائعة وتسليم سريع'),
(3, 2, 4, 3, 4, 'Good burger but delivery was delayed', 'برجر جيد لكن التسليم تأخر');

INSERT INTO Issues (TitleEN, TitleAR, StatusEN, StatusAR, ClientID, SuggestEN, SuggestAR)
VALUES
('Issue 1', 'مشكلة 1', 'Pending', 'قيد الانتظار', 1, 'Recived', 'تم الاستلام'),
('Issue 2', 'مشكلة 2', 'Pending', 'قيد الانتظار', 2, 'Approved', 'تم الموافقة');


INSERT INTO Notifications (UserID, NotificationTypeID, TitleEN, TitleAR, ActionEN, ActionAR)
VALUES
(3, 1, 'Order Update', 'تحديث الطلب', 'Your order has been shipped', 'تم شحن طلبك'),
(4, 3, 'New Order', 'طلب جديد', 'A new order has been placed for you', 'تم تقديم طلب جديد لك');


INSERT INTO PaymentMethods (MethodEN, MethodAR, PaymentMethodCode, DescriptionEN, DescriptionAR)
VALUES
('Credit Card', 'بطاقة ائتمانية', 1, 'Pay using a credit card', 'الدفع باستخدام بطاقة ائتمانية'),
('Cash', 'نقدي', 2, 'Pay with cash on delivery', 'الدفع نقدًا عند الاستلام');
