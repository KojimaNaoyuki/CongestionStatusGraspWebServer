class Place < ApplicationRecord
    has_many :CongestionDatum, dependent: :destroy
end
