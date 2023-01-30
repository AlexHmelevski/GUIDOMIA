import SwiftUI

struct HeaderView: DefaultStylableView {
    typealias Style = HeaderViewStyle
    typealias ViewModel = Model
    private let style: Style
    private let configuration: Configuration
    init(model: Model, style: Style = .default) {
        self.style = style
        self.configuration = .init(model: model)
    }
    
    var body: some View {
        style.makeBody(configuration: configuration)
    }
    
    func apply(_ style: Style) -> HeaderView {
        .init(model: configuration.model, style: style)
    }
}

struct GenericCardView_Previews: PreviewProvider {
    private static var model: HeaderView.Model  {
        PreviewMocks.HeaderViewMock.model
    }
    private static var style: HeaderView.Style {
        PreviewMocks.HeaderViewMock.style
    }
    static var previews: some View {
        HeaderView(model: model , style: style)
    }
}
