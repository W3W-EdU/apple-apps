import DashTypes
import Foundation
import SwiftTreats

@PersonalData
public struct Passport: Equatable, Identifiable, IdentityLinked, DatedPersonalData {
  public static let searchCategory: SearchCategory = .id

  public var number: String
  @CodingKey("localeFormat")
  public var country: CountryCodeNamePair?
  @CalendarDateFormatted
  public var expireDate: Date?
  @CalendarDateFormatted
  public var dateOfBirth: Date?
  @CalendarDateFormatted
  public var deliveryDate: Date?
  @Linked
  @Searchable
  public var linkedIdentity: Identity?
  public var fullname: String
  public var sex: Gender?
  public var deliveryPlace: String
  public var creationDatetime: Date?
  public var userModificationDatetime: Date?
  public var spaceId: String?
  @JSONEncoded
  public var attachments: Set<Attachment>?

  @Searchable
  public var displayFullName: String {
    return linkedIdentityFullName ?? fullname
  }

  public init() {
    id = Identifier()
    metadata = RecordMetadata(id: .temporary, contentType: Self.contentType)
    country = CountryCodeNamePair.systemCountryCode
    fullname = ""
    number = ""
    sex = .male
    deliveryPlace = ""
    creationDatetime = Date()
    userModificationDatetime = nil
    _attachments = .init(nil)
  }

  init(
    id: Identifier,
    number: String,
    country: CountryCodeNamePair? = nil,
    dateOfBirth: String?,
    deliveryDate: String?,
    expireDate: String?,
    linkedIdentity: Identifier? = nil,
    fullname: String,
    sex: Gender? = nil,
    deliveryPlace: String,
    creationDatetime: Date? = nil,
    userModificationDatetime: Date? = nil,
    spaceId: String? = nil
  ) {
    self.id = id
    metadata = RecordMetadata(id: .temporary, contentType: Self.contentType)
    self.number = number
    self.country = country
    self._dateOfBirth = CalendarDateFormatted(rawValue: dateOfBirth)
    self._deliveryDate = CalendarDateFormatted(rawValue: deliveryDate)
    self._expireDate = CalendarDateFormatted(rawValue: expireDate)
    self._linkedIdentity = Linked(identifier: linkedIdentity)
    self.fullname = fullname
    self.sex = sex
    self.deliveryPlace = deliveryPlace
    self.creationDatetime = creationDatetime
    self.userModificationDatetime = userModificationDatetime
    self.spaceId = spaceId
    _attachments = .init(nil)
  }
}

extension Passport {
  public func validate() throws {
    if fullname.isEmptyOrWhitespaces() && number.isEmptyOrWhitespaces() {
      let invalidProperty = fullname.isEmptyOrWhitespaces() ? \Passport.fullname : \.number
      throw ItemValidationError(invalidProperty: invalidProperty)
    }
  }
}
