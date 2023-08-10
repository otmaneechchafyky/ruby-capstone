class Collection
  attr_reader :collection

  def initialize(params)
    @collection = params[:collection] || []
  end

  def create_new
    raise NotImplementedError, "🚨 #{self.class} has not implemented method '#{__method__}' yet!"
  end

  def all
    @collection
  end

  def select(index)
    return @collection[index] unless empty?

    false
  end

  def list_all
    puts @collection
    true
  end

  def empty?
    @collection.empty?
  end

  private

  def already_has(params = {})
    return false if empty? || params.empty?

    matches = []
    @collection.find do |elem|
      matches = params.keys.map do |key|
        next unless elem.respond_to?(key)

        elem.send(key).eql?(params[key])
      end
      matches.all?
    end
  end

  def create_params
    raise NotImplementedError, "🚨 #{self.class} has not implemented method '#{__method__}' yet!"
  end
end
