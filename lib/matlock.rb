require 'matlock/data'
require 'matlock/version'

require 'active_support/inflector'
require 'matlock/ext/string'

class Matlock
  ##############################################################################
  #
  # Constructor
  #
  ##############################################################################

  # Creates a new matlock object.
  def initialize()
    @stopwords = []
  end


  ##############################################################################
  #
  # Attributes
  #
  ##############################################################################

  # A list of stop words to ignore when matching names.
  attr_reader :stopwords
  
  def stopwords=(value)
    value ||= []
    @stopwords = value.map {|item| item.upcase }
  end


  ##############################################################################
  #
  # Methods
  #
  ##############################################################################

  # Extracts a list of names from a string.
  #
  # @param content [String]  the string that names should be extracted from.
  #
  # @returns [Array]  a list of names.
  def extract_names(content)
    names = []
    
    # Split content into words.
    words = content.split(/[^-a-z0-9]+/i).select {|v| v.index(/^[-a-z]+$/i)}
    
    # Loop over each bigram and check if the words are title cased and if at
    # least one of the words is a first or last name.
    words.each_with_index do |first_name, index|
      surname = full_surname = words[index+1] || ''
      
      # Skip to the next word if we have a couple of the next words.
      if ['van', 'von'].index(surname)
        surname = words[index+2] || ''
        full_surname = "#{full_surname} #{surname}"
      end
      
      # Only look at two words that are titlecase and neither one is a stopword.
      next if !first_name.titlecase? || !surname.titlecase?
      next if !stopwords.index(first_name.upcase).nil? || !stopwords.index(surname.upcase).nil?
      
      # Check if either the first name or last name is a recognized common name.
      if Matlock::Data.first_name?(first_name) || Matlock::Data.surname?(surname)
        full_name = "#{first_name} #{full_surname}"
        names << full_name if names.index(full_name).nil?
      end
    end
    
    return names
  end
end
