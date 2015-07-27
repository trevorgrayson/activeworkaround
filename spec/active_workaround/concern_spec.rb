require 'spec_helper'

describe(ActiveWorkaround::Concern) do

  describe("has_many") do 

    it("creates an object that responds to association") {
      dummy = User.create(name: "bob")
      expect(FundingInstrument).to receive(:find).with(:all, "user_id"=>dummy.id.to_s)
      dummy.funding_instruments
    }

    it("returns as expected") {
      dummy = User.create(name: "bob")
      expect(dummy.funding_instruments).to be_a(ActiveWorkaround::CollectionProxy)
      expect(dummy.funding_instruments[0]).to be(:a)

      expect(dummy.funding_instruments.first).to be(:a)

      [:size, :length, :count].each do |method|
        expect(dummy.funding_instruments.send(method)).to be(2)
      end

    }

    describe("new") do

      it("builds") {
        args = {:a => :b}
        dummy = User.create(name: "bob")
        expect(FundingInstrument).to receive(:build).with(args)
        dummy.funding_instruments.build(args)
      }

      it("creates") {
        args = {:a => :b}
        dummy = User.create(name: "bob")
        expect(FundingInstrument).to receive(:create).with(args)
        dummy.funding_instruments.create(args)
      }

      it("creates!") {
        args = {:a => :b}
        dummy = User.create(name: "bob")
        expect(FundingInstrument).to receive(:create!).with(args)
        dummy.funding_instruments.create!(args)
      }

      it("concats") {
        dummy = User.create(name: "bob")

        child = Array.wrap( FundingInstrument.new() )
        expect(dummy.funding_instruments.size).to eq(2)
        dummy.funding_instruments.concat( child )
        expect(dummy.funding_instruments.size).to eq(3)
      }

      it("pushes") {
        dummy = User.create(name: "bob")

        child = FundingInstrument.new()
        expect(dummy.funding_instruments.size).to eq(2)
        dummy.funding_instruments << child 
        expect(dummy.funding_instruments.size).to eq(3)
        dummy.funding_instruments.push child 
        expect(dummy.funding_instruments.size).to eq(4)
        dummy.funding_instruments.append child 
        expect(dummy.funding_instruments.size).to eq(5)
      }

    end

  end

end
