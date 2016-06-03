module TimeEase
  Input  = Struct.new(:start_time, :end_time, :date, :dones)

  class Parser
    def parse
    end

    private

    def projects
      entries.each do |ent|
        pj_name_ab, service_name_ab, time_in_hour = ent.match(reg)[1..3]
      end
    end

    def reg
      /(\w+)\s*(\w*)\s*\(?([\w\.]+)?\)?/
    end

    def entries
      dones.split(",").map(&:strip)
    end
  end
end
