# config/initializers/prometheus_exporter.rb
if Rails.env.development? || Rails.env.production?
  require 'prometheus_exporter/instrumentation'
  require 'prometheus_exporter/middleware'

  # Rack middleware: expose /metrics on the main app
  Rails.application.middleware.unshift PrometheusExporter::Middleware

  PrometheusExporter::Instrumentation::ActiveRecord.start
end
