module OlaMundo
  class Encoder
    SUPPORTED_FORMATS = ["MSbit", "LSbit"].freeze

    def initialize(format: "MSbit")
      @format = format
    end

    def call(text)
      case format
      when "MSbit"
        encode_most_significant_bit_format(text)
      when "LSbit"
        encode_least_significant_bit_format(text)
      else
        fail UnsupportedFormat.new("Unsupported binary format")
      end
    end

    private

    attr_reader :format

    def encode_most_significant_bit_format(text)
      text.chars.map { |character| character.unpack("B*") }.join(" ")
    end

    def encode_least_significant_bit_format(text)
      text.chars.map { |character| character.unpack("b*") }.join(" ")
    end
  end
end
