//
//  artTableViewCell.swift
//  NYTimesArticles
//
//  Created by Hesham Mohammed on 28/06/2022.
//

import UIKit
import Reusable
import Kingfisher

class ArticlesTableViewCell: UITableViewCell, Reusable, ArticlesCellProtocol {
    
    @IBOutlet weak var articleLabel: UILabel!
    @IBOutlet weak var articleImageView: UIImageView!
    
    // MARK: - Cell registration
    
    static let cellIdentifier: String = "ArticlesTableViewCell"
    static let cellNib: UINib = UINib(nibName: "ArticlesTableViewCell", bundle: nil)
    
    var articleTitle: String = "" {
        didSet {
            articleLabel.text = articleTitle
        }
    }
    
    var articleImageUrl: String? {
        didSet {
            if let url = articleImageUrl {
                articleImageView.kf.setImage(with: URL(string: url))
            }
        }
    }
}
