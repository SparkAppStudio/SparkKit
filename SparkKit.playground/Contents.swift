import UIKit
import SparkKit
import PlaygroundSupport


let gframe = CGRect(x: 0, y: 0, width: 200, height: 100)
let gradientLabel = GradientLabel(frame: gframe)
gradientLabel.text = "5:37"
gradientLabel.font = UIFont.preferredFont(forTextStyle: .title1)

let oframe = CGRect(x: 100, y: 100, width: 150, height: 60)
let outlineButton = OutlineButton(frame: oframe)
outlineButton.color = .white
outlineButton.title = "No Thanks"

let testView = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
testView.backgroundColor = .purple

testView.addSubview(gradientLabel)
testView.addSubview(outlineButton)

PlaygroundPage.current.liveView = testView
