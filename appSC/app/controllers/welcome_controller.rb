class WelcomeController < ApplicationController
  
  def do_chart(type)
    a = []
    b = []
    modelview = DailyErrNum.find_by_sql ["select date,sum(err_num) as err_num from daily_err_nums where  trim(app_type) = ? group by date order by date",type] 
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
    modelview = DailyErrNum.find_by_sql ["select host_name,sum(err_num) as err_num from daily_err_nums where trim(app_type) = ? group by host_name",type]
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
      f.chart({:defaultSeriesType=>"bar"})
     end
     

    a = []
    b = []
    modelview = DailyErrCode.find_by_sql ["select err_code,sum(err_num) as err_num from daily_err_codes where trim(app_type) = ? group by err_code ",type]
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
    modelview = DailyErrNumModule.find_by_sql ["select module,sum(err_num)  as err_num from daily_err_num_modules where trim(app_type) = ? group by module",type]
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
    modelview = DailyErrNumModule.find_by_sql [" select hour,sum(err_num) as err_num from  daily_err_num_hours where trim(app_type) = ? group by hour ",type]
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
  def index
    
    a = []
    b = []
    modelview = DailyErrNum.find_by_sql ["select date,sum(err_num) as err_num from daily_err_nums group by date order by date"] 
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
    modelview = DailyErrNum.find_by_sql ["select host_name,sum(err_num) as err_num from daily_err_nums group by host_name"]
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
      f.chart({:defaultSeriesType=>"bar"})
     end
     

    a = []
    b = []
    modelview = DailyErrCode.find_by_sql ["select err_code,sum(err_num) as err_num from daily_err_codes group by err_code "]
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
    modelview = DailyErrNumModule.find_by_sql ["select module,sum(err_num)  as err_num from daily_err_num_modules  group by module"]
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
    modelview = DailyErrNumModule.find_by_sql [" select hour,sum(err_num) as err_num from  daily_err_num_hours  group by hour "]
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

  def app_index
    
    do_chart  "APP"
    a = []
    b = []
    modelview = DailyErrNumModule.find_by_sql ["select fwd_ins,sum(err_num) as err_num from daily_err_code_ins_infos where trim(app_type) = ? group by fwd_ins order by err_num","APP"]
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
  
   
  end

  def com_index
    
    do_chart  "COM"
    

    
  end

  def znap_index
    
    do_chart  "ZNAP"

  end

  def ha_index
    
    do_chart  "HA"
   
  end 

  def log_config
    
    @ErrCodes = ErrCode.order(:id).page params[:page]
    
  end
  
  def index_find
    query_str = params[:find]
    start_time = query_str[:start_time]
    end_time   = query_str[:end_time]
    findnotype(start_time,end_time)
    respond_to do |format|
          format.html {  redirect_to "index", notice: 'User was successfully created.' }
          format.js   {  render :layout => false  }
    end
  end  
    
    
    
  def com_find
    query_str = params[:find]
    start_time = query_str[:start_time]
    end_time   = query_str[:end_time]
    find("COM",start_time,end_time)   
   respond_to do |format|
          format.html {  redirect_to "app_index", notice: 'User was successfully created.' }
          format.js   {  render :layout => false  }
    end
  end
  
  
  def app_find
        
    query_str = params[:find]
    start_time = query_str[:start_time]
    end_time   = query_str[:end_time]
    find("APP",start_time,end_time)      
    a = []
    b = []
    modelview = DailyErrNumModule.find_by_sql ["select fwd_ins,sum(err_num) as err_num from daily_err_code_ins_infos where trim(app_type) = ? and date>=? and date<=? group by fwd_ins order by err_num","APP",start_time,end_time] 
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
    respond_to do |format|
          format.html {  redirect_to "app_index", notice: 'User was successfully created.' }
          format.js   {  render :layout => false  }
    end
  
  end
  
  def znap_find
        
    query_str = params[:find]
    start_time = query_str[:start_time]
    end_time   = query_str[:end_time]
    find("ZNAP",start_time,end_time)  
    respond_to do |format|
          format.html {  redirect_to "znap_index", notice: 'User was successfully created.' }
          format.js   {  render :layout => false  }
    end
  
  end
  
  def ha_find
        
    query_str = params[:find]
    start_time = query_str[:start_time]
    end_time   = query_str[:end_time]
    find("HA",start_time,end_time)
    respond_to do |format|
          format.html {  redirect_to "ha_index", notice: 'User was successfully created.' }
          format.js   {  render :layout => false  }
    end
  
  end
  
  def find(type,start_time,end_time)
    
    a = []
    b = []
    modelview = DailyErrNum.find_by_sql ["select date,sum(err_num) as err_num from daily_err_nums where  trim(app_type) = ? and date>=? and date<=? group by date order by date",type,start_time,end_time] 
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
    modelview = DailyErrNum.find_by_sql ["select host_name,sum(err_num) as err_num from daily_err_nums where trim(app_type) = ? and date>=? and date<=?  group by host_name",type,start_time,end_time]
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
      f.chart({:defaultSeriesType=>"bar"})
     end
     

    a = []
    b = []
    modelview = DailyErrCode.find_by_sql ["select err_code,sum(err_num) as err_num from daily_err_codes where trim(app_type) = ?  and date>=? and date<=? group by err_code ",type,start_time,end_time]
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
    modelview = DailyErrNumModule.find_by_sql ["select module,sum(err_num)  as err_num from daily_err_num_modules where trim(app_type) = ?  and dates>=? and dates<=? group by module",type,start_time,end_time]
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
    modelview = DailyErrNumModule.find_by_sql [" select hour,sum(err_num) as err_num from  daily_err_num_hours where trim(app_type) = ?  and date>=? and date<=? group by hour ",type,start_time,end_time]
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
  
 def findnotype(start_time,end_time)
    
    a = []
    b = []
    modelview = DailyErrNum.find_by_sql ["select date,sum(err_num) as err_num from daily_err_nums where   date>=? and date<=? group by date order by date",start_time,end_time] 
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
    modelview = DailyErrNum.find_by_sql ["select host_name,sum(err_num) as err_num from daily_err_nums where  date>=? and date<=?  group by host_name",start_time,end_time]
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
      f.chart({:defaultSeriesType=>"bar"})
     end
     

    a = []
    b = []
    modelview = DailyErrCode.find_by_sql ["select err_code,sum(err_num) as err_num from daily_err_codes where date>=? and date<=? group by err_code ",start_time,end_time]
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
    modelview = DailyErrNumModule.find_by_sql ["select module,sum(err_num)  as err_num from daily_err_num_modules where dates>=? and dates<=? group by module",start_time,end_time]
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
    modelview = DailyErrNumModule.find_by_sql [" select hour,sum(err_num) as err_num from  daily_err_num_hours where  date>=? and date<=? group by hour ",start_time,end_time]
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
  
  def sum_chart
    
    host_name_a = []
    date_a = []
    num_a  = []
    
    tmp_daily_err_nums = DailyErrNum.find_by_sql ["select host_name as host_name ,date,sum(err_num) as err_num from daily_err_nums  where host_name not in ('PPCUMAS02','PPCUMAS01') group by host_name,date order by host_name,date"]
    
    tmp_daily_err_nums.each do |t|
      host_name_a << t.host_name
      date_a      << t.date
      num_a       << t.err_num
    end
    x_data = date_a.uniq.sort
    n_count = date_a.uniq.count
    host_n =  host_name_a.uniq.sort
    @sum_host_date_chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(:text => "主机报错时间分布")
      f.xAxis(:categories => x_data )
      i = 0
      num_a.in_groups_of(n_count).each do |group| 
        f.series(:name =>host_n[i] ,  :data => group )
        i+=1
      end
 
      f.legend(:itemDistance=> 8)
      f.chart({:defaultSeriesType=>"spline"})
     end
     
     
    codes_set = []
    b = []
    modelview = DailyErrCode.find_by_sql ["select err_code,sum(err_num) as err_num from daily_err_codes  group by err_code order by err_num desc limit 10"]
    modelview.each do  |sw| 
      codes_set << sw.err_code.rstrip 
      b << sw.err_num 
    end 
    @sum_err_code = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(:text => "报错码TOP 10展示")
      f.xAxis(:categories => codes_set )
      f.series(:name => "报错笔数", :yAxis => 0, :data => b )

      f.legend(:align => 'center', :verticalAlign => 'top', :y => 20, :x => -10, :layout => 'vertical',:margin => 0)
      f.chart({:defaultSeriesType=>"bar"})
     end
     
     @chart_set={}
     codes_set.each do |code|
       a = []
       b = []
       modelview = DailyErrCode.find_by_sql ["select date,err_num  from daily_err_codes where trim(err_code) = ? order by date",code]
       modelview.each do  |sw| 
          a << sw.date 
          b << sw.err_num 
       end 
       chart_tmp  = LazyHighCharts::HighChart.new('graph') do |f|
         f.title(:text => "#{code}报错展示")
         f.xAxis(:categories => a )
         f.series(:name => "报错笔数", :yAxis => 0, :data => b )
         f.legend(:align => 'center', :verticalAlign => 'top', :y => 20, :x => -10, :layout => 'vertical',:margin => 0)
         f.chart({:defaultSeriesType=>"spline"})
       end
        @chart_set["#{code}"] = chart_tmp
     end
     
    a = []
    b = []
    modelview = DailyErrNumModule.find_by_sql ["select fwd_ins,sum(err_num) as err_num from daily_err_code_ins_infos group by fwd_ins order by err_num desc limit 10"] 
    modelview.each do  |sw| 
      a << sw.fwd_ins.strip 
      b << sw.err_num 
    end 
    @chart_err_fwd10 = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(:text => "TOP10机构分布")
      f.xAxis(:categories => a )
      f.series(:name => "报错笔数", :yAxis => 0, :data => b )

      f.yAxis [
         {:title => {:text => "报错笔数", :margin => 20} },
      ]
      f.legend(:align => 'center', :verticalAlign => 'top', :y => 20, :x => -10, :layout => 'vertical',:margin => 0)
      f.chart({:defaultSeriesType=>"bar"})
     end      
     
     
  
    @fwd10_chart_set={}  
    a.each do |fwd_ins|
       a = []
       b = []
       modelview = DailyErrCode.find_by_sql ["select date,sum(err_num)  as err_num from daily_err_code_ins_infos where trim(fwd_ins) = ? group by date order by date",fwd_ins]
       modelview.each do  |sw| 
          a << sw.date 
          b << sw.err_num 
       end 
       chart_tmp  = LazyHighCharts::HighChart.new('graph') do |f|
         f.title(:text => "#{fwd_ins}报错展示")
         f.xAxis(:categories => a )
         f.series(:name => "报错笔数", :yAxis => 0, :data => b )
         f.legend(:align => 'center', :verticalAlign => 'top', :y => 20, :x => -10, :layout => 'vertical',:margin => 0)
         f.chart({:defaultSeriesType=>"spline"})
       end
      @fwd10_chart_set["#{fwd_ins}"] = chart_tmp
    end      

  end
  
end
