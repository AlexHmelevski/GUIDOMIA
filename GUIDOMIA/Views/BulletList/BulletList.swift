import SwiftUI

struct BulletList: DefaultStylableView {

    typealias Style = BulletListStyle
    
    private let configuration: Configuration
    private let style: Style
    
    init(model: Model, style: Style = .default) {
        self.configuration = .init(model: model)
        self.style = style
    }
    
    func apply(_ style: BulletListStyle) -> BulletList {
        BulletList(model: configuration.model,
                   style: style)
    }
    
    var body: some View {
        style.makeBody(configuration: configuration)
    }
}

struct BulletList_Previews: PreviewProvider {
    
    static var model: BulletList.Model {
        PreviewMocks.BulletListMock.model
    }
    
    static var style: BulletList.Style {
        PreviewMocks.BulletListMock.style
    }
    static var previews: some View {
        BulletList(model: model, style: style)
    }
}
