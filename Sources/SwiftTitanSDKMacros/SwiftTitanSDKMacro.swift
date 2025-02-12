import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import Foundation

/// Implementation of the `stringify` macro, which takes an expression
/// of any type and produces a tuple containing the value of that expression
/// and the source code that produced the value. For example
///
///     #stringify(x + y)
///
///  will expand to
///
///     (x + y, "x + y")
public struct StringifyMacro: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) -> ExprSyntax {
        guard let argument = node.arguments.first?.expression else {
            fatalError("compiler bug: the macro does not have any arguments")
        }

        return "(\(argument), \(literal: argument.description))"
    }
}
/// Simple error type for macro expansions
enum MacroError: Error, CustomStringConvertible {
    case message(String)

    var description: String {
        switch self {
        case .message(let message):
            return message
        }
    }
}
public struct MixinMacro: PeerMacro {
    public static func expansion(of node: SwiftSyntax.AttributeSyntax, providingPeersOf declaration: some SwiftSyntax.DeclSyntaxProtocol, in context: some SwiftSyntaxMacros.MacroExpansionContext) throws -> [SwiftSyntax.DeclSyntax] {
        // The macro expects the attached declaration to be a struct with nested structs
        guard let structDecl = declaration.as(StructDeclSyntax.self) else {
            throw MacroError.message("Mixin macro can only be attached to a struct declaration.")
        }
        
        // Extract properties and conformances from the base struct
        let baseProperties = extractProperties(from: structDecl)
        let baseConformances = extractConformances(from: structDecl)
        
        // Initialize an array to hold generated structs
        var generatedStructs: [StructDeclSyntax] = []
        
        // Process nested structs recursively
        try processStruct(
            structDecl: structDecl,
            inheritedProperties: baseProperties,
            inheritedConformances: baseConformances,
            generatedStructs: &generatedStructs
        )
        
        return generatedStructs.map { DeclSyntax($0) }
    }
    
    /// Recursively processes a struct and its nested structs, aggregating properties and conformances
    private static func processStruct(
        structDecl: StructDeclSyntax,
        inheritedProperties: [Property],
        inheritedConformances: [String],
        generatedStructs: inout [StructDeclSyntax]
    ) throws {
        // Extract properties and conformances from the current struct
        let currentProperties = extractProperties(from: structDecl)
        let currentConformances = extractConformances(from: structDecl)
        
        // Aggregate properties and conformances from inheritance
        let aggregatedProperties = inheritedProperties + currentProperties
        let aggregatedConformances = inheritedConformances + currentConformances
        
        // Find nested structs within the current struct
        let nestedStructs = findNestedStructs(in: structDecl)
        
        if nestedStructs.isEmpty {
            // If there are no nested structs, it's a leaf struct. Generate it.
            let newStruct = try generateStruct(
                from: structDecl,
                mixedProperties: aggregatedProperties,
                conformances: aggregatedConformances
            )
            generatedStructs.append(newStruct.as(StructDeclSyntax.self)!)
        } else {
            // If there are nested structs, recursively process each one
            for nested in nestedStructs {
                try processStruct(
                    structDecl: nested,
                    inheritedProperties: aggregatedProperties,
                    inheritedConformances: aggregatedConformances,
                    generatedStructs: &generatedStructs
                )
            }
        }
    }
    
    /// Extracts stored properties from a StructDeclSyntax
    private static func extractProperties(from structDecl: StructDeclSyntax) -> [Property] {
        structDecl.memberBlock.members.compactMap { member -> Property? in
            guard let varDecl = member.decl.as(VariableDeclSyntax.self) else { return nil }
            guard varDecl.bindings.count == 1,
                  let binding = varDecl.bindings.first,
                  let pattern = binding.pattern.as(IdentifierPatternSyntax.self),
                  let type = binding.typeAnnotation?.type.description
            else { return nil }
            let name = pattern.identifier.text
            return Property(name: name, type: type)
        }
    }
    
    /// Extracts protocol conformances from a StructDeclSyntax
    private static func extractConformances(from structDecl: StructDeclSyntax) -> [String] {
        structDecl.inheritanceClause?.inheritedTypes.map { $0.type.description.trimmingCharacters(in: .whitespacesAndNewlines) } ?? []
    }
    
    /// Finds all nested structs within a StructDeclSyntax
    private static func findNestedStructs(in structDecl: StructDeclSyntax) -> [StructDeclSyntax] {
        structDecl.memberBlock.members.compactMap { member -> StructDeclSyntax? in
            guard let nestedStruct = member.decl.as(StructDeclSyntax.self) else { return nil }
            return nestedStruct
        }
    }
    
    /// Generates a new struct declaration with aggregated properties and conformances
    private static func generateStruct(
        from original: StructDeclSyntax,
        mixedProperties: [Property],
        conformances: [String]
    ) throws -> DeclSyntax {
        // Get struct name
        let structName = original.name.text
        
        let membersSet = Set(mixedProperties.map { $0.name })
        let membersReversedSet = Set(mixedProperties.map { String($0.name.reversed())})
        let membersToExclude = membersSet.intersection(membersReversedSet)
        
        let members = Array(Set(mixedProperties.filter {!membersToExclude.contains($0.name)}))
        // Prepare member declarations
        let memberBlock = members.map { p in
            "public var \(p.name): \(p.type)"
        }.sorted().joined(separator: "\n")
        
        let conformSet = Set(conformances)
        let conformReverseSet = Set(conformances.map { String($0.reversed())})
        let conformToExclude = conformSet.intersection(conformReverseSet)
        
        let conform = Array(conformSet.symmetricDifference(conformToExclude))
        
        return DeclSyntax("""
            public struct \(raw: structName)\(raw: conform.isEmpty ? "" : ": \(conform.joined(separator: ", "))") {
                \(raw: memberBlock)
            }
        """)
    }
    
    /// Helper struct to represent a property
    private struct Property: Hashable {
        let name: String
        let type: String
    }
}

public struct DataInitMacro: MemberMacro {
    enum StructOrClass {
        case Struct(StructDeclSyntax), Class(ClassDeclSyntax)
    }
    public static func expansion(
        of node: AttributeSyntax,
        providingMembersOf declaration: some DeclGroupSyntax,
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        
        // Ensure the macro is applied to a struct or class
        let structDecl = declaration.as(StructDeclSyntax.self)
        let classDecl = declaration.as(ClassDeclSyntax.self)
        guard structDecl != nil || classDecl != nil else {
            throw MacroError.message("@DataInit can only be applied to structs or classes.")
        }

        let sorc = structDecl != nil ? StructOrClass.Struct(structDecl!) : StructOrClass.Class(classDecl!)
        // Extract stored properties
        let properties = extractProperties(from: sorc)

        // Sort properties: non-optionals first, then optionals (alphabetically within each group)
        let sortedProperties = properties.sorted { lhs, rhs in
            if lhs.isOptional == rhs.isOptional {
                return lhs.name < rhs.name // Sort alphabetically if both are the same type
            }
            return !lhs.isOptional // Non-optionals first
        }

        // Generate initializer parameters
        let parameters = sortedProperties.map { prop in
            if prop.isOptional {
                return "\(prop.name): \(prop.type) = nil"
            } else {
                return "\(prop.name): \(prop.type)"
            }
        }.joined(separator: ", ")

        // Generate property assignments
        let assignments = sortedProperties.map { prop in
            "self.\(prop.name) = \(prop.name)"
        }.joined(separator: "\n")

        // Create initializer syntax
        

        return [DeclSyntax("""
        public init(\(raw: parameters)) {
            \(raw: assignments)
        }
        """)]
    }

    /// Extracts stored properties from a struct or class declaration
    private static func extractProperties(from decl: StructOrClass) -> [Property] {
        let extracted = {
            switch decl {
            case .Class(let c): return c.memberBlock
            case .Struct(let s): return s.memberBlock
            }
        }()
        return extracted.members.compactMap { member -> Property? in
            guard let varDecl = member.decl.as(VariableDeclSyntax.self) else { return nil }
            guard varDecl.bindings.count == 1,
                  let binding = varDecl.bindings.first,
                  let pattern = binding.pattern.as(IdentifierPatternSyntax.self),
                  let typeSyntax = binding.typeAnnotation?.type
            else { return nil }

            let name = pattern.identifier.text
            let type = typeSyntax.description
            let isOptional = type.hasSuffix("?") // Check if it's an optional type
            return Property(name: name, type: type, isOptional: isOptional)
        }
    }

    /// Helper struct to represent a property
    private struct Property {
        let name: String
        let type: String
        let isOptional: Bool
    }
}

@main
struct SwiftTitanSDKPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        MixinMacro.self,
        DataInitMacro.self
    ]
}
