import SwiftUI

struct SignIn: View {
    
    @State var logInActive: Bool = false
    @State var checkBoxValue: Bool = false
    
    @StateObject var userViewModel = UserViewModel()
    
    func checkFields() {
        if !userViewModel.user.email.isEmpty && !userViewModel.user.password.isEmpty {
            logInActive = true
        } else {
            logInActive = false
        }
    }
    
    var body: some View {
        
            
            VStack {
                
                CustomHeadline(
                    title: "Create an acoount",
                    subtitle: "Fill in your email and password to continue",
                    customPadding: 0
                )
                .padding(.bottom, 5)
                .padding(.top, 100)
                
                if userViewModel.isError {
                    Text("Неверный логин или пароль")
                        .font(.system(size: 14))
                        .foregroundStyle(.red)
                        .padding(10)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .padding(0)
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.red))
                        .padding(.bottom, -15)
                    
                }
                
                VStack(spacing: 25) {
                    CustomTextField(
                        isSecureField: false,
                        titleField: "Email address",
                        placeholderField: "***********@example.com",
                        text: $userViewModel.user.email
                    )
                    .textContentType(.emailAddress)
                    .onChange(of: userViewModel.user.email) {
                        checkFields()
                    }
                    CustomTextField(
                        isSecureField: true,
                        titleField: "Password",
                        placeholderField: "***********",
                        text: $userViewModel.user.password
                    )
                    .onChange(of: userViewModel.user.password) {
                        checkFields()
                    }
                    HStack {
                        HStack {
                            CustomCheckBox(isActive: $checkBoxValue)
                            Text("Remember password")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        NavigationLink("Forgot Password?", destination: ForgotPassword())
                            .font(.system(size: 14))
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        
                    }
                    .padding(.top, -5)
                }
                .padding([.top, .bottom], 25)
                
                Spacer()
                
                NavigationLink(destination: Profile(),
                               isActive: $userViewModel.isAuth) {
                    EmptyView()
                }
                if logInActive {
                    Button("Log In", action: {
                        userViewModel.signIn()
                    })
                        .font(.system(size: 16, weight: .bold))
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 50)
                        .background(logInActive ? Color.blue : Color.gray)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                } else {
                    Text("Log In")
                        .font(.system(size: 16, weight: .bold))
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 50)
                        .background(logInActive ? Color.blue : Color.gray)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
                
                VStack {
                    HStack {
                        Text("Already have an account?")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                        
                        NavigationLink("Sign Up", destination: SignUp())
                            .font(.system(size: 14))
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    }
                    .padding([.top, .bottom], 5)
                    HStack(spacing: 5) {
                        Text("or log is using")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                        
                        Image(systemName: "g.circle.fill")
                            .font(.system(size: 16))
                            .foregroundColor(.orange)
                    }
                }
                
            }
            .padding(25)
            .navigationBarBackButtonHidden(true)
        
        
    }
}

#Preview {
    SignIn()
}
