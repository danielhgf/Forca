require_relative "iniciar_jogo"
require_relative "img_ascii"
require_relative "data_api"
require_relative "vencer_perder"
require_relative "limpar_tela"

include Ascii
include DataAPI
include Vencer
include Iniciar

class Forca < LimparTela
  attr_reader :img, :backup, :esconder,:venceu, :perdeu, :cont, :word, :count

  def initialize
    LimparTela.identificar_os
    @API = DataAPI::GerarPalavra.gerar
    @count, @word = @API["count"], @API["word"]
    @img = Ascii::IMG
    @cont = Ascii::IMG.size - 1
    @esconder = Array.new(@count,"_")
    @backup = @word
    start
  end

  def inicio_forca
    LimparTela.identificar_os
    puts @img[@cont]

    @esconder.each do |linha| 
      print linha
    end
    puts    
    begin
      print "\033[;1mDigite uma letra: "
      letra = gets.chomp
      raise "\033[1;31mPor favor digite UMA letra\033[;1m" if letra == "" || letra.size > 1
    rescue => exception
      puts exception
      retry
    end

    unless @word.include? letra
      @cont = @cont - 1
    else
      index = @word.index(letra)
      @esconder[index] = letra
      @word = @word.sub(letra, "*")
    end
  end

  def start
    until venceu? || perdeu?
      inicio_forca
    end
  end
end

Iniciar::Inicializar.tela_carregamento
Forca.new
op = ""
while op != "n"
  print "\033[;1mDeseja continuar jogando(s/n): "
  op = gets.chomp.downcase
  if op == "s" then
    Forca.new
  else
    print "\033[;1mObrigado por jogar"
    break
  end
end 