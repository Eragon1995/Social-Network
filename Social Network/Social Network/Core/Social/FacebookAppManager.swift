
import UIKit
import FBSDKLoginKit

class FacebookAppManager: NSObject {
    
    static let sharedInstance = FacebookAppManager()
    
    var fbLoginOnSuccess: ((FBMeResponse) -> ())?
    
    override init() {
        super.init()
        // Initialization code
    }
    
    // MARK: - Facebook Login
    
    func getFBUserData(){
        if((FBSDKAccessToken.current()) != nil){
            
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, email"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil && result != nil){
                    let dictDatas = result as! NSDictionary
                    
                    let fbMeResponse = FBMeResponse()
                    
                    // Fb id
                    if let fbId = dictDatas.object(forKey: "id") {
                        fbMeResponse.fbId = fbId as! String
                    }
                    
                    // Fb name
                    if let name = dictDatas.object(forKey: "name") {
                        fbMeResponse.name = name as! String
                    }
                    
                    // Email
                    if let email = dictDatas.object(forKey: "email") {
                        fbMeResponse.email = email as! String
                    }
                    
                    
                    self.fbLoginOnSuccess?(fbMeResponse)
                }else{
                    // Show error
                }
            })
        }
    }
    
    func signInFromViewController(viewController: UIViewController) {
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["public_profile", "email"], from: viewController) { (result, error) in
            if (result != nil && error == nil){
                let fbloginresult : FBSDKLoginManagerLoginResult = result!
                if(fbloginresult.grantedPermissions != nil && fbloginresult.grantedPermissions.contains("email")){
                    self.getFBUserData()
                }
            }else{
                // Show Error here
            }
        }
    }
    
    func signOut() {
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager.logOut()
    }
}
