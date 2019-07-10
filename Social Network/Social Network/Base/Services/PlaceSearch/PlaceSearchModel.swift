import UIKit

class PlaceSearchModel {
    var placeId: String = ""
    var fullText: String = ""
    var primaryText: String = ""
    var secondaryText: String = ""
    var addressComponents: [String]?
    
    class Address {
        var route: String = ""
        var geocode: String = ""
    }
}
