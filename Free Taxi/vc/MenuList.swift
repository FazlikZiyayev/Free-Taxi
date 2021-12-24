//
//  MenuListController.swift
//  Free Taxi
//
//  Created by Fazlik Ziyaev on 21/12/21.
//

import UIKit

class MenuList: UIViewController {

    let items = ["Мои поездки" , "Способы оплаты " , "Избранные адреса"]
    let itemsPic = [
        UIImage(named: "my_trips_icon"),
        UIImage(named: "wallet_icon"),
        UIImage(named: "star_icon")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        
        let profileView = UIView()
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        
        let profilePic = UIImageView()
        let nameLabel = UILabel()
        let lastNameLabel = UILabel()
        let phoneNumberLabel = UILabel()
        
        view.addSubview(profileView)
        
        profileView.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        profilePic.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        lastNameLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        
        profileView.backgroundColor = UIColor(named: "profile_block_background")
        profileView.layer.cornerRadius = 8
        
        profileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        profileView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        profileView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        profileView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        profileView.addSubview(profilePic)
        profilePic.image = UIImage(named: "me")
        
        profilePic.heightAnchor.constraint(equalToConstant: 70).isActive = true
        profilePic.widthAnchor.constraint(equalToConstant: 70).isActive = true
        profilePic.leftAnchor.constraint(equalTo: profileView.leftAnchor, constant: 10).isActive = true
        profilePic.topAnchor.constraint(equalTo: profileView.topAnchor, constant: 15).isActive = true
        
        profilePic.layer.borderWidth = 1
        profilePic.layer.masksToBounds = false
        profilePic.layer.borderColor = UIColor.black.cgColor
        profilePic.layer.cornerRadius = 35
        profilePic.clipsToBounds = true
        
        profileView.addSubview(nameLabel)
        nameLabel.text = "Fazliddin"
        nameLabel.textColor = .white
        nameLabel.font = .boldSystemFont(ofSize: 17)
        nameLabel.topAnchor.constraint(equalTo: profileView.topAnchor, constant: 17).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: profilePic.rightAnchor, constant: 10).isActive = true
        
        profileView.addSubview(lastNameLabel)
        lastNameLabel.text = "Ziyaev"
        lastNameLabel.textColor = .white
        lastNameLabel.font = .boldSystemFont(ofSize: 17)
        lastNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        lastNameLabel.leftAnchor.constraint(equalTo: profilePic.rightAnchor, constant: 10).isActive = true
        
        profileView.addSubview(phoneNumberLabel)
        phoneNumberLabel.text = "+998 99 643 16 30"
        phoneNumberLabel.textColor = .lightGray
        phoneNumberLabel.font = .systemFont(ofSize: 15)
        phoneNumberLabel.topAnchor.constraint(equalTo: lastNameLabel.bottomAnchor, constant: 5).isActive = true
        phoneNumberLabel.leftAnchor.constraint(equalTo: profilePic.rightAnchor, constant: 10).isActive = true
        
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = .black
        
        tableView.topAnchor.constraint(equalTo: profileView.bottomAnchor, constant: 20).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
}

extension MenuList: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" , for: indexPath)
        cell.textLabel?.textColor = .white
        cell.backgroundColor = .black
        cell.textLabel?.text = items[indexPath.row]
        cell.imageView?.image = itemsPic[indexPath.row]
        
        return cell
    }
}

extension MenuList: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let presentedVC = TripHistory()
        let vc = UINavigationController(rootViewController: presentedVC)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
}
