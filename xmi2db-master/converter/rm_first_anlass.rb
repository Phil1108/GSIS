require 'xml'
require 'json'

def usage
	puts 'Usage: ruby rm_first_anlass.rb infile [outfile]'
	puts 'Liest infile, entfernt den ersten Anlass falls es zwei gibt und schreibt das Ergebnis nach outfile.'
end

infile = ARGV[0] || ''
if !(File.exist? infile)
  usage
	puts "Abbruch! Kann Eingabedatei #{infile} nicht finden."
	exit
end

outfile = ARGV[1] || ''
if !File.exist? outfile
	outfile  = "#{File.dirname(infile)}/#{File.basename(infile, ".*")}_rm#{File.extname(infile)}"
end

start = Time.now

r = XML::Reader.file infile
w = XML::Writer.file outfile
w.set_indent('  ')
first_row = true
last_depth = 0
elements = []
is_anlass = false
num_anlass = 0 
write = true

replcmnts = 0

while r.read
	# start the document
	if first_row
		w.start_document(:encoding => r.encoding)
		first_row = false
	end

	name = r.name

	# umzubenennende Features sind erst ab Tiefe 4
	if r.depth > 3
		if r.depth > last_depth
			elements.push r.name 
		elsif r.depth == last_depth
			elements.pop
			elements.push r.name
		else
			elements.pop
		end

		rename_path = elements.join('_')
		last_depth = r.depth
	end

	if (!rename_path.nil? and rename_path.downcase == "wfs:property_wfs:name_#text" and r.value.downcase == "adv:anlass")
		if is_anlass
			is_anlass = false
			write = true
		else
			is_anlass = true
			num_anlass += 1
			write = false
		end
	end

	if (is_anlass and rename_path.downcase == "wfs:property_wfs:value_#text")
		first_anlass_value = r.value.encode(:xml => :text)
	end

	if (is_anlass and rename_path.downcase == "ogc:filter")
		w.write_raw 'adv:anlass'
		w.end_element
		w.start_element 'wfs:Value'
		w.write_raw first_anlass_value
		w.end_element
		w.end_element
		is_anlass = false
		write = true
	end
	if (write)
		case r.node_type
			when XML::Reader::TYPE_COMMENT
				w.write_comment r.value
			when XML::Reader::TYPE_ELEMENT
				w.start_element name
				start_element_empty = r.empty_element?
				r.attribute_count.times do |i|
					r.move_to_next_attribute
					w.write_attribute r.name, r.value
				end
				w.end_element if start_element_empty
			when XML::Reader::TYPE_TEXT
				w.write_raw r.value.encode(:xml => :text)
			when XML::Reader::TYPE_END_ELEMENT
				w.end_element
		end
	end
end

finish = Time.now

#puts "Ausgabedatei: #{outfile}"
#puts "Ausfuehrungszeit: #{(finish - start).round(2)} Sekunden"
#puts "Loeschungen: #{num_anlass}"