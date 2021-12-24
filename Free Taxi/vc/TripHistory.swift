//
//  SomeVC.swift
//  Free Taxi
//
//  Created by Fazlik Ziyaev on 21/12/21.
//

import UIKit

class TripHistory: UITableViewController {
    
    lazy var backBtn: UIBarButtonItem = {
        let btn = UIBarButtonItem()
        btn.image = UIImage(named: "btn_back")
        btn.tintColor = .black
        btn.target = self
        btn.action = #selector(backBtnPressed)
        return btn
    }()
    
    @objc func backBtnPressed(){
        self.dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.setLeftBarButton(backBtn, animated: true)
        navigationItem.title = "Мои поездки"
        navigationItem.largeTitleDisplayMode = .always
        
        
        tableView.register(UINib(nibName: "TripTableViewCell", bundle: nil), forCellReuseIdentifier: "tripCell")
        tableView.separatorColor = .clear
        tableView.rowHeight = 150
        tableView.sectionHeaderHeight = 50
    }

    // number of sections on table view
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // section header view
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 50))
        let dateLabel = UILabel(frame: CGRect(x: 20, y: 5, width: view.frame.width - 20, height: 40))
        dateLabel.text = "6 Июля, Вторник"
        dateLabel.font = .boldSystemFont(ofSize: 24)
        view.addSubview(dateLabel)
        view.backgroundColor = .white
        
        return view
    }
    
    // number of rows in each section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    // cell view
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tripCell" , for: indexPath) as! TripTableViewCell
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let presentedVC = TripDetails()
        presentedVC.modalPresentationStyle = .fullScreen
        present(presentedVC, animated: true, completion: nil)
    }
}
