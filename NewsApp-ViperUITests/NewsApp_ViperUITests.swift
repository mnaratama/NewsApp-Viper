//
//  NewsApp_ViperUITests.swift
//  NewsApp-ViperUITests
//
//  Created by Naratama on 28/07/23.
//

import XCTest
@testable import NewsApp_ViperTests

final class NewsApp_ViperUITests: XCTestCase {
    
    private var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments.append("🚨****** UITest Began ******🚨")
    }
    
    func testHomeViewControllerElementsExist(){
        app.launch()
        XCTAssertTrue(app.isHomeNewsViewDisplayed)
        XCTAssertFalse(app.isHomeCategoryCollectionViewDisplayed)
        XCTAssertTrue(app.isHomeSearchTextFieldDisplayed)
        XCTAssertTrue(app.isHomeCategoryButtonDisplayed)
        XCTAssertTrue(app.isHomeHeaderViewDisplayed)
        XCTAssertFalse(app.isHomeCategoryContainerViewDisplayed)
        XCTAssertTrue(app.isHomeSearchViewDisplayed)
        XCTAssertFalse(app.isHomeErrorSearchNewsDisplayed)
    }

    func testSourceViewControllerElementsExist(){
        app.launch()
        XCTAssertFalse(app.isSourcesViewDisplayed)
        XCTAssertFalse(app.isSourcesCategoryCollectionViewDisplayed)
        XCTAssertFalse(app.isSourcesSearchTextFieldDisplayed)
        XCTAssertFalse(app.isSourcesCategoryButtonDisplayed)
        XCTAssertFalse(app.isSourcesHeaderViewDisplayed)
        XCTAssertFalse(app.isSourcesCategoryContainerViewDisplayed)
        XCTAssertFalse(app.isSourcesSearchViewDisplayed)
        XCTAssertFalse(app.isSourcesErrorSearchNewsDisplayed)
    }
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}

extension XCUIApplication {
    
    // MARK: - Home View Controller
    var homeNewsTableView: XCUIElement! {
        tables["homeNewsTableView"]
    }
    
    var isHomeNewsViewDisplayed: Bool {
        homeNewsTableView.exists
    }
    
    var homeCategoryCollectionView: XCUIElement! {
        collectionViews["homeCategoryCollectionView"]
    }
    
    var isHomeCategoryCollectionViewDisplayed: Bool {
        homeCategoryCollectionView.exists
    }
    
    var homeSearchTextField: XCUIElement! {
        textFields["homeSearchTextField"]
    }
    
    var isHomeSearchTextFieldDisplayed: Bool {
        homeSearchTextField.exists
    }
    
    var homeCategoryButton: XCUIElement! {
        buttons["homeCategoryButton"]
    }
    
    var isHomeCategoryButtonDisplayed: Bool {
        homeCategoryButton.exists
    }
    
    var homeHeaderView: XCUIElement! {
        otherElements["homeHeaderView"]
    }
    
    var isHomeHeaderViewDisplayed: Bool {
        homeHeaderView.exists
    }
    
    var homeCategoryContainerView: XCUIElement! {
        otherElements["homeCategoryContainerView"]
    }
    
    var isHomeCategoryContainerViewDisplayed: Bool {
        homeCategoryContainerView.exists
    }
    
    var homeSearchView: XCUIElement! {
        otherElements["homeSearchView"]
    }
    
    var isHomeSearchViewDisplayed: Bool {
        homeSearchView.exists
    }
    
    var homeErrorSearchNews: XCUIElement! {
        staticTexts["homeErrorSearchNews"]
    }
    
    var isHomeErrorSearchNewsDisplayed: Bool {
        homeErrorSearchNews.exists
    }
    
    
    // MARK: - Source View Controller
    var sourcesTableView: XCUIElement! {
        tables["sourcesTableView"]
    }

    var isSourcesViewDisplayed: Bool {
        sourcesTableView.exists
    }

    var sourcesCategoryCollectionView: XCUIElement! {
        collectionViews["sourcesCategoryCollectionView"]
    }

    var isSourcesCategoryCollectionViewDisplayed: Bool {
        sourcesCategoryCollectionView.exists
    }

    var sourcesSearchTextField: XCUIElement! {
        textFields["sourcesSearchTextField"]
    }

    var isSourcesSearchTextFieldDisplayed: Bool {
        sourcesSearchTextField.exists
    }

    var sourcesCategoryButton: XCUIElement! {
        buttons["sourcesCategoryButton"]
    }

    var isSourcesCategoryButtonDisplayed: Bool {
        sourcesCategoryButton.exists
    }

    var sourcesHeaderView: XCUIElement! {
        otherElements["sourcesHeaderView"]
    }

    var isSourcesHeaderViewDisplayed: Bool {
        sourcesHeaderView.exists
    }

    var sourcesCategoryContainerView: XCUIElement! {
        otherElements["sourcesCategoryContainerView"]
    }

    var isSourcesCategoryContainerViewDisplayed: Bool {
        sourcesCategoryContainerView.exists
    }

    var sourcesSearchView: XCUIElement! {
        otherElements["sourcesSearchView"]
    }

    var isSourcesSearchViewDisplayed: Bool {
        sourcesSearchView.exists
    }

    var sourcesErrorSearchNews: XCUIElement! {
        staticTexts["sourcesErrorSearchNews"]
    }

    var isSourcesErrorSearchNewsDisplayed: Bool {
        sourcesErrorSearchNews.exists
    }
}
