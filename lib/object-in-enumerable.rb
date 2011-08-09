require "object-in-enumerable/version"

module ObjectInEnumerable
  def in?(enum)
    enum.respond_to?(:include?) ? enum.include?(self) : nil
  end

  def not_in?(enum)
    enum.respond_to?(:include?) ? !enum.include?(self) : nil
  end
end

class Object
  include ObjectInEnumerable
end
