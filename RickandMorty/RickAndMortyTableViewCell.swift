////
////  RickAndMortyTableViewCell.swift
////  RickandMorty
////
////  Created by huseyin.kucuk on 11.11.2021.
////
//
//import UIKit
//import Foundation
//
//class RickAndMortyTableViewCellViewModel {
//    let name: String
//    let created: String
//    let imageURL: URL?
//    var imageData: Data? = nil
//    
//    init(name: String,
//         created: String,
//         imageURL: URL?
//    ) {
//        self.name = name
//        self.created = created
//        self.imageURL = imageURL
//    }
//}
//
//class RickAndMortyTableViewCell: UITableViewCell {
//
//    static let identifier = "RickAndMortyTableViewCell"
//    
//    private let ramNameLabel: UILabel = {
//        let label = UILabel()
//        label.numberOfLines = 0
//        label.font = .systemFont (ofSize: 25, weight: .medium)
//        return label
//    }()
//    private let ramCreatedLabel: UILabel = {
//        let label = UILabel()
//        label.numberOfLines = 0
//        label.font = .systemFont (ofSize: 18, weight: .regular)
//        return label
//    }()
//	
//    private let ramImageView: UIImageView = {
//       let imageView = UIImageView()
//        imageView.clipsToBounds = true
//        imageView.backgroundColor = .secondarySystemBackground
//        imageView.contentMode = .scaleAspectFill
//        return imageView
//    }()
//    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        contentView.addSubview(ramNameLabel)
//        contentView.addSubview(ramCreatedLabel)
//        contentView.addSubview(ramImageView)
//    }
//    required init?(coder: NSCoder) {
//        fatalError()
//    }
//    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        ramNameLabel.frame = CGRect(
//                                    x: 10,
//                                    y: 0,
//                                    width: contentView.frame.size.width - 200,
//                                    height: 70)
//        ramCreatedLabel.frame = CGRect(
//                                    x: 10,
//                                    y: 70,
//                                    width: contentView.frame.size.width - 200,
//                                    height: contentView.frame.size.height/2)
//        ramImageView.frame = CGRect(
//                                    x: contentView.frame.size.width - 200,
//                                    y: 5,
//                                    width: 190,
//                                    height: contentView.frame.size.height - 10)
//        
//    }
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        ramNameLabel.text = nil
//        ramCreatedLabel.text = nil
//        ramImageView.image = nil
//    }
//    func configure(with viewModel: RickAndMortyTableViewCellViewModel) {
//        ramNameLabel.text = viewModel.name
//        ramCreatedLabel.text = viewModel.created
////        var url:NSURL = NSURL.URLWithString("http://myurl/ios8.png%22")
////            var data:NSData = NSData.dataWithContentsOfURL(url, options: nil, error: nil)
////
////            imageView.image = UIImage.imageWithData(data)// Error here
//        if let data = viewModel.imageData {
//           // ramImageView.image = UIImage(data: data)
//        }
//        else if let url = viewModel.imageURL {
//            URLSession.shared.dataTask(with: url) { data, _, error in
//                guard let data = data, error == nil else {
//                    return
//                }
//                //viewModel.imageData = data
//                DispatchQueue.main.async {
//                    self.ramImageView.image = UIImage(data: data)
//                }
//            }.resume()
//            
//        }
//    }
//}
