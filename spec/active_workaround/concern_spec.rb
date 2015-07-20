require 'spec_helper'
require 'debugger'

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

    #describe("finds a foreign_id") do

    #  #it("prefers to_param") {
    #  #  dummy = User.new
    #  #  expect(FundingInstrument).to receive(:find).with(:all, "dummy_id"=>1)
    #  #  dummy.funding_instruments
    #  #}

    #  #it("defaults to @id") {
    #  #  dummy = UserWithoutToParam.new

    #  #  #expect(FundingInstrument).to receive(:find).with(:all, "dummy_without_to_param_id"=>1)
    #  #  #dummy.funding_instruments
    #  #}

    #  it("doesn't croak on no id") { skip("I'm lazy, put an id on it")
    #    dummy = HorribleObject.new
    #    #expect(FundingInstrument).to receive(:find).with(:all, {})
    #    #dummy.funding_instruments
    #  }

    #end

  end

  #describe("belongs_to") do

  #  it("creates an object that responds to association") {
  #    dummy = SubservientDummy.new
  #    #expect(ParentObject).to receive(:find).with(id:1)
  #    dummy.parent_object
  #  }

  #  it("returns as expected") {
  #    dummy = SubservientDummy.new
  #    #expect(dummy.parent_object).to eq([:a, :b, :c])
  #  }

  #end

end
