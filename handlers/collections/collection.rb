require_relative '../file_handler'

class Collection
  attr_reader :collection

  def initialize(params)
    @storage = FileHandler.new(params)
    @obj = params[:obj]
    @collection = params[:collection] || load(params[:dependencies])
  end

  def save
    return say_nothing_to(self.class.name, 'save') if empty?

    say_saving(self.class.name, @storage.full_path)
    @storage.save(@collection)
    say_saved(@storage.full_path)
    true
  end

  def load(params = {})
    @storage.load.map do |json_elem|
      hash_elem = @obj.from_json(json_elem) unless block_given?
      params[:json] = json_elem unless params.nil?
      obj = yield(params) if block_given?
      obj = @obj.new(hash_elem) unless block_given?
      obj
    end
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

  def select_by(params)
    already_has(params)
  end

  def list_all
    return say_nothing_to(self.class.name, 'list') if empty?

    print_title("List all #{self.class.name}")
    yield if block_given?
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
