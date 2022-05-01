require_relative "limpar_tela"
module Iniciar
  class Inicializar < LimparTela
    def self.tela_carregamento
      LimparTela.identificar_os
      print "\033[1;32mIniciando o jogo."
      5.times do |num|
        print "."
        sleep 0.3
      end
      puts ".\033[1;97m"
    end
  end
end