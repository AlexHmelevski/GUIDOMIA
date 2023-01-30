import SwiftUI

struct RatingView: DefaultStylableView {
   
    typealias ViewModel = Model
    typealias Style = RatingViewStyle
    private let configuration: Configuration
    private let style: Style
    init(model: Model, style: Style = .default) {
        self.configuration = .init(model: model)
        self.style = style
    }
    
    func apply(_ style: RatingViewStyle) -> RatingView {
        .init(model: configuration.model, style: style)
    }
    
    var body: some View {
        style.makeBody(configuration: configuration)
    }
}


extension RatingView {
    struct Model {
        let count: Int
    }
}

struct RatingView_Previews: PreviewProvider {
    static var model: RatingView.Model {
        PreviewMocks.RatingViewMock.model
    }
    
    static var style: RatingView.Style {
        PreviewMocks.RatingViewMock.style
    }
    static var previews: some View {
        RatingView(model: model, style: style)
    }
}
