class BaseService
  def self.call(*args)
    new(*args).tap(&:call)
  end
end
