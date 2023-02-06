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
    case likeGustar = "like Gustar"
    case thirdPersonOnly = "third Person only"
    case auxiliary = "auxiliary"
    case reflexive = "reflexive"
    case participles = "participles"
    case idioms = "idioms"
}

public struct BehavioralVerbModel {
    public init(){
    }
    
    public func getVerbs(language: LanguageType, bt: BehaviorType)->[Verb]{
        switch bt{
        case .weather: return getVerbsLikeWeather(language: language)
        case .likeGustar: return getVerbsLikeGustar(language: language)
        case .thirdPersonOnly: return getVerbsLikeThirdPersonOnly(language: language)
        case .auxiliary: return getAuxiliaryVerbs(language: language)
        default: return [Verb]()
        }
    }
    public func getVerbsLikeWeather(language: LanguageType)->[Verb]{
        var verbList = [Verb]()
        switch language{
        case .Spanish:
            verbList.append(Verb(spanish: "amanacer", french: "", english: ""))
            verbList.append(Verb(spanish: "anochecer", french: "", english: ""))
            verbList.append(Verb(spanish: "atardecer", french: "", english: ""))
            verbList.append(Verb(spanish: "helar", french: "", english: ""))
            verbList.append(Verb(spanish: "granizar", french: "", english: ""))
            verbList.append(Verb(spanish: "llover", french: "", english: ""))
            verbList.append(Verb(spanish: "nevar", french: "", english: ""))
            verbList.append(Verb(spanish: "relampaguear", french: "", english: ""))
            verbList.append(Verb(spanish: "tronar", french: "", english: ""))
            return verbList
        case .French: return verbList
        default: return verbList
        }
    }
    
    public func isWeather(language: LanguageType, targetVerb: Verb)->Bool{
        for verb in getVerbsLikeWeather(language: language){
            if targetVerb == verb { return true}
        }
        return false
    }
    
    public func getVerbsLikeGustar(language: LanguageType)->[Verb]{
        var verbList = [Verb]()
        switch language{
        case .Spanish:
            verbList.append(Verb(spanish: "gustar", french: "", english: ""))
            verbList.append(Verb(spanish: "aburrir", french: "", english: ""))
            verbList.append(Verb(spanish: "doler", french: "", english: ""))
            verbList.append(Verb(spanish: "encantar", french: "", english: ""))
            verbList.append(Verb(spanish: "faltar", french: "", english: ""))
            verbList.append(Verb(spanish: "fascinar", french: "", english: ""))
            verbList.append(Verb(spanish: "importar", french: "", english: ""))
            verbList.append(Verb(spanish: "molestar", french: "", english: ""))
            verbList.append(Verb(spanish: "parecer", french: "", english: ""))
            verbList.append(Verb(spanish: "quedar", french: "", english: ""))
            verbList.append(Verb(spanish: "sorprender", french: "", english: ""))
            verbList.append(Verb(spanish: "volver loco", french: "", english: ""))
            return verbList
        case .French: return verbList
        default: return verbList
        }
    }
    public func isVerbLikeGustar(language: LanguageType, targetVerb: Verb)->Bool{
        for verb in getVerbsLikeGustar(language: language){
            if targetVerb == verb { return true}
        }
        return false
    }
    
    public func getVerbsLikeThirdPersonOnly(language: LanguageType)->[Verb]{
        var verbList = [Verb]()
        switch language{
        case .Spanish:
            verbList.append(Verb(spanish: "acaecer", french: "", english: "take place"))
            verbList.append(Verb(spanish: "acontecer", french: "", english: "happen"))
            verbList.append(Verb(spanish: "atañer", french: "", english: "appertain"))
            verbList.append(Verb(spanish: "aterirse", french: "", english: "get stiff with cold"))
            verbList.append(Verb(spanish: "despavorir", french: "", english: "terrify"))
            verbList.append(Verb(spanish: "desolar", french: "", english: "devastate"))
            verbList.append(Verb(spanish: "empedernir", french: "", english: "harden"))
            verbList.append(Verb(spanish: "suceder", french: "", english: "happen"))
            return verbList
        case .French: return verbList
        default: return verbList
        }
    }
    
    public func isThirdPersonOnly(language: LanguageType, targetVerb: Verb)->Bool{
        for verb in getVerbsLikeThirdPersonOnly(language: language){
            if targetVerb == verb { return true}
        }
        return false
    }
    
//    alcanzar + infinitive (to manage to do)
//    comenzar + infinitive (to begin doing)
//    echar a + infinitive (to begin doing)
//    haber de + infinitive (to have to do)
//    parar de + infinitive (to stop doing)
//    resultar + infinitive (to end up doing)
//    quedar en + infinitive (to arrange to do )
//    seguir + gerund (to keep on doing, to continue to do)

    
    public func getAuxiliaryVerbs(language: LanguageType)->[Verb]{
        var verbList = [Verb]()
        switch language{
        case .Spanish:
            verbList.append(Verb(spanish: "acabar de", french: "finir de", english: "just finished"))
            verbList.append(Verb(spanish: "alcanzar", french: "atteindre", english: "reach"))
            verbList.append(Verb(spanish: "andar", french: "marcher", english: "walk"))
            verbList.append(Verb(spanish: "deber", french: "devoir", english: "should"))
            verbList.append(Verb(spanish: "echar a", french: "jeter à", english: "kick out"))
            verbList.append(Verb(spanish: "estar", french: "être", english: "be"))
            verbList.append(Verb(spanish: "haber de", french: "devoir", english: "need to"))
            verbList.append(Verb(spanish: "haber", french: "avoir", english: "have"))
            verbList.append(Verb(spanish: "parar de", french: "arrêter", english: "stop"))
            verbList.append(Verb(spanish: "poder", french: "pouvoir", english: "can"))
            verbList.append(Verb(spanish: "quedar sin", french: "rester dans", english: "has been without"))
            verbList.append(Verb(spanish: "quedarse en", french: "rester dans", english: "stay in"))  //I stay in bed
            verbList.append(Verb(spanish: "querer", french: "vouloir", english: "want to"))
            verbList.append(Verb(spanish: "resultar", french: "résulter", english: "result"))
            verbList.append(Verb(spanish: "seguir", french: "continuer", english: "continue"))
            
            verbList.append(Verb(spanish: "comenzar a", french: "commencer à", english: "begin"))
            verbList.append(Verb(spanish: "dejar de", french: "laisser de", english: "stop"))
            verbList.append(Verb(spanish: "estar por", french: "être par", english: "be by"))
            verbList.append(Verb(spanish: "ir a", french: "aller à", english: "go to"))
            verbList.append(Verb(spanish: "ponerse a", french: "accéder à", english: "get to"))
            verbList.append(Verb(spanish: "romper a", french: "casser à", english: "break up"))
            verbList.append(Verb(spanish: "soler", french: "faire habituellement", english: "usually"))
            verbList.append(Verb(spanish: "tener que", french: "devoir", english: "have to"))
            verbList.append(Verb(spanish: "venir a", french: "venir à", english: "come to"))
            verbList.append(Verb(spanish: "volver a", french: "retourner à", english: "do again"))
            
            verbList.append(Verb(spanish: "ir", french: "aller", english: "go"))
            verbList.append(Verb(spanish: "llevar", french: "apporter", english: "carry on"))
            verbList.append(Verb(spanish: "venir", french: "venir", english: "come"))
            
            verbList.append(Verb(spanish: "dejar hecho", french: "laissere résonner", english: "leave done"))
            verbList.append(Verb(spanish: "llevar puesto", french: "porter", english: "be wearing"))
            verbList.append(Verb(spanish: "sentirse", french: "se sentir", english: "feel sorry"))
            verbList.append(Verb(spanish: "verse", french: "se voir", english: "be"))
            return verbList
        case .French: return verbList
        default: return verbList
        }
    }
    
    public func isAuxiliaryAtTense(language: LanguageType, verb: Verb, targetTense: Tense)->Bool{
        let result = isAuxiliary(language: language, verb: verb)
        if result.0 && result.1 == targetTense {return true}
        return false
    }
    
    public func getAuxiliaryVerbsAtTense(language: LanguageType, targetTense: Tense)->[Verb]{
        var verbList = [Verb]()
        for verb in getAuxiliaryVerbs(language: language){
            let result = isAuxiliary(language: language, verb: verb)
            if result.0 {
                if result.1 == targetTense { verbList.append(verb)}
            }
        }
        return verbList
    }
    
    public func isAuxiliary(language: LanguageType, verb: Verb)->(Bool, Tense){
        switch language{
        case .Spanish:
            switch verb.spanish{
            case "deber": return (true, .infinitive)  //should
            case "estar": return (true, .gerund)  //should
            case "poder": return (true, .infinitive)  //can
            case "querer": return (true, .infinitive)  //want
            case "acabar de": return (true, .infinitive)
            case "andar": return (true, .gerund)
            case "alcanzar": return (true, .infinitive)
            case "echar a": return (true, .infinitive)
            case "haber de": return (true, .infinitive)
            case "haber": return (true, .pastParticiple)
            case "parar de": return (true, .infinitive)
            case "resultar": return (true, .infinitive)
            case "quedar sin": return (true, .infinitive)
            case "quedarse en": return (true, .infinitive)
            case "seguir": return (true, .gerund)
                
            case "comenzar a": return (true, .infinitive)
            case "dejar de": return (true, .infinitive)
            case "estar por": return (true, .infinitive)
            case "ir a": return (true, .infinitive)
            case "ponerse a": return (true, .infinitive)
            case "romper a": return (true, .infinitive)
            case "soler": return (true, .infinitive)
            case "venir a": return (true, .infinitive)
            case "tener que": return (true, .infinitive)
            case "volver a": return (true, .infinitive)
                
            case "ir": return (true, .gerund)
            case "llevar": return (true, .gerund)
            case "venir": return (true, .gerund)
                
            case "dejar hecho": return (true, .gerund)
            case "llevar puesto": return (true, .gerund)
            case "sentirse": return (true, .gerund)
            case "verse": return (true, .gerund)
               
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
    
    public func getAuxiliaryComment(language: LanguageType, verb: Verb)->(String, String){
        switch language{
        case .Spanish:
            switch verb.spanish{
            case "acabar de": return ("auxiliary phrase 'acabar de':  Takes an infinitive. Means 'to just'.", "\"acabo de estudiar\" means \"I just studied\".")
            case "andar": return ("auxiliary verb 'andar':  Takes a gerund. Means 'is' when used like this.", "\"ando estudiando\" means \"I am studying\".  Similar use as \"estar\".")
            case "deber": return ("auxiliary verb 'deber':  Takes an infinitive. Means 'should'.", "\"debo estudiar\" means \"I should study\".")
            case "estar": return ("auxiliary verb 'estar':  Takes a present participle and is referred to as progressive tense. Means 'is'."," \"estoy estudiando\" means \"I am studying\".")
            case "poder": return ("auxiliary verb 'poder':  Takes an infinitive. Means 'can'.", "\"puedo estudiar\" means \"I can study\".")
            case "querer": return ("auxiliary verb 'querer':  Takes an infinitive. Means 'want to'", " \"quiero estudiar\" means \"I want to study\".")
            case "alcanzar": return ("auxiliary verb 'alcanzar':  Takes an infinitive. Means 'to manage to' when used like this.", "\"alcanzo estudiar\" means \"I manage to study\".")
            case "echar a": return ("auxiliary phrase 'echar a':  Takes an infinitive. Means 'to start' when used like this.", "\"echo a estudiar\" means \"I am starting to study\".")
            case "haber de": return ("auxiliary phrase 'haber de':  Takes an infinitive. Means 'to have to do' when used like this.", " \"he de estudiar\" means \"I have to study\".")
            case "haber": return ("auxiliary verb 'haber':  Takes a past participle. Means 'to have' when used like this and is referred to as perfect tense.", " \"he estudiado\" means \"I have studied\".")
            case "parar de": return ("auxiliary phrase 'parar de':  Takes an infinitive. Means 'to stop doing' when used like this.", " \"paro de estudiar\" means \"I stop studying\".")
            case "resultar": return ("auxiliary verb 'resultar':  Takes an infinitive. Means 'to end up doing' when used like this.", "\"resulto estudiar\" means \"I end up studying\".")
            case "quedarse en": return ("auxiliary phrase 'quedarse en':  Takes an infinitive. Means 'to arrange to' when used like this.", "\"me quedo en estudiar\" means \"I stay to study\".")
            case "quedar sin": return ("auxiliary phrase 'quedar sin':  Takes an infinitive. Means 'to have not been' when used like this.", "\"el trabajo quedó sin realizar\" means \"The work was never finished\".")
            case "seguir": return ("auxiliary verb 'seguir':  Takes a gerund. Means 'to continue to' when used like this.", "\"sigo estudiando\" means \"I am still studying\".")
           
            case "comenzar a": return ("auxiliary phrase 'comenzar a':  Takes an infinitive. Means 'to begin' when used like this.", "\"comenzo estudiar\" means \"I am beginning to study\".")
            case "dejar de": return ("auxiliary phrase 'dejar de':  Takes an infinitive. Means 'to stop' when used like this.", "\"dejo de estudiar\" means \"I stop studying\".")
            case "estar por": return ("auxiliary phrase 'estar por':  Takes an infinitive. Means 'to be about to' when used like this.", "\"estoy por estudiar\" means \"I am about to start studying\".")
            case "ir a": return ("auxiliary phrase 'ir a':  Takes an infinitive. Means 'going to' when used like this.", "\"voy a estudiar\" means \"I am going to study\".")
            case "ponerse a": return ("auxiliary phrase 'ponerse a':  Takes an infinitive. Means 'to start' when used like this.", "\"me pongo a estudiar\" means \"I am starting to study\".")
            case "romper a": return ("auxiliary phrase 'romper a':  Takes an infinitive. Means 'suddenly start' when used like this.", "\"rompo a estudiar\" means \"I break to study\".")
            case "soler": return ("auxiliary verb 'soler':  Takes an infinitive. Means 'usually do something' when used like this. ", "\"suelo estudiar\" means \"I usually study\".")
            case "venir a": return ("auxiliary phrase 'venir a':  Takes an infinitive. Means 'come to' when used like this.", "\"vengo a estudiar\" means \"I come to study\".")
            case "tener que": return ("auxiliary phrase 'tener que':  Takes an infinitive. Means 'have to do something' when used like this.", "\"tengo que estudiar\" means \"I have to study\".")
            case "volver a": return ("auxiliary phrase 'volver a':  Takes an infinitive. Means 'do something again' when used like this.", "\"vuelvo a estudiar\" means \"I return to study\".")
                
            case "ir": return ("auxiliary verb 'ir':  Takes a gerund. Means 'do something' when used like this.", "\"voy estudiando\" means \"I am studying\".")
            case "llevar": return ("auxiliary verb 'llevar':  Takes a gerund. Means 'have been something' when used like this.", "\"llevo estudiando\" means \"I have been studying\".")
            case "venir": return ("auxiliary verb 'venir':  Takes a gerund. Means 'have been doing something' when used like this.", " \"vengo estudiando\" means \"I have been studying\".")
                
            case "dejar hecho": return ("auxiliary phrase 'dejar hecho':  Takes a gerund. Means 'be done' when used like this.", "\"dejar hecho estudiando\" means \"I usually study\".")
            case "llevar puesto": return ("auxiliary phrase 'llevar puesto':  Takes a gerund. Means 'usually do something' when used like this.", "\"llevo puesto estudiando\" means \"I have been studying\".")
            case "sentirse": return ("auxiliary verb 'sentirse':  Takes a past participle. Means 'to feel' when used like this.", "\"me siento agotado\" means \"I feel exhausted\".")
            case "verse":return ("auxiliary verb 'verse':  Takes a gerund. Means 'to see oneself' when used like this.", "\"me veo estudiando\" means \"I see myself studying\".")
            default: return ("", "")
            }
        case .French:
            switch verb.french{
            case "être": return ("", "")

                
            case "avoir": return ("", "")
                
            default: return ("", "")
                
            }
        default: return ("", "")
            
        }
    }
}

