
import SwiftUI

protocol StylesFactory {
    var carsUseCaseStyle: CarsUseCase.Style{ get }
}

struct Symbols {
    static var bulletPointSymbol: String {
        "•"
    }

    static var ratingSymbol: String {
        "★"
    }
}

struct Colors {
    static var headerTextColor: Color {
        Color.white
    }
    
    static var mainOrange: Color {
        Color(hex: "FC6016")
    }
    
    static var mainDark: Color {
        .init(hex: "858585")
    }
    
    static var mainLight: Color {
        .init(hex: "D5D5D5")
    }
    
    static var mainText: Color {
        .black
    }
    
    static var mainTextLight: Color {
        self.mainText.opacity(0.45)
    }
}

struct Fonts {
    static var headerLargeFont: Font {
        Font.system(size: 30, weight: .bold, design: .serif)
    }
    
    static var headerMiddleFont: Font {
        Font.system(size: 18, weight: .bold, design: .serif)
    }
    
    static var optionsFont: Font {
        Font.system(size: 18, weight: .regular, design: .serif)
    }
    
    static var optionsSelectedFont: Font {
        Font.system(size: 18, weight: .bold, design: .serif)
    }
}

struct ImagesIcon {
    static var menu: String {
        "text.justify"
    }
}


struct DefaultFactory: StylesFactory {
    
    var navigationBarStyle: NavigationBar.Style {
        .init(background: Colors.mainOrange,
              foregroundColor: .white,
              textFont: Fonts.headerLargeFont.uppercaseSmallCaps(),
              imageName: ImagesIcon.menu)
    }

    var headerStyle: HeaderView.Style {
        .init(foregroundColor: Colors.headerTextColor,
              topTextFont: Fonts.headerLargeFont,
              bottomTextFont: Fonts.headerMiddleFont)
    }
    
    var ratingStyle: RatingView.Style {
        .init(foregroundColor: Colors.mainOrange,
              font: Fonts.headerMiddleFont,
              symbol: Symbols.ratingSymbol)
    }
    
    var bulletListStyle: BulletList.Style {
        .init(bulletColor: Colors.mainOrange,
              bulletFont: Fonts.headerMiddleFont,
              textColor: Colors.mainText,
              textFont: Fonts.headerMiddleFont,
              titleColor: Colors.mainTextLight,
              titleFont: Fonts.headerMiddleFont,
              symbol: Symbols.bulletPointSymbol)
    }
    
    var carHeaderStyle: CarHeader.Style {
        .init(ratingStyle: ratingStyle,
              nameColor: Colors.mainTextLight,
              nameFont: Fonts.headerMiddleFont,
              priceColor: Colors.mainTextLight,
              priceFont: Fonts.headerMiddleFont)
    }
    
    func carStyle(expanded: Bool) -> ListCard.Style {
        .init(headerStyle: carHeaderStyle,
              bulletListStyle: bulletListStyle,
              backgroundColor: Colors.mainLight,
              expanded: expanded)
    }
    
    
    var carListStyle: CarList.Style {
        .init(cardStyleCollapsed: carStyle(expanded: false),
              cardStyleExpanded: carStyle(expanded: true),
              headerViewStyle: headerStyle,
              filterStyle: filterListStyle,
              separatorColor: Colors.mainOrange)
    }
    
    var carsUseCaseStyle: CarsUseCase.Style {
        .init(listStyle: carListStyle,
              navigationBarStyle: navigationBarStyle)
    }
    
    
    var filterListStyle: FilterList.Style {
        .init(textColor: .white,
              textFont: Fonts.headerMiddleFont,
              backgroundColor: Colors.mainDark,
              cornerRadius: 15,
              pickerStyle: dropDownStyle)
    }
    
    
    var dropDownStyle: DropDownPicker.Style {
        .init(backgroundColor: .white,
              titleFont: Fonts.headerMiddleFont,
              titleColor: Colors.mainLight,
              optionsFont: Fonts.optionsFont,
              optionsColor: Colors.mainLight,
              selectedFont: Fonts.optionsSelectedFont,
              selectedColor: Colors.mainText,
              cornerRadius: 15)
    }
}
