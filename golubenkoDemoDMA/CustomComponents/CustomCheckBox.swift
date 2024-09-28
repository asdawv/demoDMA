import SwiftUI

struct CustomCheckBox: View {
    // Компонент CustomCheckBox используется для того, чтобы переиспользовать
    // один и тот же компонент с одинаковым набором логики и стилизации.
    //
    // Дата создания комментария: 28 сентября 2024 г.
    // Автор: Голубенко М. И.
    @Binding var isActive: Bool
    
    var body: some View {
        
        Group {
            if isActive {
                RoundedRectangle(cornerRadius: 2)
                    .fill(Color.blue)
                    .frame(width: 16, height: 16)
                    .overlay {
                        if isActive {
                            Image(systemName: "checkmark")
                                .font(.system(size: 10))
                                .foregroundColor(.white)
                        }
                    }
            } else {
                RoundedRectangle(cornerRadius: 2)
                    .stroke(Color.accentColor, lineWidth: 1)
                    .frame(width: 16, height: 16)
            }
        }
        .onTapGesture {
            self.isActive.toggle()
        }
        
    }
}

