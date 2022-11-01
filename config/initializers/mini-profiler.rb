if Rails.env == 'staging'
    Rack::MiniProfilerRails.initialize!(Rails.application)
end

Rack::MiniProfiler.config.position = 'bottom-left'