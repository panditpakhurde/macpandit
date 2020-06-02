import UIKit

// --- Using map to transform the [String] ---

let imageUrlStrings = ["https://image-url.com", "https://another-image-url.com", "https://one-more-image-url.com", "wrong url"]

// Using 'map' we can convert a sequence of values into
// a new array of optional or non-optional values, using a closure as a transform:
let validImageUrl = imageUrlStrings.map { URL(string: $0) }
print(validImageUrl)
//[Optional(https://image-url.com), Optional(https://another-image-url.com), Optional(https://one-more-image-url.com), nil]


// --- Using compactMap to transform the [String] ---

// Using 'compactMap' we can convert a sequence of values into
// a new array of non-optional values, using a closure as a transform:
let validImageURLs = imageUrlStrings.compactMap {
    URL(string: $0)
}
print(validImageURLs)
//[https://image-url.com, https://another-image-url.com, https://one-more-image-url.com]


// --- Using compactMap to transform the [[String]] ---


let urlStrings2DArray = [["https://image-url.com", "https://another-image-url.com"], ["https://one-more-image-url.com", "wrong url"]]

// --- Function to get urls from single array ---

func validURLs(in stringUrls: [String]) -> [URL] {
    return stringUrls.compactMap { URL(string: $0) }
}

///Get final array using compactMap over 2D array
var finalValidURLs = urlStrings2DArray.compactMap {
    validURLs(in: $0)
}
print(finalValidURLs)
//[[https://image-url.com, https://another-image-url.com], [https://one-more-image-url.com]]

// --- Using flatMap to transform the [[String]] ---

///Get final array using flatMap over 2D array
let finalFlatValidURLs = urlStrings2DArray.flatMap {
    validURLs(in: $0)
}
print(finalFlatValidURLs)
//[https://image-url.com, https://another-image-url.com, https://one-more-image-url.com]


// --- Using flatMap to transform the [[Int]] ---

var integers = [[4,5,6], [9, 1], [3,5,2]]

let Nnumbers = integers.flatMap { $0 }
print(Nnumbers)
//[4, 5, 6, 9, 1, 3, 5, 2]


// --- Using map to transform Array to [Int] ---

var numbers = ["43", "23", "notANumber"]

let ints = numbers.map { Int($0)}
print(ints)
//[Optional(43), Optional(23), nil]

// --- Using map to transform Array to [Int] ---

let intsCompact = numbers.compactMap { Int($0)}
print(intsCompact)
//[43, 23]

// --- Using map to transform Array to [Int] ---

let intsFlat = numbers.flatMap { Int($0)}
print(intsCompact)
//use of flatMap to map optional values is deprecated, instead use compactMap for the same.

