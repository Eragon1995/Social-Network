
import UIKit
import GooglePlaces

class GooglePlaceSearch: NSObject {
    var placesClient: GMSPlacesClient!
    
    func setupComponent() {
        placesClient = GMSPlacesClient.shared()
    }
    
    func getAutocomplatePredictions(textSearch: String, countryCode: String, searchCallBack: @escaping ([PlaceSearchModel]) -> ()) {
        var arrPlaceSearch: [PlaceSearchModel] = []
        
        /**
         * Create a new session token. Be sure to use the same token for calling
         * findAutocompletePredictions, as well as the subsequent place details request.
         * This ensures that the user's query and selection are billed as a single session.
         */
        let token = GMSAutocompleteSessionToken.init()
        
        // Create a type filter.
        let filter = GMSAutocompleteFilter()
        filter.type = .noFilter
        filter.country = countryCode
        
        placesClient?.findAutocompletePredictions(fromQuery: textSearch, bounds: nil, boundsMode: GMSAutocompleteBoundsMode.bias, filter: filter, sessionToken: token, callback: { (results, error) in
            
            if let error = error {
                print("Autocomplete error: \(error)")
            } else if let results = results {
                for result in results {
                    let placeSearch = PlaceSearchModel()
                    placeSearch.placeId = result.placeID
                    placeSearch.fullText = result.attributedFullText.string
                    placeSearch.primaryText = result.attributedPrimaryText.string
                    placeSearch.secondaryText = result.attributedSecondaryText?.string ?? ""
                    placeSearch.addressComponents = result.types
                    arrPlaceSearch.append(placeSearch)
                }
            }
            searchCallBack(arrPlaceSearch)
                                                    
        })
    }
    
    func getAutocomplateCityName(textSearch: String, countryCode: String, searchCallBack: @escaping ([PlaceSearchModel]) -> ()) {
        var arrPlaceSearch: [PlaceSearchModel] = []
        
        /**
         * Create a new session token. Be sure to use the same token for calling
         * findAutocompletePredictions, as well as the subsequent place details request.
         * This ensures that the user's query and selection are billed as a single session.
         */
        let token = GMSAutocompleteSessionToken.init()
        
        // Create a type filter.
        let filter = GMSAutocompleteFilter()
        filter.type = .city
        filter.country = countryCode
        
        placesClient?.findAutocompletePredictions(fromQuery: textSearch, bounds: nil, boundsMode: GMSAutocompleteBoundsMode.bias, filter: filter, sessionToken: token, callback: { (results, error) in
            
            if let error = error {
                print("Autocomplete error: \(error)")
            } else if let results = results {
                for result in results {
                    let placeSearch = PlaceSearchModel()
                    placeSearch.placeId = result.placeID
                    placeSearch.fullText = result.attributedFullText.string
                    placeSearch.primaryText = result.attributedPrimaryText.string
                    placeSearch.secondaryText = result.attributedSecondaryText?.string ?? ""
                    placeSearch.addressComponents = result.types
                    arrPlaceSearch.append(placeSearch)
                }
            }
            searchCallBack(arrPlaceSearch)
            
        })
    }
    
}
