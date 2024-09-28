import Foundation
import Supabase

class Reposetories {
    // Класс Reposetories используется для взаимодействия в базой данных Supabase.
    // включает в себя ряд вспомогательных методов, необходимых для организации
    // взаимодействия с базой данных.
    //
    // Переменная supabase хранит в себе подключение к БД Supabase с помощью
    // сгенерированного URL и токена (Key).
    //
    // Метод signUp служит для регистрации пользователя в системе.
    // Метод signIn используется для авторизации пользователя в системе.
    // Метод logOut используется для выхода пользователя из системы.
    //
    // Дата создания комментария: 28 сентября 2024 г.
    // Автор: Голубенко М. И.
    static let instance = Reposetories()
    
    let supabase = SupabaseClient(
        supabaseURL: URL(string: "https://dbhzgqdinokhfxwidmoi.supabase.co")!,
        supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRiaHpncWRpbm9raGZ4d2lkbW9pIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjcyMzAzMDMsImV4cCI6MjA0MjgwNjMwM30.SKJfxG_QlSevp7YVQLMsYJXA-d9w45PFYEmbuDWjyp8",
        options: .init()
    )
    
    func signUp(
        fullname: String, phone: String, email: String, password: String
    ) async throws {
        try await supabase.auth.signUp(email: email, password: password)
        
        let user = try await supabase.auth.session.user
        
        let newUser = UserModel(
            id: user.id,
            fullname: fullname,
            phone: phone,
            email: email,
            password: password
        )
        
        try await supabase.from("users")
            .insert(newUser)
            .execute()
        
        try await supabase.auth.signOut()
    }
    
    func signIn(
        email: String, password: String
    ) async throws {
        try await supabase.auth.signIn(email: email, password: password)
    }
    
    func logOut() async throws {
        try await supabase.auth.signOut()
    }
}
