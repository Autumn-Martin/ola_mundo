module OlaMundo
  class SectionTranslator
    def initialize(section, language, encoder: Encoder.new)
      @encoder = encoder
      @language = language
      @section = section.downcase
    end

    def call
      if punctuation_or_space?
        section
      elsif known_word?
        language[:"#{section}"]
      else
        encoder.call(section)
      end
    end

    private

    attr_reader  :encoder, :language, :section

    def known_word?
      language[:"#{section}"]
    end

    def punctuation_or_space?
      /[[:punct:]]+|[[:blank:]]+/.match?(section)
    end
  end
end
