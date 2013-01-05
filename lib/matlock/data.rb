class Matlock
  class Data
    ############################################################################
    #
    # Attributes
    #
    ############################################################################

    # Retrieves a hash of surnames.
    def self.surnames; @surnames; end

    # Retrieves a hash of first names.
    def self.first_names; @first_names; end

    # Retrieves a hash of male names.
    def self.male_names; @male_names; end

    # Retrieves a hash of female names.
    def self.female_names; @female_names; end

    # Retrieves a hash of common words.
    def self.common_words; @common_words; end


    ############################################################################
    #
    # Methods
    #
    ############################################################################

    # Loads all data from the data files.
    def self.load()
      # Determine path to the data files embedded in the gem.
      path = File.join(File.expand_path(File.dirname(__FILE__)), "data")
      
      # Load files into global hashes on the Data class.
      @surnames = load_file("#{path}/names.surname.txt")
      @male_names = load_file("#{path}/names.male.txt")
      @female_names = load_file("#{path}/names.female.txt")
      @common_words = load_file("#{path}/common.txt")
      
      # Join the male and female names into a single lookup.
      @first_names = @male_names.merge(@female_names)
    end
    
    # Loads a single data file as a hash lookup.
    #
    # @param filename [String]  the name of the file to load.
    #
    # @return  a hash lookup of names.
    def self.load_file(filename)
      lookup = {}
      index = 1;
      
      File.open(filename, "r").each_line do |line|
        lookup[line.chomp.upcase] = index
        index = index + 1
      end
      
      return lookup
    end
  end
end

# Perform the data file load on initialization.
Matlock::Data.load()