//
//  TableViewCell.swift
//  RickandMorty
//
//  Created by huseyin.kucuk on 15.11.2021.
//

import UIKit
import Kingfisher

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mainUIImageView: UIImageView!
    
    func configureCell(with item: CellViewModel) {
        let urlToString = item.imageURL?.absoluteString
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "tr_TR")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        nameLabel.text = item.name
        let convertedDate = dateFormatter.date(from: item.created)!//unwrap yerine olağanca kontrol handling guard let if let
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        let convertedStringDate = dateFormatter.string(from: convertedDate)
        dateLabel.text = convertedStringDate
        mainUIImageView.kf.indicatorType = .activity
        setURL(url: urlToString!)
        mainUIImageView.setImageWithURL(url: urlToString!)
    }
    
    
}



extension TableViewCell
{
    func setURL(url: String) {
        mainUIImageView.kf.setImage(with: URL(string: url), placeholder: nil, options: [.transition(.fade(0.7))], completionHandler: nil)
    }
}

extension UIImageView {
    
    func setImageWithURL(url: String) {
        kf.setImage (with: URL(string: url), placeholder: nil, options: [.transition(.fade(0.7))], completionHandler: nil)
    }
}
