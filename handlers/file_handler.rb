class FileHandler
  def initialize(params)
    @data_folder = params[:folder] || 'data'
    @data_filename = params[:filename]
  end

  def full_path
    "#{@data_folder}/#{@data_filename}"
  end

  def read_file(path)
    File.read(path)
  end

  def write_file(path, content)
    File.write(path, content)
    true
  end

  def make_dir(path)
    Dir.mkdir(path)
  end

  def dir_exist?(path)
    Dir.exist?(path)
  end

  def file_exist?(path)
    File.exist?(path)
  end

  def file_empty?(path)
    File.empty?(path)
  end

  def save(data)
    make_dir(@data_folder) unless dir_exist?(@data_folder)

    file_content = data.map { |obj| JSON.generate(obj, { max_nesting: false }) }
    write_file(full_path, file_content.join("\n"))
  end

  def load
    return [] unless file_exist?(full_path)
    return [] if file_empty?(full_path)

    file = read_file(full_path)
    file.split("\n")
  end
end
