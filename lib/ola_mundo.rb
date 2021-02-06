Dir[File.join(__dir__, "ola_mundo/languages", "*.rb")].each { |file| require file }
require "ola_mundo/transformer"
require "ola_mundo/translator"
require "ola_mundo/section_translator"
require "ola_mundo/encoder"

module OlaMundo
  class UnsupportedFormat < StandardError; end

  def self.start
    String.send(:include, Transformer)
    "hello world!".translate("portuguese")
  end
end
