import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var symbol: UILabel!
    
    //    Operator Button
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var percentButton: UIButton!
    @IBOutlet weak var divisionButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var subtractionButton: UIButton!
    @IBOutlet weak var additionButton: UIButton!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var decimal_pointButton: UIButton!

    //    Number Button
    @IBOutlet weak var numZeroButton: UIButton!
    @IBOutlet weak var numOneButton: UIButton!
    @IBOutlet weak var numTwoButton: UIButton!
    @IBOutlet weak var numThreeButton: UIButton!
    @IBOutlet weak var numFourButton: UIButton!
    @IBOutlet weak var numFiveButton: UIButton!
    @IBOutlet weak var numSixButton: UIButton!
    @IBOutlet weak var numSevenButton: UIButton!
    @IBOutlet weak var numEightButton: UIButton!
    @IBOutlet weak var numNineButton: UIButton!
    @IBOutlet weak var pointButton: UIButton!
    
    var resultNumber = "0"
    var currentNumber = "0"
    var currentSymbol = ""
    var previousNumber = "0"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func clearButton(_ sender: UIButton) {
        result.text = "0"
        number.text = "0"
        symbol.text = ""
        resultNumber = "0"
        currentNumber = "0"
        currentSymbol = ""
        previousNumber = "0"
    }

    @IBAction func numberButton(_ sender: UIButton) {
        let buttonValue = sender.titleLabel?.text ?? ""

        if buttonValue == "." {
            if !currentNumber.contains(".") {
                currentNumber += buttonValue
            }
        } else if currentNumber == "0" {
            currentNumber = buttonValue
        } else {
            currentNumber += buttonValue
        }

        number.text = currentNumber
    }
    

    @IBAction func symbolButton(_ sender: UIButton) {
        let operatorSymbol = sender.titleLabel?.text ?? ""
        
        if operatorSymbol == "+/-" {
            if currentNumber != "0" {
                currentNumber = String("-" + currentNumber)
            }
        }
        
        if currentNumber != "0" {
            if !previousNumber.isEmpty && !currentNumber.isEmpty {
                calculateResult()
            }
        }
        
        currentSymbol = operatorSymbol
        symbol.text = currentSymbol
        previousNumber = resultNumber
        currentNumber = "0"
    }

    @IBAction func calculation(_ sender: UIButton) {
        calculateResult()
    }

    func calculateResult() {
        
        if let current = Double(currentNumber), let previous = Double(previousNumber) {
            if currentSymbol == "+" {
                resultNumber = "\(previous + current)"
            } else if currentSymbol == "-" {
                resultNumber = "\(previous - current)"
            } else if currentSymbol == "x" {
                resultNumber = "\(current * previous)"
            } else if currentSymbol == "/" {
                if current != 0 {
                    resultNumber = "\(previous / current)"
                } else {
                    resultNumber = "0"
                }
            } else if currentSymbol == "%" {
                resultNumber = "\(previous / 100)"
            } else if currentSymbol == "+/-"{
                resultNumber = "\(current + previous)"
            } else {
                resultNumber = currentNumber
            }

            if resultNumber.hasSuffix(".0") {
                resultNumber = String(resultNumber.dropLast(2))
            }
            currentNumber = "0"
        }

        previousNumber = resultNumber
        result.text = resultNumber
        number.text = currentNumber
    }
}
