import SwiftUI

struct CarHeader: DefaultStylableView {
  
    typealias ViewModel = Model
    typealias Style = CarHeaderStyle
    
    private let style: Style
    private let configuration: Configuration
    init(model: Model, style: CarHeaderStyle = .default) {
        self.style = style
        self.configuration = .init(model: model)
    }
    var body: some View {
        style.makeBody(configuration: configuration)
    }
    
    func apply(_ style: CarHeaderStyle) -> CarHeader {
        .init(model: configuration.model, style: style)
    }
}

struct CarHeader_Previews: PreviewProvider {
    static var model: CarHeader.Model {
        PreviewMocks.CarHeaderMock.model
    }
    static var style: CarHeader.CarHeaderStyle {
        PreviewMocks.CarHeaderMock.style
    }
    
    static var previews: some View {
        CarHeader(model: model, style: style)
           
    }
}
