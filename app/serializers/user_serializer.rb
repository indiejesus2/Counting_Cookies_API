class UserSerializer
    include FastJsonapi::ObjectSerializer
    attributes :id, :username, :name, :target
    has_many :records
    # has_many :days, through: :records
    attribute :records do |user|
        data = Record.where(user_id: user.id)
        records = {}
        data.each do |record|
            records[:id] = record.id
            records[:date] = record.date
            records[:daily_allowance] = record.daily_allowance
            records[:daily_total] = record.daily_total
            records[:vote] = record.vote
        end
    end
end