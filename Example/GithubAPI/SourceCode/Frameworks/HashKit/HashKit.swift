//
//  Hashable.swift
//  HashableDemo
//
//  Created by Kazuya Ueoka on 2016/06/30.
//  Copyright © 2016年 fromKK. All rights reserved.
//

import Foundation
import CommonCrypto

public enum HashableType {
    case md5
    case sha1
    case sha224
    case sha256
    case sha384
    case sha512

    public func hash(data: Data) -> String? {
        typealias HashType = ((UnsafeRawPointer, CC_LONG, UnsafeMutablePointer<UInt8>) -> UnsafeMutablePointer<UInt8>?)
        let algorithm: HashType
        let digestLength: Int32
        switch self {
        case .md5:
            algorithm = CC_MD5
            digestLength = CC_MD5_DIGEST_LENGTH
            break
        case .sha1:
            algorithm = CC_SHA1
            digestLength = CC_SHA1_DIGEST_LENGTH
            break
        case .sha224:
            algorithm = CC_SHA224
            digestLength = CC_SHA224_DIGEST_LENGTH
            break
        case .sha256:
            algorithm = CC_SHA256
            digestLength = CC_SHA256_DIGEST_LENGTH
            break
        case .sha384:
            algorithm = CC_SHA384
            digestLength = CC_SHA384_DIGEST_LENGTH
            break
        case .sha512:
            algorithm = CC_SHA512
            digestLength = CC_SHA512_DIGEST_LENGTH
            break
        }
        let digestLen: Int = Int(digestLength)
        let buffer: UnsafeMutablePointer<CUnsignedChar> = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)

        let value: UnsafeMutablePointer<UInt8> = UnsafeMutablePointer.allocate(capacity: data.count)
        data.copyBytes(to: value, count: data.count)
        _ = algorithm(value, CUnsignedInt(data.count), buffer)
        var result: String = ""
        for i in 0..<digestLen {
            result += String(format: "%02x", buffer[i])
        }
        value.deallocate()
        buffer.deallocate()
        return result
    }
}

public protocol HashKit {
    func md5() -> String?
    func sha1() -> String?
    func sha224() -> String?
    func sha256() -> String?
    func sha384() -> String?
    func sha512() -> String?
}

extension Data: HashKit {
    public func md5() -> String? {
        return HashableType.md5.hash(data: self)
    }

    public func sha1() -> String? {
        return HashableType.sha1.hash(data: self)
    }

    public func sha224() -> String? {
        return HashableType.sha224.hash(data: self)
    }

    public func sha256() -> String? {
        return HashableType.sha256.hash(data: self)
    }

    public func sha384() -> String? {
        return HashableType.sha384.hash(data: self)
    }

    public func sha512() -> String? {
        return HashableType.sha512.hash(data: self)
    }
}

extension String: HashKit {
    public func md5() -> String? {
        guard let data: Data = self.data(using: String.Encoding.utf8) else {
            return nil
        }
        return HashableType.md5.hash(data: data)
    }

    public func sha1() -> String? {
        guard let data: Data = self.data(using: String.Encoding.utf8) else {
            return nil
        }
        return HashableType.sha1.hash(data: data)
    }

    public func sha224() -> String? {
        guard let data: Data = self.data(using: String.Encoding.utf8) else {
            return nil
        }
        return HashableType.sha224.hash(data: data)
    }

    public func sha256() -> String? {
        guard let data: Data = self.data(using: String.Encoding.utf8) else {
            return nil
        }
        return HashableType.sha256.hash(data: data)
    }

    public func sha384() -> String? {
        guard let data: Data = self.data(using: String.Encoding.utf8) else {
            return nil
        }
        return HashableType.sha384.hash(data: data)
    }

    public func sha512() -> String? {
        guard let data: Data = self.data(using: String.Encoding.utf8) else {
            return nil
        }
        return HashableType.sha512.hash(data: data)
    }
}

public protocol HashableHmac {
    func hmac(algorithm: HashableType, key: String) -> String?
}

extension String: HashableHmac {
    public func hmac(algorithm: HashableType, key: String) -> String? {
        guard let str: [CChar] = self.cString(using: String.Encoding.utf8) else {
            return nil
        }
        guard let keyStr: [CChar] = key.cString(using: String.Encoding.utf8) else {
            return nil
        }

        let strLen: Int = Int(self.lengthOfBytes(using: String.Encoding.utf8))

        let algo: CCHmacAlgorithm
        let digestLength: Int32
        switch algorithm {
        case .md5:
            algo = CCHmacAlgorithm(kCCHmacAlgMD5)
            digestLength = CC_MD5_DIGEST_LENGTH
            break
        case .sha1:
            algo = CCHmacAlgorithm(kCCHmacAlgSHA1)
            digestLength = CC_SHA1_DIGEST_LENGTH
            break
        case .sha224:
            algo = CCHmacAlgorithm(kCCHmacAlgSHA224)
            digestLength = CC_SHA224_DIGEST_LENGTH
            break
        case .sha256:
            algo = CCHmacAlgorithm(kCCHmacAlgSHA256)
            digestLength = CC_SHA256_DIGEST_LENGTH
            break
        case .sha384:
            algo = CCHmacAlgorithm(kCCHmacAlgSHA384)
            digestLength = CC_SHA384_DIGEST_LENGTH
            break
        case .sha512:
            algo = CCHmacAlgorithm(kCCHmacAlgSHA512)
            digestLength = CC_SHA512_DIGEST_LENGTH
            break
        }
        let digestLen: Int = Int(digestLength)
        let buffer = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
        let keyLen = Int(key.lengthOfBytes(using: String.Encoding.utf8))

        CCHmac(algo, keyStr, keyLen, str, strLen, buffer)

        var result: String = ""
        for i in 0..<digestLen {
            result += String(format: "%02x", buffer[i])
        }
        buffer.deallocate()

        return result
    }
}
