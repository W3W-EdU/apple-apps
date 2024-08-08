import Foundation

extension Domain {
  typealias DomainName = String
  typealias GroupIndex = Int

  static let linkedDomainsGroups: [[DomainName]] = [
    [
      "aa.com",
      "americanairlines.com",
      "americanairlines.jp",
    ],
    [
      "aeromexico.com",
      "clubpremier.com",
    ],
    [
      "aetna.com",
      "myplanportal.com",
    ],
    [
      "airfrance.com",
      "klm.com",
      "flyingblue.com",
    ],
    [
      "albertsons.com",
      "acmemarkets.com",
      "carrsqc.com",
      "jewelosco.com",
      "pavilions.com",
      "randalls.com",
      "safeway.com",
      "shaws.com",
      "starmarket.com",
      "tomthumb.com",
      "vons.com",
    ],
    [
      "airbnb.com.ar",
      "airbnb.com.au",
      "airbnb.at",
      "airbnb.be",
      "airbnb.com.bz",
      "airbnb.com.bo",
      "airbnb.com.br",
      "airbnb.ca",
      "airbnb.cl",
      "airbnb.com.co",
      "airbnb.co.cr",
      "airbnb.cz",
      "airbnb.dk",
      "airbnb.com.ec",
      "airbnb.com.sv",
      "airbnb.fi",
      "airbnb.fr",
      "airbnb.de",
      "airbnb.gr",
      "airbnb.com.gt",
      "airbnb.gy",
      "airbnb.com.hn",
      "airbnb.com.hk",
      "airbnb.hu",
      "airbnb.is",
      "airbnb.co.in",
      "airbnb.co.id",
      "airbnb.ie",
      "airbnb.it",
      "airbnb.jp",
      "airbnb.com.my",
      "airbnb.com.mt",
      "airbnb.mx",
      "airbnb.nl",
      "airbnb.co.nz",
      "airbnb.com.ni",
      "airbnb.no",
      "airbnb.com.pa",
      "airbnb.com.py",
      "airbnb.com.pe",
      "airbnb.pl",
      "airbnb.pt",
      "airbnb.ru",
      "airbnb.com.sg",
      "airbnb.co.kr",
      "airbnb.es",
      "airbnb.se",
      "airbnb.ch",
      "airbnb.com.tw",
      "airbnb.com.tr",
      "airbnb.co.uk",
      "airbnb.com",
      "airbnb.co.ve",
    ],
    [
      "alibaba.com",
      "aliexpress.com",
      "aliexpress.ru",
    ],
    [
      "amazon.com",
      "amazon.ae",
      "amazon.com.au",
      "amazon.com.br",
      "amazon.ca",
      "amazon.fr",
      "amazon.de",
      "amazon.in",
      "amazon.it",
      "amazon.com.mx",
      "amazon.nl",
      "amazon.es",
      "amazon.com.tr",
      "amazon.co.uk",
      "amazon.sa",
      "amazon.sg",
      "amazon.se",
      "amazon.pl",
    ],
    [
      "amcrestcloud.com",
      "amcrestview.com",
    ],
    [
      "americastestkitchen.com",
      "cooksillustrated.com",
      "cookscountry.com",
      "onlinecookingschool.com",
    ],
    [
      "ancestry.com",
      "ancestry.ca",
      "ancestry.co.uk",
      "ancestry.com.au",
      "ancestry.de",
      "ancestry.fr",
      "ancestry.it",
      "ancestry.mx",
      "ancestry.se",
      "ancestry.ie",
      "ancestry.pl",
    ],
    [
      "anthem.com",
      "sydneyhealth.com",
    ],
    [
      "apple.com",
      "icloud.com",
    ],
    [
      "att.com",
      "att.net",
    ],
    [
      "autohebdo.net",
      "autotrader.ca",
    ],
    [
      "backcountry.com",
      "competitivecyclist.com",
    ],
    [
      "backmarket.be",
      "backmarket.fr",
    ],
    [
      "bahn.de",
      "bahn.com",
    ],
    [
      "bayard-jeunesse.com",
      "milan-jeunesse.com",
    ],
    [
      "bilka.dk",
      "br.dk",
      "foetex.dk",
    ],
    [
      "bbc.com",
      "bbc.co.uk",
    ],
    [
      "beachbodyondemand.com",
      "teambeachbody.com",
    ],
    [
      "beavercreek.com",
      "breckenridge.com",
      "epicpass.com",
      "keystoneresort.com",
      "kirkwood.com",
      "mountsunapee.com",
      "northstarcalifornia.com",
      "okemo.com",
      "parkcitymountain.com",
      "skicb.com",
      "skiheavenly.com",
      "snow.com",
      "stevenspass.com",
      "stowe.com",
      "vail.com",
      "whistlerblackcomb.com",
    ],
    [
      "bedbathandbeyond.com",
      "buybuybaby.com",
    ],
    [
      "boudinbakery.com",
      "boudincatering.com",
    ],
    [
      "cathaypacific.com",
      "asiamiles.com",
    ],
    [
      "centralfcu.org",
      "centralfcu.com",
    ],
    [
      "cision.com",
      "prnewswire.com",
    ],
    [
      "citi.com",
      "citicards.com",
    ],
    [
      "classicalradio.com",
      "di.fm",
      "jazzradio.com",
      "radiotunes.com",
      "rockradio.com",
      "zenradio.com",
    ],
    [
      "coolblue.nl",
      "coolblue.be",
      "coolblue.de",
    ],
    [
      "curbed.com",
      "grubstreet.com",
      "nymag.com",
      "thecut.com",
      "vulture.com",
    ],
    [
      "dinersclubnorthamerica.com",
      "dinersclubus.com",
    ],
    [
      "discordmerch.com",
      "discord.store",
    ],
    [
      "dish.com",
      "mydish.com",
      "dishnetwork.com",
    ],
    [
      "drivethrurpg.com",
      "drivethrucards.com",
      "drivethrucomics.com",
      "drivethrufiction.com",
      "wargamevault.com",
      "storytellersvault.com",
      "dmsguild.com",
      "ulisses-ebooks.de",
      "pegasusdigital.de",
    ],
    [
      "ebgames.com.au",
      "zingpopculture.com.au",
    ],
    [
      "epicgames.com",
      "unrealengine.com",
    ],
    [
      "shopdisney.com",
      "go.com",
      "disneylandparis.com",
      "shopdisney.fr",
      "shopdisney.co.uk",
      "shopdisney.de",
      "shopdisney.es",
      "shopdisney.eu",
      "shopdisney.it",
      "marvel.com",
      "espn.com",
      "disneyworld.eu",
      "d23.com",
      "thewaltdisneycompany.com",
      "starwars.com",
      "fxnetworks.com",
      "disneymovieinsiders.com",
      "abc.com",
    ],
    [
      "docusign.com",
      "docusign.net",
    ],
    [
      "ebay.at",
      "ebay.be",
      "ebay.ca",
      "ebay.ch",
      "ebay.cn",
      "ebay.co.th",
      "ebay.co.uk",
      "ebay.com",
      "ebay.com.au",
      "ebay.com.hk",
      "ebay.com.my",
      "ebay.com.sg",
      "ebay.com.tw",
      "ebay.de",
      "ebay.es",
      "ebay.fr",
      "ebay.ie",
      "ebay.it",
      "ebay.nl",
      "ebay.ph",
      "ebay.pl",
      "ebay.vn",
    ],
    [
      "eckerle.de",
      "hirmer.de",
    ],
    [
      "envato.com",
      "themeforest.net",
      "codecanyon.net",
      "videohive.net",
      "audiojungle.net",
      "graphicriver.net",
      "placeit.net",
      "photodune.net",
      "tutsplus.com",
      "3docean.net",
    ],
    [
      "eventbrite.at",
      "eventbrite.be",
      "eventbrite.ca",
      "eventbrite.ch",
      "eventbrite.cl",
      "eventbrite.co",
      "eventbrite.co.uk",
      "eventbrite.co.nz",
      "eventbrite.com",
      "eventbrite.com.au",
      "eventbrite.com.br",
      "eventbrite.com.ar",
      "eventbrite.com.mx",
      "eventbrite.com.pe",
      "eventbrite.de",
      "eventbrite.dk",
      "eventbrite.es",
      "eventbrite.fi",
      "eventbrite.fr",
      "eventbrite.hk",
      "eventbrite.ie",
      "eventbrite.in",
      "eventbrite.it",
      "eventbrite.my",
      "eventbrite.nl",
      "eventbrite.ph",
      "eventbrite.pt",
      "eventbrite.se",
      "eventbrite.sg",
    ],
    [
      "expedia.com",
      "expedia.se",
      "expedia.ru",
      "expedia.no",
      "expedia.nl",
      "expedia.mx",
      "expedia.it",
      "expedia.gr",
      "expedia.fr",
      "expedia.fi",
      "expedia.es",
      "expedia.dk",
      "expedia.de",
      "expedia.com.vn",
      "expedia.com.tw",
      "expedia.com.sg",
      "expedia.com.ph",
      "expedia.com.my",
      "expedia.com.hk",
      "expedia.com.br",
      "expedia.com.au",
      "expedia.com.ar",
      "expedia.co.uk",
      "expedia.co.th",
      "expedia.co.nz",
      "expedia.co.kr",
      "expedia.co.jp",
      "expedia.co.in",
      "expedia.co.id",
      "expedia.cn",
      "expedia.ch",
      "expedia.cat",
      "expedia.ca",
      "expedia.be",
      "expedia.at",
    ],
    [
      "expressvpn.com",
      "expressvpn.net",
    ],
    [
      "facebook.com",
      "messenger.com",
    ],
    [
      "fandango.com",
      "fandangonow.com",
    ],
    [
      "findmypast.co.uk",
      "findmypast.com",
      "findmypast.com.au",
      "findmypast.ie",
    ],
    [
      "firstbanktexas.com",
      "savvyatfirstbanklubbock.com",
    ],
    [
      "fnac.com",
      "fnacspectacles.com",
    ],
    [
      "fourleaf.net",
      "fourleaf.cl",
    ],
    [
      "foursquare.com",
      "swarmapp.com",
    ],
    [
      "francetelevisions.fr",
      "france.tv",
    ],
    [
      "fxcm.com",
      "myfxcm.com",
    ],
    [
      "glassdoor.com",
      "glassdoor.com.ar",
      "glassdoor.com.au",
      "glassdoor.com.br",
      "glassdoor.com.hk",
      "glassdoor.com.mx",
      "glassdoor.co.in",
      "glassdoor.co.nz",
      "glassdoor.co.uk",
      "glassdoor.at",
      "glassdoor.ch",
      "glassdoor.sg",
      "glassdoor.ie",
      "glassdoor.it",
      "glassdoor.nl",
      "glassdoor.es",
      "glassdoor.de",
      "glassdoor.ca",
      "glassdoor.fr",
      "glassdoor.be",
    ],
    [
      "gmx.at",
      "gmx.net",
    ],
    [
      "gogoair.com",
      "gogoinflight.com",
    ],
    [
      "hcsc.net",
      "bcbsil.com",
    ],
    [
      "hertz.com",
      "hertz.fr",
      "hertz.ch",
      "hertz.nl",
      "hertz.de",
      "hertz.co.uk",
    ],
    [
      "hilton.com",
      "hiltonhonors.com",
    ],
    [
      "impresa.pt",
      "sic.pt",
      "expresso.pt",
      "expressoemprego.pt",
      "bpiexpressoimobiliario.pt",
    ],
    [
      "instagram.com",
      "threads.net",
    ],
    [
      "interactivebrokers.co.uk",
      "interactivebrokers.com",
      "interactivebrokers.ca",
      "interactivebrokers.com.hk",
      "interactivebrokers.co.in",
      "interactivebrokers.co.jp",
      "interactivebrokers.com.au",
    ],
    [
      "intuit.com",
      "mint.com",
    ],
    [
      "jobleads.com",
      "jobleads.de",
      "jobleads.fr",
      "jobleads.it",
      "jobleads.co.uk",
      "jobleads.ca",
      "jobleads.mx",
    ],
    [
      "kaiserpermanente.org",
      "kp.org",
    ],
    [
      "kayak.com",
      "kayak.ae",
      "kayak.com.ar",
      "kayak.com.au",
      "kayak.com.br",
      "kayak.ch",
      "kayak.cl",
      "kayak.com.co",
      "kayak.de",
      "kayak.dk",
      "kayak.es",
      "kayak.fr",
      "kayak.co.uk",
      "kayak.com.hk",
      "kayak.co.id",
      "kayak.ie",
      "kayak.co.in",
      "kayak.it",
      "kayak.co.jp",
      "kayak.co.kr",
      "kayak.com.mx",
      "kayak.com.my",
      "kayak.nl",
      "kayak.no",
      "kayak.com.pe",
      "kayak.com.ph",
      "kayak.pl",
      "kayak.pt",
      "kayak.ru",
      "kayak.sa",
      "kayak.se",
      "kayak.sg",
      "kayak.co.th",
      "kayak.com.tr",
    ],
    [
      "landmarkcu.com",
      "landmarkcuonline.com",
    ],
    [
      "loiselet-daigremont.com",
      "loiselet-daigremont.fr",
    ],
    [
      "lookmark.io",
      "lookmark.link",
    ],
    [
      "lrz.de",
      "mwn.de",
      "mytum.de",
      "tum.de",
    ],
    [
      "lufthansa.com",
      "miles-and-more.com",
      "swiss.com",
    ],
    [
      "marriott.com",
      "marriottrewards.com",
      "ritzcarlton.com",
      "spg.com",
      "starwoodhotels.com",
    ],
    [
      "e.leclerc",
      "auto.leclerc",
      "leclercdrive.fr",
      "location.leclerc",
      "chezmoi.leclerc",
      "traiteur.leclerc",
      "mesrecettes.leclerc",
    ],
    [
      "live.com",
      "microsoftonline.com",
      "office.com",
    ],
    [
      "markandgraham.com",
      "pbteen.com",
      "potterybarn.com",
      "williams-sonoma.com",
    ],
    [
      "ml.com",
      "merrill.com",
      "merrilledge.com",
    ],
    [
      "mojang.com",
      "minecraft.net",
    ],
    [
      "morrisons.com",
      "mymorrisons.com",
    ],
    [
      "myheritage.com",
      "myheritage.fr",
      "myheritage.no",
      "myheritage.nl",
      "myheritage.co.il",
      "myheritage.de",
      "myheritage.se",
      "myheritage.dk",
    ],
    [
      "myringgo.com",
      "myringgo.co.uk",
    ],
    [
      "mytoys.de",
      "mirapodo.de",
    ],
    [
      "nextinpact.com",
      "inpact-hardware.com",
    ],
    [
      "nintendolife.com",
      "purexbox.com",
      "pushsquare.com",
    ],
    [
      "nokia.com",
      "withings.com",
    ],
    [
      "norwegianreward.com",
      "norwegian.com",
    ],
    [
      "oesterreich.gv.at",
      "handy-signatur.at",
    ],
    [
      "oneazcu.com",
      "oneazcreditunion.com",
    ],
    [
      "opendsn.com",
      "dnsomatic.com",
    ],
    [
      "opentable.com",
      "opentable.co.uk",
      "opentable.de",
      "opentable.jp",
      "opentable.com.au",
      "opentable.com.mx",
      "opentable.ie",
    ],
    [
      "optumrx.com",
      "optum.com",
    ],
    [
      "parsec.app",
      "parsecgaming.com",
    ],
    [
      "pinterest.com",
      "pinterest.ca",
      "pinterest.co.uk",
      "pinterest.fr",
      "pinterest.de",
      "pinterest.es",
      "pin.it",
      "pinterest.com.au",
      "pinterest.se",
      "pinterest.ph",
      "pinterest.ch",
      "pinterest.com.mx",
      "pinterest.dk",
      "pinterest.pt",
      "pinterest.ru",
      "pinterest.it",
      "pinterest.at",
      "pinterest.jp",
      "pinterest.cl",
      "pinterest.ie",
      "pinterest.co.kr",
      "pinterest.nz",
      "pintrest.com",
    ],
    [
      "pocket.com",
      "getpocket.com",
    ],
    [
      "poshmark.com",
      "poshmark.ca",
      "poshmark.com.au",
    ],
    [
      "post.at",
      "shoepping.at",
    ],
    [
      "postman.com",
      "getpostman.com",
    ],
    [
      "potterybarnkids.co.uk",
      "westelm.co.uk",
    ],
    [
      "priorityguestrewards.com",
      "aturahotels.com",
      "independentcollection.com.au",
      "qthotels.com",
      "rydges.com",
    ],
    [
      "probikeshop.fr",
      "bikeshop.es",
      "probikeshop.it",
      "probikeshop.pt",
      "probikeshop.com",
    ],
    [
      "proton.me",
      "protonvpn.com",
    ],
    [
      "prusa3d.com",
      "prusaprinters.org",
    ],
    [
      "pornhub.com",
      "pornhubpremium.com",
    ],
    [
      "postnl.nl",
      "postnl.be",
    ],
    [
      "rakuten.com",
      "rakuten.tv",
    ],
    [
      "riotgames.com",
      "leagueoflegends.com",
    ],
    [
      "sas.dk",
      "sas.no",
      "sas.se",
      "sas.fi",
      "flysas.com",
    ],
    [
      "saxoinvestor.fr",
      "saxoinvestor.com",
      "saxotrader.com",
      "saxotrader.fr",
    ],
    [
      "scholarshare529.com",
      "secureaccountview.com",
    ],
    [
      "schweizmobil.ch",
      "schweizmobilplus.ch",
      "suissemobileplus.ch",
    ],
    [
      "scribbr.com",
      "scribbr.de",
      "scribbr.dk",
      "scribbr.es",
      "scribbr.fi",
      "scribbr.fr",
      "scribbr.it",
      "scribbr.nl",
      "scribbr.no",
      "scribbr.se",
    ],
    [
      "shopperplus.ca",
      "123ink.ca",
      "primecables.ca",
      "living.ca",
    ],
    [
      "sncf.com",
      "sncf-connect.com",
      "monidentifiant.sncf",
      "tgvinoui.sncf",
      "tgvinouipro.sncf",
    ],
    [
      "sodexo.com",
      "sodexopass.fr",
    ],
    [
      "sony.com",
      "sonyentertainmentnetwork.com",
    ],
    [
      "spark.net",
      "jdate.com",
    ],
    [
      "splitser.com",
      "wiebetaaltwat.nl",
    ],
    [
      "stackoverflow.com",
      "askubuntu.com",
      "serverfault.com",
      "stackexchange.com",
      "superuser.com",
    ],
    [
      "starwellness.org",
      "slhn.org",
    ],
    [
      "steampowered.com",
      "steamcommunity.com",
      "steamgames.com",
    ],
    [
      "surveymonkey.com",
      "surveymonkey.de",
      "surveymonkey.co.uk",
      "surveymonkey.ru",
    ],
    [
      "telecentro.com.ar",
      "telecentroplay.com.ar",
    ],
    [
      "tesla.com",
      "teslamotors.com",
    ],
    [
      "thefork.com",
      "thefork.at",
      "thefork.fr",
      "thefork.ch",
      "thefork.no",
      "thefork.de",
      "thefork.co.uk",
      "thefork.com.au",
    ],
    [
      "ticketcorner.ch",
      "fansale.ch",
    ],
    [
      "ticketmaster.com",
      "livenation.com",
    ],
    [
      "trello.com",
      "atlassian.com",
    ],
    [
      "twitter.com",
      "x.com",
    ],
    [
      "ubisoft.com",
      "ubi.com",
      "ubisoftconnect.com",
    ],
    [
      "uhaul.com",
      "movinghelp.com",
    ],
    [
      "uhc.com",
      "myuhc.com",
      "healthsafe-id.com",
    ],
    [
      "umsystem.edu",
      "mst.edu",
      "umkc.edu",
      "umsl.edu",
      "missouri.edu",
    ],
    [
      "united.com",
      "unitedwifi.com",
    ],
    [
      "uspowerboating.com",
      "ussailing.org",
    ],
    [
      "verizonwireless.com",
      "vzw.com",
    ],
    [
      "walgreens.com",
      "alliancerxwp.com",
    ],
    [
      "wayfair.com",
      "wayfair.co.uk",
      "wayfair.ca",
      "wayfair.de",
      "jossandmain.com",
      "allmodern.com",
      "perigold.com",
      "birchlane.com",
    ],
    [
      "wellsfargo.com",
      "wellsfargoadvisors.com",
    ],
    [
      "wikipedia.org",
      "mediawiki.org",
      "wikibooks.org",
      "wikidata.org",
      "wikinews.org",
      "wikiquote.org",
      "wikisource.org",
      "wikiversity.org",
      "wikivoyage.org",
      "wiktionary.org",
      "wikimedia.org",
    ],
    [
      "wiimmfi.de",
      "wii-homebrew.com",
    ],
    [
      "wilson.com",
      "slugger.com",
      "atecsports.com",
      "demarini.com",
      "evoshield.com",
      "luxilon.com",
    ],
    [
      "wsj.com",
      "dowjones.com",
    ],
    [
      "yandex.ru",
      "yandex.ua",
      "yandex.by",
      "yandex.eu",
      "yandex.ee",
      "yandex.lt",
      "yandex.lv",
      "yandex.md",
      "yandex.uz",
      "yandex.tm",
      "yandex.tj",
      "yandex.az",
      "yandex.com",
      "yandex.co.il",
      "yandex.fr",
      "yandex.com.ge",
      "yandex.com.am",
      "yandex.com.tr",
      "yandex.kz",
      "yandex.kg",
    ],
    [
      "yelp.at",
      "yelp.be",
      "yelp.ca",
      "yelp.ch",
      "yelp.co.uk",
      "yelp.com",
      "yelp.com.ar",
      "yelp.com.br",
      "yelp.de",
      "yelp.dk",
      "yelp.es",
      "yelp.fi",
      "yelp.fr",
      "yelp.ie",
      "yelp.it",
      "yelp.nl",
      "yelp.no",
      "yelp.pt",
      "yelp.se",
    ],
  ]
  static let linkedDomains: [DomainName: GroupIndex] = [
    "aa.com": 0,
    "americanairlines.com": 0,
    "americanairlines.jp": 0,
    "aeromexico.com": 1,
    "clubpremier.com": 1,
    "aetna.com": 2,
    "myplanportal.com": 2,
    "airfrance.com": 3,
    "klm.com": 3,
    "flyingblue.com": 3,
    "albertsons.com": 4,
    "acmemarkets.com": 4,
    "carrsqc.com": 4,
    "jewelosco.com": 4,
    "pavilions.com": 4,
    "randalls.com": 4,
    "safeway.com": 4,
    "shaws.com": 4,
    "starmarket.com": 4,
    "tomthumb.com": 4,
    "vons.com": 4,
    "airbnb.com.ar": 5,
    "airbnb.com.au": 5,
    "airbnb.at": 5,
    "airbnb.be": 5,
    "airbnb.com.bz": 5,
    "airbnb.com.bo": 5,
    "airbnb.com.br": 5,
    "airbnb.ca": 5,
    "airbnb.cl": 5,
    "airbnb.com.co": 5,
    "airbnb.co.cr": 5,
    "airbnb.cz": 5,
    "airbnb.dk": 5,
    "airbnb.com.ec": 5,
    "airbnb.com.sv": 5,
    "airbnb.fi": 5,
    "airbnb.fr": 5,
    "airbnb.de": 5,
    "airbnb.gr": 5,
    "airbnb.com.gt": 5,
    "airbnb.gy": 5,
    "airbnb.com.hn": 5,
    "airbnb.com.hk": 5,
    "airbnb.hu": 5,
    "airbnb.is": 5,
    "airbnb.co.in": 5,
    "airbnb.co.id": 5,
    "airbnb.ie": 5,
    "airbnb.it": 5,
    "airbnb.jp": 5,
    "airbnb.com.my": 5,
    "airbnb.com.mt": 5,
    "airbnb.mx": 5,
    "airbnb.nl": 5,
    "airbnb.co.nz": 5,
    "airbnb.com.ni": 5,
    "airbnb.no": 5,
    "airbnb.com.pa": 5,
    "airbnb.com.py": 5,
    "airbnb.com.pe": 5,
    "airbnb.pl": 5,
    "airbnb.pt": 5,
    "airbnb.ru": 5,
    "airbnb.com.sg": 5,
    "airbnb.co.kr": 5,
    "airbnb.es": 5,
    "airbnb.se": 5,
    "airbnb.ch": 5,
    "airbnb.com.tw": 5,
    "airbnb.com.tr": 5,
    "airbnb.co.uk": 5,
    "airbnb.com": 5,
    "airbnb.co.ve": 5,
    "alibaba.com": 6,
    "aliexpress.com": 6,
    "aliexpress.ru": 6,
    "amazon.com": 7,
    "amazon.ae": 7,
    "amazon.com.au": 7,
    "amazon.com.br": 7,
    "amazon.ca": 7,
    "amazon.fr": 7,
    "amazon.de": 7,
    "amazon.in": 7,
    "amazon.it": 7,
    "amazon.com.mx": 7,
    "amazon.nl": 7,
    "amazon.es": 7,
    "amazon.com.tr": 7,
    "amazon.co.uk": 7,
    "amazon.sa": 7,
    "amazon.sg": 7,
    "amazon.se": 7,
    "amazon.pl": 7,
    "amcrestcloud.com": 8,
    "amcrestview.com": 8,
    "americastestkitchen.com": 9,
    "cooksillustrated.com": 9,
    "cookscountry.com": 9,
    "onlinecookingschool.com": 9,
    "ancestry.com": 10,
    "ancestry.ca": 10,
    "ancestry.co.uk": 10,
    "ancestry.com.au": 10,
    "ancestry.de": 10,
    "ancestry.fr": 10,
    "ancestry.it": 10,
    "ancestry.mx": 10,
    "ancestry.se": 10,
    "ancestry.ie": 10,
    "ancestry.pl": 10,
    "anthem.com": 11,
    "sydneyhealth.com": 11,
    "apple.com": 12,
    "icloud.com": 12,
    "att.com": 13,
    "att.net": 13,
    "autohebdo.net": 14,
    "autotrader.ca": 14,
    "backcountry.com": 15,
    "competitivecyclist.com": 15,
    "backmarket.be": 16,
    "backmarket.fr": 16,
    "bahn.de": 17,
    "bahn.com": 17,
    "bayard-jeunesse.com": 18,
    "milan-jeunesse.com": 18,
    "bilka.dk": 19,
    "br.dk": 19,
    "foetex.dk": 19,
    "bbc.com": 20,
    "bbc.co.uk": 20,
    "beachbodyondemand.com": 21,
    "teambeachbody.com": 21,
    "beavercreek.com": 22,
    "breckenridge.com": 22,
    "epicpass.com": 22,
    "keystoneresort.com": 22,
    "kirkwood.com": 22,
    "mountsunapee.com": 22,
    "northstarcalifornia.com": 22,
    "okemo.com": 22,
    "parkcitymountain.com": 22,
    "skicb.com": 22,
    "skiheavenly.com": 22,
    "snow.com": 22,
    "stevenspass.com": 22,
    "stowe.com": 22,
    "vail.com": 22,
    "whistlerblackcomb.com": 22,
    "bedbathandbeyond.com": 23,
    "buybuybaby.com": 23,
    "boudinbakery.com": 24,
    "boudincatering.com": 24,
    "cathaypacific.com": 25,
    "asiamiles.com": 25,
    "centralfcu.org": 26,
    "centralfcu.com": 26,
    "cision.com": 27,
    "prnewswire.com": 27,
    "citi.com": 28,
    "citicards.com": 28,
    "classicalradio.com": 29,
    "di.fm": 29,
    "jazzradio.com": 29,
    "radiotunes.com": 29,
    "rockradio.com": 29,
    "zenradio.com": 29,
    "coolblue.nl": 30,
    "coolblue.be": 30,
    "coolblue.de": 30,
    "curbed.com": 31,
    "grubstreet.com": 31,
    "nymag.com": 31,
    "thecut.com": 31,
    "vulture.com": 31,
    "dinersclubnorthamerica.com": 32,
    "dinersclubus.com": 32,
    "discordmerch.com": 33,
    "discord.store": 33,
    "dish.com": 34,
    "mydish.com": 34,
    "dishnetwork.com": 34,
    "drivethrurpg.com": 35,
    "drivethrucards.com": 35,
    "drivethrucomics.com": 35,
    "drivethrufiction.com": 35,
    "wargamevault.com": 35,
    "storytellersvault.com": 35,
    "dmsguild.com": 35,
    "ulisses-ebooks.de": 35,
    "pegasusdigital.de": 35,
    "ebgames.com.au": 36,
    "zingpopculture.com.au": 36,
    "epicgames.com": 37,
    "unrealengine.com": 37,
    "shopdisney.com": 38,
    "go.com": 38,
    "disneylandparis.com": 38,
    "shopdisney.fr": 38,
    "shopdisney.co.uk": 38,
    "shopdisney.de": 38,
    "shopdisney.es": 38,
    "shopdisney.eu": 38,
    "shopdisney.it": 38,
    "marvel.com": 38,
    "espn.com": 38,
    "disneyworld.eu": 38,
    "d23.com": 38,
    "thewaltdisneycompany.com": 38,
    "starwars.com": 38,
    "fxnetworks.com": 38,
    "disneymovieinsiders.com": 38,
    "abc.com": 38,
    "docusign.com": 39,
    "docusign.net": 39,
    "ebay.at": 40,
    "ebay.be": 40,
    "ebay.ca": 40,
    "ebay.ch": 40,
    "ebay.cn": 40,
    "ebay.co.th": 40,
    "ebay.co.uk": 40,
    "ebay.com": 40,
    "ebay.com.au": 40,
    "ebay.com.hk": 40,
    "ebay.com.my": 40,
    "ebay.com.sg": 40,
    "ebay.com.tw": 40,
    "ebay.de": 40,
    "ebay.es": 40,
    "ebay.fr": 40,
    "ebay.ie": 40,
    "ebay.it": 40,
    "ebay.nl": 40,
    "ebay.ph": 40,
    "ebay.pl": 40,
    "ebay.vn": 40,
    "eckerle.de": 41,
    "hirmer.de": 41,
    "envato.com": 42,
    "themeforest.net": 42,
    "codecanyon.net": 42,
    "videohive.net": 42,
    "audiojungle.net": 42,
    "graphicriver.net": 42,
    "placeit.net": 42,
    "photodune.net": 42,
    "tutsplus.com": 42,
    "3docean.net": 42,
    "eventbrite.at": 43,
    "eventbrite.be": 43,
    "eventbrite.ca": 43,
    "eventbrite.ch": 43,
    "eventbrite.cl": 43,
    "eventbrite.co": 43,
    "eventbrite.co.uk": 43,
    "eventbrite.co.nz": 43,
    "eventbrite.com": 43,
    "eventbrite.com.au": 43,
    "eventbrite.com.br": 43,
    "eventbrite.com.ar": 43,
    "eventbrite.com.mx": 43,
    "eventbrite.com.pe": 43,
    "eventbrite.de": 43,
    "eventbrite.dk": 43,
    "eventbrite.es": 43,
    "eventbrite.fi": 43,
    "eventbrite.fr": 43,
    "eventbrite.hk": 43,
    "eventbrite.ie": 43,
    "eventbrite.in": 43,
    "eventbrite.it": 43,
    "eventbrite.my": 43,
    "eventbrite.nl": 43,
    "eventbrite.ph": 43,
    "eventbrite.pt": 43,
    "eventbrite.se": 43,
    "eventbrite.sg": 43,
    "expedia.com": 44,
    "expedia.se": 44,
    "expedia.ru": 44,
    "expedia.no": 44,
    "expedia.nl": 44,
    "expedia.mx": 44,
    "expedia.it": 44,
    "expedia.gr": 44,
    "expedia.fr": 44,
    "expedia.fi": 44,
    "expedia.es": 44,
    "expedia.dk": 44,
    "expedia.de": 44,
    "expedia.com.vn": 44,
    "expedia.com.tw": 44,
    "expedia.com.sg": 44,
    "expedia.com.ph": 44,
    "expedia.com.my": 44,
    "expedia.com.hk": 44,
    "expedia.com.br": 44,
    "expedia.com.au": 44,
    "expedia.com.ar": 44,
    "expedia.co.uk": 44,
    "expedia.co.th": 44,
    "expedia.co.nz": 44,
    "expedia.co.kr": 44,
    "expedia.co.jp": 44,
    "expedia.co.in": 44,
    "expedia.co.id": 44,
    "expedia.cn": 44,
    "expedia.ch": 44,
    "expedia.cat": 44,
    "expedia.ca": 44,
    "expedia.be": 44,
    "expedia.at": 44,
    "expressvpn.com": 45,
    "expressvpn.net": 45,
    "facebook.com": 46,
    "messenger.com": 46,
    "fandango.com": 47,
    "fandangonow.com": 47,
    "findmypast.co.uk": 48,
    "findmypast.com": 48,
    "findmypast.com.au": 48,
    "findmypast.ie": 48,
    "firstbanktexas.com": 49,
    "savvyatfirstbanklubbock.com": 49,
    "fnac.com": 50,
    "fnacspectacles.com": 50,
    "fourleaf.net": 51,
    "fourleaf.cl": 51,
    "foursquare.com": 52,
    "swarmapp.com": 52,
    "francetelevisions.fr": 53,
    "france.tv": 53,
    "fxcm.com": 54,
    "myfxcm.com": 54,
    "glassdoor.com": 55,
    "glassdoor.com.ar": 55,
    "glassdoor.com.au": 55,
    "glassdoor.com.br": 55,
    "glassdoor.com.hk": 55,
    "glassdoor.com.mx": 55,
    "glassdoor.co.in": 55,
    "glassdoor.co.nz": 55,
    "glassdoor.co.uk": 55,
    "glassdoor.at": 55,
    "glassdoor.ch": 55,
    "glassdoor.sg": 55,
    "glassdoor.ie": 55,
    "glassdoor.it": 55,
    "glassdoor.nl": 55,
    "glassdoor.es": 55,
    "glassdoor.de": 55,
    "glassdoor.ca": 55,
    "glassdoor.fr": 55,
    "glassdoor.be": 55,
    "gmx.at": 56,
    "gmx.net": 56,
    "gogoair.com": 57,
    "gogoinflight.com": 57,
    "hcsc.net": 58,
    "bcbsil.com": 58,
    "hertz.com": 59,
    "hertz.fr": 59,
    "hertz.ch": 59,
    "hertz.nl": 59,
    "hertz.de": 59,
    "hertz.co.uk": 59,
    "hilton.com": 60,
    "hiltonhonors.com": 60,
    "impresa.pt": 61,
    "sic.pt": 61,
    "expresso.pt": 61,
    "expressoemprego.pt": 61,
    "bpiexpressoimobiliario.pt": 61,
    "instagram.com": 62,
    "threads.net": 62,
    "interactivebrokers.co.uk": 63,
    "interactivebrokers.com": 63,
    "interactivebrokers.ca": 63,
    "interactivebrokers.com.hk": 63,
    "interactivebrokers.co.in": 63,
    "interactivebrokers.co.jp": 63,
    "interactivebrokers.com.au": 63,
    "intuit.com": 64,
    "mint.com": 64,
    "jobleads.com": 65,
    "jobleads.de": 65,
    "jobleads.fr": 65,
    "jobleads.it": 65,
    "jobleads.co.uk": 65,
    "jobleads.ca": 65,
    "jobleads.mx": 65,
    "kaiserpermanente.org": 66,
    "kp.org": 66,
    "kayak.com": 67,
    "kayak.ae": 67,
    "kayak.com.ar": 67,
    "kayak.com.au": 67,
    "kayak.com.br": 67,
    "kayak.ch": 67,
    "kayak.cl": 67,
    "kayak.com.co": 67,
    "kayak.de": 67,
    "kayak.dk": 67,
    "kayak.es": 67,
    "kayak.fr": 67,
    "kayak.co.uk": 67,
    "kayak.com.hk": 67,
    "kayak.co.id": 67,
    "kayak.ie": 67,
    "kayak.co.in": 67,
    "kayak.it": 67,
    "kayak.co.jp": 67,
    "kayak.co.kr": 67,
    "kayak.com.mx": 67,
    "kayak.com.my": 67,
    "kayak.nl": 67,
    "kayak.no": 67,
    "kayak.com.pe": 67,
    "kayak.com.ph": 67,
    "kayak.pl": 67,
    "kayak.pt": 67,
    "kayak.ru": 67,
    "kayak.sa": 67,
    "kayak.se": 67,
    "kayak.sg": 67,
    "kayak.co.th": 67,
    "kayak.com.tr": 67,
    "landmarkcu.com": 68,
    "landmarkcuonline.com": 68,
    "loiselet-daigremont.com": 69,
    "loiselet-daigremont.fr": 69,
    "lookmark.io": 70,
    "lookmark.link": 70,
    "lrz.de": 71,
    "mwn.de": 71,
    "mytum.de": 71,
    "tum.de": 71,
    "lufthansa.com": 72,
    "miles-and-more.com": 72,
    "swiss.com": 72,
    "marriott.com": 73,
    "marriottrewards.com": 73,
    "ritzcarlton.com": 73,
    "spg.com": 73,
    "starwoodhotels.com": 73,
    "e.leclerc": 74,
    "auto.leclerc": 74,
    "leclercdrive.fr": 74,
    "location.leclerc": 74,
    "chezmoi.leclerc": 74,
    "traiteur.leclerc": 74,
    "mesrecettes.leclerc": 74,
    "live.com": 75,
    "microsoftonline.com": 75,
    "office.com": 75,
    "markandgraham.com": 76,
    "pbteen.com": 76,
    "potterybarn.com": 76,
    "williams-sonoma.com": 76,
    "ml.com": 77,
    "merrill.com": 77,
    "merrilledge.com": 77,
    "mojang.com": 78,
    "minecraft.net": 78,
    "morrisons.com": 79,
    "mymorrisons.com": 79,
    "myheritage.com": 80,
    "myheritage.fr": 80,
    "myheritage.no": 80,
    "myheritage.nl": 80,
    "myheritage.co.il": 80,
    "myheritage.de": 80,
    "myheritage.se": 80,
    "myheritage.dk": 80,
    "myringgo.com": 81,
    "myringgo.co.uk": 81,
    "mytoys.de": 82,
    "mirapodo.de": 82,
    "nextinpact.com": 83,
    "inpact-hardware.com": 83,
    "nintendolife.com": 84,
    "purexbox.com": 84,
    "pushsquare.com": 84,
    "nokia.com": 85,
    "withings.com": 85,
    "norwegianreward.com": 86,
    "norwegian.com": 86,
    "oesterreich.gv.at": 87,
    "handy-signatur.at": 87,
    "oneazcu.com": 88,
    "oneazcreditunion.com": 88,
    "opendsn.com": 89,
    "dnsomatic.com": 89,
    "opentable.com": 90,
    "opentable.co.uk": 90,
    "opentable.de": 90,
    "opentable.jp": 90,
    "opentable.com.au": 90,
    "opentable.com.mx": 90,
    "opentable.ie": 90,
    "optumrx.com": 91,
    "optum.com": 91,
    "parsec.app": 92,
    "parsecgaming.com": 92,
    "pinterest.com": 93,
    "pinterest.ca": 93,
    "pinterest.co.uk": 93,
    "pinterest.fr": 93,
    "pinterest.de": 93,
    "pinterest.es": 93,
    "pin.it": 93,
    "pinterest.com.au": 93,
    "pinterest.se": 93,
    "pinterest.ph": 93,
    "pinterest.ch": 93,
    "pinterest.com.mx": 93,
    "pinterest.dk": 93,
    "pinterest.pt": 93,
    "pinterest.ru": 93,
    "pinterest.it": 93,
    "pinterest.at": 93,
    "pinterest.jp": 93,
    "pinterest.cl": 93,
    "pinterest.ie": 93,
    "pinterest.co.kr": 93,
    "pinterest.nz": 93,
    "pintrest.com": 93,
    "pocket.com": 94,
    "getpocket.com": 94,
    "poshmark.com": 95,
    "poshmark.ca": 95,
    "poshmark.com.au": 95,
    "post.at": 96,
    "shoepping.at": 96,
    "postman.com": 97,
    "getpostman.com": 97,
    "potterybarnkids.co.uk": 98,
    "westelm.co.uk": 98,
    "priorityguestrewards.com": 99,
    "aturahotels.com": 99,
    "independentcollection.com.au": 99,
    "qthotels.com": 99,
    "rydges.com": 99,
    "probikeshop.fr": 100,
    "bikeshop.es": 100,
    "probikeshop.it": 100,
    "probikeshop.pt": 100,
    "probikeshop.com": 100,
    "proton.me": 101,
    "protonvpn.com": 101,
    "prusa3d.com": 102,
    "prusaprinters.org": 102,
    "pornhub.com": 103,
    "pornhubpremium.com": 103,
    "postnl.nl": 104,
    "postnl.be": 104,
    "rakuten.com": 105,
    "rakuten.tv": 105,
    "riotgames.com": 106,
    "leagueoflegends.com": 106,
    "sas.dk": 107,
    "sas.no": 107,
    "sas.se": 107,
    "sas.fi": 107,
    "flysas.com": 107,
    "saxoinvestor.fr": 108,
    "saxoinvestor.com": 108,
    "saxotrader.com": 108,
    "saxotrader.fr": 108,
    "scholarshare529.com": 109,
    "secureaccountview.com": 109,
    "schweizmobil.ch": 110,
    "schweizmobilplus.ch": 110,
    "suissemobileplus.ch": 110,
    "scribbr.com": 111,
    "scribbr.de": 111,
    "scribbr.dk": 111,
    "scribbr.es": 111,
    "scribbr.fi": 111,
    "scribbr.fr": 111,
    "scribbr.it": 111,
    "scribbr.nl": 111,
    "scribbr.no": 111,
    "scribbr.se": 111,
    "shopperplus.ca": 112,
    "123ink.ca": 112,
    "primecables.ca": 112,
    "living.ca": 112,
    "sncf.com": 113,
    "sncf-connect.com": 113,
    "monidentifiant.sncf": 113,
    "tgvinoui.sncf": 113,
    "tgvinouipro.sncf": 113,
    "sodexo.com": 114,
    "sodexopass.fr": 114,
    "sony.com": 115,
    "sonyentertainmentnetwork.com": 115,
    "spark.net": 116,
    "jdate.com": 116,
    "splitser.com": 117,
    "wiebetaaltwat.nl": 117,
    "stackoverflow.com": 118,
    "askubuntu.com": 118,
    "serverfault.com": 118,
    "stackexchange.com": 118,
    "superuser.com": 118,
    "starwellness.org": 119,
    "slhn.org": 119,
    "steampowered.com": 120,
    "steamcommunity.com": 120,
    "steamgames.com": 120,
    "surveymonkey.com": 121,
    "surveymonkey.de": 121,
    "surveymonkey.co.uk": 121,
    "surveymonkey.ru": 121,
    "telecentro.com.ar": 122,
    "telecentroplay.com.ar": 122,
    "tesla.com": 123,
    "teslamotors.com": 123,
    "thefork.com": 124,
    "thefork.at": 124,
    "thefork.fr": 124,
    "thefork.ch": 124,
    "thefork.no": 124,
    "thefork.de": 124,
    "thefork.co.uk": 124,
    "thefork.com.au": 124,
    "ticketcorner.ch": 125,
    "fansale.ch": 125,
    "ticketmaster.com": 126,
    "livenation.com": 126,
    "trello.com": 127,
    "atlassian.com": 127,
    "twitter.com": 128,
    "x.com": 128,
    "ubisoft.com": 129,
    "ubi.com": 129,
    "ubisoftconnect.com": 129,
    "uhaul.com": 130,
    "movinghelp.com": 130,
    "uhc.com": 131,
    "myuhc.com": 131,
    "healthsafe-id.com": 131,
    "umsystem.edu": 132,
    "mst.edu": 132,
    "umkc.edu": 132,
    "umsl.edu": 132,
    "missouri.edu": 132,
    "united.com": 133,
    "unitedwifi.com": 133,
    "uspowerboating.com": 134,
    "ussailing.org": 134,
    "verizonwireless.com": 135,
    "vzw.com": 135,
    "walgreens.com": 136,
    "alliancerxwp.com": 136,
    "wayfair.com": 137,
    "wayfair.co.uk": 137,
    "wayfair.ca": 137,
    "wayfair.de": 137,
    "jossandmain.com": 137,
    "allmodern.com": 137,
    "perigold.com": 137,
    "birchlane.com": 137,
    "wellsfargo.com": 138,
    "wellsfargoadvisors.com": 138,
    "wikipedia.org": 139,
    "mediawiki.org": 139,
    "wikibooks.org": 139,
    "wikidata.org": 139,
    "wikinews.org": 139,
    "wikiquote.org": 139,
    "wikisource.org": 139,
    "wikiversity.org": 139,
    "wikivoyage.org": 139,
    "wiktionary.org": 139,
    "wikimedia.org": 139,
    "wiimmfi.de": 140,
    "wii-homebrew.com": 140,
    "wilson.com": 141,
    "slugger.com": 141,
    "atecsports.com": 141,
    "demarini.com": 141,
    "evoshield.com": 141,
    "luxilon.com": 141,
    "wsj.com": 142,
    "dowjones.com": 142,
    "yandex.ru": 143,
    "yandex.ua": 143,
    "yandex.by": 143,
    "yandex.eu": 143,
    "yandex.ee": 143,
    "yandex.lt": 143,
    "yandex.lv": 143,
    "yandex.md": 143,
    "yandex.uz": 143,
    "yandex.tm": 143,
    "yandex.tj": 143,
    "yandex.az": 143,
    "yandex.com": 143,
    "yandex.co.il": 143,
    "yandex.fr": 143,
    "yandex.com.ge": 143,
    "yandex.com.am": 143,
    "yandex.com.tr": 143,
    "yandex.kz": 143,
    "yandex.kg": 143,
    "yelp.at": 144,
    "yelp.be": 144,
    "yelp.ca": 144,
    "yelp.ch": 144,
    "yelp.co.uk": 144,
    "yelp.com": 144,
    "yelp.com.ar": 144,
    "yelp.com.br": 144,
    "yelp.de": 144,
    "yelp.dk": 144,
    "yelp.es": 144,
    "yelp.fi": 144,
    "yelp.fr": 144,
    "yelp.ie": 144,
    "yelp.it": 144,
    "yelp.nl": 144,
    "yelp.no": 144,
    "yelp.pt": 144,
    "yelp.se": 144,
  ]
}
