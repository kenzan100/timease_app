module TimeEase::Adapter
  class Mite
    def body
      {
        time_entry: {
          date_at:    "YYYY-MM-DD",
          minutes:    185,
          project_id: 111,
          service_id: 123
        }
      }.to_json
    end
  end
end
