Dado("que gostaria de visualizar o sonar") do
    
    #setup miner
    miner_sonar = CapturaSonar.new
    url_miner_sonar = 'https://sistemas.dpf.gov.br/sonar/dashboard?id=br.gov.dpf%3Aminer-rest'
    miner_sistema = 'MINER-REST'

    #setup siscaer
    siscaer_sonar = CapturaSonar.new
    url_siscaer_sonar = 'https://sistemas.dpf.gov.br/sonar/dashboard?id=br.gov.dpf%3Asiscaer-batch'
    siscaer_sistema = 'SISCAER-BATCH'
    
    #setup siproquim
    siproquim_sonar = CapturaSonar.new
    url_siproquim_sonar = 'https://sistemas.dpf.gov.br/sonar/dashboard?id=br.gov.dpf%3Asiproquim-fiscalizacao-rest'
    siproquim_sistema = 'SIPROQUIM-FISCALIZACAO-REST'

    #setup siproquim offline
    siproquim_offline_sonar = CapturaSonar.new
    url_siproquim_offline_sonar = 'https://sistemas.dpf.gov.br/sonar/dashboard?id=br.gov.dpf%3Asiproquim-fiscalizacao-offline'
    siproquim_offline_sistema = 'SIPROQUIM-FISCALIZACAO-OFFLINE'

    #setup sittel rest
    sittel_sonar = CapturaSonar.new
    url_sittel_sonar = 'https://sistemas.dpf.gov.br/sonar/dashboard?id=br.gov.dpf%3Asittel-rest'
    sittel_sistema = 'SITTEL-REST' 

    #setup ferramentas
    salvar = Tools.new

    #executando a captura dos dados
    dados_miner = miner_sonar.loading url_miner_sonar, miner_sistema
    dados_siscaer = siscaer_sonar.loading url_siscaer_sonar, siscaer_sistema
    dados_siproquim = siproquim_sonar.loading url_siproquim_sonar, siproquim_sistema
    dados_siproquim_offline = siproquim_offline_sonar.loading url_siproquim_offline_sonar, siproquim_offline_sistema
    dados_sittel = sittel_sonar.loading url_sittel_sonar, sittel_sistema
 
    #salvando arquivo csv
    sonar = 'sonar.csv'
    info = "PROJETOS;BUGS;VULNERABILIDADES;CODE SMELLS;COBERTURA;DUPLICADOS\n#{dados_miner}\n#{dados_siscaer}\n#{dados_siproquim}\n#{dados_siproquim_offline}\n#{dados_sittel}"
    salvar.salvar_dados(sonar, info)

end