//
//  ViewController.swift
//  HaberProjesi
//
//  Created by mehmet emin akman on 8.02.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var tableView: UITableView!
    
    private var newsTableViewModel: NewsTableViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        verileriAl()
    }
    
    func verileriAl(){
        
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/BTK-iOSDataSet/master/dataset.json")
        WebServices().internettenHaberleriIndir(url: url!) { (haberler) in
            if let haberler = haberler{
                self.newsTableViewModel = NewsTableViewModel(newsList: haberler)
            }
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsTableViewModel == nil ? 0 : self.newsTableViewModel.numberOfRowInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsCell
        let newsViewModel = self.newsTableViewModel?.newsAtIndexPath(indexPath.row)
        cell.titleLabel.text = newsViewModel?.title
        cell.storyLabel.text = newsViewModel?.stroy
        return cell
    }
    
    
    
    


}

