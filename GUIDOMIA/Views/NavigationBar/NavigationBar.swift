import SwiftUI
typealias Closure<T> = (T) -> Void
typealias VoidClosure = () -> Void

struct NavigationBar: DefaultStylableView {
   
    typealias Style = BarStyle
    typealias ViewModel = Model
    
    private let model: Model
    private let configuration: Configuration
    private let style: Style
    
    init(model: ViewModel, style: Style = .defaultStyle) {
        self.model = model
        configuration = .init(action: model.action ?? {}, text: model.text)
        self.style = style
    }
    var body: some View {
        style.makeBody(configuration: configuration)
    }
    
    func apply(_ style: Style) -> Self {
        .init(model: model, style: style)
    }
}


struct NavigationBar_Previews: PreviewProvider {
    static let mocks = PreviewMocks.self
    static var previews: some View {
        NavigationBar(model: mocks.NavigationBarMock.model)
            .apply(mocks.NavigationBarMock.style)
    }
}


extension NavigationBar {
    struct Model {
        let text: String
        let buttonImage: String
        let action: VoidClosure?
    }
}








