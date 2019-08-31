Incluir dependencias

# apt-get --assume-yes install \
gcc \
libcurl4-openssl-dev \
libxml2-dev \
ruby \
ruby-dev


se problemass no migration verificar versáo da migration

rails secret	
EDITOR=nano rails credentials:edit

Obs? credentials presente no rails 5.2
se user credentiarls e tiver problemas, lembrar de deletar arquivo anterior antes de rodar novamente comando.

development:
  secret_key_base: 
  
production:
  secret_key_base: 
  mapa_api_key: 
  
Incluir o ip publico do servidor no arquivo de config dos ambientes
  
  
config.action_mailer.default_url_options = { host: "3.212.235.203:8080" }  


Para o exemplo nao esquecer do rodar o db:seed para platar o exemplo.