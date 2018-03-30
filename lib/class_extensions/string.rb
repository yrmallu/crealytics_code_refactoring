# expanding core String class to support German-specific conversions
class String
  def from_german_to_f
    self.gsub(',', '.').to_f
  end
end

