// Edge properties: To demonstrate usage of edge properties as assignment requires, we flattened LeaseOffer relationship and added more detailed description of relations we use.
//                  We added language proficiency to 'knows language' association and 'type of author' to 'has author' association. Author can be writer but also translator.

CREATE (en:Language { name: 'English', description: 'English is a West Germanic language of the Indo-European language family.', tag: 'en' })
CREATE (cs:Language { name: 'Czech', description: 'Spoken by over 10 million people, it serves as the official language of the Czech Republic.', tag: 'cs'})
CREATE (sk:Language { name: 'Slovak', description: 'Slovak is the language spoken in Slovakia. It is a language from Slavic language family.', tag: 'sk'})

// Authors
CREATE (tolkien:Author { familyName: 'Tolkien', givenName: ['John', 'Ronald', 'Reul'], birthDate: '1892-01-03'})
CREATE (carnegie:Author { familyName: 'Carnegie', givenName: 'Dale', birthDate: '1888-11-24'})
CREATE (huxley:Author { familyName: 'Huxley', givenName: ['Aldous', 'Leonard'], birthDate: '1894-07-26'})

CREATE (tolkien)-[:KNOWS_LANGUAGE { proficiency: 'native' }]->(en)
CREATE (carnegie)-[:KNOWS_LANGUAGE { proficiency: 'native' }]->(en)
CREATE (huxley)-[:KNOWS_LANGUAGE { proficiency: 'native' }]->(en)

// Genres
CREATE (fantasy:Genre { name: 'Fantasy', description: 'Fantasy is a genre of speculative fiction involving magical elements, typically set in a fictional universe and sometimes inspired by mythology and folklore.'})
CREATE (nonfiction:Genre { name: 'Nonfiction', description: 'Nonfiction is any document or media content that attempts to provide accurate information regarding a real-world topic. It is written to communicate facts or opinions about reality.'})
CREATE (fiction:Genre { name: 'Fiction', description: 'Science fiction (sci-fi) is a form of fiction that deals principally with the impact of actual or imagined science upon society or individuals.'})

// Books - originals
CREATE (fellowship:Book { isbn: '9780345339706', name: 'The Fellowship of the Ring (The Lord of the Rings, Part 1)', keywords: ['middle-earth', 'quest']})
CREATE (howToWinFriends:Book { isbn: '9781785042409', name: 'How to Win Friends and Influence People', keywords: ['communication', 'speaking']})
CREATE (braveNewWorld:Book { isbn: '9780099518471', name: 'Brave New World', keywords: ['society', 'future', 'dystopia']})

CREATE (fellowship)-[:IN_LANGUAGE]->(en)
CREATE (howToWinFriends)-[:IN_LANGUAGE]->(en)
CREATE (braveNewWorld)-[:IN_LANGUAGE]->(en)

CREATE (fellowship)-[:IN_GENRE]->(fantasy)
CREATE (howToWinFriends)-[:IN_GENRE]->(nonfiction)
CREATE (braveNewWorld)-[:IN_GENRE]->(fiction)

CREATE (fellowship)-[:HAS_AUTHOR { type: 'writer' } ]->(tolkien)
CREATE (howToWinFriends)-[:HAS_AUTHOR { type: 'writer' } ]->(carnegie)
CREATE (braveNewWorld)-[:HAS_AUTHOR { type: 'writer' } ]->(huxley)

// Books - translations
CREATE (spolecenstvo:Book { isbn: '9780395974681', name: 'Společenstvo prstenu', keywords: ['middle-earth', 'quest']})
CREATE (jakZiskavatPratele:Book { isbn: '9788073065195', name: 'Jak získávat přátele a působit na lidi', keywords: ['communication', 'speaking']})
CREATE (prekrasnyNovySvet:Book { isbn: '9788080618643', name: 'Prekrásny nový svet', keywords: ['society', 'future', 'dystopia']})

CREATE (spolecenstvo)-[:IN_LANGUAGE]->(cs)
CREATE (jakZiskavatPratele)-[:IN_LANGUAGE]->(cs)
CREATE (prekrasnyNovySvet)-[:IN_LANGUAGE]->(sk)

CREATE (spolecenstvo)-[:IN_GENRE]->(fantasy)
CREATE (jakZiskavatPratele)-[:IN_GENRE]->(nonfiction)
CREATE (prekrasnyNovySvet)-[:IN_GENRE]->(fiction)

CREATE (spolecenstvo)-[:TRANSLATION_OF]->(fellowship)
CREATE (jakZiskavatPratele)-[:TRANSLATION_OF]->(howToWinFriends)
CREATE (braveNewWorld)-[:TRANSLATION_OF]->(prekrasnyNovySvet)

CREATE (fellowship)-[:HAS_AUTHOR { type: 'writer' } ]->(tolkien)
CREATE (howToWinFriends)-[:HAS_AUTHOR { type: 'writer' } ]->(carnegie)
CREATE (braveNewWorld)-[:HAS_AUTHOR { type: 'writer' } ]->(huxley)

// Libraries
CREATE (krajskaPce:Library { name: 'Krajská knihovna v Pardubicích', url: 'https://kkpce.cz', email: 'dotazy@kkpce.cz' })
CREATE (knihovnaHk:Library { name: 'Knihovna města Hradce Králové', url: 'https://www.knihovnahk.cz', email: 'knihovna@knihovnahk.cz' })
CREATE (knihovnaBrno:Library { name: 'Moravská zemská knihovna v Brně', url: 'https://www.mzk.cz/', email: 'mzk@mzk.cz' })

// Offers
CREATE (krajskaPce)-[:MAKES_OFFER { availableFrom: '2022-09-13', availableUntil: '2032-09-13', sku: 'KS944RUR', availability: 'available' }]->(fellowship)
CREATE (krajskaPce)-[:MAKES_OFFER { availableFrom: '2020-05-01', availableUntil: '2030-09-01', sku: 'KS945RUR', availability: 'available' }]->(fellowship)
CREATE (knihovnaHk)-[:MAKES_OFFER { availableFrom: '2015-05-01', availableUntil: '2025-09-01', sku: 'KS94HRDC', availability: 'available' }]->(fellowship)
