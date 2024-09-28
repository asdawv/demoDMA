import SwiftUI

struct OTPVerify: View {
    
    @State var cube0: String = ""
    @State var cube1: String = ""
    @State var cube2: String = ""
    @State var cube3: String = ""
    @State var cube4: String = ""
    @State var cube5: String = ""
    @State var allFieldsContains: Bool = false
    
    @State var isCurrentCode: Bool = false
    
    @State var defaultColor = Color.blue
    
    @State var cube0State: Bool = false
    @State var cube1State: Bool = false
    @State var cube2State: Bool = false
    @State var cube3State: Bool = false
    @State var cube4State: Bool = false
    @State var cube5State: Bool = false
    
    func checkFields() {
        
        if cube0.isEmpty || cube1.isEmpty || cube2.isEmpty || cube3.isEmpty || cube4.isEmpty || cube5.isEmpty {
            allFieldsContains = false
        } else {
            allFieldsContains = true
        }
        
    }
    
    func currentCode() {
        var counterFields: Int = 0
        
        if cube0 == "2" {
            counterFields += 1
        }
        
        if cube1 == "2" {
            counterFields += 1
        }
        
        if cube2 == "2" {
            counterFields += 1
        }
        
        if cube3 == "2" {
            counterFields += 1
        }
        
        if cube4 == "2" {
            counterFields += 1
        }
        
        if cube5 == "2" {
            counterFields += 1
        }
        
        if counterFields == 6 {
            isCurrentCode = true
        } else {
            isCurrentCode = false
            defaultColor = Color.red
        }
    }
    
    var body: some View {
        
        VStack {
            
            CustomHeadline(
                title: "OTP Verification",
                subtitle: "Enter the 6 digit numbers send to your email",
                customPadding: 0
            )
            .padding(.bottom, 55)
            .padding(.top, 100)
            
            HStack(spacing: 25) {
                TextField("", text: $cube0)
                    .frame(width: 25, height: 25, alignment: .center)
                    .padding(5)
                    .border(cube0State ? defaultColor : Color.gray)
                    .multilineTextAlignment(.center)
                    .onChange(of: cube0) { newValue in
                        if cube0.count > 1 {
                            self.cube0 = String(newValue.prefix(1))
                        } else if cube0.count < 1 {
                            self.cube0State = false
                            self.defaultColor = Color.blue
                        } else {
                            self.cube0State = true
                        }
                        checkFields()
                    }
                TextField("", text: $cube1)
                    .frame(width: 25, height: 25, alignment: .center)
                    .padding(5)
                    .border(cube1State ? defaultColor : Color.gray)
                    .multilineTextAlignment(.center)
                    .onChange(of: cube1) { newValue in
                        if cube1.count > 1 {
                            self.cube1 = String(newValue.prefix(1))
                        } else if cube1.count < 1 {
                            self.cube1State = false
                            self.defaultColor = Color.blue
                        } else {
                            self.cube1State = true
                        }
                        checkFields()
                    }
                TextField("", text: $cube2)
                    .frame(width: 25, height: 25, alignment: .center)
                    .padding(5)
                    .border(cube2State ? defaultColor : Color.gray)
                    .multilineTextAlignment(.center)
                    .onChange(of: cube2) { newValue in
                        if cube2.count > 1 {
                            self.cube2 = String(newValue.prefix(1))
                        } else if cube2.count < 1 {
                            self.cube2State = false
                            self.defaultColor = Color.blue
                        } else {
                            self.cube2State = true
                        }
                        checkFields()
                    }
                TextField("", text: $cube3)
                    .frame(width: 25, height: 25, alignment: .center)
                    .padding(5)
                    .border(cube3State ? defaultColor : Color.gray)
                    .multilineTextAlignment(.center)
                    .onChange(of: cube3) { newValue in
                        if cube3.count > 1 {
                            self.cube3 = String(newValue.prefix(1))
                        } else if cube3.count < 1 {
                            self.cube3State = false
                            self.defaultColor = Color.blue
                        } else {
                            self.cube3State = true
                        }
                        checkFields()
                    }
                TextField("", text: $cube4)
                    .frame(width: 25, height: 25, alignment: .center)
                    .padding(5)
                    .border(cube4State ? defaultColor : Color.gray)
                    .multilineTextAlignment(.center)
                    .onChange(of: cube4) { newValue in
                        if cube4.count > 1 {
                            self.cube4 = String(newValue.prefix(1))
                        } else if cube4.count < 1 {
                            self.cube4State = false
                            self.defaultColor = Color.blue
                        } else {
                            self.cube4State = true
                        }
                        checkFields()
                    }
                TextField("", text: $cube5)
                    .frame(width: 25, height: 25, alignment: .center)
                    .padding(5)
                    .border(cube5State ? defaultColor : Color.gray)
                    .multilineTextAlignment(.center)
                    .onChange(of: cube5) { newValue in
                        if cube5.count > 1 {
                            self.cube5 = String(newValue.prefix(1))
                        } else if cube5.count < 1 {
                            self.cube5State = false
                            self.defaultColor = Color.blue
                        } else {
                            self.cube5State = true
                        }
                        checkFields()
                    }
            }
            
            Text("If you didn't receive code, resend after 1:00")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .padding(25)
            
            NavigationLink(destination: ResetPassword(),
                           isActive: $isCurrentCode) {
                EmptyView()
            }
            
            if !allFieldsContains {
                Text("Set New Password")
                    .font(.system(size: 16, weight: .bold))
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 50)
                    .background(allFieldsContains ? Color.blue : Color.gray)
                    .cornerRadius(10)
                    .padding(.top, 50)
                    .foregroundColor(.white)
            } else {
                Button("Set New Password", action: {
                    currentCode()
                })
                    .font(.system(size: 16, weight: .bold))
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 50)
                    .background(allFieldsContains ? Color.blue : Color.gray)
                    .cornerRadius(10)
                    .padding(.top, 50)
                    .foregroundColor(.white)
                
            }
            
            Spacer()
            
            Text("Default code: \(Text("222222").foregroundColor(.blue))")
                .font(.system(size: 12))
                .foregroundStyle(.gray)
        }
        .padding(25)
        .navigationBarBackButtonHidden(true)
    }
        
}

#Preview {
    OTPVerify()
}
