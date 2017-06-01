//
//  RSAHelper.swift
//  MyEncrypter
//
//  Created by 鄭翔元 on 2017/6/1.
//  Copyright © 2017年 Addweup. All rights reserved.
//

import Foundation
import CryptoSwift
import SwiftyRSA

class RSAHelper{
    //    public static let pubpemString = "-----BEGIN RSA PUBLIC KEY-----\nMIIBCgKCAQEAtL1hr0CD4X/xaiDPkAymYmWYXyUqmc+YYNtZtf1REP2shF476UkK\nSUcJRIjjgOj1/DctMhB8IjHjg7jbgIb28yWdaJtbqVKXHzydmJWiLkEWRri4pkrj\nLGYjZPUUgMm2eLfwc6AI+vs3yiasZCSdAHZ764d9sdVcxqLn3Fi83AsfdYABUtOZ\nE6w9LGzwDhoHRWiVelUXV9rFh5P+L7dk+4CLeNPcSVjS4yyfVAXeJj1Uxa8VhU20\n3Nu5wRQLY51z8EozuffnK2wY1+TkixgC9k5XuAMPGPgZMP70SnG3fF1Ox3u1w4mD\nh0mxB9bNR4A/xqhpTKG/7xneh78uARJ1UQIDAQAB\n-----END RSA PUBLIC KEY-----"
    
    //    public static let pubpemString = "-----BEGIN RSA PUBLIC KEY-----\nMIICCgKCAgEA74jtsv8+lp/yaq/0974Jr7B5hFowOzPr32TkpWT1wuDRmjaCO5YC\n1YmjxF6DEenBK98IcL1dnPSIyNjrZnM4iLDHXYpD0bI1W5SyFqAxSCcd5PW0dP5w\nmssisSmU4wd35EOUJ98nEYPstfB7yEl1Qz5Om5UUPu8gGXSzXYqSn+Pb38GPSpGM\ngHkoSNyuQrS65Zx7Z3jMkGNL0y8YvinBglICwlNceAmOHWJinFFQNSt1bbSU3WFm\nbuCQ4jsP3MRu5iaKgYJsQS2SO4Nq+B5GsUkUIQTe8h0/CqksWGcJ3tGCjXQzQn++\nfybHBajcUL8L50YRcbfwyEUqlqKR31fPOBtcnH3I4od4iqAqnV408qgZw0843d1h\n98RJyIQaV7JYkkUR2M8hdmon7CDFKAY5hHp2SM8CsMYcmxCP/gGEczp2LMSxP989\nJkMGdxBLnqZWBGNKuOjPOjiQEBRrviGiyA1dRDs0cMiOu+QgMlqMJZIlGc3fWCSO\n20TB51DfFUuyKQ4nHT49MLU99ap6ENyjXsybmsEy1KU0TQIiZnzOpFw7fJ9fQCDN\npp7X1RF8hoLzn5wo1XdcQLsBzsNpuSaUnrwc90wT5vzBLYo89bmIUcsXbUPSBG9J\nnmhyycVZ7btdjn9qPf5BT7r6i9NJ/C/LaQHTzWVcQlNa8jx8SP+Cru8CAwEAAQ==\n-----END RSA PUBLIC KEY-----"
    
    public static let pubpemString = "-----BEGIN RSA PUBLIC KEY-----\nMIIECgKCBAEA4aYr5YH7afM9Q4LRK9X8l9OZUV/sTd826assXqf7pG4DFucCoKsM\nIN/IL0OItQHcjf9WiJ96QvXz9uTAhM0Q8XlR+zreE7EbCq1l9LK+krgmLtTEaUqm\nPXmw9A3Tn0VUnqW0RRibR99/gaE+cwUIgBIdvSqAsVl4P/9Ia5qpM9jKIQFZmiXZ\nI9tM2HOQ3W9asDaCji4eMNaKxR9u1fCLwi/+pW18Ig7cCLjQt5nFzCDPrJhmF2Zz\nCUezN0cSoS31fQeSqkD+AsKEQ6gop71rhFrOIiWXhVnn117zQXmX+uz3vFG26lPq\n1X+TnffJyrdijg40Q94wm9FT7+E/EU4Hc7lac/NDgTzKNSrNYTprswoE0rMeQPzB\nNyeqSbuY4YH6sL/nkejnOcUVYiAs2io4xOJILpl69aj0lcgWrPqlE9yQ5dJ1GxNb\nJZfEJZL80MRiumKHt+nVOAlZa7AlYmFBzKsAkxhDQLLdyVMQYS34GElojw9c6CcS\nIqoKVCzLQzfBBniohHUbNhKB9lKuG2v2n2/K8DpY653xKKHPr81ucZB4NLZHaBf6\n/CiWkXQboguveyi3x9S9cPYghW6WgwTp7r9l78fudDgOlCooVb8pxzqqpSypcNUK\n4fxU3NZbw4MK3f4E49bRkzgv2XVZtBh8NcGt6FlFhfq9KdH54rtFUF5vDt2Yi//L\n6VRvOvdqq6a3yb4Btlfj24f+ymMTKtiCySJAgxYwEyS6ue3WGn98g8Iu/rZrE+we\n6W4CLc8tfJec78huq4BnE5AL4mywAOy7MaGlC0APas1mD1J24o5eJaZ5pgOZSViP\n7ELvVQHguYttWpASb4wQxFFIYU7M3wnev9m4ZTpe9/8XVVvp7AN/ksNr1zTcNo9c\nvaTF3O7ODIbjS2iSTsgJPFY/gvZiBzEODF0OuI+I2AINSS6SDPjLzaAyk4mdtJrF\nApK9oj+f12iVKKbtrG5Fs1pHKtXIZWCioI+h5ZpkUGkQESTxbZcYfpCJf4WopOuw\nqA1BuPnQZDNsdGPmH/N+ew0ej4a1O6pqrSQ+S0xBqMm9MbmWHQDFsK00TduhZDT5\nTOQ4h/7N9YtAC/v3vwz31pIHF/ZL0N0oX27vZqQ77mzWOeich0rmx+jTzJiKB9w4\n7gQOCzMURLSWe5H4DndUtMInd0oZOXjZKuUQyQdK32UdSwHvuzLWKCSl4kA3Z4XE\nZotoRd3RGbEcAbtJayWcRRNwX6d2Kd3cLzyeMWaoYfTjMI+D65kQwCq+a5B4joy0\nAk4Z//AMw59IuOcdhyOwAYe6HoiXe8qPIjxXJ0+MoaPHaLKCLLUUJ90S3Q2w4ocL\n/HTGb1rvrVEtm2i/9Jn7fen0QdPczPMjPwIDAQAB\n-----END RSA PUBLIC KEY-----"
    
    //    public static let pubpemString = "-----BEGIN PUBLIC KEY-----\nMIIFIjANBgkqhkiG9w0BAQEFAAOCBQ8AMIIFCgKCBQEA1crBSU1qUqwLzSsf18+i\nPiBkXO68V5bNt0YN04LhnLwwGTOm0dm/oRmBDvSVa/bcWHP6/+3ml3D9gfMElHmr\nEiCWV9PTHejF9EJ1kVnMu8+l72g2fwsCUrm3LnAXVQ4Jxu/o09b0XU8uh8Z7Kzqf\nfeLSMJTFqpAmBAexMsSYN45ho5jAWsm9/31Hw8jru4TWaxZC5y3Bv7asYNzO4yNi\nk3gzfiJuV2fKsKfNSyxXSoHeXo+lvrWzh6Yg5JD0KIqZaOKCJ0t/xPxNExm8iLwe\nqeLBCfN2CZiX4+x/cpaZFbczuEb3JYHPnrCs4pcv/ErWC26qSK3UD40fGdk2KV61\nywGWtvU4E+l7TTm2fCQ4WwtnGJ2YNcMYiGO4/MGEB04K3iB69iv37Y29hkgRA2nN\nbkHTru3KgfsiXVjMoxbW3hXbkWeiUd8tlqbgnvl58SJi5o/wdyPKMat7RPsGSoGf\ntM0VV0MVcZXXDROYNr8o6eCw+UdDXqMKG2gha20352rq4Dl040UmNE9TZZuU+Z2A\nVNIf5Hz9E6ShjKaUOHEr1iL8adNTPhA57Ds4UG99eFhB65K0XSSRKEBHm20PldRf\nnUMjWTBiUfk9UgYUI0Mic4SwFmC52rVlB7a9gkVz9qKaZZxcMmK7iqxeteJbPiph\nTnTrsdGdeCjbvbapQfH5253SSqNlsCC36pcuxYatNNdjl4Y+zpK0tbzcasuRN3j+\nY2GJY+gYbHbazhIDod4HCDBVucMecd+eG+kwawv/ToXBIgi7fpXZence9s/x4jve\nPgvP68aXLorXcz/q3KsPnxlU4N57PATUkQ6Dezc00jQsF5aFsTFUE6UR7UBJZYHr\nG3NFYPM1OBethug5aeHp3OQ3mIsmzw2SU5/vbXIf24ROjswa/VZghPbyy86zPD+H\n1yM8cI0Eatq7/Sn5L24t2qihgC9iXQtvUZbMCCb89noQB8XBA9VDegfpj2GT/jkw\nq1jt8pEaFDpfubZ0kdwCSRxgSgFC8M529ltT0owMY7WMZLeifmS9UFI+kplHEbbz\nqSMqpQLmv6SDvsw4bonXZKAnhdgPBytoBVWmpTz73iXKZUi2yjgXUDLT4t6ITrrh\nk2W+2XJdxj5MvtpwLPzIdm48c3T30n7LNIrtUOc/uSe/x3Xap4WRTWHlf+1FkI4G\nYDTjWPmorFd571LG65iz6KPBBgTMjo0JyMPTzDoDLfv29WaLZmaygcZQkGYMm5gP\nwKEWEV7+wNDCJ2HuGksaxb6WA0edynvzugN5SJmtsYf+1pYGkWS0uQ5401zL1h+t\nxZzy6HsNYoJVAK9aleUIXPEcCz2d0jmCbCSlb+wJe85HGHJ6SZET4VKMfJnjTB3a\nWXGAZyNw8hZ7UYeikxXEliEO3JczmRmfwcV8A/0M03eJrO5dGbd7Uyp2Z5ee5yyt\nzh1xx3HJPvk+39FMxXsFKgtPGkxjbNrN2S5QTjqpJ1ygd8QL0gt33wU9vu7co8Wd\nhtFnDwF90NlxbF0ALKWmd0QFRUZ2qoncGcHM2SkAcL6vQmBq1Ljxc0KOkp6VYjq+\nZjSVGgYklXR2KFqvwmNYj8ySAaqtgBwWRsZWp29zLXlGdopBC2GIw4Vjl5d4SPzU\nOoeF4qKTuqzkq1k3tWMwH7My36BkmHC8Rc0YnMK3cY6EuuY80t/EYThr6K0EhENa\nYmg+0W2tmV0bTr5HcX60MXsCAwEAAQ==\n-----END PUBLIC KEY-----"
    
    
    public static func loadPublicKey(pubpemString:String) -> PublicKey?{
        let publicKey = try? PublicKey(pemEncoded: pubpemString)
        return publicKey
    }
    
    public static func encrypt(content: String, key: PublicKey) throws -> String?{
        do{
            let clear = try ClearMessage(string: content, using: .utf8)
            let encrypted = try clear.encrypted(with: key, padding: .PKCS1)
            return encrypted.data.base64EncodedString()
        }
        catch{
            throw error
        }
    }
    
}
