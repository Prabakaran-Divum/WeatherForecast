//
//  WeatherManager.swift
//  WeatherForecast
//
//  Created by Prabakaran on 22/05/22.
//

import Foundation
import Alamofire

class WeatherManager {
    private static let sharedInstance = WeatherManager()
    static func getForeCastInfo(with cityName: String, _ success: @escaping ((_ response: ForecastModel, _ statusCode: Int) -> Void), failure: @escaping ((_ error: Error) -> Void)) {
        sharedInstance.getForeCastInfoCall(with: cityName) { (forecastModel, statusCode) in
            success(forecastModel, statusCode)
        } _: { (error) in
            failure(error)
        }
    }
}
extension WeatherManager {
    private func getForeCastInfoCall(with cityName: String, _ success: @escaping ((_ response: ForecastModel, _ statusCode: Int) -> Void), _ failure: @escaping ((_ error: Error) -> Void)) {

        let apiUrl = "\(Api.baseUrl)\(Api.endPoint(for: .forecast))?appid=\(APPLocalConfig.APIKey)&q=\(cityName)"

        Alamofire.request(apiUrl, method: .get, encoding: JSONEncoding.default, headers: ApiHeader.sharedInstance.getApiHeaders()).responseJSON { (alamofireResponse) in
            convertFromJSONToModel(alamofireResponse) { (data, _ statusCode) -> Forecast? in
                do {
                    let forecastModel = try JSONDecoder().decode(ForecastModel.self, from: data)
                    success(forecastModel, statusCode)
                } catch {
                    handleDecode(error: error)
                }
                return nil
            }
        }
    }
}


  // MARK: - JSON Model
  func convertFromJSONToModel<T: Codable>(_ response: DataResponse<Any>, decode: ((_ data: Data, _ statusCode: Int) -> T?), failure: ((_ error: Error) -> Void)? = nil) {
      switch response.result {
//      case .success:
      case .success(let json):
          print("Success Response JSON: \(json)")
          let statusCode = response.response?.statusCode ?? 0
          if let responseData = response.data {
              _ = decode(responseData, statusCode)
          }
      case .failure(let error):
          let errorMessage = error.localizedDescription
          let statusCode = response.response?.statusCode ?? 0

          print("API Error Message: \(errorMessage) and StatusCode: \(statusCode)")
          if let failureClosure = failure { failureClosure(error) }
          failure?(error)
      }
  }
  func handleDecode(error: Error) {
      print("decode error: \(error.localizedDescription)")
  }
