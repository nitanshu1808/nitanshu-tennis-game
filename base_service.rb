class BaseService
  def self.start(*args)
    new(*args).tap(&:start)
  end
end
