describe OlaMundo::Encoder do
  subject(:encoder) { described_class.new(format: format) }

  describe "#call" do
    let(:call) { encoder.call("world") }

    context "default" do
      let(:call) { described_class.new.call("world") }
      it "returns binary in MSbit format" do
        expect(call).to eq("01110111 01101111 01110010 01101100 01100100")
      end
    end
    context "MSbit format" do
      let(:format) { "MSbit" }
      it "returns binary in that format" do
        expect(call).to eq("01110111 01101111 01110010 01101100 01100100")
      end
    end
    context "LSbit format" do
      let(:format) { "LSbit" }
      it "returns binary in that format" do
        expect(call).to eq("11101110 11110110 01001110 00110110 00100110")
      end
    end
    context "unknown format" do
      let(:format) { "mysterioso" }
      it "raises an error" do
        expect { call }.to raise_error { |error|
          expect(error).to be_a(OlaMundo::UnsupportedFormat)
          expect(error.message).to eq("Unsupported binary format")
        }
      end
    end
  end
end
