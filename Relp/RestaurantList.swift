//
//  RestaurantList.swift
//  Relp
//
//  Created by Nishanth P on 2/23/17.
//  Copyright © 2017 Nishapp. All rights reserved.
//

import UIKit

class RestaurantList: UITableViewController {

    let identifer : String = "relpCell"
    let API : String = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670,151.1957&radius=500&types=food&name=cruise&key=AIzaSyAZzPfNO8KSatKBRCYaFUjL8WwdcX-ugbk"
    
    var restaurants:[Restaurant] = [Restaurant]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        restaurantAPI(API) { (array) in
            
            self.restaurants = array
            self.tableView.reloadData()
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurants.count
    }

        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifer , for: indexPath)
        let restaurant = restaurants[indexPath.row]
        
        
        cell.textLabel?.text = restaurant.name!

        return cell
            
    }
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}



extension RestaurantList{
    
    func restaurantAPI(_ urlString:String, completion:@escaping (_ array:[Restaurant]) ->()){
        
        
        var restArray : [Restaurant] = [Restaurant]()
        var openNow:Bool = false
        
        let url = URL(string:urlString)
        let urlSessionTask = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error == nil{
                
                if let validData = data{
                    
                    do {
                        
                        let jsonDict = try JSONSerialization.jsonObject(with: validData, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                            let reslist = jsonDict["results"] as! NSArray
                        for restaurantType in reslist{
                            
                            let restaurant = restaurantType as! NSDictionary
                            
                            let name = restaurant["name"] as! String
                            let geometry = restaurant["geometry"] as! NSDictionary
                            
                            if let openingHours = restaurant["opening_hours"] as? NSDictionary {
                                let openNow = openingHours["open_now"] as! Bool
                            }
            
                            let location = geometry["location"] as! NSDictionary
                            let latitude = location["lat"] as! Double
                            let longitude = location["lng"] as! Double
                            
                            let address = restaurant["vicinity"] as! String
                            let rating = restaurant["rating"] as? Int ?? 0
                            let price = restaurant["price_level"] as? Int ?? 0
                            
                            let newRestaurant = Restaurant(name:name, lat:latitude, long:longitude, address:address, open:openNow, rating:rating, price:price)
                            
                            restArray.append(newRestaurant)
                            
                            completion(restArray)
                        }

                    }
                    catch {
                        print(error.localizedDescription)
                    }//do
                    
                }//if
                
                
            }//if
            
        }//task
        
        urlSessionTask.resume()
        
        
    }
    
    
    
    
    
    
    
    
    
    
}
