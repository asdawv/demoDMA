import SwiftUI

struct Profile: View {
    
    @StateObject var userViewModel = UserViewModel()
    
    var body: some View {
        
        VStack {
            Spacer()
            Divider()
            Text("Home")
                .font(.system(size: 20, weight: .bold))
                .padding(10)
            Divider()
            Spacer()
            
            NavigationLink("\(Image(systemName: "arrow.left")) Back to Log In", destination: SignIn())
                .font(.system(size: 14))
                .foregroundColor(.blue)
        }
        .navigationBarBackButtonHidden(true)
        
        
    }
}

#Preview {
    Profile()
}
