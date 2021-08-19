class Api::V1::RecordsController < ApplicationController

    skip_before_action :authorized

    before_action :set_user
    before_action :set_record, only: [:show, :edit, :update, :destroy]
    wrap_parameters :record, include: [:user_id, :date, :vote, :item_name, :item_calories]

    def index
        if (@user.records)
            render json: RecordSerializer.new(@user.records) 
        end
    end

    def show
        render json: RecordSerializer.new(@record)
    end

    def create
        @record = @user.records.new(record_params)
        if @record.checkDate(record_params)
            if @record.save
                @record.days.create(day_params)
                @record.allowance
                @record.save
                render json: RecordSerializer.new(@record)
            else 
                render json: {error: "Must include date"}
            end
        end
    end

    def update
        if @record.vote != record_params[:vote]
            @record.vote = record_params[:vote]
            @record.save
            render json: RecordSerializer.new(@record)
        elsif (!!params[:item_name])
            @record.days.create(day_params)
            @record.allowance
            @record.save
            render json: RecordSerializer.new(@record)
        else
            render json: RecordSerializer.new(@record)
        end
    end

    def destroy
        @record.days.each do |day|
            day.destroy
        end
        @record.destroy
        render json: RecordSerializer.new(@user.records)
    end

    private

    def set_user
        @user = User.find(params[:user_id])
    end

    def set_record
        @record = Record.find(params[:id])
    end

    def record_params
        params.require(:record).permit(:date, :user_id, :vote)
    end

    def day_params
        params.require(:record).permit(:item_name, :item_calories)
    end

end
