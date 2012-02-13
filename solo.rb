require File.expand_path("../handler", __FILE__)

report_handlers << Prototyping::AuditHandler.new
exception_handlers << Prototyping::AuditHandler.new

cookbook_path File.expand_path('../books', __FILE__)

