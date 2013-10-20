Dir["./app/metrics/mentions/*.rb"].each { |file| require file }

class MetricsRunner
  def run(tweets)
    @scores = {}

    Metrics.submodules.each do |sub_module|
      score = sub_module.run(tweets)
      @scores.merge!(score) unless score.nil?
    end

    return @scores
  end
end

class Module
  def submodules
    constants.collect {|const_name| const_get(const_name)}.select {|const| const.class == Module}
  end
end
