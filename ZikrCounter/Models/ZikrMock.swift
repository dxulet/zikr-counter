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
        zikr.arabic = "اللّٰهُ أَكْبَر"
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
        zikr.target = 33
        zikr.arabic = "سُـبْحانَ الله"
        zikr.pronunciation = "Subhanallah"
        zikr.translation = "Glory be to Allah"
        zikr.hadith = "Әбу Һурайрадан (р.а.) жеткен Мүслімдегі риуаятта Алла елшісі былай дейді: «Кім де кім әрбір намаздан кейін 33 рет «Сұбханаллаһ», 33 рет «Алхамдулиллаһ», 33 рет «Аллаһу әкбар» десе, бәрін қосқанда тоқсан тоғыз болады, ал жүзіншісінде «Лә иләәһа иллаллаһу уахдаһу лә шариика ләһ, ләһул-мулку уә ләһулхамду уа һуа алаа кулли шаийн қадиир», деп, айтса, теңіз толқынының көбігіндей күнәсі болса да, кешіріледі»"
        zikr.colors = ColorGradients.greenblack.rawValue
        return zikr
    }
    
    static var zikr4: Zikr {
        let zikr = Zikr()
        zikr.title = "La ilaha illallahu wahdahu la sharika lah"
        zikr.target = 100
        zikr.arabic = "لاَ إِلَهَ إِلاَّ اللَّهُ وَحْدَهُ لاَ شَرِيكَ لَهُ، لَهُ الْمُلْكُ، وَلَهُ الْحَمْدُ، وَهُوَ عَلَى كُلِّ شَىْءٍ قَدِيرٌ‏"
        zikr.pronunciation = "La ilaha illallahu wahdahu la sharika lahu lahul mulku wa lahul hamdu wa huwa ala kulli shay in qadeer"
        zikr.translation = "There is no god but Allah, the One, having no partner with Him. Sovereignty belongs to Him and all the praise is due to Him, and He is Potent over everything"
        zikr.hadith = "Әбу Һурайра (р.а.) риуаят еткен хадисте: «Кімде-кім: «Лә иләһә иллә Аллаһу, уахдаһу лә шәрикә ләһ, ләһул-мулку уә ләһул-хамду, уә һуә ъәлә кулли шәйин Қодир»,-деп күніне жүз рет айтса, он құлды азат еткенмен тең болады. Және де оған жүз сауап жазылып, жүз жамандығы өшіріледі. Және (дұғасы) сол күні кеш батқанша шайтаннан қорған болмақ. Ешкім бұдан абзал сөз айта алмайды. Тек одан көбірек айтқан адам болмаса»,-деген. (Бұхари, Муслим)"
        zikr.colors = ColorGradients.instaGrad.rawValue
        return zikr
    }
    
    static var kalimah: Zikr {
        let zikr = Zikr()
        zikr.title = "La ilaha illallah"
        zikr.target = 33
        zikr.arabic = "لاَ إِلَهَ إِلاَّ اللَّهُ"
        zikr.pronunciation = "La ilaha illallah"
        zikr.translation = "There is none worthy of worship except Allah"
        zikr.hadith = "On the virtue of those who praise Allah (سُبْحَٰنَهُۥ وَتَعَٰلَىٰ). This dhikr also affirms Allah's oneness, a concept known as Tawhid, a central tenet of Islam. Jabir bin 'Abdullah said: \"I heard the Messenger of Allah (ﷺ) say: 'The best of remembrance is La ilaha illallah (None has the right to be worshiped but Allah), and the best of supplication is Al-Hamdu Lillah (praise is to Allah).'\""
        zikr.colors = ColorGradients.zikrColor.rawValue
        return zikr
    }
    
    static var istighfar: Zikr {
        let zikr = Zikr()
        zikr.title = "Astaghfirullah"
        zikr.target = 33
        zikr.arabic = "أستغفر الله"
        zikr.pronunciation = "Astaghfirullah"
        zikr.translation = "I seek forgiveness from Allah."
        zikr.hadith = "Imam Al-Auza'i (one of the subnarrators) of this Hadith was asked: \"How forgiveness should be sought?\" He replied: \"I say: Astaghfirullah, Astaghfirullah (I seek forgiveness from Allah. I seek forgiveness from Allah).\" (Sahih al-Bukhari 6405)"
        return zikr
    }
    
    static var lahawla: Zikr {
        let zikr = Zikr()
        zikr.title = "La hawla wa la quwwata illa billah"
        zikr.target = 33
        zikr.arabic = "لاَ حَوْلَ وَلاَ قُوَّةَ إِلاَّ بِاللَّهِ"
        zikr.pronunciation = "La hawla wa la quwwata illa billah"
        zikr.translation = "There is no power and no strength except with Allah"
        zikr.hadith = "It was narrated that Hazim bin Harmalah said: \"I passed by the Prophet (saas) and he said to me: 'O Hazim, say often: \"La hawla wa la quwwata illa billah (there is no power and no strength except with Allah),\" for it is one of the treasures of Paradise.'\""
        return zikr
    }
    
    static var salawat: Zikr {
        let zikr = Zikr()
        zikr.title = "Salawat"
        zikr.target = 100
        zikr.arabic = "أللهُمَّ صَلِّ علىَ مُحَمَّدٍ وَ علَى آلِ مُحمدٍ"
        zikr.pronunciation = "Allahumma salli 'alaa muhammadin wa 'alaa aali muhammad"
        zikr.translation = "Уа, Алла! Мұхаммедке және оның әулетіне салауат жолдай гөр"
        zikr.hadith = "Ардақты Пайғамбарымыз (оған Алланың салауаты мен сәлемі болсын): «Кім маған бір салауат айтса, Алла Тағала оған он салауат айтады», – деген (имам Муслим)."
        zikr.colors = ColorGradients.tealBlack.rawValue
        return zikr
    }
    
    static var gloriousAllah: Zikr {
        let zikr = Zikr()
        zikr.title = "Subhan-Allah, wal-hamdu-lillah, wa la ilaha illallah, wa Allahu Akbar"
        zikr.target = 33
        zikr.arabic = "سُبْحَانَ اللَّهِ وَالْحَمْدُ لِلَّهِ وَلاَ إِلَهَ إِلاَّ اللَّهُ وَاللَّهُ أَكْبَرُ"
        zikr.pronunciation = "Subhan-Allah, wal-hamdu-lillah, wa la ilaha illallah, wa Allahu Akbar"
        zikr.translation = "Glory is to Allah, praise is to Allah, none has the right to be worshiped but Allah and Allah is the Most Great."
        zikr.hadith = "It was narrated from Abu Hurairah that: the Messenger of Allah (ﷺ) passed by him when he was planting a plant, and said: \"O Abu Hurairah, what are you planting?\" I said: \"A plant for me.\" He said: \"Shall I not tell you of a plant that is better than this?\" He said: \"Of course, O Messenger of Allah.\" He said: \"Say: 'Subhan-Allah, wal-hamdu-lillah, wa la ilaha illallah, wa Allahu Akbar (Glory is to Allah, praise is to Allah, none has the right to be worshiped but Allah and Allah is the Most Great.)' For each one a tree will be planted for you in Paradise.\""
        return zikr
    }
    
    static var defaultZikrProvider = [
        zikr1, zikr2, zikr3, zikr4, salawat, kalimah, istighfar, lahawla, gloriousAllah
    ]
}
