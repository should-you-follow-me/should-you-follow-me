module StatusesMetrics
  module Java
    WORDS = ['java', 'jsf', 'hibernate']
    def self.score
      { status_java: -10 }
    end
  end

  module RubyOrRails
    WORDS = ['ruby', 'rails']
    def self.score
      { status_ruby_rails: 20 }
    end
  end

  module Javascript
    WORDS = ['js', 'javascript', 'node', 'nodejs']
    def self.score
      { status_javascript: 20 }
    end
  end
end