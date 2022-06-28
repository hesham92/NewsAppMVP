//
//  ArticlesListPresenter.swift
//  NYTimesArticles
//
//  Created by Hesham Mohammed on 28/06/2022.
//

import Foundation

protocol ArticlesPresenterProtocol {
    var articlesCount: Int { get }
    func viewDidloaded()
    func didSelectArticleAtIndex(index: Int)
    func configureCell(cell: ArticlesCellProtocol, index: Int)
}

class ArticlesPresenter: ArticlesPresenterProtocol {
    let service: ArticlesServiceProviderProtocol
    let view: ArticlesViewProtocol
    var articles:[Article] = []
    
    init(view: ArticlesViewProtocol, service: ArticlesServiceProviderProtocol = ArticlesServiceProvider()){
        self.view = view
        self.service = service
    }
    
    var articlesCount: Int {
        return articles.count
    }
    
    func viewDidloaded() {
        self.view.showLoading()
        
        service.fetchArticles(completion: { [weak self] (result) in
            guard let self = self else { return }
            self.view.hideLoading()
            
            switch(result) {
            case .success(let articleResponse):
                print(articleResponse)
                self.articles = articleResponse.results
                self.view.showArticles()
            case .failure(let error):
                print(error)
                self.view.showError(error)
            }
        })
    }
    
    func configureCell(cell: ArticlesCellProtocol, index: Int) {
        cell.articleTitle = articles[index].title
        if articles[index].media.count > 0 {
            cell.articleImageUrl = articles[index].media[0].mediaMetadata?[MediaFormat.mediumThreeByTwo440.index].url
        }
    }
    
    func didSelectArticleAtIndex(index: Int) {
        self.view.navigateToArticleDetailsScreen(article: articles[index])
    }
}

