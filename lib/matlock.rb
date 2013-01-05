require 'matlock/data'
require 'matlock/version'

require 'matlock/ext/string'

class Matlock
  # Extracts a list of names from a string.
  #
  # @param content [String]  the string that names should be extracted from.
  #
  # @returns [Array]  a list of names.
  def extract_names(content)
    names = []
    
    # Split content into words.
    words = content.split(/\b+/).select {|v| v.index(/^[a-z]+$/i)}
    
    # Loop over each bigram and check if the words are title cased and if at
    # least one of the words is a first or last name.
    words.each_with_index do |first_name, index|
      surname = words[index+1] || ''
      
      # Only look at two words that are titlecase.
      next if !first_name.titlecase? || !surname.titlecase?
      
      # Check if either the first name or last name is a recognized common name.
      if Matlock::Data.first_name?(first_name) || Matlock::Data.surname?(surname)
        full_name = "#{first_name} #{surname}"
        names << full_name if names.index(full_name).nil?
      end
    end
    
    return names
  end
end
