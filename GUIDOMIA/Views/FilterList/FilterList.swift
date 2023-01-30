import SwiftUI

struct FilterList: DefaultStylableView {
    typealias ViewModel = Model
    
    typealias Style = FilterListStyle
    
    @ObservedObject var model: Model
    private let style: Style
    private let configuration: Configuration
    init(model: Model, style: FilterListStyle = .default) {
        self.model = model
        self.style = style
        self.configuration = .init(model: model)
    }
    var body: some View {
        style.makeBody(configuration: configuration)
    }
    func apply(_ style: FilterListStyle) -> FilterList {
        .init(model: model, style: style)
    }
}

struct FilterList_Previews: PreviewProvider {
    
    static var factory: DefaultFactory {
        .init()
    }
    
    static var previews: some View {
        FilterList(model: PreviewMocks.FilterListMock.model,
                   style: PreviewMocks.FilterListMock.style)
    }
}
