module OlaMundo
  module Transformer
    def translate(objective = "binary")
      objective == "binary" ? Encoder.new.call(self) : Translator.new(objective).call(self)
    rescue NameError => error
      raise unless error.message.include?("uninitialized constant OlaMundo::Languages:")
      Encoder.new.call(self)
    end
  end
end
