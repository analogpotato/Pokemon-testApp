//
//  ViewController.swift
//  testApp
//
//  Created by Frank on 6/27/21.
//

import UIKit

class ViewController: UIViewController {

    var arrayOfPokemon = [Pokemon]()

    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.Constants.reuseIdentifer)
        return tableView
    }()

    let navBar: UINavigationBar = {
        let width = UIScreen.main.bounds.width
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: width, height: 0))
        let navTitleItem = UINavigationItem(title: "Pokemon")
        let navTitleAttribute = [NSAttributedString.Key.foregroundColor: UIColor.blue]
        navBar.titleTextAttributes = navTitleAttribute
        navBar.largeTitleTextAttributes = navTitleAttribute
        navTitleItem.largeTitleDisplayMode = .always
        navTitleItem.hidesSearchBarWhenScrolling = true
        navBar.setItems([navTitleItem], animated: false)
        return navBar
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        setupSubviews()
        accessAPI()

    }

    func accessAPI() {
        let apiURL = "https://pokeapi.co/api/v2/pokemon"

        if let url = URL(string: apiURL) {
            if let data = try? Data(contentsOf: url) {
                parseJson(json: data)
            }
        }
    }


    func parseJson(json: Data) {
        let decorder = JSONDecoder()

        if let jsonPokemon = try? decorder.decode(Pokemons.self, from: json) {
            arrayOfPokemon = jsonPokemon.results

            tableView.reloadData()
        }
    }

    func setupSubviews() {

        view.addSubview(navBar)
        view.addSubview(tableView)

        navBar.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false

        navBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        navBar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        navBar.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true

        tableView.topAnchor.constraint(equalTo: navBar.bottomAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true

    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfPokemon.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.Constants.reuseIdentifer, for: indexPath) as! CustomCell
        let pokemon = arrayOfPokemon[indexPath.row]
        cell.textLabel?.text = pokemon.name
        return cell
    }
}
