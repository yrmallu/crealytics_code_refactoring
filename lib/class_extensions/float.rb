# expanding core Float class to support German-specific conversions
class Float
  def to_german_s
    self.to_s.gsub('.', ',')
  end
end
