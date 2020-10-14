import HwpKitFramework
import XCTest

/**
 doc version : unknown
 program version : 10.30.3(2478)
 */
final class Create2014Tests: XCTestCase {
    let (expected, actual) = createHwp(#file, "blank-mac2014vp")

    func testCreate() throws {
        // XCTAssertEqual(expected, actual)
    }

    func testfileHeader() throws {
        XCTAssertEqual(expected.fileHeader, actual.fileHeader)
    }

    func testDocInfo() throws {
        XCTAssertEqual(expected.docInfo.documentProperties, actual.docInfo.documentProperties)
        XCTAssertEqual(expected.docInfo.compatibleDocument, actual.docInfo.compatibleDocument)
        let expectedMappings = expected.docInfo.idMappings
        let actualMappings = actual.docInfo.idMappings
        // XCTAssertEqual(expectedMappings.faceNameArray, actualMappings.faceNameArray)
        XCTAssertEqual(expectedMappings.borderFillArray, actualMappings.borderFillArray)
        // XCTAssertEqual(expectedMappings.charShapeArray, actualMappings.charShapeArray)
        XCTAssertEqual(expectedMappings.paraShapeArray, actualMappings.paraShapeArray)

        // XCTAssertEqual(expected.docInfo, actual.docInfo)
    }

    func testSectionArray() throws {
        XCTAssertEqual(expected.sectionArray.count, actual.sectionArray.count)

        XCTAssertEqual(expected.sectionArray, actual.sectionArray)
    }
}