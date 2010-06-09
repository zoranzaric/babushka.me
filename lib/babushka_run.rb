class BabushkaRun < Struct.new(:dep_spec)
  def perform
    output = `babushka '#{dep_spec}' --defaults`.chomp
    raise "babushka run failed" unless $? == 0
  end
end
