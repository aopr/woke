class SavedFeedly < ApplicationRecord
  validates :url, uniqueness: true

############################ TOP Keywords Begin##################################
  def self.gather_headlines #creates array of headlines
    i = 0
    text_to_search = []
    things = SavedFeedly.all
    while i < things.length
      text_to_search << things[i].headline
      i += 1
    end
    return text_to_search
  end

  def self.flatten_text(text_to_search)
    y = text_to_search
    y = y.join(", ").gsub!(/[[:punct:]]/, '') # flattens array into one string based on commas and removes punctuation from inside array
    return y
  end
  def self.sort_words(stuff)     #creates hash of indv words with wordcount
    sorted = stuff.sort_by {|k,v| v}.reverse # builds sorted array with highest first
    return sorted
  end

  def self.add_blacklist_word(word)
   blacklist = %w[rt is about the]  # creates blacklisted words
   blacklist << word
  end

  def self.remove_blacklisted_from_text(sorted)
    blacklist = %w[headlines new, how pallette color your team watch first their out can state trump away it's but if up or do his been if it a no being had as after from like are they our powertv her only day have when need dont don't via him get most really will us my there by she at has me what so etc of a i in you for and with to this on to he amp more we just im who people http https that not be an was rt is about the]  # creates blacklisted words
    blacklist.each do |blacklisted|  #deletes blacklisted words
      sorted.delete_if {|key, value| key == blacklisted}
    end
    return sorted
  end

  def self.count_words(uncounted_words)  #method to count words
    words = uncounted_words.split(' ')
    freq = Hash.new(0)
    words.each { |word| freq[word.downcase] += 1 }
    return freq  #returns hash with freq
  end

  def self.get_top_words(cleaned_and_sorted)
    cleaned_and_sorted[0...19]
    # p "The Top 20 Keywords in tweets are #{cleaned_and_sorted}"
    return cleaned_and_sorted
  end

  def self.top_keywords #search for top words in headlines
    get_top_words(
    remove_blacklisted_from_text(
              sort_words(
              count_words(
              flatten_text(
              gather_headlines)))))
  end
############################### Top Keywords end##################################
############################### Top links Begin##################################
  def self.gather_rss_links #creates array of links
    i = 0
    urls_to_flatten = []
    things = SavedFeedly.all
    while i < things.length
      urls_to_flatten << things[i].url
      i += 1
    end
    return urls_to_flatten
  end

  def self.flatten_urls(urls_to_flatten) #puts feed urls into a string
    y = urls_to_flatten
    y = y.join(", ")
  end
  def self.count_urls(uncounted_urls) #counts flattened urls and builds a hash
    urls = uncounted_urls.split(',')
    freq = Hash.new(0)
    urls.each { |url| freq[url.downcase] += 1 }
    return freq  #returns hash with freq
  end

  def self.get_top_links #search for top links in RSS feed
    get_top_words(
              sort_words(
              count_urls(
              flatten_urls(
              gather_links))))
  end

end
