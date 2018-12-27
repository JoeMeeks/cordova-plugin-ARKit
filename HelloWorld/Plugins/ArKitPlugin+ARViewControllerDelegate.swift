//
//  ArKitPlugin+ARViewControllerDelegate.swift
//  HelloWorld
//
//  Created by Eugene Bokhan on 27/12/2018.
//

import simd

extension ArKitPlugin: ARViewControllerDelegate {
    
    func updateCameraTransform(transfrom: simd_float4x4) {
        sendMatrix(transfrom: transfrom)
    }
    
    func sendMatrix(transfrom: simd_float4x4) {
        let cameraPosition = float3(transfrom.columns.3.x,
                                    transfrom.columns.3.y,
                                    transfrom.columns.3.z)
        let cameraPositionX = cameraPosition.x
        let cameraPositionY = cameraPosition.y
        let cameraPositionZ = cameraPosition.z
        
        let cameraQuaternion = simd_quatf(transfrom)
        let cameraQuaternionX = cameraQuaternion.vector.x
        let cameraQuaternionY = cameraQuaternion.vector.y
        let cameraQuaternionZ = cameraQuaternion.vector.z
        let cameraQuaternionW = cameraQuaternion.vector.w
        
        let message = "\(cameraPositionX), \(cameraPositionY), \(cameraPositionZ), \(cameraQuaternionX), \(cameraQuaternionY), \(cameraQuaternionZ), \(cameraQuaternionW)"
        
        guard let result = CDVPluginResult(status: CDVCommandStatus_OK,
                                           messageAs: message) else { return }
        result.setKeepCallbackAs(true)
        commandDelegate!.send(result,
                              callbackId: callbackId)
    }

}
