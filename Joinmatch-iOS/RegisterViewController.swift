

import UIKit
import Eureka

class RegisterViewController: FormViewController {
    @IBAction func backAction(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        form
            +++ Section("Informacion de tu cuenta")
            <<< TextRow(){ row_username in
                row_username.title = "Username"
                row_username.placeholder = "Con esto inicias sesion"
                
            }

            <<< PasswordRow(){ row_password in
                row_password.title = "Contraseña"
                row_password.placeholder = "Ingresa una contraseña"
                
            }
            +++ Section("Hablanos de tí")
            <<< TextRow(){ row_name in
                row_name.title = "Nombre"
                row_name.placeholder = "Ingresa tu nombre"
                
            }
            <<< TextRow(){ row_email in
                row_email.title = "Email"
                row_email.placeholder = "Ingresa tu email"
                
            }
            <<< DateRow(){
                $0.title = "F. Nacimiento"
                $0.value = Date(timeIntervalSinceReferenceDate: 0)
            }
        
            
            +++ SelectableSection<ListCheckRow<String>>("Que deportes te interesan?", selectionType: .multipleSelection)

        let sports = ["Futbol", "Voley", "Basket"]

        for option in sports {
            form.last! <<< ListCheckRow<String>(option){ sportrow in
                sportrow.title = option
                sportrow.selectableValue = option
                sportrow.value = nil
            }
        }
        
        
    }
    
}


