//
//  NewsViewModel.swift
//  HaberProjesi
//
//  Created by mehmet emin akman on 11.02.2024.
//

import Foundation

struct NewsTableViewModel{
    let newsList : [News]
    
    
    func numberOfRowInSection() -> Int {
        return self.newsList.count
    }
    
    func newsAtIndexPath(_ index : Int) -> NewsViewModel{
        let news = self.newsList[index]
        return NewsViewModel(news : news)
    }
    
    
}

struct NewsViewModel{
    
    let news : News
    
    var title : String{
        return self.news.title
    }
    
    var stroy : String{
        return self.news.story
    }
    
    
}
