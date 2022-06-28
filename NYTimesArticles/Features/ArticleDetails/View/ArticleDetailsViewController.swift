//
//  ArticleDetailsViewController.swift
//  NYTimesArticles
//
//  Created by Hesham Mohammed on 27/06/2022.
//

import UIKit
import Kingfisher

protocol ArticleDetailsViewProtocol {
    var articleTitle: String { get set }
    var articleImageUrl: String? { get set }
}

class ArticleDetailsViewController: UIViewController, ArticleDetailsViewProtocol {
    
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var detailsLabel: UILabel!
    
    // MARK: - Properties
    var presenter: ArticleDetailsPresenter!
    
    // MARK: Initializer
    init(){
        super.init(nibName: "ArticleDetailsViewController", bundle: nil)
    }

    required init?(coder: NSCoder) {
        assertionFailure("init(coder:) has not been implemented")
        return nil
    }
    
    var articleTitle: String = "" {
        didSet {
            detailsLabel.text = articleTitle
        }
    }
    
    var articleImageUrl: String? {
        didSet {
            if let url = articleImageUrl {
                headerImageView.kf.setImage(with: URL(string: url))
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidloaded()
    }
    
    static func makeViewController(article: Article) -> ArticleDetailsViewController {
        let viewControoler = ArticleDetailsViewController()
        let presenter = ArticleDetailsPresenter(article: article, view: viewControoler)
        viewControoler.presenter = presenter
        
        return viewControoler
    }
}
