class Tools

    def salvar_dados(file, dados)
        local_file = open(file, "w")
        local_file.write(dados)    
        local_file.close
    end

    def leitura
        File.open(file, 'r') do |ler|
            while novaLinha = ler.gets
              @protocolo = novaLinha
            end
        end
        numero = @protocolo.split(":")
        @autorizacao = numero[1]
    end
end