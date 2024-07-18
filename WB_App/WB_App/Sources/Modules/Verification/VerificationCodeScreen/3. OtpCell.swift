
import SwiftUI
import Combine

struct OtpCell: View {
    
    /// Биндинг на значение, которое пользователь вводит в 1 ячейку
    @Binding var value : String
    
    var body: some View {
        ZStack {
            backgroundCircle
            oneDigitTextField
        }
        .modifier(OtpModifer(pin: $value))
    }
    
    /// Circle, located on background of cell
    var backgroundCircle: some View {
        Circle()
            .fill(value == "" ? Color.Neutural.divider : .clear)
            .frame(width: 30, height: 30)
    }
    
    /// Textfield on the Circle
    var oneDigitTextField: some View {
        TextField("", text: $value)
            .font(.wbFont(.heading1))
            .tint(.black)
            .keyboardType(.numberPad)
    }
}


// Ограничивает количество вводимых символов в textLimt и с применением Just()
// Ограничивает доступные символами в aviableSymbols
/// Модификатор для ячейки OtpCell
struct OtpModifer: ViewModifier {

    /// Биндинг на значение, которое пользователь вводит в 1 ячейку
    @Binding var pin : String

    private let textLimt = 1
    private let aviableSymbols = "1234567890"

    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.center)
            .onReceive(Just(pin)) { _ in
                validateNumbers()
                limitText(textLimt)
            }
            .background(Color.white.cornerRadius(5))
    }
    
    private func limitText(_ max : Int) {
        if pin.count > max {
            self.pin = String(pin.prefix(max))
        }
    }
    
    private func validateNumbers() {
        self.pin = pin.filter { aviableSymbols.contains($0) }
    }
}
