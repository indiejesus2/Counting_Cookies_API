class RecordSerializer
    include FastJsonapi::ObjectSerializer
    attributes :id, :date, :daily_allowance, :daily_total, :user_id
    has_many :days
    attribute :days do |record|
        days = Day.where(record_id: record.id)
        recs = {} 
        days.each do |day|
            recs[:id] = day.id
            recs[:item_name] = day.item_name
            recs[:item_calories] = day.item_calories
        end
    end
end