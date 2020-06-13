//
//  BinTableViewController.swift
//  cleaner
//
//  Created by Admin on 01/06/2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit
import CoreData
import GoogleMobileAds

class BinTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
  
    let bannerView = GADBannerView()
    let cellIdentifier = "BinTableViewCell"
    
    @IBOutlet weak var tableview: UITableView!
    private var tableData : NSMutableArray = NSMutableArray()
    private var BinItem : [BinData] = []
    private var groupkey:NSMutableArray!
    private var grouplist:NSMutableArray!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.register(UINib(nibName: "BinTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: cellIdentifier)
        self.tableview.separatorStyle = .none
        self.tableview.estimatedRowHeight = UITableView.automaticDimension
        self.tableview.rowHeight = UITableView.automaticDimension
        self.tableview.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.tableview.allowsSelection = false
        self.tableview.backgroundColor = UIColor(named: "FFC800")
        
        groupkey = NSMutableArray()
        grouplist = NSMutableArray()
        
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2435281174"
        bannerView.rootViewController = self
//        addBannerToView();
    }
    
    override func viewDidAppear(_ animated: Bool) {
          super.viewDidAppear(animated)
          loadAdaptiveBannerAd()
    }
    func addBannerToView(){
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerView)
        
        NSLayoutConstraint.activate([
            //align your banner to the bottom of the safe area
            bannerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            //Center your banner horizontally
            bannerView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func getAdaptiveSize() -> GADAdSize {
           // Step 1 - Determine the view width to use for the ad width.
           //in this codelab we use the full safe area width
           var frame: CGRect
           // Here safe area is taken into account, hence the view frame is used
           // after the view has been laid out.
           if #available(iOS 11.0, *) {
               frame = view.frame.inset(by: view.safeAreaInsets)
           } else {
               frame = view.frame
           }
           let viewWidth = frame.size.width

           // Step 2 - Get Adaptive GADAdSize and set the ad view.
           let adSize = GADCurrentOrientationAnchoredAdaptiveBannerAdSizeWithWidth(viewWidth)
           return adSize
       }
    
    func loadAdaptiveBannerAd(){
          bannerView.adSize = getAdaptiveSize()
          bannerView.load(GADRequest())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initDatas()
    }

    internal func initDatas() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "DD"
        BinItem = DatabaseManager.getBinDatas()
        print(BinItem.count)
        groupkey?.removeAllObjects()
        grouplist?.removeAllObjects()
        
        for i in 1 ..< BinItem.count-1{
            print(BinItem[i].binDate!)
            
            let month = dateFormatter.string(from: BinItem[i].binDate!)
            if(groupkey != nil){
                if(!groupkey.contains(month)){
                    groupkey?.add(month)
                }else{
                    continue
                }
            }
        }
        
        if(groupkey != nil){
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "DD"
            for i in 0 ..< groupkey.count{
                var todoInSectionDatas:[BinData] = []
                for j in 1 ..< BinItem.count - 1{
                    if(groupkey.object(at: i) as! String) == dateFormatter.string(from: BinItem[j].binDate!){
                        todoInSectionDatas.append(BinItem[j])
                    }
                }
                todoInSectionDatas.sort(){$0.binDate! < $1.binDate!}
                grouplist.add(todoInSectionDatas)
            }
        }
        self.tableview.reloadData()
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return groupkey.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let todoInSectionDatas = self.grouplist.object(at: section) as! [BinData]
        return todoInSectionDatas.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BinTableViewCell", for: indexPath) as! BinTableViewCell
        let tododatas = self.grouplist.object(at: indexPath.section) as! [BinData]
            cell.initData(todoData: tododatas, section: indexPath.section, ind: indexPath.row)
            return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row < 1){
            return 100
        }else{
            return 0
        }
    }
    
}
