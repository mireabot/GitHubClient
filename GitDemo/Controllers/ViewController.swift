//
//  ViewController.swift
//  GitDemo
//
//  Created by Mikhail Kolkov on 14.01.21.

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var viewModel = GithubUserViewModel()
    fileprivate var items = [Item]()
    fileprivate var activityIndicator = UIActivityIndicatorView(style: .large)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicatorView()
        registerCell()
        navigationBarColor()
        self.customReloadData()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    fileprivate func activityIndicatorView() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        tableView.addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    fileprivate func navigationBarColor() {
        UINavigationBar.appearance().barTintColor = .init(red: 23.0/255, green: 197.0/255, blue: 157.0/255, alpha: 1.0)
        
        // To change colour of tappable items.
        UINavigationBar.appearance().tintColor = .white
        
        // To apply textAttributes to title i.e. colour, font etc.
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor.white,
                                                            .font : UIFont.init(name: "AvenirNext-DemiBold", size: 22.0)!]
        // To control navigation bar's translucency.
        UINavigationBar.appearance().isTranslucent = false
    }
    
    private func customReloadData() {
        activityIndicator.startAnimating()
        viewModel.fetchGitHubUserData { data in
            self.items = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.activityIndicator.stopAnimating()
            }
        }
    }

   private func registerCell() {
        tableView.register(UINib.init(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "UserCell")
        tableView.separatorStyle = .none
    }
    
    @IBAction func searchText(_ sender: Any) {
        let alertController = UIAlertController(title: "Search In Repo", message: "", preferredStyle: UIAlertController.Style.alert)
        alertController.addTextField { (textField : UITextField!) -> Void in
               textField.placeholder = "Enter User Name"
           }
        
        let saveAction = UIAlertAction(title: "Search", style: UIAlertAction.Style.default, handler: { alert -> Void in
            let languageTextField = alertController.textFields![0] as UITextField
            searchName = "language:\(languageTextField.text ?? "")"
            self.customReloadData()
           })
           alertController.addAction(saveAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableViewCellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserCell else { return UITableViewCell() }
        
        let fileUrl = URL(string: items[indexPath.row].owner.avatarURL)

        cell.repoLabel.text = items[indexPath.row].name
        cell.starLabel.text = String(items[indexPath.row].stargazersCount)
        cell.languageLabel.text = items[indexPath.row].language
        ImageLoader.image(for: fileUrl!) { image in
            cell.UserImageView.image = image
        }
        cell.selectionStyle = .none

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = items[indexPath.row]

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "details") as? UserDetailsViewController
        vc?.items = selectedItem
        navigationController?.pushViewController(vc!, animated: true)
    }
    
}
