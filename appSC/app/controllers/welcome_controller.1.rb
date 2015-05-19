class WelcomeController < ApplicationController
  def index
    a = []
    b = []
    modelview = DailyErrNum.find_by_sql ["select host_name,err_num from daily_err_nums where trim(app_type) = ?","APP"]

    modelview.each do  |sw| 
      a << sw.host_name 
      b << sw.err_num 
    end 
   # b1 = [12333,121313,12122,21212]
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(:text => "转接主机报错展示")
      f.xAxis(:categories => a )
      f.series(:name => "报错笔数", :yAxis => 0, :data => b )
   #   f.series(:name => "报错笔数", :yAxis => 0, :data => b1)
      f.yAxis [
         {:title => {:text => "报错笔数", :margin => 20} },
      ]
      f.legend(:align => 'center', :verticalAlign => 'top', :y => 20, :x => -10, :layout => 'vertical',:margin => 0)
  #f.legend(:align => 'center', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',:margin => 0)
       f.chart({:defaultSeriesType=>"column"})
     end

    a = []
    b = []
    modelview = DailyErrNum.find_by_sql ["select host_name,err_num from daily_err_nums where trim(app_type) = ?","COM"]

    modelview.each do  |sw| 
      a << sw.host_name 
      b << sw.err_num 
    end 

    @chart1 = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(:text => "通讯主机报错展示")
      f.xAxis(:categories => a )
      f.series(:name => "报错笔数", :yAxis => 0, :data => b )

      f.yAxis [
         {:title => {:text => "报错笔数", :margin => 20} },
      ]
      f.legend(:align => 'center', :verticalAlign => 'top', :y => 20, :x => -10, :layout => 'vertical',:margin => 0)
  #f.legend(:align => 'center', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',:margin => 0)
       f.chart({:defaultSeriesType=>"column"})
     end

    a = []
    b = []
    modelview = DailyErrNum.find_by_sql ["select host_name,err_num from daily_err_nums where trim(app_type) = ?","ZNAP"]

    modelview.each do  |sw| 
      a << sw.host_name 
      b << sw.err_num 
    end 

    @chart2 = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(:text => "NAP主机报错展示")
      f.xAxis(:categories => a )
      f.series(:name => "报错笔数", :yAxis => 0, :data => b )

      f.yAxis [
         {:title => {:text => "报错笔数", :margin => 20} },
      ]
      f.legend(:align => 'center', :verticalAlign => 'top', :y => 20, :x => -10, :layout => 'vertical',:margin => 0)
  #f.legend(:align => 'center', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',:margin => 0)
       f.chart({:defaultSeriesType=>"column"})
     end

    a = []
    b = []
    modelview = DailyErrNum.find_by_sql ["select host_name,err_num from daily_err_nums where trim(app_type) = ?","HA"]

    modelview.each do  |sw| 
      a << sw.host_name 
      b << sw.err_num 
    end 

    @chart3 = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(:text => "高可用报错展示")
      f.xAxis(:categories => a )
      f.series(:name => "报错笔数", :yAxis => 0, :data => b )

      f.yAxis [
         {:title => {:text => "报错笔数", :margin => 20} },
      ]
      f.legend(:align => 'center', :verticalAlign => 'top', :y => 20, :x => -10, :layout => 'vertical',:margin => 0)
  #f.legend(:align => 'center', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',:margin => 0)
       f.chart({:defaultSeriesType=>"column"})
     end

  end

  def app_index
    a = []
    b = []
    modelview = DailyErrNum.find_by_sql ["select date,sum(err_num) as err_num from daily_err_nums where  trim(app_type) = ? group by date","APP"] 
    modelview.each do  |sw| 
        a << sw.date 
        b << sw.err_num 
    end 
    @total_chart = LazyHighCharts::HighChart.new('graph') do |f|
        f.title(:text => "应用业务报错总数")
        f.xAxis(:categories => a )
        f.series(:name => "报错笔数", :yAxis => 0, :data => b )

        f.yAxis [
           {:title => {:text => "报错笔数", :margin => 20} },
        ]
        f.legend(:align => 'center', :verticalAlign => 'top', :y => 20, :x => -10, :layout => 'vertical',:margin => 0)
        f.chart({:defaultSeriesType=>"column"})
    end   

    a = []
    b = []
    modelview = DailyErrNum.find_by_sql ["select host_name,err_num from daily_err_nums where trim(app_type) = ?","APP"]
    modelview.each do  |sw| 
      a << sw.host_name 
      b << sw.err_num 
    end 

    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(:text => "应用主机报错展示")
      f.xAxis(:categories => a )
      f.series(:name => "报错笔数", :yAxis => 0, :data => b )

      f.yAxis [
         {:title => {:text => "报错笔数", :margin => 20} },
      ]
      f.legend(:align => 'center', :verticalAlign => 'top', :y => 20, :x => -10, :layout => 'vertical',:margin => 0)
      f.chart({:defaultSeriesType=>"column"})
     end
     

    a = []
    b = []
    modelview = DailyErrCode.find_by_sql ["select err_code,err_num from daily_err_codes where trim(app_type) = ?","APP"]
    modelview.each do  |sw| 
      a << sw.err_code 
      b << sw.err_num 
    end 
    @chart_err_code = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(:text => "报错码展示")
      f.xAxis(:categories => a )
      f.series(:name => "报错笔数", :yAxis => 0, :data => b )

      f.yAxis [
         {:title => {:text => "报错笔数", :margin => 20} },
      ]
      f.legend(:align => 'center', :verticalAlign => 'top', :y => 20, :x => -10, :layout => 'vertical',:margin => 0)
      f.chart({:defaultSeriesType=>"column"})
     end


    a = []
    b = []
    modelview = DailyErrNumModule.find_by_sql ["select module,err_num from daily_err_num_modules where trim(app_type) = ?","APP"]
    modelview.each do  |sw| 
      a << sw.module 
      b << sw.err_num 
    end 
    @chart_err_module = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(:text => "报错模块展示")
      f.xAxis(:categories => a )
      f.series(:name => "报错笔数", :yAxis => 0, :data => b )

      f.yAxis [
         {:title => {:text => "报错笔数", :margin => 20} },
      ]
      f.legend(:align => 'center', :verticalAlign => 'top', :y => 20, :x => -10, :layout => 'vertical',:margin => 0)
      f.chart({:defaultSeriesType=>"column"})
     end

    
    a = []
    b = []
    modelview = DailyErrNumModule.find_by_sql ["select fwd_ins,err_num from daily_err_code_ins_infos where trim(app_type) = ? order by err_num","APP"]
    modelview.each do  |sw| 
      a << sw.fwd_ins 
      b << sw.err_num 
    end 
    @chart_err_fwd = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(:text => "应用业务报错机构分布")
      f.xAxis(:categories => a )
      f.series(:name => "报错笔数", :yAxis => 0, :data => b )

      f.yAxis [
         {:title => {:text => "报错笔数", :margin => 20} },
      ]
      f.legend(:align => 'center', :verticalAlign => 'top', :y => 20, :x => -10, :layout => 'vertical',:margin => 0)
      f.chart({:defaultSeriesType=>"column"})
     end


    a = []
    b = []
    modelview = DailyErrNumModule.find_by_sql [" select hour,err_num from  daily_err_num_hours where trim(app_type) = ?","APP"]
    modelview.each do  |sw| 
      a << sw.hour 
      b << sw.err_num 
    end 
    @chart_err_hour = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(:text => "应用业务报错时间分布")
      f.xAxis(:categories => a )
      f.series(:name => "报错笔数", :yAxis => 0, :data => b )

      f.yAxis [
         {:title => {:text => "报错笔数", :margin => 20} },
      ]
      f.legend(:align => 'center', :verticalAlign => 'top', :y => 20, :x => -10, :layout => 'vertical',:margin => 0)
      f.chart({:defaultSeriesType=>"line"})
     end
  end

  def com_index
    a = []
    b = []
    modelview = DailyErrNum.find_by_sql ["select date,sum(err_num) as err_num from daily_err_nums where  trim(app_type) = ? group by date","COM"] 
    modelview.each do  |sw| 
        a << sw.date 
        b << sw.err_num 
    end 
    @total_chart = LazyHighCharts::HighChart.new('graph') do |f|
        f.title(:text => "应用业务报错总数")
        f.xAxis(:categories => a )
        f.series(:name => "报错笔数", :yAxis => 0, :data => b )

        f.yAxis [
           {:title => {:text => "报错笔数", :margin => 20} },
        ]
        f.legend(:align => 'center', :verticalAlign => 'top', :y => 20, :x => -10, :layout => 'vertical',:margin => 0)
        f.chart({:defaultSeriesType=>"bar"})
    end  
    a = []
    b = []
    modelview = DailyErrNumModule.find_by_sql [" select hour,err_num from  daily_err_num_hours where trim(app_type) = ?","COM"]
    modelview.each do  |sw| 
      a << sw.hour 
      b << sw.err_num 
    end 
    @chart_err_hour = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(:text => "应用业务报错时间分布")
      f.xAxis(:categories => a )
      f.series(:name => "报错笔数", :yAxis => 0, :data => b )
      f.yAxis [
         {:title => {:text => "报错笔数", :margin => 20} },
      ]
      f.legend(:align => 'center', :verticalAlign => 'top', :y => 20, :x => -10, :layout => 'vertical',:margin => 0)
      f.chart({:defaultSeriesType=>"line"})
    end

    a = []
    b = []
    modelview = DailyErrNum.find_by_sql ["select host_name,err_num from daily_err_nums where trim(app_type) = ?","COM"]
    modelview.each do  |sw| 
      a << sw.host_name 
      b << sw.err_num 
    end 

    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(:text => "转接主机报错展示")
      f.xAxis(:categories => a )
      f.series(:name => "报错笔数", :yAxis => 0, :data => b )

      f.yAxis [
         {:title => {:text => "报错笔数", :margin => 20} },
      ]
      f.legend(:align => 'center', :verticalAlign => 'top', :y => 20, :x => -10, :layout => 'vertical',:margin => 0)
       f.chart({:defaultSeriesType=>"bar"})
     end

    a = []
    b = []
    modelview = DailyErrCode.find_by_sql ["select err_code,err_num from daily_err_codes where trim(app_type) = ?","COM"]
    modelview.each do  |sw| 
      a << sw.err_code 
      b << sw.err_num 
    end 

    @chart_err_code = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(:text => "报错码展示")
      f.xAxis(:categories => a )
      f.series(:name => "报错笔数", :yAxis => 0, :data => b )

      f.yAxis [
         {:title => {:text => "报错笔数", :margin => 20} },
      ]
      f.legend(:align => 'center', :verticalAlign => 'top', :y => 20, :x => -10, :layout => 'vertical',:margin => 0)
       f.chart({:defaultSeriesType=>"bar"})
     end

    a = []
    b = []  
    modelview = DailyErrNumModule.find_by_sql ["select module,err_num from daily_err_num_modules where trim(app_type) = ?","COM"]
    modelview.each do  |sw| 
      a << sw.module 
      b << sw.err_num 
    end 

    @chart_err_module = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(:text => "报错模块展示")
      f.xAxis(:categories => a )
      f.series(:name => "报错笔数", :yAxis => 0, :data => b )

      f.yAxis [
         {:title => {:text => "报错笔数", :margin => 20} },
      ]
      f.legend(:align => 'center', :verticalAlign => 'top', :y => 20, :x => -10, :layout => 'vertical',:margin => 0)
  #f.legend(:align => 'center', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',:margin => 0)
       f.chart({:defaultSeriesType=>"bar"})
     end

  end

  def znap_index
    a = []
    b = []
    modelview = DailyErrNum.find_by_sql ["select date,sum(err_num) as err_num from daily_err_nums where  trim(app_type) = ? group by date","ZNAP"] 
    modelview.each do  |sw| 
        a << sw.date 
        b << sw.err_num 
    end 
    @total_chart = LazyHighCharts::HighChart.new('graph') do |f|
        f.title(:text => "应用业务报错总数")
        f.xAxis(:categories => a )
        f.series(:name => "报错笔数", :yAxis => 0, :data => b )

        f.yAxis [
           {:title => {:text => "报错笔数", :margin => 20} },
        ]
        f.legend(:align => 'center', :verticalAlign => 'top', :y => 20, :x => -10, :layout => 'vertical',:margin => 0)
        f.chart({:defaultSeriesType=>"bar"})
    end  
    a = []
    b = []
    modelview = DailyErrNumModule.find_by_sql [" select hour,err_num from  daily_err_num_hours where trim(app_type) = ?","ZNAP"]
    modelview.each do  |sw| 
      a << sw.hour 
      b << sw.err_num 
    end 
    @chart_err_hour = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(:text => "应用业务报错时间分布")
      f.xAxis(:categories => a )
      f.series(:name => "报错笔数", :yAxis => 0, :data => b )
      f.yAxis [
         {:title => {:text => "报错笔数", :margin => 20} },
      ]
      f.legend(:align => 'center', :verticalAlign => 'top', :y => 20, :x => -10, :layout => 'vertical',:margin => 0)
      f.chart({:defaultSeriesType=>"line"})
    end        

    a = []
    b = []
    modelview = DailyErrNum.find_by_sql ["select host_name,err_num from daily_err_nums where trim(app_type) = ?","ZNAP"]

    modelview.each do  |sw| 
      a << sw.host_name 
      b << sw.err_num 
    end 

    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(:text => "转接主机报错展示")
      f.xAxis(:categories => a )
      f.series(:name => "报错笔数", :yAxis => 0, :data => b )

      f.yAxis [
         {:title => {:text => "报错笔数", :margin => 20} },
      ]
      f.legend(:align => 'center', :verticalAlign => 'top', :y => 20, :x => -10, :layout => 'vertical',:margin => 0)
  #f.legend(:align => 'center', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',:margin => 0)
       f.chart({:defaultSeriesType=>"bar"})
     end

    a = []
    b = []
    modelview = DailyErrCode.find_by_sql ["select err_code,err_num from daily_err_codes where trim(app_type) = ?","ZNAP"]
    modelview.each do  |sw| 
      a << sw.err_code 
      b << sw.err_num 
    end 

    @chart_err_code = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(:text => "报错码展示")
      f.xAxis(:categories => a )
      f.series(:name => "报错笔数", :yAxis => 0, :data => b )

      f.yAxis [
         {:title => {:text => "报错笔数", :margin => 20} },
      ]
      f.legend(:align => 'center', :verticalAlign => 'top', :y => 20, :x => -10, :layout => 'vertical',:margin => 0)
  #f.legend(:align => 'center', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',:margin => 0)
       f.chart({:defaultSeriesType=>"bar"})
     end

    a = []
    b = []  
    modelview = DailyErrNumModule.find_by_sql ["select module,err_num from daily_err_num_modules where trim(app_type) = ?","ZNAP"]
    modelview.each do  |sw| 
      a << sw.module 
      b << sw.err_num 
    end 

    @chart_err_module = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(:text => "报错模块展示")
      f.xAxis(:categories => a )
      f.series(:name => "报错笔数", :yAxis => 0, :data => b )

      f.yAxis [
         {:title => {:text => "报错笔数", :margin => 20} },
      ]
      f.legend(:align => 'center', :verticalAlign => 'top', :y => 20, :x => -10, :layout => 'vertical',:margin => 0)
  #f.legend(:align => 'center', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',:margin => 0)
       f.chart({:defaultSeriesType=>"bar"})
     end

  end

  def ha_index
    a = []
    b = []
    modelview = DailyErrNum.find_by_sql ["select date,sum(err_num) as err_num from daily_err_nums where  trim(app_type) = ? group by date","HA"] 
    modelview.each do  |sw| 
        a << sw.date 
        b << sw.err_num 
    end 
    @total_chart = LazyHighCharts::HighChart.new('graph') do |f|
        f.title(:text => "应用业务报错总数")
        f.xAxis(:categories => a )
        f.series(:name => "报错笔数", :yAxis => 0, :data => b )

        f.yAxis [
           {:title => {:text => "报错笔数", :margin => 20} },
        ]
        f.legend(:align => 'center', :verticalAlign => 'top', :y => 20, :x => -10, :layout => 'vertical',:margin => 0)
        f.chart({:defaultSeriesType=>"bar"})
    end  
    a = []
    b = []
    modelview = DailyErrNumModule.find_by_sql [" select hour,err_num from  daily_err_num_hours where trim(app_type) = ?","HA"]
    modelview.each do  |sw| 
      a << sw.hour 
      b << sw.err_num 
    end 
    @chart_err_hour = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(:text => "应用业务报错时间分布")
      f.xAxis(:categories => a )
      f.series(:name => "报错笔数", :yAxis => 0, :data => b )
      f.yAxis [
         {:title => {:text => "报错笔数", :margin => 20} },
      ]
      f.legend(:align => 'center', :verticalAlign => 'top', :y => 20, :x => -10, :layout => 'vertical',:margin => 0)
      f.chart({:defaultSeriesType=>"line"})
    end    
    a = []
    b = []
    modelview = DailyErrNum.find_by_sql ["select host_name,err_num from daily_err_nums where trim(app_type) = ?","HA"]
    modelview.each do  |sw| 
      a << sw.host_name 
      b << sw.err_num 
    end 

    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(:text => "转接主机报错展示")
      f.xAxis(:categories => a )
      f.series(:name => "报错笔数", :yAxis => 0, :data => b )

      f.yAxis [
         {:title => {:text => "报错笔数", :margin => 20} },
      ]
      f.legend(:align => 'center', :verticalAlign => 'top', :y => 20, :x => -10, :layout => 'vertical',:margin => 0)
  #f.legend(:align => 'center', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',:margin => 0)
       f.chart({:defaultSeriesType=>"bar"})
     end

    a = []
    b = []
    modelview = DailyErrCode.find_by_sql ["select err_code,err_num from daily_err_codes where trim(app_type) = ?","HA"]
    modelview.each do  |sw| 
      a << sw.err_code 
      b << sw.err_num 
    end 

    @chart_err_code = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(:text => "报错码展示")
      f.xAxis(:categories => a )
      f.series(:name => "报错笔数", :yAxis => 0, :data => b )

      f.yAxis [
         {:title => {:text => "报错笔数", :margin => 20} },
      ]
      f.legend(:align => 'center', :verticalAlign => 'top', :y => 20, :x => -10, :layout => 'vertical',:margin => 0)
  #f.legend(:align => 'center', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',:margin => 0)
       f.chart({:defaultSeriesType=>"bar"})
     end

    a = []
    b = []  
    modelview = DailyErrNumModule.find_by_sql ["select module,err_num from daily_err_num_modules where trim(app_type) = ?","HA"]
    modelview.each do  |sw| 
      a << sw.module 
      b << sw.err_num 
    end 

    @chart_err_module = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(:text => "报错模块展示")
      f.xAxis(:categories => a )
      f.series(:name => "报错笔数", :yAxis => 0, :data => b )

      f.yAxis [
         {:title => {:text => "报错笔数", :margin => 20} },
      ]
      f.legend(:align => 'center', :verticalAlign => 'top', :y => 20, :x => -10, :layout => 'vertical',:margin => 0)
  #f.legend(:align => 'center', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',:margin => 0)
       f.chart({:defaultSeriesType=>"bar"})
     end


  end 

  def log_config
    
    @ErrCodes = ErrCode.order(:id).page params[:page]
    
  end
  
  
  def find
    
    query_str = params[:find]
    start_time = query_str[:start_time]
    end_time   = query_str[:end_time]
    
    a = []
    b = []
    modelview = DailyErrNum.find_by_sql ["select host_name,err_num from daily_err_nums where trim(app_type) = ? and date>=? and date<=?","APP",start_time,end_time]

    modelview.each do  |sw| 
      a << sw.host_name 
      b << sw.err_num 
    end 
   # b1 = [12333,121313,12122,21212]
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(:text => "转接主机报错展示")
      f.xAxis(:categories => a )
      f.series(:name => "报错笔数", :yAxis => 0, :data => b )
   #   f.series(:name => "报错笔数", :yAxis => 0, :data => b1)
      f.yAxis [
         {:title => {:text => "报错笔数", :margin => 20} },
      ]
      f.legend(:align => 'center', :verticalAlign => 'top', :y => 20, :x => -10, :layout => 'vertical',:margin => 0)
  #f.legend(:align => 'center', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',:margin => 0)
       f.chart({:defaultSeriesType=>"column"})
     end
 
     respond_to do |format|
          format.html {  redirect_to "index", notice: 'User was successfully created.' }
          format.js   {  render :layout => false  }
     end
  
  end
end
