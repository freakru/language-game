(($) ->
    $.fn.shuffle = ->
        this.each =>
            items = $(this).children()
            if items.length
                return $(this).html($.shuffle(items))
            else
                return this
    
    $.shuffle = (arr) ->
        # From the end of the list to the beginning, pick element `i`.
        for i in [arr.length-1..1]
            # Choose random element `j` to the front of `i` to swap with.
            j = Math.floor Math.random() * (i + 1)
            # Swap `j` with `i`, using destructured assignment
            [arr[i], arr[j]] = [arr[j], arr[i]]
        # Return the shuffled array.
        arr

)(jQuery)

App = ->
    
    @languages = [
        ['aa','Afar']
        ['ab','Abkhaz']
        ['ae','Avestan']
        ['afa','Luganda']
        ['afa','Mawu']
        ['ak','Akan']
        ['akk','Akkadian']
        ['alg','Abenaki']
        ['alg','Algonquin']
        ['alg','Mohican']
        ['alg','Potawatomi']
        ['alg','Powhatan']
        ['am','Amharic']
        ['an','Aragonese']
        ['ang','Anglo']        
        ['ar','Darja']
        ['arw','Arawak']
        ['arc','Aramaic']
        ['arn','Mapundungun']
        ['art','Lojban']
        ['as','Assamese']
        ['ast','Asturian']
        ['at','Haiti']
        ['aus','Olkola']
        ['aus','Wagiman']
        ['aus','Warlpiri']
        ['av','Avar']
        ['ay','Aymara']
        ['az','Azerbaijani']
        ['ba','Bashkir']
        ['bai','Dschang']
        ['bas','Basaa']
        ['bat','Sudovian']
        ['btk','Batak']
        ['be','Belarusian']
        ['bem','Bemba']
        ['bg','Bulgarian']
        ['bh','Bihari']
        ['bi','Bislama']
        ['bm','Bambara']
        ['bn','Bengali']
        ['bnt','Bangi']
        ['bnt','Ila']
        ['bnt','Masaba']
        ['bnt','Ntomba']
        ['bo','Tibetan']
        ['br','Breton']
        ['ca','Catalan']
        ['ca','Valencian']
        ['cai','Ch']
        ['cai','Garifuna']
        ['cai','Guahibo']
        ['cai','Miskito']
        ['cai','Oluta']
        ['cai','Jatibonicu']
        ['cai','Zoque']
        ['car','Caribe']
        ['ce','Chechen']
        ['ceb','Cebuano']
        ['ch','Chamorro']
        ['cho','Choctaw']
        ['chk','Chuuk']
        ['chy','Cheyenne']
        ['co','Corsican']
        ['cop','Coptic']
        ['cpe','Afro-Seminole']
        ['cpe','Gullah']
        ['cpe','Jamaican']
        ['cpe','Port']
        ['cr','Cree']
        ['crp','Fanagolo']
        ['cu','Old']
        ['cv','Chuvash']
        ['cy','Welsh']
        ['da','Danish']
        ['de','German']
        ['del','Lenape']
        ['dua','Duala']
        ['dra','Brahui']
        ['dv','Divehi']
        ['dz','Dzongkha']
        ['ee','Ewe']
        ['efi','Efik']
        ['el','Griko']
        ['en','English']
        ['enm','Middle']
        ['eo','Esperanto']
        ['es','Spanish']
        ['et','Estonian']
        ['eu','Basque']
        ['fa','Persian']
        ['ff','Fula']
        ['fi','Finnish']
        ['fiu','Karelian']
        ['fiu','Veps']
        ['fj','Fijian']
        ['fo','Faroese']
        ['fon','Fon']
        ['fr','French']
        ['fro','Old']
        ['fur','Friulian']
        ['fy','Frisian']
        ['ga','Irish']
        ['gd','Scottish']
        ['gem','Alsatian']
        ['gem','Bavarian']
        ['gem','Cimbrian']
        ['gem','Kölsch']
        ['gem','Mennonite']
        ['gez','Ge']
        ['gl','Galician']
        ['gmh','Middle']
        ['gn','Guarani']
        ['gu','Gujarati']
        ['gv','Manx']
        ['ha','Hausa']
        ['hi','Hindi']
        ['hil','Hiligaynon']
        ['hmn','Hmong']
        ['ho','Hiri']
        ['hr','Croatian']
        ['hu','Hungarian']
        ['hy','Armenian']
        ['hz','Herero']
        ['ia','Interlingua']
        ['id','Indonesian']
        ['ie','Interlingue']
        ['ig','Igbo']
        ['ii','Sichuan']
        ['ik','Iñupiaq']
        ['ilo','Ilocano']
        ['inh','Ingush']
        ['io','Ido']
        ['ira','Dari']
        ['ira','Ishkashmi']
        ['iro','Mingo']
        ['iro','Onandaga']
        ['iro','Wyandot']
        ['is','Old']
        ['iu','Inuktitut']
        ['jpr','Judeo-Persian']
        ['jrb','Judeo-Arabic']
        ['ja','Japanese']
        ['jv','Javanese']
        ['ka','Georgian']
        ['kab','Kabyle']
        ['kg','Kongo']
        ['ki','Kikuyu']
        ['kj','Kwanyama']
        ['kk','Kazakh']
        ['kl','Greenlandic']
        ['kn','Kannada']
        ['ko','Korean']
        ['kos','Kosraean']
        ['kr','Kanuri']
        ['ks','Kashmiri']
        ['ku','Kurdish']
        ['kv','Komi']
        ['kw','Cornish']
        ['ky','Kirghiz']
        ['la','Latin']
        ['lad','Ladino']
        ['lb','Luxemburgish']
        ['lg','Ganda']
        ['li','Limburgan']
        ['ln','Lingala']
        ['lo','Lao']
        ['lol','Mongo-Nkundu']
        ['loz','Lozi']
        ['lt','Lithuanian']
        ['lu','Luba-Katanga']
        ['lv','Latvian']
        ['man','Mandinka']
        ['map','Bisaya']
        ['map','Carolinian']
        ['map','Marquesan']
        ['map','Mokilese']
        ['map','Ponapean']
        ['map','Rotuman']
        ['map','Roviana']
        ['map','Sa']
        ['map','Tarawan']
        ['map','Woleaian']
        ['mg','Malagasy']
        ['mh','Marshallese']
        ['mi','Maori']
        ['mic','Micmac']
        ['mis','Ainu']
        ['mis','Chukchi']
        ['mis','Etruscan']
        ['mis','Nganasan']
        ['mk','Macedonian']
        ['ml','Malayalam']
        ['mn','Mongolian']
        ['mno','Manobo']
        ['mo','Moldavian']
        ['mos','Mossi']
        ['mr','Marathi']
        ['ms','Malay']
        ['mt','Maltese']
        ['mus','Muskogee']
        ['my','Burmese']
        ['myn','Kekchi']
        ['na','Nauruan']
        ['nah','Náhuatl']
        ['nai','Alabama']
        ['nai','Chickasaw']
        ['nai','Chontal']
        ['nai','Comanche']
        ['nai','Hopi']
        ['nai','Koasati']
        ['nai','Nez']
        ['nai','Papago-Pima']
        ['nai','Seri']
        ['nai','Wintu']
        ['nd','North']
        ['nds','Old']
        ['ne','Nepali']
        ['ng','Ndonga']
        ['nic','Bobo']
        ['nic','Boko']
        ['nic','Buli']
        ['no','Norwegian']
        ['nv','Navajo']
        ['ny','Chichewa']
        ['oc','Occitan']
        ['oj','Ojibwa']
        ['oj','Ottawa']
        ['om','Oromo']
        ['or','Oriya']
        ['os','Ossetic']
        ['oto','Otomi']
        ['pa','Panjabi']
        ['paa','Ekari']
        ['pag','Pangasinan']
        ['pam','Pampangan']
        ['pap','Papiamentu']
        ['pau','Palauan']
        ['phi','Ivatan']
        ['phi','Magindanoan']
        ['phi','Maranao']
        ['pi','Pali']
        ['ps','Pashto']
        ['qu','Quechua']
        ['rap','Rapanui']
        ['rm','Raeto-Romance']
        ['rn','Rundi']
        ['ro','Romanian']
        ['roa','Ladin']
        ['roa','Ligurian']
        ['roa','Lombard']
        ['roa','Piedmontese']
        ['roa','Romagnolo']
        ['roa','Sicilian']
        ['roa','Veneto']
        ['rom','Romany']
        ['rw','Kinyarwanda']
        ['sa','Sanskrit']
        ['sai','Mayangna']
        ['sai','Nhengatu']
        ['sai','Paumarí']
        ['sco','Scots']
        ['sd','Sindhi']
        ['se','Kildi']
        ['se','Northern']
        ['sg','Sango']
        ['si','Sinhalese']
        ['sio','Lakota']
        ['sio','Siouan']
        ['sk','Slovak']
        ['sl','Slovene']
        ['sm','Samoan']
        ['sn','Shona']
        ['so','Somali']
        ['sr','Serbian']
        ['ss','Swati']
        ['su','Sundanese']
        ['ta','Tamil']
        ['te','Telugu']
        ['tg','Tajik']
        ['th','Thai']
        ['tk','Turkmen']
        ['tl','Tagalog']
        ['tli','Tlingit']
        ['tn','Tswana']
        ['to','Tonga']
        ['ts','Tsonga']
        ['tw','Twi']
        ['ty','Tahitian']
        ['ug','Uighur']
        ['uz','Uzbek']
        ['ve','Venda']
        ['wa','Walloon']
        ['wen','Upper']
        ['wo','Wolof']
        ['xh','Xhosa']
        ['yi','Yiddish']
        ['yo','Yoruba']
        ['ypk','Yu']
        ['za','Chuang']
        ['zap','Zapotec']
        ['zh','Chinese']
        ['zu','Zulu']
    ]

    @languages = [    
        ['bla','Blackfoot']
        ['bg','Bulgarian']
        ['bs','Bosnian']
        ['cs','Czech']
        ['el','Greek']
        ['en','English']
        ['haw','Hawaiian']
        ['he','Hebrew']
        ['is','Icelandic']
        ['it','Italian']
        ['km','Khmer']
        ['mn','Mongolian']
        ['nl','Dutch']
        ['pl','Polish']
        ['pt','Portuguese']
        ['ru','Russian']
        ['sa','Sanskrit']
        ['sq','Albanian']
        ['sv','Swedish']
        ['sw','Swahili']
        ['tg','Tajik']
        ['tr','Turkish']
        ['tt','Tatar']
        ['uk','Ukrainian']
        ['vi','Vietnamese']
        ['vo','Volapük']
    ]

    @sentences =
        bla: ['ᖽᔦᔭ ᖽ ᖽᐧᔈᒧᐧᖾᒉᖽ ᖳᒐᑊᖿ ᖹᒣᔦᖽᒧᐧᖹᖿᒣᖷᑊᖿ ᖿᑉᔦᐠᖷᑊᖿ ᖽ ᖲᒉᑊᖿ ᖽᑯᒣᖽᖷᑊᖿ ᖳᖹᔈᒣᖷ ᖽᐧᔈᒧᐧᖾᒉᖽ᙮ ᖱᒪᐟᓱᔪᐦ᙮ ᖱᖽᐧᑯᑊᒧᐧ ᖲᒍ ᖲᒧᐧᒪᒪᐟᔈᑯᒉ ᒍᖹ᙮']
        bg: ['Често столицата е център на дейности от много голямо значение за страната - политически, икономически, културни и други.']
        bs: ['U ovo doba (do 1463.) spadaju jezični spomenici koje, u različitim stepenima, oblicima i na različitim mjestima, bosanski jezik dijeli s hrvatskim i srpskim.', 'To, što veći dio tih jezičnih spomenika nije formalno integrisan u korpus bosanske pismenosti nije previše relevantno, jer je nijedan jezik ne nastaje niotkuda.']
        cs: ['Hlavní město představuje správní středisko a symbol určitého území, typicky státu nebo většího správního nebo samosprávného celku.']
        el: ['Η ελληνική υπήρξε στην αρχαιότητα η πιο διαδεδομένη γλώσσα στην Μεσόγειο και στην Νότια Ευρώπη κυρίως εξαιτίας του πλήθους των αποικιών που είχαν ιδρυθεί από τους Έλληνες στις ακτές της Μεσογείου και έφτασε να είναι η γλώσσα του εμπορίου ακόμα και μέχρι τα τέλη της Αλεξανδρινής περιόδου.', 'Η ελληνική σήμερα αποτελεί τη μητρική γλώσσα περίπου 12 εκατομμυρίων ανθρώπων, κυρίως στην Ελλάδα και την Κύπρο. Αποτελεί επίσης την μητρική γλώσσα αυτοχθόνων πληθυσμών στην Αλβανία, τη Βουλγαρία, την ΠΓΔΜ, την Ιταλία και την Τουρκία.']
        en: ['Three supporters taken to hospital and ten more injured in brawl at city café on Sunday night after allegedly being ‘set upon’ by Ukrainian group.']
        haw: ['Kākoʻo a paipai ka Hale Kuamoʻo i ka hoʻokumu ʻana i ka ʻōlelo, ʻo ia ka ʻōlelo kaiapuni o nā kula, ke aupuni a me nā ʻoihana like ʻole.']
        he: ['שפה ממשפחת השפות השמיות, הידועה כשפתו של העם היהודי. השפה הרשמית והעיקרית של מדינת ישראל.']
        is: ['Samskipti Norðurlandanna hafa, í aldanna rás, einkennst bæði af samstarfi og átökum.', 'Endalok Kalda stríðsins breyttu stöðunni að ýmsu leyti á Norðurlöndunum og nálægum svæðum.']
        it: ['Le testimonianze disponibili mostrano infatti marcate differenze tra le parlate delle diverse zone mentre manca un comune modello volgare di riferimento.', 'Dal greco sono entrati in italiano molti termini tecnici scientifici (come aritmia, pneumologia, nosocomio), politici e religiosi, questi ultimi dovuti alla diffusione della Vulgata.']
        km: ['ភាសាខ្មែរ ឬខេមរភាសា គឺជាភាសារបស់ ប្រជារាស្ត្រខ្មែរ ។ ភាសាសំស្ក្រឹត និងភាសាបាលីបាន​ជួយបង្កើតខេមរភាសា ព្រោះភាសាខ្មែរបានខ្ចីពាក្យច្រើនពីភាសាអស់នោះ។​ភាសាខ្មែរមានអក្សរក្រមវែងជាងគេនៅលើផែនដី។​ វាជាភាសាមួយដ៏ចំណាស់​ ដែលប្រហែលជាមានដើមកំណើតតាំងតែពី​ ២០០០ឆ្នាំមុនមកម៉្លេះ']
        mn: ['Дэлхийн хамгийн том хотууд нь заримдаа улсын нийслэл биш байдаг.']
        nl: ['Rond 1500 kwam er een streven op gang om een algemene schrijftaal te ontwikkelen die in ruimere gebieden bruikbaar kon zijn door verschillende regionale elementen in zich te verenigen.', 'De Friese en Saksische dialecten hebben op het vaste land het meest onder invloed ervan gestaan.']
        pl: ['Do najważniejszych wczesnych zmian należy palatalizacja indoeuropejska.', 'Niezmiernie popularna jest w tym okresie literatura polska zarówno w oryginale, jak i w transkrypcji na cyrylicę oraz tłumaczeniach na rosyjski.']
        pt: ['A flor é a estrutura reprodutora característica das plantas denominadas espermatófitas ou fanerogâmicas.']
        ru: ['Откровенно говоря, прежде я не особо задумывался о таком подходе.', 'Ведь обозреватели предпочитают выставлять яркость на максимум, что приводит к не совсем корректным сравнительным данным по смартфонам']
        sa: ['अवश्यं आगन्तव्य, न विस्मर्तव्यम्']
        sq: ['Neymar u bashkua me Santosin në vitin 2003, ai kaloi me sukses kategroinë e skaudrave të moshave dhe më pas u bashkua me skuadrën e parë.', 'Ai bëri debutimin e tij me Santosin në vitin 2009, dhe u votua si lojtari më i mirë i ri i kampionatit Paulista të vitit 2009.']
        sv: ['Unionens övergripande mål är enligt fördraget om Europeiska unionen att främja freden, unionens värden (såsom frihet, demokrati och jämlikhet) och folkens välfärd.', 'Unionen har som ambition att upprätta ett område med frihet, säkerhet och rättvisa utan inre gränser, en inre marknad med fri rörlighet för varor, personer, tjänster och kapital, en ekonomisk och monetär union med en gemensam valuta samt verka för sina värden runt om i världen, bland annat genom en gemensam utrikes- och säkerhetspolitik.']
        sw: ['Ni lugha ya taifa; ni lugha ya shule za msingi, lugha ya utawala serikalini na mahakamani; inatumika kote nchini, makanisani, misikitini, redioni, kwenye runinga na idadi kubwa ya magazeti.', 'Athira nyingi hutokea bila mpangilio pale ambako wasemaji wanapokea maneno mapya, wanaacha kutumia maneno mengine au hubadilisha kawaida ya matamshi au sarufi.']
        tg: ['Забони точикӣ диққати олимон ва нависандагони оламро ба худ ҷалб кардааст.', 'Ин забон ба хонаводаи забонҳои ҳинду-аврупоӣ дохил мешавад.']
        tr: ['İslamiyet’in yayılmasıyla burada Samani, Gazneli, Büyük Selçuklu Devleti ve Harzemşahlar gibi Türk devletlerinin hakimiyetleri görüldü.']
        tt: ['Бу китап. Бу китапта текстлар бар. Текстлар җөмләләрдән торалар.', 'Җөмләләр сузләрдән, ә сузләр хәрефләрдән торалар.']
        uk: ['Фізичні вправи в оздоровчих цілях використовувалися впродовж багатьох тисячоліть.', 'Найбільш ранні рукописи, в яких мовиться про лікувальну дію рухів, масажу, знайдені в Китаї.']
        vi: ['Phong cách và hình dạng nhà cửa tùy theo từng vùng và miền.']
        vo: ['In Suomiyän vöno feilan yunik älifom.', 'Do äbinos vob sevärik ad befeilön länedi neflukik, ai äbinom ye fredik.', 'In län at, kiöp pöp binon smalik, mens lifons soaliko ko oks it e ko nat.']

    @newGame = () ->
        @lives = 3
        @score = 0
        @updateStats()
        @newQuestion()
        return


    @newQuestion = () ->
        languages = @languages
        idx = Math.floor(Math.random() * languages.length)
        language = languages[idx]
        key = language[0]
        @correctAnswer = name = language[1]       

        text = @sentences[key][0]
    
        names = [name]
        while names.length < 3
            i = Math.floor(Math.random() * languages.length)
            continue if languages[i][1] in names
            names.push languages[i][1]
    
        for name, i in names
            $("#btn-#{i}").text name

        $('#guess-buttons').shuffle();
        $("#btn-0").data 'correctAnswer', true
    
        $('#language').text(text)

        $('#main').show()
        $('#wrong-guess, #right-guess, #game-over').hide()
        return

    @guess = (isCorrect) ->
        wikiLink = "<a href='http://en.wikipedia.org/wiki/#{@correctAnswer}_language' target='_blank'>#{@correctAnswer}</a>"
        $('.correct-answer').html(wikiLink)

        if !isCorrect
            @lives--
            return @gameOver() if @lives is 0 
            $('#main').hide()
            $('#wrong-guess').show()
        else
            @score += 100
            $('#main').hide()
            $('#right-guess').show()
        @updateStats()


    @gameOver = () ->
        $('#game-over').show();
        $('#main').hide();
        return false


    @updateStats = () ->
        $('#lives').text "Lives: #{@lives}"
        $('.score').text @score

    
    @run = () ->
        @newGame()

        $('body').on 'click', '.guess', (e) =>
            # e.currentTarget - avoid issue on using $(this) in coffe function
            isCorrect = $(e.currentTarget).data('correctAnswer')
            console.log isCorrect
            @guess isCorrect
            return

        $('.new-question').on 'click', (e) =>
            @newQuestion()
            return

        $('.new-game').on 'click', (e) =>
            @newGame()
            return
        return
    return

jQuery ($) ->
    new App().run()
    
