import Foundation

// Данная структура описывает модель пользователя,
// что позволяет на базе данной структуры создать
// экземпляр, который будет использоваться при
// добавлении нового User в базу данных.
//
// UserModel включает в себя следующие поля:
//  id - уникальный идентификатор (тип UUID), с помощью которого
//       можно однозначно идентифицировать пользователя в БД;
//  fullname - полное имя User (тип String);
//  phone - номер телефона User (тип String);
//  email - адрес электронной почты User (тип String);
//  password - пароль User (тип String). В обязательном порядке
//             должен храниться в зашифрованном виде, но не в
//             данном случае.
//
// Дата создания комментария: 28 сентября 2024 г.
// Автор: Голубенко М. И.
struct UserModel: Codable {
    var id: UUID
    var fullname: String
    var phone: String
    var email: String
    var password: String
}
