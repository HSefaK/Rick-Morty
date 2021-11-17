//
//  TableViewController.swift
//  RickandMorty
//
//  Created by huseyin.kucuk on 15.11.2021.
//

import Foundation
import UIKit
//import Kingfisher

class CellViewModel {
    let name: String
    let created: String
    let imageURL: URL?
    
    init(name: String,
         created: String,
         imageURL: URL?
    ) {
        self.name = name
        self.created = created
        self.imageURL = imageURL
    }
}

class TableViewController: UITableViewController {
    
    private var viewModels = [CellViewModel]()

    override func viewDidLoad() {
// loading indicator kullanmaya özen göster
        APICaller.shared.getData { [weak self] result in
            switch result {
            case .success(let data):
                self?.viewModels = data.compactMap({CellViewModel(name: $0.name, created: $0.created, imageURL: URL(string: $0.image ))
                    
                })
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
                
            case .failure(let error): //popup alert error 
                print(error)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self, options: nil)?.first as! TableViewCell//tableviewdqeue cell
        cell.configureCell(with: viewModels[indexPath.row])
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 169
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}
