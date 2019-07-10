
import UIKit

class MenuButton: UIView {
    @IBInspectable var iconUrl: UIImage?
    @IBInspectable var title: String?
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var labelTitle: UIRegularLabel!
    @IBOutlet weak var circleBg: UIView!
    @IBOutlet weak var labelNumber: UIRegularLabel!
    
    var activeColor = UIColor(hexStr: "FF0000")
    var inactiveColor = UIColor(hexStr: "767676")
    var textActiveColor = UIColor(hexStr: "FF0000")
    var textInActiveColor = UIColor(hexStr: "000000")
    
    var menuId: Int = -1
    var onClick: ((_ menuId: Int)->())?
    
    override init(frame: CGRect) { // For using CustomView in code
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) { // For using CustomView in IB
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageIcon.image = iconUrl
        labelTitle.text = title
    }
    
    func setMenuActive() {
        labelTitle.textColor = textActiveColor
    }
    
    func setMenuInActive() {
        labelTitle.textColor = textInActiveColor
    }
    
    func showNotify(number: Int) {
        if number == 0 {
            circleBg.isHidden = true
        } else {
            circleBg.isHidden = false
            labelNumber.text = String(number)
        }
    }
    
    private func commonInit() {
        // Load view from nib
        Bundle.main.loadNibNamed("MenuButton", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }

    @IBAction func menuOnClick(_ sender: Any) {
        onClick?(self.menuId)
    }
}
