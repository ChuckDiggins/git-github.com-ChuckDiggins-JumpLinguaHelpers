//
//  File.swift
//  
//
//  Created by Charles Diggins on 5/14/22.
//

import Foundation
import JumpLinguaHelpers

public enum BehaviorType : String {
case weather = "weather"
case likeGustar = "likeGustar"
case thirdPersonOnly = "thirdPersonOnly"
    case auxiliary = "Auxiliary"
    
}

public struct BehavioralVerbModel {
    public func isWeather(language: LanguageType, verb: Verb)->Bool{
        switch language{
        case .Spanish:
            switch verb.spanish{
            case "amanacer": return true
            case "anochecer": return true
            case "atardecer": return true
            case "helar ": return true
            case "granizar": return true
            case "llover": return true
            case "nevar": return true
            case "relampaguear": return true
            case "tronar": return true
            default: return false
            }
        case .French:
            switch verb.french{
            case "amanacer": return true
            default: return false
            }
        default: return false
        }
    }
    
    public func isLikeGustar(language: LanguageType, verb: Verb)->Bool{
        switch language{
        case .Spanish:
            switch verb.spanish{
            case "gustar": return true
            case "aburrir": return true
            case "doler": return true
            case "encantar ": return true
            case "faltar": return true
            case "fascinar": return true
            case "importar": return true
            case "molestar": return true
            case "parecer": return true
            case "quedar": return true
            case "sorprender": return true
            case "volver loco": return true
            default: return false
            }
        case .French:
            switch verb.french{
            case "importar": return true
            default: return false
            }
        default: return false
        }
    }
    
    public func isThirdPersonOnly(language: LanguageType, verb: Verb)->Bool{
        switch language{
        case .Spanish:
            switch verb.spanish{
            case "acaecer": return true  //happen
            case "acontecer": return true  //happen
            case "atañer": return true  //to have to do with
            case "aterirse": return true
            case "despavorir": return true
            case "desolar ": return true
            case "empedernir": return true
            case "suceder": return true
            default: return false
            }
        case .French:
            switch verb.french{
            case "importar": return true
            default: return false
            }
        default: return false
        }
    }
    
//    alcanzar + infinitive (to manage to do)
//    comenzar + infinitive (to begin doing)
//    echar a + infinitive (to begin doing)
//    haber de + infinitive (to have to do)
//    parar de + infinitive (to stop doing)
//    resultar + infinitive (to end up doing)
//    quedar en + infinitive (to arrange to do )
//    seguir + gerund (to keep on doing, to continue to do)
    
    public func isAuxiliary(language: LanguageType, verb: Verb)->(Bool, Tense){
        switch language{
        case .Spanish:
            switch verb.spanish{
            case "deber": return (true, .infinitive)  //should
            case "estar": return (true, .gerund)  //should
            case "poder": return (true, .infinitive)  //can
            case "querer": return (true, .infinitive)  //want
            case "acabar de": return (true, .pastParticiple)
            case "andar": return (true, .gerund)
            case "alcanzar": return (true, .infinitive)
            case "echar a": return (true, .infinitive)
            case "haber de": return (true, .infinitive)
            case "haber": return (true, .pastParticiple)
            case "parar de": return (true, .infinitive)
            case "parar de": return (true, .infinitive)
            case "resultar": return (true, .infinitive)
            case "quedar en": return (true, .infinitive)
            case "seguir": return (true, .gerund)
            default: return (false, .infinitive)
            }
        case .French:
            switch verb.french{
            case "être": return (true, .infinitive)
                
// used with these 17 infinitives
//                aller     To go
//                arriver     To arrive
//                descendre     To go down
//                devenir     To become
//                entrer     To enter
//                monter     To go up
//                mourir     To die
//                naître     To be born
//                passer     To pass
//                partir     To leave
//                rentrer     To re-enter
//                rester     To stay
//                retourner     To return
//                revenir     To come back
//                sortir     To go out
//                tomber     To fall
//                venir     To come
                
            case "avoir": return (true, .infinitive)
            default: return (false, .infinitive)
            }
        default: return (false, .infinitive)
        }
    }
}
