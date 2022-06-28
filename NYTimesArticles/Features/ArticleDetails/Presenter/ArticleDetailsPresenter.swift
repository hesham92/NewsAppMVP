//
//  ArticleDetailsPresenter.swift
//  NYTimesArticles
//
//  Created by Hesham Mohammed on 28/06/2022.
//

import Foundation

protocol ArticleDetailsPresenterPresenterProtocol {
    func viewDidloaded()
}

class ArticleDetailsPresenter: ArticleDetailsPresenterPresenterProtocol {
    var view: ArticleDetailsViewProtocol
    var article: Article
    
    init(article: Article, view: ArticleDetailsViewProtocol){
        self.view = view
        self.article = article
    }
    
    func viewDidloaded() {
        view.articleTitle = article.title
        if article.media.count > 0 {
            view.articleImageUrl = article.media[0].mediaMetadata?[MediaFormat.mediumThreeByTwo440.index].url
        }
    }
}
