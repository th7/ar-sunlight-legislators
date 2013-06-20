class CongressMemberScrubber
  def self.scrub(congress_members)
    congress_members.each do |cm|
      cm.attributes.each do |key, value|
        cm.send(key+'=', nil) if value == ''
      end
      cm.save
    end
  end
end
