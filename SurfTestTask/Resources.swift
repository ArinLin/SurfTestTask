//
//  Resources.swift
//  SurfTestTask
//
//  Created by Arina on 01.08.2023.
//

import UIKit

enum Resourses {
    enum Fonts {
        static func helveticaRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
        
        static func SFProDisplay(with size: CGFloat) -> UIFont {
            UIFont(name: "14_20_Regular SF", size: size) ?? UIFont()
        }
    }
    
    enum Texts {
        static var profile = "Профиль"
        static var name = "Иванов Иван Иванович"
        static var description = "Middle iOS-разработчик, опыт более 2-х лет"
        static var location = "Воронеж"
        static var skills = "Мои навыки"
        static var about = "О себе"
        static var aboutText = "Experienced software engineer skilled in developing scalable and maintainable systems"
    }
    
    enum Colors {
        static var background = UIColor(hexString: "#F3F3F5")
        static var textColor = UIColor(hexString: "#313131")
        static var textDescription = UIColor(hexString: "#96959B")
    }
    
    enum Images {
        static var man = UIImage(named: "man")?.resized(to: CGSize(width: 120, height: 120))
        static var location = UIImage(named: "location")?.resized(to: CGSize(width: 16, height: 16))
        static var pencil = UIImage(named: "pencil")?.resized(to: CGSize(width: 24, height: 24))
        static var checkmark = UIImage(named: "checkmark")?.resized(to: CGSize(width: 24, height: 24))
        static var cross = UIImage(named: "cross")?.resized(to: CGSize(width: 14, height: 14))
    }
}

//MARK: Меняем размер загруженных иконок через растровые изображения, используя метод UIGraphicsImageRenderer
extension UIImage {
    func resized(to newSize: CGSize) -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: newSize)
        let resizedImage = renderer.image { context in
            self.draw(in: CGRect(origin: .zero, size: newSize))
        }
        return resizedImage
    }
}

//MARK: Ext for hex color values
extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

