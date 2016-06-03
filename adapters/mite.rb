require "byebug"
require "yaml"
require "json"

module TimeEase::Adapter
  class Mite
    def initialize(parsed_output)
      @parsed = parsed_output
    end

    def body
      @parsed.map do |entry|
        range = entry.time_range
        {
          time_entry: {
            date_at:    range.first.strftime("%Y-%m-%d"),
            minutes:    ((range.last - range.first) / 60.0).to_i,
            project_id: project_id(entry),
            service_id: service_id(entry)
          }
        }
      end
    end

    private

    def project_id(entry)
      detect_id(entry, "projects", "pj_name")
    end

    def service_id(entry)
      detect_id(entry, "services", "task_name")
    end

    def detect_id(entry, key, prop)
      mapping[key].detect(->{{}}) { |record|
        record["names"].include? entry.send(prop)
      }["id"]
    end

    def mapping
      @mapping ||= YAML.load_file("data/mite_mapping.yml")
    end
  end
end
