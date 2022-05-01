module Vencer
  def venceu?
    if @esconder.join("") == @backup
      puts "\033[1;32mParabens você ganhou o jogo\033[;1m"
      return @venceu = true
    end
  end

  def perdeu?
    if @cont == 0 
      puts "\033[1;31mInfelizmetente você perdeu o jogo\033[;1m"
      return @venceu = true
    else
      return @venceu = false  
    end
  end
end
