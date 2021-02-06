require "ola_mundo/translation"

module OlaMundo
  def self.greet(language = "portuguese")
    words = "hello world!"
    Translation.new(language: language).call(words)
  end
end
