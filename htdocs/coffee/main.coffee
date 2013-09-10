App = ->
    @lives = 3
    @score = 0

    @languages = [
        {} = 'key': 'bg', 'name': 'Bulgarian', 'text': 'Често столицата е център на дейности от много голямо значение за страната - политически, икономически, културни и други.'
        {} = 'key': 'cs', 'name': 'Czech', 'text': 'Hlavní město představuje správní středisko a symbol určitého území, typicky státu nebo většího správního nebo samosprávného celku.'
        {} = 'key': 'en', 'name': 'English', 'text': 'Three supporters taken to hospital and ten more injured in brawl at city café on Sunday night after allegedly being ‘set upon’ by Ukrainian group.'
        {} = 'key': 'mn', 'name': 'Mongolian', 'text': 'Дэлхийн хамгийн том хотууд нь заримдаа улсын нийслэл биш байдаг.'
        {} = 'key': 'pt', 'name': 'Português', 'text': 'A flor é a estrutura reprodutora característica das plantas denominadas espermatófitas ou fanerogâmicas.'
    ]

    @newQuestion = () ->
        languages = @languages
        idx = Math.floor(Math.random() * languages.length)
        key = languages[idx].key
        name = languages[idx].name
        text = languages[idx].text
    
        names = [name]
        while names.length < 3
            i = Math.floor(Math.random() * languages.length)
            continue if languages[i].name in names
            names.push languages[i].name
    
        $("#btn-0").data 'correctAnswer', true
        for name, i in names
            $("#btn-#{i}").text name
    
        $('#language').text(text)



    @answer = (isCorrect) ->
        return @gameOver() if @lives is 0
        if !isCorrect
            @lives--
        else
            @score += 100
        @updateStats()
        @newQuestion()



    @gameOver = () ->
        console.log 'game over'
        return false



    @updateStats = () ->
        $('#lives').text "Lives: #{@lives}"
        $('#score').text "Score: #{@score}"


    
    @run = () ->
        @newQuestion()

        $('.answer').on 'click', (e) =>
            # e.currentTarget - avoid issue on using $(this) in coffe function
            isCorrect = $(e.currentTarget).data('correctAnswer')
            console.log isCorrect
            @answer isCorrect
            return
        return
    return

jQuery ($) ->
    new App().run()
    
