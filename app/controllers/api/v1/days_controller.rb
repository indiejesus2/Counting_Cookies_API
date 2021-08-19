class Api::V1::DaysController < ApplicationController

    before_action :set_item, :set_date

    def destroy
        @item.destroy
        @record.allowance
        @record.save
        render json: RecordSerializer.new(@record)
    end

    private

    def set_date
        @record =  Record.find(params[:record_id])
    end

    def set_item
        @item = Day.find(params[:id])
    end

end