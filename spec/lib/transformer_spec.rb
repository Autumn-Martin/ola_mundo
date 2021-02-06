describe OlaMundo::Transformer do
  before { OlaMundo.start }

  describe "#translate" do
    context "known language content" do
      it "returns the translation" do
        expect("Hello world!".translate("spanish")).to eq("Hola mundo!")
      end
    end
    context "mixed known and unknown language content" do
      it "returns the translation mixed with binary for unknown words" do
        expect("hello quatervois?".translate("italian")).to eq(
          "Ciao 01110001 01110101 01100001 01110100 01100101 01110010 01110110 01101111 01101001 01110011?"
        )
      end
    end
    context "unknown language" do
      it "returns binary" do
        expect("hi".translate("darlek")).to eq("01101000 01101001")
      end
    end
  end
end
