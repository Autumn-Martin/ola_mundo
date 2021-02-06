describe OlaMundo::SectionTranslator do
  subject(:section_translator) { described_class.new(section, language) }

  describe "#call" do
    let(:language) { OlaMundo::Languages::FRENCH }
    let(:call) { section_translator.call }

    context "known word" do
      let(:section) { "world" }

      it "returns the translation" do
        expect(call).to eq("monde")
      end
    end
    context "unknown word" do
      let(:section) { "meowwoof" }

      it "returns the translation mixed with binary for unknown words" do
        expect(call).to eq("01101101 01100101 01101111 01110111 01110111 01101111 01101111 01100110")
      end
    end
    context "space" do
      let(:section) { " " }

      it "returns the space" do
        expect(call).to eq(" ")
      end
    end
    context "punctuation" do
      let(:section) { "." }
      
      it "returns the punctuation" do
        expect(call).to eq(".")
      end
    end
  end
end
