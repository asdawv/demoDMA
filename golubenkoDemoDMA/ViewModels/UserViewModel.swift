import Foundation

class UserViewModel: ObservableObject {
    // Класс UserViewModel непосредственно реализует логику, связанную
    // с объектом User. 
    // Сюда входит: signUp (регистрация) и signIn (авторизация).
    //
    // signUp, как и signIn, использует экземпляр класса Reposetories,
    // чтобы взаимодействовать с базой данных.
    //
    // Дата создания комментария: 28 сентября 2024 г.
    // Автор: Голубенко М. И.
    @Published var user = UserModel(
        id: UUID(),
        fullname: "",
        phone: "",
        email: "",
        password: ""
    )

    @Published var confirmPassword: String = ""
    @Published var isProgress: Bool = false
    @Published var isNavigate: Bool = false
    @Published var isAuth: Bool = false
    @Published var isError: Bool = false
    @Published var emailExist: Bool = false
    
    func signUp() {
        Task {
            do {
                await MainActor.run {
                    self.isProgress = true
                }
                try await Reposetories.instance.signUp(
                    fullname: user.fullname,
                    phone: user.phone,
                    email: user.email,
                    password: user.password
                )
                await MainActor.run {
                    self.isNavigate = true
                    self.isProgress = false
                }
            } catch {
                print("ERROR: " + error.localizedDescription)
                await MainActor.run {
                    self.isError = true
                    self.isProgress = false
                }
            }
        }
    }
    
    func signIn() {
        Task {
            do {
                await MainActor.run {
                    self.isProgress = true
                }
                try await Reposetories.instance.signIn(
                    email: user.email,
                    password: user.password
                )
                await MainActor.run {
                    self.isAuth = true
                    self.isProgress = false
                }
            } catch {
                print("ERROR: " + error.localizedDescription)
                await MainActor.run {
                    self.isError = true
                    self.isProgress = false
                }
            }
        }
    }
}

