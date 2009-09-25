class Object
  # Uses the given enum's include? method to determine whether the object is included in it. If the given method doesn't respond to include?, returns nil.
  def in?(enum)
    enum.respond_to?(:include?) ? enum.include?(self) : nil
  end
  
  def not_in?(enum)
    enum.respond_to?(:include?) ? !enum.include?(self) : nil
  end
end