  TIMELOG_RE = /
    (
    ((\d+)(h|hours?))((\d+)(m|min)?)?
    |
    ((\d+)(h|hours?|m|min))
    |
    (\d+):(\d+)
    |
    (\d+([\.,]\d+)?)h?
    )
    /x

a = "[3263]DayDateCombo [2653] shows different labels for negative days"
ref_keywords = "*".split(",").collect(&:strip)
fix_keywords = "fixes,closes".split(",").collect(&:strip) 
kw_regexp = (ref_keywords + fix_keywords).collect{|kw| Regexp.escape(kw)}.join("|")
#a.scan(/([\s\(\[,-]|^)((#{kw_regexp})[\s:]+)?(#\d+(\s+@#{TIMELOG_RE})?([\s,;&]+#\d+(\s+@#{TIMELOG_RE})?)*)(?=[[:punct:]]|\s|<|$)/i) do |match|
a.scan(/([\s\(\[,-]|^)((#{kw_regexp})[\s:]+)?(\[\d+\](\s+@#{TIMELOG_RE})?([\s,;&]+#\d+(\s+@#{TIMELOG_RE})?)*)(?=[[:punct:]]|\s|<|$)/i) do |match|
	action, refs = match[2], match[3]
	puts "action: " + (match[2] or "null")
	puts "refs: " + (match[3] or "null")

	# refs.scan(/#(\d+)(\s+@#{TIMELOG_RE})?/).each do |m|
	refs.scan(/\[(\d+)\](\s+@#{TIMELOG_RE})?/).each do |m|
		puts "->ref: "+m[0]
	end
end

