import SwiftUI

struct ResetPassword: View {
    
    @State var password: String = ""
    @State var passwordConfigrm: String = ""
    @State var checkPassword: Bool = false
    
    func passwordMatch() {
        if !password.isEmpty && password == passwordConfigrm {
            checkPassword = true
        } else {
            checkPassword = false
        }
    }
    
    @StateObject var userViewModel = UserViewModel()
    
    var body: some View {
        
        VStack {

            CustomHeadline(
                title: "New Password",
                subtitle: "Enter new password",
                customPadding: 0
            )
            .padding(.bottom, 55)
            .padding(.top, 100)
            
            VStack(spacing: 25) {
                CustomTextField(
                    isSecureField: true,
                    titleField: "Password",
                    placeholderField: "***********",
                    text: $password
                )
                .onChange(of: password) {
                    passwordMatch()
                }
                
                CustomTextField(
                    isSecureField: true,
                    titleField: "Confirm Password",
                    placeholderField: "***********",
                    text: $passwordConfigrm
                )
                .onChange(of: passwordConfigrm) {
                    passwordMatch()
                }
            }
            
            
            if !checkPassword {
                Text("Log In")
                    .font(.system(size: 16, weight: .bold))
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 50)
                    .background(checkPassword ? Color.blue : Color.gray)
                    .cornerRadius(10)
                    .padding(.top, 50)
                    .foregroundColor(.white)
            } else {
                NavigationLink("Log In", destination: Profile())
                    .font(.system(size: 16, weight: .bold))
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 50)
                    .background(checkPassword ? Color.blue : Color.gray)
                    .cornerRadius(10)
                    .padding(.top, 50)
                    .foregroundColor(.white)
            }
            
            Spacer()
        }
        .padding(25)
        .navigationBarBackButtonHidden(true)
        
        
    }
}

#Preview {
    ResetPassword()
}
