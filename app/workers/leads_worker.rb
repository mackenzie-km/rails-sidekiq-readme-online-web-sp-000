# app/workers/leads_worker.rb

class LeadsWorker
  include Sidekiq::Worker

  def perform(leads_file)
    CSV.foreach(leads_file.path, headers: true) do |lead|
      Customer.create(email: lead[0], first_name: lead[1], last_name: lead[2])
    end
  end
end
