import Foundation

public struct HwpDocumentProperties: HwpData {
    public let sectionSize: UInt16
    public let startingIndex: HwpStartingIndex
    public let caratLocation: HwpCaratLocation

    init(_ data: Data) {
        var reader = DataReader(data)
        sectionSize = reader.readUInt16()
        startingIndex = HwpStartingIndex(reader.readBytes(12))
        caratLocation = HwpCaratLocation(reader.readBytes(12))
    }
}