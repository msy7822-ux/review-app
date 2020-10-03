class RamenShop < ApplicationRecord
    has_many :reviews, dependent: :destroy
    validates :name, presence: true, uniqueness: true

    def avg_score
        unless self.reviews.empty?
            reviews.average(:score).round(1).to_f
        else
            0.0
        end
    end


    def review_score_persentage
        unless self.reviews.empty?
            reviews.average(:score).round(1).to_f * 100/5
        else
            0.0
        end
    end
end
