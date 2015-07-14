class FundingInstrument
  # I'm a fake ActiveModel class!
  # I should minimally respond to the #find method
  def self.find(all, *args)
  end
end

class ParentObject
  def self.find(args)
    [:a, :b, :c]
  end
end

class Dummy 
  extend ActiveWorkaround::Concern

  #has_many_related
  #has_many_affiliated
  has_many_remote :funding_instruments#, cache: true

  def initialize
    @id = 1
  end

end

class DummyWithoutToParam
  extend ActiveWorkaround::Concern

  #todo, just use class_name
  has_many_remote :funding_instruments, class: FundingInstrument #, foreign_key: :account_id

  def initialize
    @id = 1
  end

end

class HorribleObject 
  extend ActiveWorkaround::Concern

  has_many_remote :funding_instruments

end

class SubservientDummy
  extend ActiveWorkaround::Concern

  def initialize
    @id = 1
  end

  belongs_to_remote :parent_object

end
