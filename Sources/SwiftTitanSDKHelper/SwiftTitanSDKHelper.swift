// The Swift Programming Language
// https://docs.swift.org/swift-book

@attached(peer, names: arbitrary)
public macro Mixin() = #externalMacro(
    module: "SwiftTitanSDKMacros",
    type: "MixinMacro"
)

/// A macro that generates an initializer for a struct or class,
/// ensuring that optional properties default to `nil`, and
/// parameters are sorted alphabetically, with non-optional ones first.
///
/// Example:
///
///     @DataInit
///     struct SomeStruct {
///         public var a: Int32
///         public var b: Int64?
///     }
///
/// Expands to:
///
///     struct SomeStruct {
///         public var a: Int32
///         public var b: Int64?
///         public init(a: Int32, b: Int64? = nil) {
///             self.a = a
///             self.b = b
///         }
///     }
@attached(member, names: named(init))
public macro DataInit() = #externalMacro(
    module: "SwiftTitanSDKMacros",
    type: "DataInitMacro"
)

//@attached(member)
//public macro QueryBuilder() = #externalMacro(
//    module: "SwiftTitanSDKMacros",
//    type: "QueryBuilderMacro"
//)
