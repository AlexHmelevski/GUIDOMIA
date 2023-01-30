import SwiftUI

struct CarsUseCase: DefaultStylableView {
  
    
    typealias ViewModel = Model
    
    typealias Style = CarsUseCaseStyle
    
    @ObservedObject var model: Model
    private let configuration: Configuration
    private let style: Style
    init(model: Model, style: Style = .default) {
        self.model = model
        self.style = style
        self.configuration = .init(model: model)
        
    }
    var body: some View {
        style.makeBody(configuration: configuration)
    }
    
    func apply(_ style: CarsUseCaseStyle) -> CarsUseCase {
        .init(model: model, style: style)
    }
}


struct CarsUseCase_Previews: PreviewProvider {
    static var previews: some View {
        CarsUseCase(model: PreviewMocks.CarsUseCaseMock.model,
                    style: PreviewMocks.CarsUseCaseMock.style)
    }
}
