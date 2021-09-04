//
//  ViewController.swift
//  SmallWeatherApp
//
//  Created by Monisha Ravi on 9/2/21.
//

import UIKit

class ViewController: UIViewController {
    //button defaults fix
    //button dynamics fix
    
    @IBOutlet var zipSearchTextField: UITextField!
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var cityTemperatureLabel: UILabel!
    let apiKey = "K9ThwCmT3GORmKWcF8osHlQ9TaviWkXV"
    var zipCode: String = ""
    var locationKey: String = ""
    var cityName: String = ""
    var cityTemperature: String = ""
    
    
    //button f(x)
    @IBAction func searchCity(_ sender: UIButton) {
        zipCode = zipSearchTextField.text!
        print(zipCode)
        LocationAPI()
    }
    //parse for location key
    func LocationAPI() -> String {
        print("MARKED LOCATION API")
        print (zipCode)
        let url = URL(string: "http://dataservice.accuweather.com/locations/v1/postalcodes/search?apikey=\(apiKey)&q=\(zipCode)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session: URLSession = {
               let config = URLSessionConfiguration.default
               return URLSession(configuration: config)
           }()
         
            let task = session.dataTask(with: request) {
                (data, response, error) in
                if let jsonData = data {
                    if let jsonString = String(data: jsonData, encoding: .utf8) {
                        //print(jsonString)
                        let users = try! JSONDecoder().decode([Location].self, from: jsonData)

                        for user in users {
                            print("GOTCHA\(user.Key)")
                            self.cityName = user.LocalizedName
                            self.locationKey = user.Key
                            print("GOTCHASELFLOC \(self.locationKey)")
                            print("GOTCHASELFLOC2 \(self.cityName)")
                            break
                        }
                    }
                    
                    } else if let requestError = error {
                    print("Error fetching location: \(requestError)")
                    } else {
                    print("Unexpected error fetching location")
                    }
            }
            task.resume()
        self.cityNameLabel.text = cityName
        return locationKey
       }
        
    // parse for city name, temperature, and icon
//    private func callTemperatureAPI(locationKey: String) {
//        print("REACHED TEMP API")
//        let url = URL(string: "http://dataservice.accuweather.com/forecasts/v1/daily/1day/\(locationKey)apikey=\(apiKey)&language=en-us&details=false&metric=true")!
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//
//        let session: URLSession = {
//               let config = URLSessionConfiguration.default
//               return URLSession(configuration: config)
//           }()
//
//            let task = session.dataTask(with: request) {
//                (data, response, error) in
//                if let jsonData = data {
//                    if let jsonString = String(data: jsonData, encoding: .utf8) {
//                        print(jsonString)
//
//        }
//
//                } else if let requestError = error {
//                    print("Error fetching temperature: \(requestError)")
//        } else {
//                    print("Unexpected error fetching temperature")
//                }
//        }
//            task.resume()
//
//       }
//
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.systemBlue
//        callTemperatureAPI(locationKey:  LocationAPI())
        // Do any additional setup after loading the view.
    }


}

