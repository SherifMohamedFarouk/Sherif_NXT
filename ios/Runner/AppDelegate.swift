import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    override func application(_ application: UIApplication,
                              didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
        let batteryChannel = FlutterMethodChannel(name: "com.example.sherif_nxt_assessment/bottomSheet",
                                                  binaryMessenger: controller.binaryMessenger)
        
        batteryChannel.setMethodCallHandler({
            [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
            // This method is invoked on the UI thread.
            guard call.method == "showBottomSheet" else {
                result(FlutterMethodNotImplemented)
                return
            }
            
            let arguments = call.arguments as! [String: Any] // Force unwrap
            let name = arguments["name"] as! String
            let image = arguments["image"] as! String
            let id = arguments["id"] as! String
            let type = arguments["type"] as! String
            let seat = arguments["seat"] as! String
            let isDark = arguments["isDark"] as! Bool
            self?.showBottomSheet(name: name, image: image, id: id, type: type, seat: seat, isDark: isDark)
        })
        
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    private func showBottomSheet(name: String, image: String, id: String, type: String, seat: String, isDark: Bool) {
        guard let flutterViewController = window?.rootViewController as? FlutterViewController else { return }
        
        let bottomSheetWidth: CGFloat = UIScreen.main.bounds.width
        let bottomSheetHeight: CGFloat = 300 // Adjust the height as needed
        
        // Create the alert controller with custom height
        let alertController = UIAlertController(title: "", message: nil, preferredStyle: .actionSheet)
        let heightConstraint = NSLayoutConstraint(item: alertController.view!,
                                                  attribute: .height,
                                                  relatedBy: .equal,
                                                  toItem: nil,
                                                  attribute: .notAnAttribute,
                                                  multiplier: 1,
                                                  constant: bottomSheetHeight)
        alertController.view.addConstraint(heightConstraint)
        
        // Create a container view for the ticket-like design
        let horizontalPadding: CGFloat = 8// Adjust as needed

        // Create a container view for the ticket-like design
        let containerWidth: CGFloat = UIScreen.main.bounds.width - 2 * horizontalPadding
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: containerWidth, height: bottomSheetHeight))
        containerView.backgroundColor = isDark ? UIColor(hex: ("171717")) :  UIColor(hex: ("E3E3E3"))
        containerView.layer.cornerRadius = 10
        // Create a container view for the ticket-like design
        let containerSmallView = UIView(frame: CGRect(x: 0, y: 0, width: containerWidth, height: 30))
        containerSmallView.backgroundColor = isDark ? UIColor(hex: "2B2B2B") :  UIColor(hex: "FFFFFF")

        // Create a mask layer with rounded corners for the top corners
        let maskLayer = CAShapeLayer()
        maskLayer.frame = containerSmallView.bounds

        // Set the radius for the top corners
        let cornerRadius: CGFloat = 10
        let maskPath = UIBezierPath(roundedRect: containerSmallView.bounds,
                                    byRoundingCorners: [.topLeft, .topRight],
                                    cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        maskLayer.path = maskPath.cgPath

        // Apply the mask to your view
        containerSmallView.layer.mask = maskLayer
        containerView.addSubview(containerSmallView)
        // Add RoundedRectView as background
        let roundedRectViewWidth: CGFloat = 60
        let roundedRectViewHeight: CGFloat = 7
        let roundedRectViewX = (containerWidth - roundedRectViewWidth) / 2
        let roundedRectView = RoundedRectView(frame: CGRect(x: roundedRectViewX, y: 10, width: roundedRectViewWidth, height: roundedRectViewHeight))
        containerSmallView.addSubview(roundedRectView)
        
        // Add top strings
        let ticketLab = UILabel(frame: CGRect(x: 10, y: 35, width: containerWidth - 40, height: 30))
        ticketLab.text = "Tickets :"
        ticketLab.textColor = isDark ? UIColor.white : UIColor.black
        containerView.addSubview(ticketLab)
        
        // Add ticket view
        let ticketWidth: CGFloat = containerWidth - 40
        let ticketHeight: CGFloat = 150
        let ticketView = UIView(frame: CGRect(x: 20, y: (bottomSheetHeight - ticketHeight) / 2, width: ticketWidth, height: ticketHeight))
        ticketView.backgroundColor = isDark ? UIColor(hex: "#1E1E1E") : UIColor(hex: "#DFDDDD")
        ticketView.layer.cornerRadius = 0
        
        // Add dotted line separator at the center
        let separatorView = UIView(frame: CGRect(x: 0, y: ticketHeight / 2 - 1, width: ticketWidth, height: 2))
        separatorView.backgroundColor = isDark ? UIColor.white : UIColor.black
        ticketView.addSubview(separatorView)
        
        // Add image view
        let imageView = UIImageView(frame: CGRect(x: 20, y: 20, width: 50, height: 50)) // Adjust frame as needed
        imageView.contentMode = .scaleAspectFit
        ticketView.addSubview(imageView)

        // Load image from URL
        if let url = URL(string: image) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        imageView.image = UIImage(data: data)
                    }
                }
            }
        }

        // Calculate the available width for the name and ID views
        let availableWidthForText = containerWidth - 40 - imageView.frame.width - 10 // Subtracting image width and adding some spacing

        // Add top strings
        let nameView = UILabel(frame: CGRect(x: imageView.frame.maxX + 10, y: 20, width: availableWidthForText, height: 30))
        nameView.text = name
        nameView.textColor = isDark ? UIColor.white : UIColor.black
        ticketView.addSubview(nameView)

        let idView = UILabel(frame: CGRect(x: imageView.frame.maxX + 10, y: 40, width: availableWidthForText, height: 30))
        idView.text = id
        idView.textColor = isDark ? UIColor.white : UIColor.black
        ticketView.addSubview(idView)

        
        let dotDiameter: CGFloat = 2 // Diameter of each dot
          let dotSpacing: CGFloat = 5 // Spacing between dots
          let dotCount = Int(ticketWidth / (dotDiameter + dotSpacing))
          var dotXPosition: CGFloat = (ticketWidth - CGFloat(dotCount) * (dotDiameter + dotSpacing) + dotSpacing) / 2 // Centering dots
          
          for _ in 0..<dotCount {
              let dotView = UIView(frame: CGRect(x: dotXPosition, y: 0, width: dotDiameter, height: dotDiameter))
              dotView.backgroundColor = isDark ? UIColor(hex: "#1E1E1E") : UIColor(hex: "#DFDDDD")
              dotView.layer.cornerRadius = dotDiameter / 2
              separatorView.addSubview(dotView)
              dotXPosition += dotDiameter + dotSpacing
          }

        
        let typeView = UILabel(frame: CGRect(x:20, y: 80, width: containerWidth - 40, height: 30))
        typeView.text = type
        typeView.textColor = isDark ? UIColor.white : UIColor.black
        ticketView.addSubview(typeView)
        
        let seatView = UILabel(frame: CGRect(x: 20, y: 100, width: containerWidth - 40, height: 30))
        seatView.text = seat
        seatView.textColor = isDark ? UIColor.white : UIColor.black
        ticketView.addSubview(seatView)

        
        containerView.addSubview(ticketView)
        
        alertController.view.addSubview(containerView)
        
        // Add cancel button
        let cancelAction = UIAlertAction(title: "", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        flutterViewController.present(alertController, animated: true, completion: nil)
    }
    
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        self.init(red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgb & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
}
