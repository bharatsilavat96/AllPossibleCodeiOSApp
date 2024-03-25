//
//  DropDownButton.swift
//  AllInOneiOSProjectApp
//
//  Created by Apple on 13/04/23.
//

import Foundation
import UIKit

class DropdownButton: UIButton {
    
    private let arrowImageView = UIImageView()
    private let dropdownMenu = UITableView()
    private var isDropdownOpen = false
    private var dropdownItems = [String]()
    
    // MARK: - Initialization
    
    init(items: [String]) {
        super.init(frame: .zero)
        self.dropdownItems = items
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        self.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        // Set up arrow image view
        arrowImageView.image = UIImage(named: "down_arrow_image") // Replace with your own arrow image
        arrowImageView.contentMode = .scaleAspectFit
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(arrowImageView)
        
        NSLayoutConstraint.activate([
            arrowImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            arrowImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            arrowImageView.widthAnchor.constraint(equalToConstant: 20),
            arrowImageView.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        // Set up dropdown menu
        dropdownMenu.delegate = self
        dropdownMenu.dataSource = self
        dropdownMenu.isHidden = true
        dropdownMenu.translatesAutoresizingMaskIntoConstraints = false
        self.superview?.addSubview(dropdownMenu)
        
        NSLayoutConstraint.activate([
            dropdownMenu.topAnchor.constraint(equalTo: self.bottomAnchor),
            dropdownMenu.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            dropdownMenu.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            dropdownMenu.heightAnchor.constraint(equalToConstant: 150) // Set your desired height for the dropdown menu
        ])
    }
    
    // MARK: - Button Action
    
    @objc private func buttonTapped() {
        isDropdownOpen = !isDropdownOpen
        dropdownMenu.isHidden = !isDropdownOpen
    }
}

// MARK: - UITableViewDataSource

extension DropdownButton: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dropdownItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "DropdownCell")
        cell.textLabel?.text = dropdownItems[indexPath.row]
        return cell
    }
}

// MARK: - UITableViewDelegate

extension DropdownButton: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = dropdownItems[indexPath.row]
        setTitle(selectedItem, for: .normal)
        buttonTapped()
    }
}

