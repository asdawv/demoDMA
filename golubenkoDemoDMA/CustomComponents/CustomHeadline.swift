import SwiftUI

struct CustomHeadline: View {
    // Компонент CustomHeadline используется для того, чтобы на каждой странице
    // не приходилось создавать один и тот же набор компонентов с одинаковой
    // стилизацией.
    //
    // Дата создания комментария: 28 сентября 2024 г.
    // Автор: Голубенко М. И.
    
    let title: String
    let subtitle: String
    let customPadding: CGFloat
    
    var body: some View {
        
        VStack {
            Text(title)
                .font(.system(size: 30, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 5)
            Text(subtitle)
                .font(.system(size: 14))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.gray)
        }
        .padding(customPadding)
        
    }
}

