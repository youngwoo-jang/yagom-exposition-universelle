//
//  KoreanItemsListViewController.swift
//  Expo1900
//
//  Created by 이영우 on 2021/04/12.
//

import UIKit

class KoreanItemsListViewController: UIViewController {
    @IBOutlet private weak var koreaItemsListTableView: UITableView!
    var itemsData: [Item] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "한국의 출품작"
        decodeData()
        setKoreanEntryTableViewCell()
        self.koreaItemsListTableView.delegate = self
        self.koreaItemsListTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false

    }
    
    private func decodeData() {
        let decoder: JSONDecoder = JSONDecoder()
        guard let dataAsset = NSDataAsset(name: "items", bundle: .main) else {
            return
        }
        do {
            itemsData = try decoder.decode([Item].self, from: dataAsset.data)
        } catch {
            implementErrorAlert(ExpoError.invalidItemData)
        }
    }
    
    private func setKoreanEntryTableViewCell() {
        let koreaEntryTableViewCell = UINib(nibName: String(describing: KoreanEntryTableViewCell.self), bundle: nil)
        self.koreaItemsListTableView.register(koreaEntryTableViewCell, forCellReuseIdentifier: "koreaItemListTableViewCell")
    }
}

extension KoreanItemsListViewController: UITableViewDelegate {
    
}

extension KoreanItemsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = koreaItemsListTableView.dequeueReusableCell(withIdentifier: "koreaItemListTableViewCell", for: indexPath) as? KoreanEntryTableViewCell else {
            return UITableViewCell()
        }
        cell.setCell(itemsData[indexPath.row])
        return cell
    }
}
