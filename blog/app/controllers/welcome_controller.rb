class WelcomeController < ApplicationController
  def index
    a = []
    b = []
    Swt.all.each do |sw|
      b << sw.daystr
      a << sw.daynum
    end
    a = [6002, 5068, 4985, 3339, 2656 ]
    b = ["20150421", "20150422", "20150423", "20150424", "20150425"]
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(:text => "转接指标展示")
      f.xAxis(:categories => b )
  f.series(:name => "报错笔数", :yAxis => 0, :data => a )

  f.yAxis [
    {:title => {:text => "报错笔数", :margin => 20} },
  ]
  f.legend(:align => 'center', :verticalAlign => 'top', :y => 20, :x => -10, :layout => 'vertical',:margin => 0)
  #f.legend(:align => 'center', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',:margin => 0)
  f.chart({:defaultSeriesType=>"line"})
    end

    a = [1800, 1900, 1700, 1850, 1950 ]
    @chart1 = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(:text => "清算指标展示")
      f.xAxis(:categories => b )
      f.series(:name => "场次耗时", :yAxis => 0, :data => a )

      f.yAxis [
                  {:title => {:text => "场次耗时", :margin => 20} },
              ]
      f.legend(:align => 'center', :verticalAlign => 'top', :y => 20, :x => -10,:layout => 'vertical',:margin => 0)
      f.chart({:defaultSeriesType=>"line"})
    end

    a = [800, 900, 700, 850, 950 ]
    @chart2 = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(:text => "国业指标展示")
      f.xAxis(:categories => b )
      f.series(:name => "报错笔数", :yAxis => 0, :data => a )

      f.yAxis [
                  {:title => {:text => "报错笔数", :margin => 20} },
              ]
      f.legend(:align => 'center', :verticalAlign => 'top', :y => 20, :x => -10,:layout => 'vertical',:margin => 0)
      f.chart({:defaultSeriesType=>"line"})
    end
    a = [5600, 5900, 5700, 5850, 5950 ]
    @chart3 = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(:text => "短彩信指标展示")
      f.xAxis(:categories => b )
      f.series(:name => "上行笔数", :yAxis => 0, :data => a )

      f.yAxis [
                  {:title => {:text => "上行笔数", :margin => 20} },
              ]
      f.legend(:align => 'center', :verticalAlign => 'top', :y => 20, :x => -10,:layout => 'vertical',:margin => 0)
      f.chart({:defaultSeriesType=>"line"})
    end

    UserMailer.welcome_email().deliver_now
    #UserMailer.deliver_welcome_email

  end
end
