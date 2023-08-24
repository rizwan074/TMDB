//
//  ApiServices.swift
//  TMDB
//
//  Created by Rizwan Mehmood on 22/08/2023.
//

import Foundation
import Moya


import Foundation
import Moya

// Define an enumeration to represent different API services
enum APIServices {
    case getPopularMoviesList(language: String, page: Int)
}

// Extend the enumeration to conform to TargetType and AccessTokenAuthorizable protocols
extension APIServices: TargetType, AccessTokenAuthorizable {
    // Implement authorizationType property to specify the type of authorization (if any)
    var authorizationType: AuthorizationType? {
        return .none // No authorization required for this example
    }
    
    // Implement baseURL property to specify the base URL for the API
    var baseURL: URL {
        return URL(string: Constants.BASE_URL)!
    }
    
    // Implement path property to determine the endpoint path based on the enum case
    var path: String {
        switch self {
        case .getPopularMoviesList:
            return Constants.APIServices.popularMoviesListServiceAPI
        }
    }
    
    // Implement HTTP method property based on the enum case
    var method: Moya.Method {
        switch self {
        case .getPopularMoviesList:
            return .get
        default:
            return .post
        }
    }
    
    // Implement sampleData property to provide sample response data for testing
    var sampleData: Data {
        return Data() // Return empty data for this example
    }
    
    // Implement task property to specify how parameters are encoded for the request
    var task: Task {
        switch self {
        case .getPopularMoviesList(let language, let page):
            return .requestParameters(parameters: ["language": language, "page": page], encoding: URLEncoding.queryString)
        }
    }
    
    // Implement headers property to provide request headers
    var headers: [String: String]? {
        switch self {
        case .getPopularMoviesList:
            return [
                Constants.RequestHeaders.CONTENT_TYPE: Constants.DataSendRecType,
                Constants.RequestHeaders.AUTHORIZATION: "\(Constants.RequestHeaders.TOKEN_TYPE) \(Constants.Keys.TOKEN)"
            ]
        default:
            return [Constants.RequestHeaders.CONTENT_TYPE: Constants.DataSendRecType]
        }
    }
}

// Extend the Encodable protocol to add a computed property for converting to a dictionary
extension Encodable {
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
}
