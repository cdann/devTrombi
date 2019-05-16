//
//  DevTableViewController.swift
//  devTrombi
//
//  Created by celine dann on 16/05/2019.
//  Copyright © 2019 celine dann. All rights reserved.
//

import UIKit

class DevTableViewController: UITableViewController, DeveloperContainerDelegate {
    
    let detailsSegueId = "toViewDetails"
    let cellId = "devCell"
    var devContainer: DeveloperContainer? = nil
    var progressBar: UIProgressView?
    var selected: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        devContainer = DeveloperContainerFromApi()
        devContainer!.delegate = self
        refreshControl = UIRefreshControl()
        refreshControl!.addTarget(self, action: #selector(DevTableViewController.loadDevelopers), for: .valueChanged)
        loadDevelopers()
    }
    
    @objc func loadDevelopers() {
        refreshControl?.beginRefreshing()
        progressBar = UIProgressView(progressViewStyle: .bar)
        progressBar?.progress = 0.0
        tableView.addSubview(progressBar!)
        devContainer!.getDevs()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return devContainer?.developers?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = devContainer?.developers?[indexPath.row].name
        return cell
    }
    
    func onComplete(result: Result<[Developer], Error>) {
        switch result {
        case Result.success(_):
            self.tableView.reloadData()
        case let Result.failure(error):
            self.alertError(error: error)
        }
        self.refreshControl?.endRefreshing()
        progressBar?.removeFromSuperview()
        progressBar = nil
    }
    
    func onProgress(progress: Double) {
        progressBar?.progress = Float(progress)
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selected = indexPath.row
        performSegue(withIdentifier: detailsSegueId, sender: self)
    }

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailCtrl = segue.destination as? DevDetailsViewController {
            detailCtrl.developerRow = selected
            detailCtrl.devContainer = devContainer
            selected = nil
        }
    }
    

}
