//
//  PhraseManager.swift
//  ContextFree
//
//  Created by Charles Diggins on 2/20/22.
//

import Foundation

public struct dPhraseManager{
    public var m_clusterList = Array<dCluster>()

    public mutating func appendCluster(cluster: dCluster){
        m_clusterList.append(cluster)
    }
    
    public func getClusterList()->[dCluster]{
        return m_clusterList
    }
    
    public func getCluster(index: Int)->dCluster{
        if index >= 0 && index < m_clusterList.count { return m_clusterList[index] }
        return dCluster()
    }
    
    public func getClusterCount()->Int{
        return m_clusterList.count
    }
    
    public mutating func clear(){
        m_clusterList.removeAll()
    }
    
    public func getClusterByName(clusterName: String)->dCluster{
        for cluster in m_clusterList{
            if cluster.getClusterName() == clusterName {return cluster}
        }
        return dCluster()
    }
    
}

