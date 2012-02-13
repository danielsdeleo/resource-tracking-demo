
class Chef
  class RunContext
    attr_accessor :run_id
  end
end

module Prototyping

  class SetupRunID < Chef::Handler
    def report
    end
  end

  class AuditHandler < Chef::Handler
    def report
      puts "* " * 40
      puts "#{run_context.resource_updates.size} Resources Updated"
      puts "\n"
      run_context.resource_updates.each {|update| puts update.display; puts "\n"}
      puts "* " * 40
    end
  end

end

