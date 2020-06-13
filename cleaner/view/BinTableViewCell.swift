
import UIKit
import CoreData
class BinTableViewCell: UITableViewCell {


    @IBOutlet weak var btnweekday: UILabel!
    @IBOutlet weak var sdf: UIView!
    @IBOutlet weak var binImage3: UIImageView!
    @IBOutlet weak var binImage2: UIImageView!
    @IBOutlet weak var binImage1: UIImageView!
    @IBOutlet weak var monthLb: UILabel!
    @IBOutlet weak var dayLb: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    internal func initData(todoData: [BinData], section: Int, ind: Int){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd:HH"

        formatter.dateFormat = "LLLL"
        monthLb.text = formatter.string(from: todoData[0].binDate!)

        formatter.dateFormat = "dd"
        dayLb.text = formatter.string(from: todoData[0].binDate!)
        
        formatter.dateFormat = "EEEE"
        btnweekday.text = formatter.string(from: todoData[0].binDate!)
        
        if(todoData.count == 1){
            binImage1.image = UIImage(named: config.binImage[Int(todoData[0].colourIndex!)!])
        }
        if(todoData.count == 2){
            binImage2.image = UIImage(named: config.binImage[Int(todoData[1].colourIndex!)!])
            binImage1.image = UIImage(named: config.binImage[Int(todoData[0].colourIndex!)!])
        }
        
        if(todoData.count == 3){
            binImage1.image = UIImage(named: config.binImage[Int(todoData[0].colourIndex!)!])
            binImage3.image = UIImage(named: config.binImage[Int(todoData[2].colourIndex!)!])
            binImage2.image = UIImage(named: config.binImage[Int(todoData[1].colourIndex!)!])
        }
    }
    
}
