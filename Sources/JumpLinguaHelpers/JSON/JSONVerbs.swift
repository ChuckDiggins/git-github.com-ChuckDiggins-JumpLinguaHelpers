//
//  JSONTest.swift
//  ContextFree
//
//  Created by Charles Diggins on 4/27/21.
//

import UIKit

public struct JsonVerb: Codable, CustomStringConvertible {
    var english: String
    var french: String
    var spanish: String
    var transitivity: VerbTransitivity
    var verbType: String  //"RTA"
    
    public var description: String {
        return "\(self.spanish) \(self.english) \(self.french)"
    }
    
    public init(spanish: String, english: String, french: String, transitivity: VerbTransitivity, verbType : String){
        self.spanish = spanish
        self.english = english
        self.french = french
        self.transitivity = transitivity
        self.verbType = verbType
    }
    
    //if intransitive, then no object likes
    
    public init(spanish: String, english: String, french: String){
        self.spanish = spanish
        self.english = english
        self.french = french
        self.verbType = "N"
        self.transitivity = .intransitive
    }
}

/*
 
 AGREE WITH - estar de acuerdo - "All women are bad drivers." "I don't agree with you."
 BE ABOUT TO - estar a punto de -I was about to leave the house when my friends arrived.
 BE BACK - regresar -I'm working late at the office tonight so I won't be back until 10.
 BE OUT OF - quedarse sin - We're out of eggs so we can't make a tortilla.
 BE OVER - terminarse - When the football match was over, we went to the pub.
 BE UP - estar levantado - "Phil isn't up yet: he's still in bed. Phone again in ten minutes."
 BLOW UP - estallar (una bomba) - The bomb blew up killing six people.
 BLOW UP - inflar - We blew up at least a hundred balloons for the Christmas party.
 BREAK DOWN - averiarse - My car broke down on the way to Motril.
 CALL BACK - volver a llamar - "I'm afraid the manager isn't here at the moment. Could you call back later?"
 CARRY ON - seguir. continuar - I'm sorry if I interrupted you. Please carry on.
 CARRY OUT - cumplir (una promesa) - The President carried out his promise to reduce taxation.
 CARRY OUT - llevar a cabo - The execution was carried out at seven o'clock in the morning.
 CLEAR UP - poner en orden - It took four hours to clear up after the party.
 */

var MichelleCarpeterVerbList3: [JsonVerb] = [
        
    ]

var myPhrasalVerbList: [JsonVerb] = [
    
    JsonVerb(spanish: "estar de acuerdo", english: "agree with",    french: "être d'accord avec", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "estar a punto de", english: "be about to",    french: "être sur le point de", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "regresar", english: "be back",    french: "être de retour", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "quedarse sin", english: "be out of",    french: "être hors de", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "terminarse", english: "be over",    french: "être fini", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "estar levantado", english: "be up",    french: "être levé", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "estallar", english: "blow up",    french: "faire exploser", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "inflar", english: "blow up",    french: "faire sauter", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "averiarse", english: "break down",    french: "abattre", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "seguir", english: "carry on",    french: "poursuivre", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "cumplir", english: "carry out",    french: "effectuer", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "agacharse", english: "bend over",    french: "se pencher", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "poner en orden", english: "blow out",    french: "souffler", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "irrumpir", english: "break in",    french: "entrer par effraction", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "aspirar", english: "breathe in",    french: "inspirer", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "retraer", english: "bring back",    french: "rapporter", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "volver a llamar", english: "call back",    french: "rentrer dans", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "aclarar", english: "clear up",    french: "rappeler", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "llamar a", english: "call on",    french: "redre visite à", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "preocuparse por", english: "care about",    french: "se soucier de", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "cuidar de", english: "care for",    french: "s'occuper de", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "registrarse en", english: "check in",    french: "se présenter à l'enregistrement", transitivity: .ambitransitive, verbType : "NAC"),
]

var myMultiLingualVerbListB: [JsonVerb] = [
    JsonVerb(spanish: "regresar", english: "be back",    french: "être de retour", transitivity: .ambitransitive, verbType : "NAC"),
    
    JsonVerb(spanish: "registrarse en", english: "check in",    french: "se présenter à l'enregistrement", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "cuidar de", english: "care for",    french: "s'occuper de", transitivity: .ambitransitive, verbType : "NAC"),
    ]

var myMultiLingualVerbListSingle: [JsonVerb] = [
    JsonVerb(spanish: "abrir", english: "open",        french: "ouvrir",transitivity: .transitive, verbType : "N"),
    ]

var simpleVerbList: [JsonVerb] = [
    JsonVerb(spanish: "comer", english: "eat", french: "manger",transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "beber", english: "drink", french: "boire",transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "abolir", english: "abolish",    french: "abolir", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "acabar", english: "begin",      french: "commencer", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "aceptar", english: "accept",    french: "accepter", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "admitir", english: "admit",    french: "admettre", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "alcanzar", english: "reach",    french: "atteindre", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "andar", english: "walk", french: "promener"),
    JsonVerb(spanish: "estar", english: "be",    french: "être", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "comenzar", english: "begin",    french: "commencer", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "comprar", english: "buy",    french: "acheter", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "conocer", english: "know",    french: "connaître", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "decir", english: "say",   french: "dire", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "dejar", english: "leave",    french: "partir", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "encontrar", english: "find",    french: "trouver", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "escribir", english: "write",    french: "écrire", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "esperar", english: "wait",    french: "attendre", transitivity: .intransitive, verbType : "N"),
    JsonVerb(spanish: "morir", english: "die",   french: "mourir", transitivity: .intransitive, verbType : "NI"),
    JsonVerb(spanish: "mostrar", english: "show",    french: "montrer", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "permitir", english: "permit",    french: "permettre", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "pedir", english: "ask",    french: "demander", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "querer", english: "want",    french: "vouloir", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "quitar", english: "remove",    french: "supprimer", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "realizar", english: "realize",    french: "réaliser", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "robar", english: "steal",    french: "voler", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "saber", english: "know",    french: "savoir", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "sentarse", english: "sit down",  french: "s'asseoir", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "servir", english: "serve",    french: "servir", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "suponer", english: "suppose",    french: "supposer", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "tener", english: "have", french: "avoir", transitivity: .transitive, verbType : "M"),
    JsonVerb(spanish: "traer", english: "bring",    french: "apporter", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "vivir", english: "live",   french: "habiter", transitivity: .intransitive, verbType : "NI"),
    

]
                     
    var myMasterVerbList: [JsonVerb] = [
    
    JsonVerb(spanish: "abolir", english: "abolish",    french: "abolir", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "abrir", english: "open",        french: "ouvrir",transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "acabar", english: "begin",      french: "commencer", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "aclarar", english: "clear up",    french: "rappeler", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "acordarse", english: "remember",    french: "se souvenir", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "actuar", english: "act",      french: "agir", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "aceptar", english: "accept",    french: "accepter", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "adquirir", english: "acquire",    french: "acquérir", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "admitir", english: "admit",    french: "admettre", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "afeitarse", english: "shave",    french: "se raser", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "agacharse", english: "bend over",    french: "se pencher", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "ahincar", english: "perservere",    french: "conduire dans", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "airar", english: "anger",    french: "mettre en colère", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "andar", english: "walk", french: "promener"),
    JsonVerb(spanish: "asir", english: "seize", french: "asir", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "aspirar", english: "breathe in",    french: "inspirer", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "aullar", english: "yell", french: "hurler"),
    JsonVerb(spanish: "avergonzar", english: "be ashamed", french: "embarrasser", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "averiarse", english: "break down",    french: "abattre", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "averiguar", english: "find out", french: "trouver", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "beber", english: "drink", french: "boire",transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "bruñir", english: "polish", french: "polir", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "buscar", english: "look for",    french: "chercher", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "caber", english: "fit", french: "s'adapter", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "caer", english: "fall", french: "tomber"),
    JsonVerb(spanish: "cambiar", english: "change",    french: "changer", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "cazar", english: "hunt", french: "chasser", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "cerrar", english: "close", french: "fermer",transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "cocer", english: "cook", french: "cuisiner",transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "coger", english: "catch", french: "prendre",transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "colgar", english: "hang", french: "raccrocher",transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "comenzar", english: "begin",    french: "commencer", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "comer", english: "eat", french: "manger",transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "comprar", english: "buy",    french: "acheter", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "conocer", english: "know",    french: "connaître", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "construir", english: "build",    french: "construire", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "considerar", english: "consider",    french: "considérer", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "contar", english: "tell",    french: "raconter", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "creer", english: "believe",    french: "croire", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "cumplir", english: "carry out",    french: "effectuer", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "cuidar de", english: "care for",    french: "s'occuper de", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "dar", english: "give",    french: "donner", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "decir", english: "say",   french: "dire", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "defender", english: "defend", french: "défendre",transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "dejar", english: "leave",    french: "partir", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "delinquir", english: "commit a crime", french: "offenser",transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "desosar", english: "bone", french: "délier",transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "discernir", english: "discern",    french: "discerner", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "dirigir", english: "manage",    french: "mener", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "distinguir", english: "distinguish",    french: "distinguer", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "dormir", english: "sleep",    french: "dormir"),
    JsonVerb(spanish: "dormirse", english: "fall asleep",    french: "s'endormir"),
    JsonVerb(spanish: "empezar", english: "begin",    french: "commencer", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "encontrar", english: "find",    french: "trouver", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "enraizar", english: "take root",    french: "rooter", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "elegir", english: "elect",    french: "choisir", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "erguir", english: "erect",    french: "ériger", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "erguirse", english: "straighten",    french: "redresser", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "errar", english: "err",    french: "se tromper", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "escribir", english: "write",    french: "écrire", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "esperar", english: "wait",    french: "attendre", transitivity: .intransitive, verbType : "N"),
    JsonVerb(spanish: "estallar", english: "blow up",    french: "faire exploser", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "estar", english: "be",    french: "être", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "estudiar", english: "study",    french: "etudier", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "forzar", english: "force",    french: "obliger", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "guiar", english: "guide", french: "guider",transitivity: .transitive, verbType : "B"),
    JsonVerb(spanish: "gustar", english: "be pleasing to", french: "aimer",transitivity: .transitive, verbType : "B"),
    JsonVerb(spanish: "haber", english: "have",    french: "avoir", transitivity: .transitive, verbType : "NA"),
    JsonVerb(spanish: "hacer", english: "make",    french: "faire", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "inflar", english: "blow up",    french: "faire sauter", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "influir", english: "influence",    french: "influencer", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "ir", english: "go",    french: "aller", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "irse", english: "go away",    french: "partir", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "irrumpir", english: "break in",    french: "entrer par effraction", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "jugar", english: "play",    french: "jouer", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "llegar", english: "arrive",    french: "arriver", transitivity: .intransitive, verbType : "N"),
    JsonVerb(spanish: "lucir", english: "shine",    french: "luire", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "mandar", english: "send",    french: "envoyer", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "maldecir", english: "curse",    french: "maudire", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "mecer", english: "swing",    french: "bouger", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "morir", english: "die",   french: "mourir", transitivity: .intransitive, verbType : "NI"),
    JsonVerb(spanish: "mostrar", english: "show",    french: "montrer", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "mover", english: "move",    french: "déménager", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "oír", english: "hear",    french: "écouter", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "oler", english: "smell",    french: "sentir", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "pagar", english: "pay",    french: "payer", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "parecer", english: "seem",    french: "sembler", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "permitir", english: "permit",    french: "permettre", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "pedir", english: "ask",    french: "demander", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "pensar", english: "think",  french: "penser", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "placer", english: "gratify",    french: "plaisir", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "poder", english: "can",    french: "pouvoir", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "podrir", english: "decay",    french: "pourrir", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "poner", english: "put",    french: "mettre", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "poseer", english: "own",    french: "posséder", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "predecir", english: "fortell",    french: "prédire", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "producir", english: "produce",    french: "produire", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "prohibir", english: "prohibit",    french: "interdire", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "querer", english: "want",    french: "vouloir", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "quitar", english: "remove",    french: "supprimer", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "raer", english: "scrape",    french: "gratter", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "realizar", english: "realize",    french: "réaliser", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "regar", english: "irrigate",    french: "irriguer", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "regresar", english: "be back",    french: "être de retour", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "reír", english: "laugh",    french: "rire", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "reñir", english: "quarrel",    french: "disputer", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "retraer", english: "bring back",    french: "rapporter", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "robar", english: "steal",    french: "voler", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "roer", english: "gnaw",    french: "ronger", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "saber", english: "know",    french: "savoir", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "realizar", english: "realize",    french: "réaliser", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "sacar", english: "take out",    french: "enlever", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "salir", english: "leave",    french: "sortir", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "satisfacer", english: "satisfy",    french: "satisfaire", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "seguir", english: "carry on",    french: "poursuivre", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "sentarse", english: "sit down",  french: "s'asseoir", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "sentir", english: "feel",    french: "sentir", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "ser", english: "be",    french: "avoir", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "servir", english: "serve",    french: "servir", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "suponer", english: "suppose",    french: "supposer", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "suspender", english: "delay",  french: "surseoir", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "tañer", english: "strum", french: "sonner", transitivity: .transitive, verbType : "M"),
    JsonVerb(spanish: "tener", english: "have", french: "avoir", transitivity: .transitive, verbType : "M"),
    JsonVerb(spanish: "tener que", english: "have to", french: "tenir à ce que", transitivity: .transitive, verbType : "M"),
    JsonVerb(spanish: "terminarse", english: "be over",    french: "être fini", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "traer", english: "bring",    french: "apporter", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "trocar", english: "trade",    french: "troquer", transitivity: .transitive, verbType : "N"),
    JsonVerb(spanish: "ser", english: "be",    french: "avoir", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "valer", english: "be worth",    french: "valoir", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "venir", english: "come",    french: "venir", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "ver", english: "see",   french: "regarder", transitivity: .intransitive, verbType : "NI"),
    JsonVerb(spanish: "vivir", english: "live",   french: "habiter", transitivity: .intransitive, verbType : "NI"),
    JsonVerb(spanish: "volver", english: "return",   french: "revenir", transitivity: .intransitive, verbType : "NI"),
    JsonVerb(spanish: "yacer", english: "lie",   french: "mentir", transitivity: .intransitive, verbType : "NI"),
    JsonVerb(spanish: "zurcir", english: "mend",   french: "réparer", transitivity: .intransitive, verbType : "NI"),
   
    JsonVerb(spanish: "preocuparse por", english: "care about",    french: "se soucier de", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "registrarse en", english: "check in",    french: "se présenter à l'enregistrement", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "estar a punto de", english: "be about to",    french: "être sur le point de", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "volver a llamar", english: "call back",    french: "rentrer dans", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "estar de acuerdo", english: "agree with",    french: "être d'accord avec", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "estar a punto de", english: "be about to",    french: "être sur le point de", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "quedarse sin", english: "be out of",    french: "être hors de", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "estar levantado", english: "be up",    french: "être levé", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "poner en orden", english: "blow out",    french: "souffler", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "volver a llamar", english: "call back",    french: "rentrer dans", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "llamar a", english: "call on",    french: "redre visite à", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "preocuparse por", english: "care about",    french: "se soucier de", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "registrarse en", english: "check in",    french: "se présenter à l'enregistrement", transitivity: .ambitransitive, verbType : "NAC"),

]


//create json from
public struct JsonVerbManager {
    var myVerbList = [JsonVerb]()
    
    public func printVerbs(){
        print(myVerbList)
    }
    
    public func printOne(jv: JsonVerb){
        print(jv)
    }
    
//    func encodeInternalVerbs(total: Int){
//        for v in myMultiLingualVerbListA{
//            myVerbList.append(v)
//            if myVerbList.count >= total {break}
//        }
//        encodeVerbs()
//    }
    
    mutating public func encodeInternalVerbs(collectionType: JsonCollectionTypes, total: Int){
        clearWords()
        var wordList = [JsonVerb]()
        switch collectionType {
        case .Master:
            wordList = myMasterVerbList
        case .Simple:
            wordList = simpleVerbList
        case .Irregular:
            wordList = simpleVerbList
        }
        for v in wordList {
            myVerbList.append(v)
            if myVerbList.count >= total {break}
        }
        encodeVerbs()
    }
    
    mutating public func clearWords(){
        myVerbList.removeAll()
    }
    
    public func getLastVerb()->JsonVerb{
        return myVerbList.last!
    }
    
    mutating public func encodeVerbs(){
        //encode to JSON
        let encoder = JSONEncoder()
        if let encodedVerbs = try? encoder.encode(myVerbList){
            //print(String(data: encodedVerbs, encoding: .utf8)!)
            try? encodedVerbs.write(to: getURL(), options: .noFileProtection)
        }
    }
    
    mutating public func decodeVerbs(){
        let decoder = JSONDecoder()
        if let data = try? Data.init(contentsOf: getURL()){
            if let decodedVerbs = try? decoder.decode([JsonVerb].self, from: data){
                myVerbList = decodedVerbs
            }
        }
    }
    mutating public func appendVerb(verb: JsonVerb){
        var appendThis = true
        for i in 0..<myVerbList.count {
            let v = myVerbList[i]
            if v.spanish == verb.spanish && v.french == verb.french {
                myVerbList.remove(at: i)
                myVerbList.insert(verb, at:i)
                appendThis = false
                break
            }
        }
        if ( appendThis ){myVerbList.append(verb)}
        encodeVerbs()
    }
    
    mutating public func clearVerbs(){
        myVerbList.removeAll()
    }
    
    public func getVerbAt(index: Int)->JsonVerb{
        if index > myVerbList.count-1 { return myVerbList[0] }
        return myVerbList[index]
    }
    
    public func getVerbCount()->Int{
        return myVerbList.count
    }
    
    public func getURL()->URL{
        let docsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return docsURL.appendingPathComponent("SPIFEMultiLingualVerbs").appendingPathExtension("json")
    }
    
}
