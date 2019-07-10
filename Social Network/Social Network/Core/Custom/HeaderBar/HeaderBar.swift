
import UIKit

class HeaderBar: UIView {
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var buttonMenu: UIButton!
    @IBOutlet weak var buttonBack: UIButton!
    
    @IBOutlet weak var buttonMenuLeadConstrain: NSLayoutConstraint!
    // 0: Type Menu button only, 1: Type Menu button and back button, 2: Type back button only
    @IBInspectable var _headerBarType: Int = 0
    @IBInspectable var _backgrounColor: UIColor?
    @IBInspectable var _title: String?
    
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
        
        // Set header color
        if (_backgrounColor != nil) {
            headerView.backgroundColor = _backgrounColor
        }
        
        // Set title
        if (_title != nil) {
            labelTitle.text = _title
        }
        
        // Header bar type
        let buttonMenuLeadConstrainPosition1 = 16;
        let buttonMenuLeadConstrainPosition2 = 64
        // Type Menu button only
        if (_headerBarType == 0) {
            buttonMenu.isHidden = false
            buttonBack.isHidden = true
            buttonMenuLeadConstrain.constant = CGFloat(buttonMenuLeadConstrainPosition1)
        } else if (_headerBarType == 1) {
            // 1: Type Menu button and back button
            buttonMenu.isHidden = false
            buttonBack.isHidden = false
            buttonMenuLeadConstrain.constant = CGFloat(buttonMenuLeadConstrainPosition2)
        } else if (_headerBarType == 2) {
            // 2: Type back button
            buttonMenu.isHidden = true
            buttonBack.isHidden = false
        }
    }
    
    private func commonInit() {
        // Load view from nib
        Bundle.main.loadNibNamed("HeaderBar", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    

}
