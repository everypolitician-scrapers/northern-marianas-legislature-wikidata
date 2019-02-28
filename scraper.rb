#!/bin/env ruby
# frozen_string_literal: true

require 'wikidata/fetcher'

query = 'SELECT DISTINCT ?item { ?item wdt:P39 wd:Q61911728 }'
ids = EveryPolitician::Wikidata.sparql(query)

names = EveryPolitician::Wikidata.wikipedia_xpath(
  url:    'https://en.wikipedia.org/wiki/Northern_Mariana_Islands_House_of_Representatives',
  after:  '//span[@id="Members.2C_21st_Legislature"]',
  before: '//span[@id="See_also"]',
  xpath:  '//table[.//th[.="Name"]]//td[position() = last() - 1]//a[not(@class="new")]/@title',
)

EveryPolitician::Wikidata.scrape_wikidata(ids: ids, names: { en: names })
