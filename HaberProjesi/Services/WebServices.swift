//
//  WebServices.swift
//  HaberProjesi
//
//  Created by mehmet emin akman on 8.02.2024.
//

import Foundation


class WebServices{
    
    func internettenHaberleriIndir(url: URL, completion: @escaping ([News]?) ->() ){ // escaping closer
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error{
                print(error.localizedDescription)
                completion(nil)
            }
            else if let data = data {
                
                let haberlerDizisi = try? JSONDecoder().decode([News].self, from: data)
                if let haberlerDizisi = haberlerDizisi{
                    completion(haberlerDizisi)
                }
                
            }
        }.resume()
        
    }
    
}
