import SwiftUI

struct ListCard: DefaultStylableView {
    
    typealias Style = ListCardStyle

    typealias ViewModel = Model
    private let style: Style
    private let configuration: Configuration
    var hashValue: Int {
        configuration.model.name.hashValue
    }
    init(model: Model, style: ListCardStyle = .default) {
        self.style = style
        self.configuration = .init(model: model)
    }
    
    func apply(_ style: ListCardStyle) -> ListCard {
        ListCard(model: configuration.model, style: style)
    }
    
    var body: some View {
        style.makeBody(configuration: configuration)
    }
}

struct ListCard_Previews: PreviewProvider {
    static var model: ListCard.Model {
        PreviewMocks.ListCardMock.model
    }
    
    static var previews: some View {
        ListCard(model: model,
                 style: PreviewMocks.ListCardMock.style(expanded: true))
    }
}
