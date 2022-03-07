////
////  SpanishVerbList.swift
////  VIperSpanish 2
////
////  Created by Charles Diggins on 2/1/21.
////
//
//import Foundation
//
//enum frenchVerbList {
//    case connecting
//    case regular
//    case irregular
//}
//
//
//struct FrenchVerbList {
//    func getVerbList(svl: frenchVerbList)->[String]{
//        switch svl{
//        case .connecting:
//            return frenchConnecting
//        case .regular:
//            return frenchRegular
//        case .irregular:
//            return frenchIrregular
//        }
//    }
//    
//    let frenchConnecting =
//        [
//            "avoir",
//            "être",
//            "aimer",
//            "placer",
//            "manger",
//            "pecer",
//            "céder",
//            "jeter"
//        ]
//    
//    let frenchRegular =
//        [
//            "aimer",
//            "placer",
//            "manger",
//            "pecer",
//            "céder",
//            "jeter",
//            "appeler",
//            "modeler",
//            "créer",
//            "siéger",
//            "crier",
//            "payer",
//            "broyer",
//            "essuyer",
//            "envoyer",
//            "finir",
//            "haïr"
//        ]
//    
//    let frenchIrregular =
//        [
//            "aller",
//            "tenir",
//            "acquérir",
//            "sentir",
//            "couvrir",
//            "cueillir",
//            "assailir",
//            "faillir",
//            "résoudre",
//            "rire",
//            "croire"
//        ]
//}
//
//enum spanishVerbList {
//    case assorted
//    case auxiliary
//    case bescherelleAll
//    case bescherelle1to17
//    case bescherelle18to35
//    case bescherelle36to65
//    case bescherelle66to86
//    case starter
//    case phrase
//    case irregular
//    case passive
//    case regular
//    case idiomDar
//    case idiomEchar
//    case idiomPoner
//    case idiomHacer
//    case stem
//    case orthoPresent
//    case orthoPreterite
//}
//
//struct SpanishVerbList {
//    func getVerbs(svl : spanishVerbList)->([String:String]){
//        switch svl{
//        case .bescherelleAll:
//            return bescherelleAll
//        case .bescherelle1to17:
//            return bescherelle1To17
//        case .bescherelle18to35:
//            return bescherelle18To35
//        case .bescherelle36to65:
//            return bescherelle36To65
//        case .bescherelle66to86:
//            return bescherelle66To86
//        case .stem:
//            return stemChangingDictionary
//        case .orthoPresent:
//            return orthoPresentDictionary
//        case .orthoPreterite:
//            return orthoPreteritDictionary
//        case .auxiliary:
//            return auxiliaryDictionary
//        case .starter:
//            return starterDictionary
//        case .irregular:
//            return irregDictionary
//        case .passive:
//            return passiveVerbDictionary
//        case .phrase:
//            return verbPhraseDictionary
//        case .regular:
//            return regularDictionary1
//        case .idiomDar:
//            return idiomDarDictionary
//        case .idiomEchar:
//            return idiomDarDictionary
//        case .idiomPoner:
//            return idiomPonerDictionary
//        case .idiomHacer:
//            return idiomHacerDictionary
//        default:
//            return regularDictionary1
//        }
//    }
//    
//    func getVerbList(svl : spanishVerbList)->[String]{
//        switch svl{
//        case .assorted:
//            return assortedList
//        case .orthoPresent:
//            return orthoPresentList
//        default:
//            return assortedList
//        }
//    }
//    
//        let orthoPresentList = [
//            "acoger",
//            "emerger",
//            "rugir",
//            "urgir",
//            "extinguir",
//            "esparcir",
//            "conducir",
//            "reconocer",
//            "delinquir",
//            "convencer"
//        ]
//        
//    // for testing ....
//    let assortedList =
//        [
//            //"bruñir",
//            //"dar",
//            //"decir",
//            "abolir",
//            "actuar",
//            "adquirir",
//            "ahincar",
//            "airar",
//            "andar",
//            "asir",
//            "aullar",
//            "avergonzar",
//            "averiguar",
//            "caer",
//            "cazar",
//            "cocer",
//            "coger",
//            "colgar",
//            "conocer",
//            "creer",
//            
//            "defender",
//            "delinquir",
//            "desosar",
//            "dirigir",
//            "discernir",
//            "distinguir",
//            "dormir"
//            
//        ]
//    
//    let bescherelleAll =
//        [
//            "ahincarse" : "be",
//            "cocerse" : "be",
//            "colgarse" : "have",
//            "casarse" : "have"
//        ]
//    
//    let bescherelleAll_AAA =
//        [
//            "ser" : "be",
//            "estar" : "be",
//            "haber" : "have",
//            "tener" : "have",
//            
//            "cortar" : "cut",
//            "deber" : "owe",
//            "vivir" : "live",
//            "abolir" : "abolish",
//            "actuar" : "act",
//            "adquirir" : "acquire",
//            "ahincar" : "persevere",
//            "airar" : "anger",
//            "andar" : "walk",
//            "asir" : "seize",
//            "aullar" : "howl",
//            "avergonzar" : "be ashamed",
//            "averiguar" : "discover",
//            "bruñir" : "polish",
//            "caber" : "fit",
//            "caer" : "fall",
//            "cazar" : "hunt",
//            "cocer" : "cook",
//            "coger" : "catch",
//            "colgar" : "hang",
//            "conocer" : "know",
//            "creer" : "believe",
//            "dar" : "give",
//            "decir" : "say",
//            "defender" : "defend",
//            "delinquir" : "commit an offense",
//            "desosar" : "bone",
//            "dirigir" : "manage",
//            "discernir" : "discern",
//            "distinguir" : "distinguish",
//            "dormir" : "sleep",
//            "elegir" : "choose",
//            "empezar" : "begin",
//            "encontrar" : "find",
//            "enraizar" : "take root",
//            "erguir" : "rise",
//            "errar" : "err",
//            "forzar" : "force",
//            "guiar" : "guide",
//            "hacer" : "make",
//            "influir" : "influence",
//            "ir" : "go",
//            "jugar" : "play",
//            "lucir" : "shine",
//            "mecer" : "swing",
//            "mover" : "move",
//            "oír" : "hear",
//            "oler" : "smell",
//            "pagar" : "pay",
//            "parecer" : "seem",
//            "pedir" : "request",
//            "pensar" : "think",
//            "placer" : "gratify",
//            "poder" : "be able",
//            "podrir" : "rot",
//            "poner" : "place",
//            "predecir" : "predict",
//            "producir" : "produce",
//            "prohibir" : "prohibit",
//            "querer" : "want",
//            "raer" : "scrape",
//            "regar" : "irrigate",
//            "reír" : "laugh",
//            "reñir" : "argue",
//            "reunir" : "reunite",
//            "roer" : "gnaw",
//            "saber" : "know",
//            "sacar" : "take out",
//            "salir" : "leave",
//            "satisfacer" : "satisfy",
//            "seguir" : "follow",
//            "sentir" : "feel",
//            "soler" : "be accostumed",
//            "tañer" : "strum",
//            "traer" : "bring",
//            "trocar" : "trade",
//            "valer" : "be worth",
//            "venir" : "come",
//            "ver" : "see",
//            "volver" : "return",
//            "yacer" : "lie",
//            "zurcir" : "mend"
//        ]
//    
//    
//    let bescherelle1To17 =
//        [
//            "ser" : "be",
//            "estar" : "be",
//            "haber" : "have",
//            "tener" : "have",
//            "cortar" : "cut",
//            "deber" : "owe",
//            "vivir" : "live",
//            "abolir" : "abolish",
//            "actuar" : "act",
//            "adquirir" : "acquire",
//            "ahincar" : "persevere",
//            "airar" : "anger",
//            "andar" : "walk",
//            "asir" : "seize",
//            "aullar" : "howl",
//            "avergonzar" : "be ashamed",
//            "averiguar" : "discover"
//        ]
//    
//    let bescherelle18To35 =
//        [
//            "bruñir" : "polish",
//            "caber" : "fit",
//            "caer" : "fall",
//            "cazar" : "hunt",
//            "cocer" : "cook",
//            "coger" : "catch",
//            "colgar" : "hang",
//            "conocer" : "know",
//            "creer" : "believe",
//            "dar" : "give",
//            "decir" : "say",
//            "defender" : "defend",
//            "delinquir" : "commit an offense",
//            "desosar" : "bone",
//            "dirigir" : "manage",
//            "discernir" : "discern",
//            "distinguir" : "distinguish",
//            "dormir" : "sleep"
//        ]
//    
//    let bescherelle36To65 =
//        [
//            "elegir" : "choose",
//            "empezar" : "begin",
//            "encontrar" : "find",
//            "enraizar" : "take root",
//            "enguir" : "straighten",
//            "errar" : "err",
//            "forzar" : "force",
//            "guiar" : "guide",
//            "hacer" : "make",
//            "influir" : "influence",
//            "ir" : "go",
//            "jugar" : "play",
//            "lucir" : "shine",
//            "mecer" : "swing",
//            "mover" : "move",
//            "oír" : "hear",
//            "oler" : "smell",
//            "pagar" : "pay",
//            "parecer" : "seem",
//            "pedir" : "request",
//            "pensar" : "think",
//            "placer" : "gratify",
//            "poder" : "be able",
//            "podrir" : "rot",
//            "poner" : "place",
//            "predecir" : "predict",
//            "producir" : "produce",
//            "prohibir" : "prohibit",
//            "querer" : "want",
//            "raer" : "scrape"
//        ]
//    
//    let bescherelle66To86 =
//        [
//            "regar" : "irrigate",
//            "reír" : "laugh",
//            "reñir" : "argue",
//            "reunir" : "reunite",
//            "roer" : "gnaw",
//            "saber" : "know",
//            "sacar" : "take out",
//            "salir" : "leave",
//            "satisfacer" : "satisfy",
//            "seguir" : "follow",
//            "sentir" : "feel",
//            "soler" : "be accostumed",
//            "tañer" : "strum",
//            "traer" : "bring",
//            "trocar" : "trade",
//            "valer" : "be worth",
//            "venir" : "come",
//            "ver" : "see",
//            "volver" : "return",
//            "yacer" : "lie",
//            "zurcir" : "mend"
//        ]
//    
//    
//    let orthoPresentDictionary = [
//        "acoger" : "greet",
//        "emerger" : "emerge",
//        "rugir" : "roar",
//        "urgir" :"urge",
//        "extinguir" : "extinguish",
//        "esparcir" : "disperse",
//        "conducir" : "drive",
//        "reconocer" : "recognize",
//        "delinquir" : "commit an offense",
//        "convencer" : "convince"
//    ]
//    
//    let orthoPreteritDictionary = [
//        "aparcar" : "park",
//        "explicar" : "explain",
//        "pescar" : "fish",
//        "llegar" : "arrive",
//        "obligar" : "oblige",
//        "vagar" : "wander",
//        "abrazar" : "hug",
//        "gozar" : "enjoy",
//        "tropezar" : "stumble",
//    ]
//    /*
//     
//     ]
//     */
//    /*
//     é
//     É
//     á
//     ó
//     í
//     üú
//     ñ
//     ç
//     ß
//     */
//    let stemChangingDictionary = [
//        "cerrar" : "close",
//        "comenzar" : "begin",
//        "empezar" : "begin",
//        "mentir" : "lie",
//        "pensar" : "think",
//        "perder" : "lose",
//        "preferir" : "prefer",
//        "querer" : "want",
//        "sentir" : "feel",
//        "concluir" : "conclude",
//        
//        "impedir" : "prevent",
//        "medir" : "measure",
//        "pedir" : "ask for",
//        "reír" : "laugh",
//        "seguir" : "follow",
//        "servir" : "serve",
//        "sonreir" : "smile",
//        "repetir" : "repeat",
//        "elegir" : "choose",
//        "fiar" : "xxx",
//        "liar"  : "xxxx",
//        "criar" : "create",
//        
//        "contar" : "count",
//        "costar" : "cost",
//        "doler" : "hurt",
//        "dormir" : "sleep",
//        "jugar" : "play",
//        "morir" : "die",
//        "probar" : "try",
//        "volar" : "fly",
//        "volver" : "return"
//        
//    ]
//    
//    let  verbPhraseDictionary = [
//        "hacer daño a" : "hurt",
//        "creer que sí": "think so",
//        "estarse" : "be oneself",
//        "arrepentirse de" : "repent of",
//        "verse" : "see oneself",
//        "xxxseguirse de" : "follow oneself",
//        "echar de menos" : "miss",
//        "convenir de" : "agree to",
//        "surtenerse     contra" : "sustain against",
//        "complir con" : "fulfill",
//        "dejar caer" : "drop",
//        "oir harlar de" : "hear about",
//        "perder cuidado" : "not to worry",
//        "contestarse de  malos modos" : "contest oneself quickly",
//        "ponerse de acuerdo" : "come to an agreement",
//        "ser aficionado a" : "be fond of",
//        "ir de compras" : "go shopping",
//        "llegar a ser" : "become",
//        "perder de vista" : "lose sight of",
//        "no poder menos de" : "cannot help",
//        "tratar de" : "try",
//        "valer de" : "be worthwhile",
//        "cambiar de" : "change"
//    ]
//    
//    
//    let  verbPhraseArray = ["hablar","desfrutar",
//                            "iniciar",
//                            " contenerse de  ",
//                            " retenerse con  ",
//                            " almorzar",
//                            " contar ",
//                            " herirse con ",
//                            "caber",
//                            "obedecer", "seguir", "comer",
//                            "leer", "oir", "ver",
//                            "hablar",
//                            "buscar",
//                            "vivir",
//                            "caber",
//                            " averiguar ",
//                            " xxxtener de  ",
//                            " rehacerse",
//                            "  empezar ",
//                            "  acentuar ",
//                            "sentarse  ",
//                            
//                            
//                            "comer",
//                            "vivir",
//                            " averiguar ",
//                            " contenerse de  ",
//                            " rehacerse",
//                            "  empezar ",
//                            "  acentuar ",
//                            "sentarse  ",
//                            "  venir  ",
//                            "  continuar  ",
//                            "  obedecer  ",
//                            "  venir  ",
//                            "  haber  ",
//                            "bromear",
//                            "colgar",
//                            "doler",
//                            "despedirse ",
//                            " seguir ",
//                            "medir"]
//    
//    let prepositionDictionary = ["a" : "to",
//                                 "ante" : "before",
//                                 "bajo" : "under",
//                                 "cabe" : "beside",
//                                 "con" : "with",
//                                 "contra" : "against",
//                                 "cuenta de" : "notice of",
//                                 "de" : "of",
//                                 "desde" : "since",
//                                 "durante" : "during",
//                                 "en" : "in",
//                                 "entre" : "between",
//                                 "excepto" : "except",
//                                 "falta" : "lack",
//                                 "hacia" : "toward",
//                                 "hasta" : "until",
//                                 "mediante" : "through",
//                                 "para" : "for",
//                                 "por" : "by",
//                                 "pro" : "in favor of",
//                                 "salvo" : "except",
//                                 "según" : "according to",
//                                 "sin" : "without",
//                                 "so" : "under",
//                                 "sobre" : "on",
//                                 "tras" : "after" ]
//    
//    let prepositionalPhraseDictionary = ["ademas de" : "besides",
//                                         "alrededor de" : "around",
//                                         "antes de" : "before",
//                                         "cerca de" : "nearly",
//                                         "conforme de" : "according to",
//                                         "debajo de" : "under",
//                                         "de todos modos" : "quickly",
//                                         "delante de" : "in front of",
//                                         "dentro de" : "inside",
//                                         "después de" : "after",
//                                         "detrás de" : "behind",
//                                         "encima de" : "above",
//                                         "enfrente de" : "in front of",
//                                         "fuera de" : "outside of",
//                                         "junto a" : "next to",
//                                         "lejos de" : "far from",
//                                         "tocante a" : "as far as",
//                                         "respecto a" : "regarding",
//                                         "respecto de" : "regarding"
//    ]
//    
//    
//    let auxiliaryDictionary =
//        [      "ser" : "be",
//               "estar" : "be",
//               "haber" : "have",
//               "tener" : "have",
//               "cortar" : "cut",
//               "deber" : "must",
//               "vivir" : "live"
//        ]
//    
//    let  irregDictionary =
//        [  "abolir" : "abolish",
//           "actuar" : "act",
//           "adquirir" : "acquire",
//           "ahincar" : "persevere",
//           "airar" : "anger",
//           "andar" : "walk",
//           "asir" : "seize",
//           "aullar" : "howl",
//           "avergonzar" : "be ashamed",
//           "averiguar" : "find out",
//           "bruñir" : "polish",
//           "caber" : "fit",
//           "caer" : "fall",
//           "cazar" : "hunt",
//           "cocer" : "cook",
//           "coger" : "take",
//           "colgar" : "hang",
//           "conocer" : "know",
//           "creer" : "believe",
//           "dar" : "give",
//           "decir" : "say",
//           "defender" : "defend",
//           "delinquir" : "commit an offense",
//           "desosar" : "pit",
//           "dirigir" : "manage",
//           "discernir" : "discern",
//           "distinguir" : "distinguish",
//           "dormir" : "sleep",
//           "elegir" : "elect",
//           "empezar" : "begin",
//           "encontrar" : "find",
//           "enraizar" : "take root",
//           "erguir" : "rise",
//           "errar" : "err",
//           "forzar" : "force",
//           "guiar" : "guide",
//           "hacer" : "make",
//           "influir" : "influence",
//           "ir" : "go",
//           "jugar" : "play",
//           "lucir" : "shine",
//           "mecer" : "swing",
//           "mover" : "move",
//           "oir" : "hear",
//           "oler" : "smell",
//           "pager" : "pay",
//           "paracer" : "seem",
//           "pedir" : "request",
//           "pensar" : "think",
//           "placer" : "please",
//           "poder" : "be able",
//           "podrir" : "decay",
//           "pudrir" : "decay",
//           "poner" : "put",
//           "predecir" : "predict",
//           "producir" : "produce",
//           "prohibir" : "prohibit",
//           "querer" : "want",
//           "raer" : "scrape",
//           "regar" : "water",
//           "reir" : "laugh",
//           "reñir" : "argue",
//           "reunir" : "gather",
//           "roer" : "gnaw",
//           "saber" : "know",
//           "sacar" : "take out",
//           "salir" : "leave",
//           "satisfacer" : "satisfy",
//           "seguir" : "follow",
//           "sentir" : "feel",
//           "soler" : "be accustomed",
//           "taner" : "strum",
//           "traer" : "bring",
//           "trocar" : "barter",
//           "valer" : "be worth",
//           "venir" : "come",
//           "ver" : "see",
//           "volver" : "return",
//           "yacer" : "lie",
//           "zurcir" : "mend"
//           
//        ]
//    
//    
//    let idiomDarDictionary = [
//        "dar con" : "meet",
//        "dar la hora" : "strike the hour",
//        "dar las gracias" : "thank",
//        "dar una vuelta" : "take a walk",
//        "dar un paseo" : "take a walk",
//        "dar a conocer" : "make known",
//        "dar miedo" : "frighten",
//        "dar gritos" : "shout",
//        "darse prisa" :"hurry",
//        "dar la mano a" : "shake hands",
//        "darse cuenta de" : "realize"
//    ]
//    
//    let idiomEcharDictionary = [
//        "echarse a" : "begin",
//        "echar de menos" : "miss",
//        "echar un carta al correo" : "mail a letter",
//        "echar con sueno" : "sleep",
//        "echar de ver" : "take notice",
//        "echar por alto" : "exaggerate"
//    ]
//    
//    let idiomPonerDictionary = [
//        "ponerse" : "become",
//        "ponerse enfermo" : "become sick",
//        "poner la mesa" : "set the table",
//        "ponerse en pie" : "stand",
//        "ponerse a" : "begin"
//    ]
//    
//    /*
//     é
//     É
//     á
//     ó
//     í
//     üú
//     ñ
//     ç
//     ß
//     */
//    let idiomHacerDictionary = [
//        "hacer daño a" : "harm",
//        "hacer caso de" : "pay attention to",
//        "hacer el papel de" : "play the part of",
//        "hacer el favor de infinitivo" : "please infinitive",
//        "hacer falta" : "need",
//        "hacer una pregunta" : "ask a question",
//        "hacer una visita" : "visit",
//        "hacer una viaje" : "make a trip",
//        "hacerse tarde" : "be getting late",
//        "hacer cargo de" : "take charge of"
//    ]
//    
//    let starterDictionary =  [
//        "hablar" : "talk",
//        "comer" : "eat",
//        "vivir" : "live"
//    ]
//    
//    let regularDictionary1 = [
//        "aburrir" : "bore",
//        "cambiar" : "change",
//        "necesitar" : "need",
//        "ocurrir" : "happen",
//        "permitir" : "permit",
//        "recibir" : "receive",
//        "terminar" : "finish",
//        "resultar" : "turn out to be",
//        "presentar" : "present",
//        "crear" : "create",
//        "considerar" : "consider",
//        "pasar" : "pass time",
//        "deber" : "must",
//        "quedar" : "stay",
//        "hablar" : "speak",
//        "llevar" : "carry",
//        "vivir" : "live",
//        "comer" : "eat",
//        "dejar" : "leave",
//        "llamar" : "call",
//        "tomar" : "take",
//        "tratar " : "handle",
//        "mirar" : "watch",
//        "esperar" : "wait for",
//        "existir" : "exist",
//        "entrar " : "enter",
//        "trabajar" : "work",
//        
//        "acabar" : "begin",
//        "ganar" : "win",
//        "formar" : "form",
//        "partir" : "part",
//        "aceptar" : "accept",
//        "comprender" : "understand",
//        "lograr" : "obtain",
//        "preguntar" : "ask",
//        "estudiar" : "study",
//        "correr" : "run",
//        "ayudar" : "help",
//        "gustar" : "please",
//        "escuchar" : "listen",
//        "cumplir" : "fulfil",
//        "levantar" : "lift",
//        "intentar" : "attempt",
//        "usar" : "use",
//        "decidir" : "decide",
//        "olvidar" : "forget",
//        "ocupar" : "occupy",
//        "suceder" : "succeed",
//        "fijar" : "fix",
//        "aprender" : "learn",
//        "comprar" : "buy"
//    ]
//    
//    
//    let passiveVerbDictionary = [
//        "aburrir" : "bore",
//        "agradar" : "please",
//        "alegrar" : "gladden",
//        "apasionar" : "love",
//        "apetecer" : "feel like",
//        "atraer" : "attract",
//        "bastar" : "be enough",
//        "caber" : "fit",
//        "convenir" : "be better for",
//        "corresponder" : "be responsible for",
//        "costar" : "cost",
//        "disgustar" : "disgust",
//        "doler" : "hurt",
//        "encantar" : "delight",
//        "extrañar" : "surprise",
//        "faltar" : "be lacking",
//        "fascinar" : "fascinate",
//        "fastidiar" : "annoy",
//        "gustar" : "please",
//        "hacer falta" : "be missed",
//        "importar" : "matter",
//        "interesar" : "interest",
//        "molestar" : "bother",
//        "parecer" : "seem",
//        "picar" : "itch",
//        "preocupar" : "worry",
//        "quedar" : "remain",
//        "repugnar" : "disgust",
//        "sobrar" : "be left over",
//        "tocar" : "be responsible for"
//    ]
//    
//    
//    
//}
//
//
