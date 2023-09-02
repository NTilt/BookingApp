//
//  TagView.swift
//  BookingApp
//
//  Created by Никита Ясеник on 02.09.2023.
//

import SwiftUI

struct TagView: View {

    @Binding var tags: [Tag]
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(getRows(), id: \.self) { rows in
                HStack(spacing: 10) {
                    ForEach(rows) { row in
                        RowView(tag: row)
                    }
                }
            }
        }
        
        .frame(width: UIScreen.main.bounds.width - 20, alignment: .leading)
        .frame(maxWidth: .infinity)
        .onAppear {
            tags.forEach { tag in
                let font = UIFont.systemFont(ofSize: 16, weight: .medium)
                let attributes = [NSAttributedString.Key.font: font]
                let size = (tag.text as NSString).size(withAttributes: attributes)
                tags[getIndex(tag: tag)].size = size.width
            }
        }
    }
    
    @ViewBuilder
    private func RowView(tag: Tag) -> some View {
        Text(tag.text)
            .foregroundColor(Settings.textColor)
            .font(.system(size: 16, weight: .medium))
            .padding(.horizontal, 14)
            .padding(.vertical, 8)
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color(red: 0.984, green: 0.984, blue: 0.988))
            )
            .lineLimit(1)
    }
    
    private func getIndex(tag: Tag) -> Int {
        let index = tags.firstIndex { currentTag in
            currentTag.id == tag.id
        } ?? 0
        
        return index
    }
    
    private func getRows() -> [[Tag]] {
        
        var rows: [[Tag]] = []
        var currentRow: [Tag] = []
        var totalWidth: CGFloat = 0
        let screenWidth = UIScreen.main.bounds.width - 10
        
        tags.forEach { tag in
            totalWidth += (!currentRow.isEmpty || rows.isEmpty ? (tag.size + 48) : 0)
            if totalWidth >= screenWidth {
                
                totalWidth = tag.size + 48
                
                rows.append(currentRow)
                currentRow.removeAll()
                currentRow.append(tag)
                
            } else {
                currentRow.append(tag)
            }
        }
        
        if !currentRow.isEmpty {
            rows.append(currentRow)
            currentRow.removeAll()
        }
        return rows
        
    }
}

fileprivate enum Settings {
    
    static let textColor = Color(red: 0.51, green: 0.529, blue: 0.588)
    
}

struct Tag: Identifiable, Hashable {
    var id = UUID().uuidString
    var text: String
    var size: CGFloat = 0
}
