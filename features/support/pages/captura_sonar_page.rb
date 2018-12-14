class CapturaSonar < SitePrism::Page

    def bugs
        find('div.overview-card:nth-child(1) > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > a:nth-child(1) > span:nth-child(1)').text
    end

    def code_smells
        find('#overview-code-smells > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > a:nth-child(1) > span:nth-child(1)').text
    end

    def cobertura
        find('.js-overview-main-coverage').text
    end

    def vunerabilidade
        find('div.overview-card:nth-child(1) > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > div:nth-child(1) > div:nth-child(2) > a:nth-child(1) > span:nth-child(1)').text
    end

    def duplicacoes
        find('div.overview-card:nth-child(4) > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > div:nth-child(1) > a:nth-child(1)').text
    end

    def navegar(url)
        visit url
    end

    def loading(url, sistema)
        navegar url
        bug = bugs
        vuneravel = vunerabilidade
        codes = code_smells
        cober = cobertura
        dupli = duplicacoes

        return "#{sistema};#{bug};#{vuneravel};#{codes};#{cober};#{dupli}"  
    end
    
end 