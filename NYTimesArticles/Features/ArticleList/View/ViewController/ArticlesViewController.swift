//
//  ArticlesListViewController.swift
//  NYTimesArticles
//
//  Created by Hesham Mohammed on 27/06/2022.
//

import UIKit
import Alamofire
import Kingfisher

protocol ArticlesViewProtocol: LoadingViewShowing, ErrorViewShowing {
    func showArticles()
    func navigateToArticleDetailsScreen(article: Article) 
}

protocol ArticlesCellProtocol: AnyObject {
    var articleTitle: String { get set }
    var articleImageUrl: String? { get set }
}

class ArticlesViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var articlesTableView: UITableView!
    
    // MARK: - Properties
    var presenter: ArticlesPresenter!
        
    
    // MARK: Initializer
    init(){
        super.init(nibName: "ArticlesViewController", bundle: nil)
    }

    required init?(coder: NSCoder) {
        assertionFailure("init(coder:) has not been implemented")
        return nil
    }
    
    static func makeViewController() -> ArticlesViewController {
        let viewControoler = ArticlesViewController()
        let presenter = ArticlesPresenter(view: viewControoler)
        viewControoler.presenter = presenter
        
        return viewControoler
    }
    
    // MARK: LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        articlesTableView.register(ArticlesTableViewCell.cellNib, forCellReuseIdentifier: ArticlesTableViewCell.cellIdentifier)
        presenter?.viewDidloaded()
    }
    
}

extension ArticlesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.articlesCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ArticlesTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        presenter.configureCell(cell: cell, index: indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectArticleAtIndex(index: indexPath.row)
    }
}

extension ArticlesViewController: ArticlesViewProtocol {
    func showArticles() {
        self.articlesTableView.reloadData()
    }
    
    func navigateToArticleDetailsScreen(article: Article) {
        self.navigationController?.pushViewController(ArticleDetailsViewController.makeViewController(article: article), animated: true)
    }
}

