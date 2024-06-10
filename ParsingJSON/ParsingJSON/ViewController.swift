//
//  ViewController.swift
//  ParsingJSON
//
//  Created by Irsyad Ashari on 16/05/24.
//

import UIKit

class ViewController: UIViewController {
    private let mainViewModel = MainViewModel()
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(tableView)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.register(TextCell.self, forCellReuseIdentifier: TextCell.reuseIdentifier)
        
        setupConstraint()
        tableView.dataSource = self
    }

    private func setupConstraint() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        // set to center
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainViewModel.getData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TextCell.reuseIdentifier, for: indexPath) as? TextCell else {
            return UITableViewCell()
        }
        
        let model = mainViewModel.getData()[indexPath.row]
        var text = ""
        switch model {
            
        case .heading(let heading):
            text = heading.text
        case .paragraph(let paragraph):
            text = paragraph.text
        case .image(let image):
            text = image.source
        case .quote(let quote):
            text = quote.text
        }
        
        cell.configure(textValue: text)
        return cell
    }
}

