//
//  ZikrMock.swift
//  ZikrCounter
//
//  Created by Daulet Ashikbayev on 07.01.2023.
//

import Foundation
import SwiftUI

enum ZikrMock {
    static var zikr1: Zikr {
        let zikr = Zikr()
        zikr.title = "Allahu Akbar"
        zikr.current = 0
        zikr.target = 33
        zikr.total = 0
        zikr.arabic = "الله أكبر"
        zikr.pronunciation = "Allahu Akbar"
        zikr.translation = "Allah is the greatest"
        zikr.hadith = "Әбу Һурайрадан (р.а.) жеткен Мүслімдегі риуаятта Алла елшісі былай дейді: «Кім де кім әрбір намаздан кейін 33 рет «Сұбханаллаһ», 33 рет «Алхамдулиллаһ», 33 рет «Аллаһу әкбар» десе, бәрін қосқанда тоқсан тоғыз болады, ал жүзіншісінде «Лә иләәһа иллаллаһу уахдаһу лә шариика ләһ, ләһул-мулку уә ләһулхамду уа һуа алаа кулли шаийн қадиир», деп, айтса, теңіз толқынының көбігіндей күнәсі болса да, кешіріледі»"
        return zikr
    }
    
    static var zikr2: Zikr {
        let zikr = Zikr()
        zikr.title = "Alhamdulillah"
        zikr.current = 0
        zikr.target = 33
        zikr.total = 0
        zikr.arabic = "اَلْحَمْدُ لِلّٰهِ‎"
        zikr.pronunciation = "Alhamdulillah"
        zikr.translation = "Praise be to Allah"
        zikr.hadith = "Әбу Һурайрадан (р.а.) жеткен Мүслімдегі риуаятта Алла елшісі былай дейді: «Кім де кім әрбір намаздан кейін 33 рет «Сұбханаллаһ», 33 рет «Алхамдулиллаһ», 33 рет «Аллаһу әкбар» десе, бәрін қосқанда тоқсан тоғыз болады, ал жүзіншісінде «Лә иләәһа иллаллаһу уахдаһу лә шариика ләһ, ләһул-мулку уә ләһулхамду уа һуа алаа кулли шаийн қадиир», деп, айтса, теңіз толқынының көбігіндей күнәсі болса да, кешіріледі»"
        zikr.colors = ColorGradients.blueblack.rawValue
        return zikr
    }
    
    static var zikr3: Zikr {
        let zikr = Zikr()
        zikr.title = "Subhanallah"
        zikr.current = 0
        zikr.target = 33
        zikr.total = 0
        zikr.arabic = "سُبْحَانَ ٱللَّٰهِ"
        zikr.pronunciation = "Subhanallah"
        zikr.translation = "Glory be to Allah"
        zikr.hadith = "Әбу Һурайрадан (р.а.) жеткен Мүслімдегі риуаятта Алла елшісі былай дейді: «Кім де кім әрбір намаздан кейін 33 рет «Сұбханаллаһ», 33 рет «Алхамдулиллаһ», 33 рет «Аллаһу әкбар» десе, бәрін қосқанда тоқсан тоғыз болады, ал жүзіншісінде «Лә иләәһа иллаллаһу уахдаһу лә шариика ләһ, ләһул-мулку уә ләһулхамду уа һуа алаа кулли шаийн қадиир», деп, айтса, теңіз толқынының көбігіндей күнәсі болса да, кешіріледі»"
        zikr.colors = ColorGradients.greenblack.rawValue
        return zikr
    }
    
    static var zikr4: Zikr {
        let zikr = Zikr()
        zikr.title = "La ilaha illallahu wahdahu la sharika lah"
        zikr.current = 0
        zikr.target = 100
        zikr.total = 0
        zikr.arabic = "لاَ إِلَهَ إِلاَّ اللَّهُ وَحْدَهُ لاَ شَرِيكَ لَهُ، لَهُ الْمُلْكُ، وَلَهُ الْحَمْدُ، وَهُوَ عَلَى كُلِّ شَىْءٍ قَدِيرٌ‏"
        zikr.pronunciation = "La ilaha illallahu wahdahu la sharika lahu lahul mulku wa lahul hamdu wa huwa ala kulli shay in qadeer"
        zikr.translation = "There is no god but Allah, the One, having no partner with Him. Sovereignty belongs to Him and all the praise is due to Him, and He is Potent over everything"
        zikr.hadith = "Әбу Һурайра (р.а.) риуаят еткен хадисте: «Кімде-кім: «Лә иләһә иллә Аллаһу, уахдаһу лә шәрикә ләһ, ләһул-мулку уә ләһул-хамду, уә һуә ъәлә кулли шәйин Қодир»,-деп күніне жүз рет айтса, он құлды азат еткенмен тең болады. Және де оған жүз сауап жазылып, жүз жамандығы өшіріледі. Және (дұғасы) сол күні кеш батқанша шайтаннан қорған болмақ. Ешкім бұдан абзал сөз айта алмайды. Тек одан көбірек айтқан адам болмаса»,-деген. (Бұхари, Муслим)"
        zikr.colors = ColorGradients.instaGrad.rawValue
        return zikr
    }
    
    static var salawat: Zikr {
        let zikr = Zikr()
        zikr.title = "Salawat"
        zikr.current = 0
        zikr.target = 100
        zikr.total = 0
        zikr.arabic = "أللهُمَّ صَلِّ علىَ مُحَمَّدٍ وَ علَى آلِ مُحمدٍ"
        zikr.pronunciation = "Allahumma salli 'alaa muhammadin wa 'alaa aali muhammad"
        zikr.translation = "Уа, Алла! Мұхаммедке және оның әулетіне салауат жолдай гөр"
        zikr.hadith = "Ардақты Пайғамбарымыз (оған Алланың салауаты мен сәлемі болсын): «Кім маған бір салауат айтса, Алла Тағала оған он салауат айтады», – деген (имам Муслим)."
        zikr.colors = ColorGradients.tealBlack.rawValue
        return zikr
    }
    
    static var defaultZikrProvider = [
        zikr1, zikr2, zikr3, zikr4, salawat
    ]
}
