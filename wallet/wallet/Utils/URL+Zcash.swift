//
//  URL+Zcash.swift
//  wallet
//
//  Created by Francisco Gindre on 1/24/20.
//  Copyright © 2020 Francisco Gindre. All rights reserved.
//

import Foundation
import ZcashLightClientKit


extension URL {
    
    static func documentsDirectory() throws -> URL {
        try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    }
    
    static func cacheDbURL() throws -> URL {
        try documentsDirectory().appendingPathComponent(ZCASH_NETWORK.constants.DEFAULT_DB_NAME_PREFIX+ZcashSDK.DEFAULT_CACHES_DB_NAME, isDirectory: false)
    }

    static func dataDbURL() throws -> URL {
        try documentsDirectory().appendingPathComponent(ZCASH_NETWORK.constants.DEFAULT_DB_NAME_PREFIX+ZcashSDK.DEFAULT_DATA_DB_NAME, isDirectory: false)
    }

    static func pendingDbURL() throws -> URL {
        try documentsDirectory().appendingPathComponent(ZCASH_NETWORK.constants.DEFAULT_DB_NAME_PREFIX+ZcashSDK.DEFAULT_PENDING_DB_NAME)
    }

    static func spendParamsURL() throws -> URL {
        try documentsDirectory().appendingPathComponent("sapling-spend.params")
    }

    static func outputParamsURL() throws -> URL {
        try documentsDirectory().appendingPathComponent("sapling-output.params")
    }
    
    static func bundledSpendParamsURL() -> URL? {
        Bundle.main.url(forResource: "sapling-spend", withExtension: ".params")
    }

    static func bundledOutputParamsURL() -> URL? {
        Bundle.main.url(forResource: "sapling-output", withExtension: ".params")
    }
}
