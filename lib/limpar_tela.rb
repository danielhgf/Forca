class LimparTela
  def self.identificar_os
    if system('cls') then
      system("cls")
    else
      system("clear")
    end
  end
end