import SwiftUI

struct ForgotPassword: View {
    
    @State var email: String = ""
    @State var currectField: Bool = false
    @State var isWarningEmail: Bool = false
    @State var isCurrentEmail: Bool = false
    
    func checkEmailAddress() {
        if email.contains("@") {
            isWarningEmail = false
            isCurrentEmail = true
        } else {
            isWarningEmail = true
            isCurrentEmail = false
        }
    }
    
    var body: some View {
        
        VStack {
            
            CustomHeadline(
                title: "Forgot Password",
                subtitle: "Enter your email address",
                customPadding: 0
            )
            .padding(.bottom, 55)
            .padding(.top, 100)
            
            if isWarningEmail {
                Text("Неверный формат электронной почты")
                    .font(.system(size: 14))
                    .foregroundStyle(.yellow)
                    .padding(10)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.yellow))
                    .padding(.top, -40)
                    .padding(.bottom, 5)
            }
            
            CustomTextField(
                isSecureField: false,
                titleField: "Email Address",
                placeholderField: "***********@example.com",
                text: $email
            )
            .textContentType(.emailAddress)
            .onChange(of: email) {
                if email.isEmpty {
                    self.currectField = false
                } else {
                    self.currectField = true
                }
            }
            
            NavigationLink(
                destination: OTPVerify(),
                isActive: $isCurrentEmail) {
                    EmptyView()
                }
            
            if email.isEmpty {
                Text("Send OTP")
                    .font(.system(size: 16, weight: .bold))
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 50)
                    .background(currectField ? Color.blue : Color.gray)
                    .cornerRadius(10)
                    .padding(.top, 50)
                    .foregroundColor(.white)
            } else {
                Button("Send OTP", action: {
                    checkEmailAddress()
                })
                    .font(.system(size: 16, weight: .bold))
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 50)
                    .background(currectField ? Color.blue : Color.gray)
                    .cornerRadius(10)
                    .padding(.top, 50)
                    .foregroundColor(.white)
            }
            
            
            HStack(spacing: 5) {
                Text("Remember password? Back to")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                
                NavigationLink("Sign In", destination: SignIn())
                    .font(.system(size: 14))
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }
            
            Spacer()
        }
        .padding(25)
        .navigationBarBackButtonHidden(true)
        
    }
}


#Preview {
    ForgotPassword()
}
