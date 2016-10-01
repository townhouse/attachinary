module Attachinary
  class File < ::ActiveRecord::Base
    #acts_as_paranoid
    belongs_to :attachinariable, polymorphic: true
    include FileMixin
  end
end
