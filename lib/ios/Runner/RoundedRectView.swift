import UIKit


class RoundedRectView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        // Ensure background color is set to clear
        backgroundColor = .clear
    }
    
    override func draw(_ rect: CGRect) {
        // Create a UIBezierPath for the rounded rectangle
        let path = UIBezierPath(roundedRect: bounds, cornerRadius: 20.0)
        
        // Set the fill color to darker gray
        UIColor.darkGray.setFill()
        
        // Fill the path
        path.fill()
    }
}
