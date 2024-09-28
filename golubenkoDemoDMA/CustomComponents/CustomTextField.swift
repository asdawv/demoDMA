import SwiftUI

struct CustomTextField: View {
    // Компонент CustomTextFeild используется для удобного переиспользования
    // компонента текстового поля, однако с небольшими изменениями, такими как:
    // это поле защищенное (secure) или обычное. Разница между защищенным полем
    // и обычным не только в том, что содержимое 1-го должно скрываться, а также
    // в наличие дополнительного логического элемента - переключателя (глаз),
    // при нажатии на который поле должно отображать содержимое.
    //
    // Дата создания комментария: 28 сентября 2024 г.
    // Автор: Голубенко М. И.
    let isSecureField: Bool
    let titleField: String
    let placeholderField: String
    @State var isSecure: Bool = false
    @Binding var text: String
    
    var body: some View {
        
        if isSecureField {
            VStack {
                Text(titleField)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                ZStack(alignment: .trailing) {
                    if !isSecure {
                        SecureField(placeholderField, text: $text)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(10)
                            .padding(.trailing, 30)
                            .cornerRadius(5)
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray))
                            .textInputAutocapitalization(.never)
                    } else {
                        TextField(placeholderField, text: $text)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(10)
                            .padding(.trailing, 30)
                            .cornerRadius(5)
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray))
                            .textInputAutocapitalization(.never)
                    }
                    Button(action: {
                        isSecure.toggle()
                    }) {
                        Image(systemName: isSecure ? "eye" : "eye.slash")
                            .frame(alignment: .trailing)
                            .accentColor(.black)
                            .padding(10)
                            .font(.system(size: 14))
                            .scaleEffect(x: -1, y: 1)
                    }
                }
            }
        } else {
            VStack {
                Text(titleField)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                TextField(placeholderField, text: $text)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(5)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray))
                    .textInputAutocapitalization(.never)
            }
        }
        
    }
}

