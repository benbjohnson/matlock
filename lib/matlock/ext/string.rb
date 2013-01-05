class String
  def titlecase?
    return !self.index(/^[A-Z].+[a-z]/).nil?
  end

  def upcase?
    return !self.index(/^[A-Z]+$/).nil?
  end

  def downcase?
    return !self.index(/^[a-z]+$/).nil?
  end
end