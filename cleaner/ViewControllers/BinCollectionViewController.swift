
import UIKit
import CoreData

class BinCollectionViewController: UIViewController {
    var selecColourIndex: Int = 0
    var binTotalCount:Int = 0
    var cycleIndex:Int = 0
    var bindate:Date = Date()
    var bincount = 0
    
    @IBOutlet weak var binNumber: UILabel!
    @IBOutlet weak var dateCollection: UIDatePicker!
    
    internal var bindata:BinData? = nil
    var date = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //selected bin number
        binNumber.text = String(bincount + 1)
        
    }
    
    // go back the binweelk viewController
    @IBAction func backbtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // selected datepicker
    @IBAction func selectDate(_ sender: Any) {
        date = self.dateCollection.date
        bindate = date
    }
    
    // go next the viewcontroller
    @IBAction func nextbtn(_ sender: Any) {
        
        if(cycleIndex == 0){
            
            var date = self.bindate
            let enddate = Calendar.current.date(byAdding: .day, value: 121, to: date)!
            
            while date < enddate {
                let bindata = BinData(context: DatabaseManager.persistentContainer.viewContext)
                date = Calendar.current.date(byAdding: .day, value: 7, to: date)!
                bindata.bincycle = String(self.cycleIndex)
                bindata.colourIndex = String(self.selecColourIndex)
                bindata.totalCount = String(self.binTotalCount)
                bindata.binDate = date
                DatabaseManager.saveContext()
            }
            
        }
        if(cycleIndex == 1){
            
            var dates = [Date]()
            var date = self.bindate
            dates.append(date)
            let enddate = Calendar.current.date(byAdding: .day, value: 121, to: date)!
            
            while date < enddate {
                date = Calendar.current.date(byAdding: .day, value: 14, to: date)!
                dates.append(date)
            }
            
            for i in 0...dates.count - 1{
                let bindata = BinData(context: DatabaseManager.persistentContainer.viewContext)
                bindata.bincycle = String(self.cycleIndex)
                bindata.binDate = dates[i]
                bindata.colourIndex = String(self.selecColourIndex)
                bindata.totalCount = String(self.binTotalCount)
                
                //save data to coredata
                DatabaseManager.saveContext()
            }
            
        }
        if(cycleIndex == 2){
            var dates = [Date]()
            var date = self.bindate
            let enddate = Calendar.current.date(byAdding: .day, value: 121, to: date)!
            
            while date < enddate {
                date = Calendar.current.date(byAdding: .day, value: 21, to: date)!
                dates.append(date)
            }
            for i in 1...dates.count - 1{
                let bindata = BinData(context: DatabaseManager.persistentContainer.viewContext)
                bindata.bincycle = String(self.cycleIndex)
                bindata.binDate = dates[i]
                bindata.colourIndex = String(self.selecColourIndex)
                bindata.totalCount = String(self.binTotalCount)
                
                //save data to coredata
                DatabaseManager.saveContext()
            }
            
        }
        if(cycleIndex == 3){
            var dates = [Date]()
            var date = self.bindate
            let enddate = Calendar.current.date(byAdding: .day, value: 121, to: date)!
            
            while date < enddate {
                date = Calendar.current.date(byAdding: .day, value: 28, to: date)!
                dates.append(date)
            }
            for i in 1...dates.count - 1 {
                let bindata = BinData(context: DatabaseManager.persistentContainer.viewContext)
                bindata.bincycle = String(self.cycleIndex)
                bindata.binDate = dates[i]
                bindata.colourIndex = String(self.selecColourIndex)
                bindata.totalCount = String(self.binTotalCount)
                
                //save data to coredata
                DatabaseManager.saveContext()
            }
        }
        
        if(bincount < binTotalCount){
            bincount+=1
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "binColour") as! BinColourViewController
            newViewController.bincount = bincount
            newViewController.binTotalCount = self.binTotalCount
            self.present(newViewController, animated: true, completion: nil)
        }
        else{
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "binSetup") as! BinSetupViewController
            self.present(newViewController, animated: true, completion: nil)
        }
    }
    
}
