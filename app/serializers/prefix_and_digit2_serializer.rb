class PrefixAndDigit2Serializer < ActiveModel::Serializer
  



  attributes  :prefix, :minimum_digits







attribute :use_auto_generated_number, if: :include_autogenerated_number? 


def include_autogenerated_number?
  instance_options[:context][:use_auto_generated_number] == true
end



def use_auto_generated_number
  true
end



end
