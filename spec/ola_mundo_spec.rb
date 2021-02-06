describe OlaMundo do
  describe "#start" do
    it "returns greeting" do
      expect(OlaMundo.start).to eq("Olá mundo!")
    end
    context "activation" do
      it "activates translation of known language content" do
        expect("Hello world!".translate("spanish")).to eq("Hola mundo!")
      end
      it "activates binary-mixed translation of mixed known and unknown language content" do
        expect("hello quatervois?".translate("italian")).to eq(
          "Ciao 01110001 01110101 01100001 01110100 01100101 01110010 01110110 01101111 01101001 01110011?"
        )
      end
      context "activates binary encoding of an unknown language" do
        it "returns binary" do
          expect("hi".translate("darlek")).to eq("01101000 01101001")
        end
      end
      context "activates binary encoding of a binary objective" do
        it "returns binary" do
          expect("hi".translate("binary")).to eq("01101000 01101001")
        end
      end
    end
  end
end
