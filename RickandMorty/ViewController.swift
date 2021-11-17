////
////  ViewController.swift
////  RickandMorty
////
////  Created by huseyin.kucuk on 10.11.2021.
////
//
//import UIKit
//import Foundation
//
//class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//    
//    private let tableView: UITableView = {
//        let table = UITableView()
//        table.register(RickAndMortyTableViewCell.self,forCellReuseIdentifier: RickAndMortyTableViewCell.identifier)
//        return table
//    }()
//    
//    private var viewModels = [RickAndMortyTableViewCellViewModel]()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        title = "Rick&Morty"
//        view.addSubview(tableView)
//        tableView.delegate = self
//        tableView.dataSource = self
//        view.backgroundColor = .systemBackground
//        APICaller.shared.getData { [weak self] result in
//            switch result {
//            case .success(let data):
//                self?.viewModels = data.compactMap({RickAndMortyTableViewCellViewModel(name: $0.name, created: $0.created, imageURL: URL(string: $0.image ))
//                    
//                })
//                DispatchQueue.main.async {
//                    self?.tableView.reloadData()
//                }
//                
//            case .failure(let error):
//                print(error)
//            }
//        }
//        
//    }
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        tableView.frame = view.bounds
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return viewModels.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        guard let cell = tableView.dequeueReusableCell(withIdentifier: RickAndMortyTableViewCell.identifier, for: indexPath
////        ) as? RickAndMortyTableViewCell else {
////            fatalError()
////        }
////        cell.configure(with: viewModels[indexPath.row])
////        return cell
//    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 150
//    }
//}
