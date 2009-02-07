module ViewHelpers
  def javascript_tag(name)
    %{<script src="/assets/#{name}.js" type="application/x-javascript"></script>}
  end
  
  def javascripts
    @javascripts ||= []
    @javascripts.flatten!
    @javascripts.uniq!
    @javascripts
  end
end