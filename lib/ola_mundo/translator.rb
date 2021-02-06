module OlaMundo
  class Translator
    def initialize(objective)
      @language = Languages.const_get(objective.upcase)
    end

    def call(text)
      sections = split_into_words_spaces_and_punctuation(text.downcase)
      translate_sections(sections).join.capitalize
    end

    private

    attr_reader :language

    def split_into_words_spaces_and_punctuation(text)
      text.scan(/[\w'-]+|[[:punct:]]+|[[:blank:]]+/)
    end

    def translate_sections(sections)
      sections.map { |section| SectionTranslator.new(section, language).call }
    end
  end
end
