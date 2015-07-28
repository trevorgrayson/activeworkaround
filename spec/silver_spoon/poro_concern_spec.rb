require 'spec_helper'

describe(SilverSpoon::Concern) do

  describe("has_many") do 

    describe("finds a foreign_id") do

      #it("prefers to_param") {
      #  dummy = User.new
      #  expect(FundingInstrument).to receive(:find).with(:all, "dummy_id"=>1)
      #  dummy.funding_instruments
      #}

      #it("defaults to @id") {
      #  dummy = UserWithoutToParam.new

      #  #expect(FundingInstrument).to receive(:find).with(:all, "dummy_without_to_param_id"=>1)
      #  #dummy.funding_instruments
      #}

      it("doesn't croak on no id") { skip("I'm lazy, put an id on it")
        dummy = HorribleObject.new
        #expect(FundingInstrument).to receive(:find).with(:all, {})
        #dummy.funding_instruments
      }

    end

  end

  describe("belongs_to") do

    it("creates an object that responds to association") {
      dummy = SubservientDummy.new
      #expect(ParentObject).to receive(:find).with(id:1)
      dummy.parent_object
    }

    it("returns as expected") {
      dummy = SubservientDummy.new
      #expect(dummy.parent_object).to eq([:a, :b, :c])
    }

  end

end
