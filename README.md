# IHelpySwift
Interactive Help Library writer in Swift

For use:
add Delegate in current ViewController: 
HelpDelegate

//Change color for label Help description: 

HelpViewContainer.helpTextColor = .red

HelpViewContainer.helpBackgroundColor = .black

//for call HelpView for first Time in viewWillAppear:

override func viewDidAppear(_ animated: Bool) {
  if UserDefaults.standard.value(forKey: "helpInHome") == nil { //helpInHome is a var for identifier if a helpView was showed in this ViewController

      //Create object for navigationItem
      let righBt = self.navigationItem.rightBarButtonItem?.value(forKey: "view") as! UIView

      //Overwrite objects and Help description in HelpViewContainer for Interactive Help in current View
      HelpViewContainer.objectsHelp = [self.myButton,self.myOtherButton,righBt]
      HelpViewContainer.textHelp = ["Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.","Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."]
      self.CloseHelp(helpPos: 0)
  }
}

//Delegate Function when the HelpView is Closed
    func CloseHelp(helpPos: Int) {
        if helpPos < HelpViewContainer.objectsHelp.count {
            let newHelp = HelpViewContainer(nibName: "HelpViewContainer", bundle: nil)
            newHelp.objectView = HelpViewContainer.objectsHelp[helpPos]
            newHelp.pos = helpPos
            newHelp.delegate = self
            newHelp.modalPresentationStyle = UIModalPresentationStyle.overFullScreen
            newHelp.modalTransitionStyle = .crossDissolve
            
            self.present(newHelp, animated: true, completion: nil)
            newHelp.helpLb.text = HelpViewContainer.textHelp[helpPos]
            newHelp.addBackGroundLayer()
            newHelp.RezizeLb()
        }
        else {
            UserDefaults.standard.set(true, forKey: "helpInHome")
        }
    }
