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
    var zipCode: String = "19454"
    let locationKey: String = ""
    
    //button f(x) fix - FIXED!
    @IBAction func searchCity(_ sender: UIButton) {
        zipCode = zipSearchTextField.text!
        print(zipCode)
    }
    //parse for location key
    func callLocationAPI() -> String {
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
                        print(jsonString)
                    }
                    
                    } else if let requestError = error {
                    print("Error fetching location: \(requestError)")
                    } else {
                    print("Unexpected error fetching location")
                    }
            }
            task.resume()
        struct Response: Codable {
            let Version: String
            let Key: String
        }
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let res = try JSONDecoder().decode(Response.self, from: data)
                        print(res.Key)
                    } catch let error {
                        print(error)
                    }
                }
            }.resume()
        
        return "19454"
       }
        
    // parse for city name, temperature, and icon
    private func callTemperatureAPI(locationKey: String) {
        let url = URL(string: "http://dataservice.accuweather.com/forecasts/v1/daily/1day/\(locationKey)?apikey=K9ThwCmT3GORmKWcF8osHlQ9TaviWkXV&language=en-us&details=false&metric=true")!
       
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
        }
       
                } else if let requestError = error {
                    print("Error fetching temperature: \(requestError)")
        } else {
                    print("Unexpected error fetching temperature")
                }
        }
            task.resume()
        
       }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        callTemperatureAPI(locationKey:  callLocationAPI())
        // Do any additional setup after loading the view.
    }


}

