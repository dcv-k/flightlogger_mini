class Flight < ApplicationRecord
  belongs_to :lesson

  enum status: { scheduled: "scheduled", en_route: "en_route", landed: "landed", cancelled: "cancelled" }
end
