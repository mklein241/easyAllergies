//
//  Foods.swift
//  EasyAllergies
//
//  Created by Michael Klein on 5/9/21.
//

import Foundation

class Foods {
    
    struct Returned: Codable {
        var items: [Item]
        var error: String?
    }
    
    var foodArray: [Item] = []
    var urlString = "https://chompthis.com/api/v2/food/branded/search.php?api_key=16CVuwSWrltrt3MCg&country=United%20States"

    
    func getData(completed: @escaping ()->()) {
        print("Accessing some JAWNS BIG MAN url \(urlString)")
        guard let url = URL(string: urlString) else {
            print("🤬ERROR: Could not create a URL from \(urlString)")
            completed()
            return
    }
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("🤬 ERROR: \(error.localizedDescription)") }

        do {
            let returned = try JSONDecoder().decode(Returned.self, from: data!)
            self.foodArray = returned.items
            print("ayo bruv what we be returning? it be this \(self.foodArray)")
            print("🤬🤬\(url)🤬🤬")
        } catch {
            print("🤬🤬\(url)🤬🤬")
            print("🤬 JSON ERROR: \(error.localizedDescription)")
        }
             completed()
        }
        task.resume()
    }
    
}
