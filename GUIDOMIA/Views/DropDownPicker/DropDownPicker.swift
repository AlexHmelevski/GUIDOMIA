import SwiftUI

struct DropDownPicker: DefaultStylableView {
    typealias ViewModel = Model
    
    typealias Style = DropDownPickerStyle
    
    let configuration: Configuration
    @ObservedObject var model: Model
    let style: Style
    
    init(model: Model, style: DropDownPickerStyle) {
        self.model = model
        self.style = style
        self.configuration = .init(model: model)
    }
    
    var body: some View {
        style.makeBody(configuration: configuration)
    }
    
    func apply(_ style: DropDownPickerStyle) -> DropDownPicker {
        .init(model: model, style: style)
    }
}

struct DropDownPicker_Previews: PreviewProvider {
    static var previews: some View {
        DropDownPicker(model: PreviewMocks.DropDownPickerMock.model,
                       style: PreviewMocks.DropDownPickerMock.style)
    }
}
