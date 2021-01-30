import Foundation

/**
 문단 모양

 Tag ID : HWPTAG_PARA_SHAPE
 */
public struct HwpParaShape {
    /** 속성 1 */
    public let property1: UInt32
    /** 왼쪽 여백 */
    public let marginLeft: Int32
    /** 오른쪽 여백 */
    public let marginRight: Int32
    /** 들여 쓰기/내어 쓰기 */
    public let indent: Int32
    /** 문단 간격 위 */
    public let paragraphSpacingTop: Int32
    /** 문단 간격 아래 */
    public let paragraphSpacingBottom: Int32
    /** 줄 간격. 한글 2007 이하 버전(5.0.2.5 버전 미만)에서 사용. */
    public let lineSpacing: Int32
    /** 탭 정의 아이디(TabDef ID) 참조 값 */
    public let tabDefId: UInt16
    /** 번호 문단 ID(Numbering ID) 또는 글머리표 문단 모양 ID(Bullet ID) 참조 값 */
    public let numberingOrBulletId: UInt16
    /** 테두리/배경 모양 ID(BorderFill ID) 참조 값 */
    public let borderFillId: UInt16
    /** 문단 테두리 왼쪽 간격 */
    public let borderSpacingLeft: Int16
    /** 문단 테두리 오른쪽 간격 */
    public let borderSpacingRight: Int16
    /** 문단 테두리 위쪽 간격 */
    public let borderSpacingTop: Int16
    /** 문단 테두리 아래쪽 간격 */
    public let borderSpacingBottom: Int16
    /** 속성 2(표 40 참조) (5.0.1.7 버전 이상) */
    public var property2: UInt32?
    /** 속성 3(표 41 참조) (5.0.2.5 버전 이상) */
    public var property3: UInt32?
    /** 줄 간격(5.0.2.5 버전 이상) */
    public var lineSpacing2: UInt32?
    /** Unknown */
    public var unknown: UInt32?
}

extension HwpParaShape: HwpFromDataWithVersion {
    init(_ reader: inout DataReader, _ version: HwpVersion) throws {
        property1 = reader.read(UInt32.self)
        marginLeft = reader.read(Int32.self)
        marginRight = reader.read(Int32.self)
        indent = reader.read(Int32.self)
        paragraphSpacingTop = reader.read(Int32.self)
        paragraphSpacingBottom = reader.read(Int32.self)
        lineSpacing = reader.read(Int32.self)
        tabDefId = reader.read(UInt16.self)
        numberingOrBulletId = reader.read(UInt16.self)
        borderFillId = reader.read(UInt16.self)
        borderSpacingLeft = reader.read(Int16.self)
        borderSpacingRight = reader.read(Int16.self)
        borderSpacingTop = reader.read(Int16.self)
        borderSpacingBottom = reader.read(Int16.self)
        if version >= HwpVersion(5, 0, 1, 7) {
            property2 = reader.read(UInt32.self)
        }
        if version >= HwpVersion(5, 0, 2, 5) {
            property3 = reader.read(UInt32.self)
            lineSpacing2 = reader.read(UInt32.self)
        }
        if !reader.isEOF {
            unknown = reader.read(UInt32.self)
        }
    }
}

extension HwpParaShape {
    init(property1: UInt32, marginLeft: Int32, indent: Int32 = 0,
         paragraphSpacingTop: Int32 = 0, paragraphSpacingBottom: Int32 = 0,
         lineSpacing: Int32 = 160, tabDefId: UInt16, lineSpacing2: UInt32 = 160,
         unknown: UInt32 = 0)
    {
        self.property1 = property1
        self.marginLeft = marginLeft
        marginRight = 0
        self.indent = indent
        self.paragraphSpacingTop = paragraphSpacingTop
        self.paragraphSpacingBottom = paragraphSpacingBottom
        self.lineSpacing = lineSpacing
        self.tabDefId = tabDefId
        numberingOrBulletId = 0
        borderFillId = 2
        borderSpacingLeft = 0
        borderSpacingRight = 0
        borderSpacingTop = 0
        borderSpacingBottom = 0
        property2 = 0
        property3 = 0
        self.lineSpacing2 = lineSpacing2
        self.unknown = unknown
    }
}
