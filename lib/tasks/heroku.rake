namespace :heroku do
  task :autoscale => :environment do
    
    class CustomLogger < Logger
      def error(e)
        ExceptionNotifier::Notifier.background_exception_notification(e, :data => {
          :source => "Heroku Autoscaler"
        })
        super
      end
    end
    Clockwork.config[:logger] = CustomLogger.new(STDOUT)
    
    # Send Autoscale requests
    Clockwork.every(1.minutes, "autoscale.request") {
      resp = HTTParty.get(ENV['AUTOSCALE_URL'])
      puts resp
    }
    Clockwork.run
  end
end
