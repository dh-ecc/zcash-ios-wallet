//
//  BackupWallet.swift
//  wallet
//
//  Created by Francisco Gindre on 12/30/19.
//  Copyright © 2019 Francisco Gindre. All rights reserved.
//

import SwiftUI

struct BackupWallet: View {
    @EnvironmentObject var appEnvironment: ZECCWalletEnvironment
    let itemSpacing: CGFloat = 24
    let buttonPadding: CGFloat = 40
    let buttonHeight: CGFloat = 58
    
    @State private var showModal: Bool = false
    
    var body: some View {
        
        ZStack {
            
            ZcashBackground()
            VStack(alignment: .center, spacing: itemSpacing) {
                Spacer()
                ZcashLogo()
                
                Text("Your Wallet needs\nto be Backed up")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .font(.system(size: 18))
                    .padding(.horizontal, 48)
                Spacer()
                NavigationLink(destination: SeedBackup(proceedsToHome: true).environmentObject(appEnvironment)){
                    ZcashButton(color: Color.black, fill: Color.zYellow, text: "Backup Wallet")
                        .frame(height: buttonHeight)
                }
                .padding([.leading, .trailing], buttonPadding)
                
                
                NavigationLink(destination:  Home(amount: 0, verifiedBalance: appEnvironment.initializer.getBalance().asHumanReadableZecBalance()).environmentObject(appEnvironment)) {
                    Text("Skip")
                        .foregroundColor(Color.zYellow)
                        .font(.body)
                        .frame(height: buttonHeight)
                }
                .padding([.leading, .trailing], buttonPadding)
                Spacer()
            }
        }
        .onAppear() {
            do {
                try self.appEnvironment.createNewWallet()
            } catch {
                print("could not create new wallet: \(error)")
            }
        }
       
    }
}

struct BackupWallet_Previews: PreviewProvider {
    static var previews: some View {
        BackupWallet().environmentObject(ZECCWalletEnvironment.shared)
    }
}


protocol SeedWordsProvider {
    func seedWords(limit: Int) -> [String]
}

struct FakeProvider: SeedWordsProvider {}
extension SeedWordsProvider {
    func seedWords(limit: Int) -> [String] {
        ["volume", "burst", "illegal", "swap", "neck", "brother", "foil", "gain", "thought", "glass", "unfold", "mercy", "kangaroo", "faculty", "divorce"]
    }
}
