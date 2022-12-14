import UIKit

class homecoooo: UIViewController, MyCustomSegmentControlDelegate {
    
    var myDayArray = ["월", "화", "수", "목", "금"]
    let myDayCharacterArray = ["🐶","🐱","🐭", "🐹", "🦊"]
    
    @IBOutlet weak var whatDayTitle: UILabel!
    
    func segmentValueChanged(to index: Int) {
        print("ViewController - segmentValueChanged() called / index: \(index)")
        self.whatDayTitle.text = myDayArray[index] + "요일\n" + myDayCharacterArray[index]
    }
    

    
    override func loadView() {
        super.loadView()
        print("ViewController - loadView() called")
        let myCustomSegmentControl = MyCustomSegmentControl(frame: CGRect(x: 0, y: 0, width: 200, height: 200), buttonTitles: myDayArray)
        
        myCustomSegmentControl.mySegmentDelegate = self
        
        self.view.addSubview(myCustomSegmentControl)
//        myCustomSegmentControl.backgroundColor = .red
        myCustomSegmentControl.translatesAutoresizingMaskIntoConstraints = false
        myCustomSegmentControl.widthAnchor.constraint(equalToConstant: 300).isActive = true
        myCustomSegmentControl.heightAnchor.constraint(equalToConstant: 60).isActive = true
        myCustomSegmentControl.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        myCustomSegmentControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    

}


