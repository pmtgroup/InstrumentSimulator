module SidebarHelper
  def side_bar_items
    result = []
    if current_user != nil
      result << {
        :name => "Предприятия",
        :icon => 'university  ',
        :controller => :companies,
        :action => :index
      }
      result << {
        :name => "Подразделения",
        :icon => 'building  ',
        :controller => :subdivisions,
        :action => :index
      }
      result << {
        :name => "Рабочие места",
        :icon => 'group  ',
        :controller => :workplaces,
        :action => :index
      }
      result << {
        :name => "Рабочие точки",
        :icon => 'user  ',
        :controller => :workpoints,
        :action => :index
      }
      result << {
        :name => "Средства контроля ВПФ",
        :icon => 'gears  ',
        :controller => :control_tools,
        :action => :index
      }
      result << {
        :name => "Регистраторы сигналов",
        :icon => 'microchip  ',
        :controller => :register_signals,
        :action => :index
      }
      result << {
        :name => "Датчики измерения ВПФ",
        :icon => 'cog  ',
        :controller => :measurement_gauges,
        :action => :index
      }
      result << {
        :name => "Сенсоры",
        :icon => 'cog  ',
        :controller => :sensors,
        :action => :index
      }


      # result << {
      #   :name => t('sidebar.check_lists'),
        #   :icon => 'cart-arrow-down',
      #   :controller => :check_lists,
      #   :action => :index
      # }
      #
      # result << {
      #   :name => t('sidebar.admins'),
      #   :icon => 'user',
      #   :controller => :admins,
      #   :action => :index
      # }
    end

    result
  end

  def is_open?(ctr)
    ctr.to_s == controller_name.to_s
  end
end
