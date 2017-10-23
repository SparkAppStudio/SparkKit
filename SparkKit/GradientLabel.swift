//
//  Copyright © 2017 Spark App Studio. All rights reserved.
//

import UIKit

@IBDesignable
public class GradientLabel: UILabel {

    @IBInspectable public var startColor: UIColor = UIColor(red: 54/255, green: 236/255, blue: 80/255, alpha: 1.0) {
        didSet { setNeedsLayout() }
    }
    @IBInspectable public var endColor: UIColor = UIColor(red: 60/255, green: 130/255, blue: 248/255, alpha: 1.0) {
        didSet { setNeedsLayout() }
    }
    @IBInspectable public var blur: CGFloat = 4.0
    @IBInspectable public var shadowX: CGFloat = 0
    @IBInspectable public var shadowY: CGFloat = 2.0
    @IBInspectable public var blurColor: UIColor = UIColor.black.withAlphaComponent(0.5)

    public override func layoutSubviews() {
        super.layoutSubviews()

        guard let textSize = (text as NSString?)?.size(withAttributes: [NSAttributedStringKey.font: font]) else { return }
        if let bgImage = buildGradient(in: textSize, start: startColor, end: endColor) {
            let gradientColor = UIColor(patternImage: bgImage)
            textColor = gradientColor
        }
    }

    public override func drawText(in rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()!
        context.setShadow(offset: CGSize(width: shadowX, height: shadowY), blur: blur, color: blurColor.cgColor)
        super.drawText(in: rect)
    }

    func buildGradient(in size: CGSize, start: UIColor, end: UIColor) -> UIImage? {

        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()!

        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let colors: NSArray = [start.cgColor, end.cgColor]
        guard let gradient = CGGradient(colorsSpace: colorSpace,
                                        colors: colors,
                                        locations: [0, 1]) else { assertionFailure("Failed to make gradient"); return nil }
        let startPoint = CGPoint(x: size.width / 2, y: 0)
        let endPoint = CGPoint(x: size.width / 2, y: size.height)
        context.drawLinearGradient(gradient, start: startPoint, end: endPoint, options: [])

        let bgimage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return bgimage
    }
}
