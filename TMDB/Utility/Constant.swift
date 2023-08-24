//
//  Constant.swift
//  TMDB
//
//  Created by Rizwan Mehmood on 22/08/2023.
//

import Foundation



// This struct defines constants used throughout the application.
struct Constants {
    
    // Keys
    struct Keys {
        static let TOKEN = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4MzI5NjVlYzNmZDM0Njc2NTRiMmFmZGNjMDUxZGM2YyIsInN1YiI6IjY0ZTRiZDVmMDZmOTg0MDE0ZTY2YjgxOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.XOdLe3zdet3o-9v6K7nQuUGk8ySwiW19fp14JTxFwAs"  // JWT token used for authentication
    }
        
    // Request Headers
    struct RequestHeaders {
        static let AUTHORIZATION = "Authorization"  // Header for authorization
        static let TOKEN_TYPE = "Bearer"  // Token type for authorization header
        static let CONTENT_TYPE = "Content-Type"  // Header for specifying content type
        static let Accept_Type = "Accept"  // Header for specifying accepted content types
    }
    
    // Data Send and Receive Type
    static let DataSendRecType = "application/json; charset=utf-8"  // Default data type for sending and receiving data
    
    // Base URLs
    static let BASE_URL = "https://api.themoviedb.org/"  // Base URL for API requests
    static let IMAGE_URL = "https://image.tmdb.org/t/p/w500"  // Base URL for movie image retrieval
    
    // API Services
    struct APIServices {
        static let popularMoviesListServiceAPI = "3/movie/popular"  // API endpoint for fetching popular movie list
    }
    
    // Keys or Fields used in API Requests
    struct ApiRequestFields {
        static let Key_Token = "Token"  // Key for sending authentication token
        static let Key_Id = "Id"  // Key for sending entity IDs
        static let Key_ClientId = "ClientId"  // Key for sending client ID
        static let Key_UserId = "UserId"  // Key for sending user ID
        static let Key_UserName = "UserName"  // Key for sending username
        static let Key_FullName = "FullName"  // Key for sending full name
        static let Key_RoleName = "RoleName"  // Key for sending role name
    }
    
    // Connectivity Messages
    struct Connectivity {
        static let NO_INTERNET = "Internet Connection not Available!"  // Message for no internet connectivity
    }
    
    // Error Messages
    struct ErrorMessage {
        static let ERROR = "Error"  // Default error message
    }
}







    










