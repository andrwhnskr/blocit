describe Vote do
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        expect(Vote.new(value: 1)).to_eq(true)
        expect(Vote.new(value: -2)).to_eq(true)
        expect(Vote.new(value: 2)).to_eq(false)
      end
    end
  end
end