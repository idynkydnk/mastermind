class String
  def bg_black;       "\e[40m#{self}\e[0m" end
  def bg_red;         "\e[41m#{self}\e[0m" end
  def bg_green;       "\e[42m#{self}\e[0m" end
  def bg_blue;        "\e[44m#{self}\e[0m" end
  def bg_purple;      "\e[45m#{self}\e[0m" end
  def bg_gray;        "\e[47m#{self}\e[0m" end
  def bg_yellow;      "\e[43m#{self}\e[0m" end
end
