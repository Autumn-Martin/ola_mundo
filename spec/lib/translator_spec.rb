describe OlaMundo::Translator do
  subject(:translator) { described_class.new("italian") }

  describe "#call" do
    context "known language content" do
      let(:call) { translator.call("Hello world!") }

      it "returns the translation" do
        expect(call).to eq("Ciao mondo!")
      end
    end
    context "mixed known and unknown language content" do
      let(:call) { translator.call("hello quatervois?") }

      it "returns the translation mixed with binary for unknown words" do
        expect(call).to eq(
          "Ciao 01110001 01110101 01100001 01110100 01100101 01110010 01110110 01101111 01101001 01110011?"
        )
      end
    end
    context "unknown language" do
      subject(:translator) { described_class.new("dalek") }
      let(:call) { translator.call("hi!") }

      it "raises an error" do
        expect { translator.call("hi!") }.to raise_error { |error|
          expect(error).to be_a(NameError)
          expect(error.message).to eq("uninitialized constant OlaMundo::Languages::DALEK")
        }
      end
    end
  end
end
