Settings = RecursiveOpenStruct.new(YAML.load_file('config/settings.yml')[Rails.env])
