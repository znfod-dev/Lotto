//
//  LottoVC.swift
//  Lotto
//
//  Created by JongHyun Park on 2020/04/26.
//  Copyright © 2020 Znfod. All rights reserved.
//

import UIKit
import AVFoundation
import QRCodeReader

class LottoVC: BaseVC {
    // Good practice: create the reader lazily to avoid cpu overload during the
    // initialization and each time we need to scan a QRCode
    lazy var readerVC: QRCodeReaderViewController = {
        let builder = QRCodeReaderViewControllerBuilder {
            $0.reader = QRCodeReader(metadataObjectTypes: [.qr], captureDevicePosition: .back)
            
            // Configure the view controller (optional)
            $0.showTorchButton        = false
            $0.showSwitchCameraButton = false
            $0.showCancelButton       = false
            $0.showOverlayView        = true
            $0.rectOfInterest         = CGRect(x: 0.2, y: 0.2, width: 0.6, height: 0.6)
        }
        
        return QRCodeReaderViewController(builder: builder)
    }()
    
    @IBOutlet weak var tableView: UITableView!
    var drwList = Array<DRW>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        print("tableView : \(self.tableView.frame)")
        self.loadDB()
    }
    
    
    @IBAction func scanBtnClicked(_ sender: UIButton) {
        /*
        // Retrieve the QRCode content
        // By using the delegate pattern
        readerVC.delegate = self
        
        // Or by using the closure pattern
        readerVC.completionBlock = { (result: QRCodeReaderResult?) in
            print(result)
        }
        
        // Presents the readerVC as modal form sheet
        readerVC.modalPresentationStyle = .formSheet
        
        present(readerVC, animated: true, completion: nil)
         */
        WebManager.shared.getLottoResult(url: "", success: { results, drwNo in
            WebManager.shared.getLottoNumber(drwNo: drwNo!, success: { (success, drw) in

                let vc:LottoCheckVC = self.storyboard?.instantiateViewController(withIdentifier: "LottoCheckVC") as! LottoCheckVC
                vc.results = results
                vc.drw = drw
                self.present(vc, animated: false, completion: nil)
            }) { (error) in
                
            }
        }) { error in
            
        }
    }
    
    func loadDB() {
        FireStoreManager.shared.loadDB(success: { drwList in
            self.drwList = drwList
            self.tableView.reloadData()
        }) { error in
            
        }
        
    }
}

extension LottoVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.drwList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:LottoTableCell = tableView.dequeueReusableCell(withIdentifier: "LottoCell") as! LottoTableCell
        let drw = self.drwList[indexPath.row]
        
        guard let drwNo = drw.drwNo else {
            return cell
        }
        guard let drwtNo1 = drw.drwtNo1 else {
            return cell
        }
        guard let drwtNo2 = drw.drwtNo2 else {
            return cell
        }
        guard let drwtNo3 = drw.drwtNo3 else {
            return cell
        }
        guard let drwtNo4 = drw.drwtNo4 else {
            return cell
        }
        guard let drwtNo5 = drw.drwtNo5 else {
            return cell
        }
        guard let drwtNo6 = drw.drwtNo6 else {
            return cell
        }
        guard let bnusNo = drw.bnusNo else {
            return cell
        }
        cell.drwNoLbl.text = String("\(drwNo) 회")
        cell.setDrwtNo1Lbl(value: drwtNo1)
        cell.setDrwtNo2Lbl(value: drwtNo2)
        cell.setDrwtNo3Lbl(value: drwtNo3)
        cell.setDrwtNo4Lbl(value: drwtNo4)
        cell.setDrwtNo5Lbl(value: drwtNo5)
        cell.setDrwtNo6Lbl(value: drwtNo6)
        cell.setBnusNoLbl(value: bnusNo)
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0.0
        UIView.animate(withDuration: 0.3) {
            cell.alpha = 1.0
        }
    }
    
}
extension LottoVC: QRCodeReaderViewControllerDelegate {
    // MARK: - QRCodeReaderViewController Delegate Methods
    
    func reader(_ reader: QRCodeReaderViewController, didScanResult result: QRCodeReaderResult) {
        reader.stopScanning()
        
        dismiss(animated: true, completion: nil)
    }
    
    //This is an optional delegate method, that allows you to be notified when the user switches the cameraName
    //By pressing on the switch camera button
    func reader(_ reader: QRCodeReaderViewController, didSwitchCamera newCaptureDevice: AVCaptureDeviceInput) {
        print("Switching capture to: \(newCaptureDevice.device.localizedName)")
        
    }
    
    func readerDidCancel(_ reader: QRCodeReaderViewController) {
        reader.stopScanning()
        
        dismiss(animated: true, completion: nil)
    }
}


