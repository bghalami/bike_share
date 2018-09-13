class ConditionsController < ApplicationController
  def index
    @conditions = Condition.all
  end

  def show
    @condition = Condition.find(params[:id])
  end

  def dashboard
    if current_user
      # sql_max_40 = "SELECT COUNT(start_date) FROM trips JOIN conditions ON conditions.date = trips.start_date WHERE max_temp BETWEEN 40.0 AND 49.9 GROUP BY start_date ORDER BY count desc LIMIT 1"
      @max_40_avg = Trip.max_temp_data(4)[:avg]
      @max_40_high = Trip.max_temp_data(4)[:high]
      @max_40_low = Trip.max_temp_data(4)[:low]
      @max_50_avg = Trip.max_temp_data(5)[:avg]
      @max_50_high = Trip.max_temp_data(5)[:high]
      @max_50_low = Trip.max_temp_data(5)[:low]
      @max_60_avg = Trip.max_temp_data(6)[:avg]
      @max_60_high = Trip.max_temp_data(6)[:high]
      @max_60_low = Trip.max_temp_data(6)[:low]
      @max_70_avg = Trip.max_temp_data(7)[:avg]
      @max_70_high = Trip.max_temp_data(7)[:high]  # = ActiveRecord::Base.connection.execute(sql_max_70)to_f
      @max_70_low = Trip.max_temp_data(7)[:low]
      @max_80_avg = Trip.max_temp_data(8)[:avg]
      @max_80_high = Trip.max_temp_data(8)[:high]
      @max_80_low = Trip.max_temp_data(8)[:low]
      @max_90_avg = Trip.max_temp_data(9)[:avg]
      @max_90_high = Trip.max_temp_data(9)[:high]
      @max_90_low = Trip.max_temp_data(9)[:low]

      @precip0_5_avg = Trip.precip_data(0.0,0.4)[:avg]
      @precip0_5_high = Trip.precip_data(0.0,0.4)[:high]
      @precip0_5_low = Trip.precip_data(0.0,0.4)[:low]
      @precip5_1_avg = Trip.precip_data(0.5,0.9)[:avg]
      @precip5_1_high = Trip.precip_data(0.5,0.9)[:high]
      @precip5_1_low = Trip.precip_data(0.5,0.9)[:low]
      @precip_1_5_avg = Trip.precip_data(1.0,1.4)[:avg]
      @precip_1_5_high = Trip.precip_data(1.0,1.4)[:high]
      @precip_1_5_low = Trip.precip_data(1.0,1.4)[:low]
      @precip_5_2_avg = Trip.precip_data(1.5,1.9)[:avg]
      @precip_5_2_high = Trip.precip_data(1.5,1.9)[:high]
      @precip_5_2_low = Trip.precip_data(1.5,1.9)[:low]
      @precip_2_5_avg = Trip.precip_data(2.0,2.4)[:avg]
      @precip_2_5_high = Trip.precip_data(2.0,2.4)[:high]
      @precip_2_5_low = Trip.precip_data(2.0,2.4)[:low]
      @precip_5_3_avg = Trip.precip_data(2.5,2.9)[:avg]
      @precip_5_3_high = Trip.precip_data(2.5,2.9)[:high]
      @precip_5_3_low = Trip.precip_data(2.5,2.9)[:low]
      @precip_3_5_avg = Trip.precip_data(3.0,3.5)[:avg]
      @precip_3_5_high = Trip.precip_data(3.0,3.5)[:high]
      @precip_3_5_low = Trip.precip_data(3.0,3.5)[:low]

      @wind_3_avg = Trip.wind_data(0,3)[:avg]
      @wind_3_high = Trip.wind_data(0,3)[:high]
      @wind_3_low = Trip.wind_data(0,3)[:low]
      @wind_7_avg = Trip.wind_data(4,7)[:avg]
      @wind_7_high = Trip.wind_data(4,7)[:high]
      @wind_7_low = Trip.wind_data(4,7)[:low]
      @wind_11_avg = Trip.wind_data(8,11)[:avg]
      @wind_11_high = Trip.wind_data(8,11)[:high]
      @wind_11_low = Trip.wind_data(8,11)[:low]
      @wind_15_avg = Trip.wind_data(12,15)[:avg]
      @wind_15_high = Trip.wind_data(12,15)[:high]
      @wind_15_low = Trip.wind_data(12,15)[:low]
      @wind_19_avg = Trip.wind_data(16,19)[:avg]
      @wind_19_high = Trip.wind_data(16,19)[:high]
      @wind_19_low = Trip.wind_data(16,19)[:low]

      @vis_3_avg = Trip.vis_data(0,3)[:avg]
      @vis_3_high = Trip.vis_data(0,3)[:high]
      @vis_3_low = Trip.vis_data(0,3)[:low]
      @vis_7_avg = Trip.vis_data(4,7)[:avg]
      @vis_7_high = Trip.vis_data(4,7)[:high]
      @vis_7_low = Trip.vis_data(4,7)[:low]
      @vis_11_avg = Trip.vis_data(8,11)[:avg]
      @vis_11_high = Trip.vis_data(8,11)[:high]
      @vis_11_low = Trip.vis_data(8,11)[:low]
      @vis_15_avg = Trip.vis_data(12,15)[:avg]
      @vis_15_high = Trip.vis_data(12,15)[:high]
      @vis_15_low = Trip.vis_data(12,15)[:low]
      @vis_19_avg = Trip.vis_data(16,19)[:avg]
      @vis_19_high = Trip.vis_data(16,19)[:high]
      @vis_19_low = Trip.vis_data(16,19)[:low]
    else
      render file: 'public/404'
    end
  end

end
