import UIKit
import SparkKit
import PlaygroundSupport

let testView = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
testView.backgroundColor = .purple

let gradientLabel = GradientLabel(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
gradientLabel.text = "5:37"
gradientLabel.font = UIFont.preferredFont(forTextStyle: .title1)

testView.addSubview(gradientLabel)

PlaygroundPage.current.liveView = testView
