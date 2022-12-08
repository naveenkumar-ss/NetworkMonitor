//
//  NetworkManager.swift
//  Pods-SSNetworkMonitor_Example
//
//  Created by NaveenKumar on 07/12/22.
//
import Network

// An enum to handle the network status
enum NetworkStatus: String {
    case connected
    case disconnected
}

open class SSNetworkMonitor: ObservableObject {
    
    public static var shared = SSNetworkMonitor()
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "Monitor")
    
    @Published var status: NetworkStatus = .disconnected
    
    /// Check network connectivity with out alert
    /// - Returns: connectivity status
    public func checkNetworkAvailability() -> Bool {
        return networkAvailability()
    }
    
    /// Check network connectivity with out alert
    /// - Returns: connectivity status
    func networkAvailability() -> Bool {
      return  status == .connected ? true : false
    }
    
    private init() {
        monitor.pathUpdateHandler = { [weak self] path in
            guard let self = self else { return }
            
            // Monitor runs on a background thread so we need to publish
            // on the main thread
            DispatchQueue.main.async {
                if path.status == .satisfied {
                    self.status = .connected
                } else {
                    self.status = .disconnected
                }
            }
        }
        monitor.start(queue: queue)
    }
}

