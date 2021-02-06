Dir[File.join(__dir__, 'languages', '*.rb')].each { |file| require file }

require 'pry'

module OlaMundo
  class Translation
    def initialize(language: "portuguese")
      @language = Languages.const_get(language.upcase)
    end

    def call(string)
      phrase_pieces = split_into_words_and_punctuation(string.downcase)
      phrase_pieces.map { |phrase_piece| translate(phrase_piece) }.join.capitalize
    end

    private

    attr_reader :language

    def split_into_words_and_punctuation(string)
      string.scan(/[\w'-]+|[[:punct:]]+|[[:blank:]]+/)
    end

    def translate(phrase_piece)
      if punctuation_or_space?(phrase_piece)
        phrase_piece
      elsif known_word?(phrase_piece)
        language[:"#{phrase_piece}"]
      else
        "<unknown>"
      end
    end

    def punctuation_or_space?(phrase_piece)
      /[[:punct:]]+|[[:blank:]]+/.match?(phrase_piece)
    end

    def known_word?(phrase_piece)
      language[:"#{phrase_piece}"]
    end
  end
end
