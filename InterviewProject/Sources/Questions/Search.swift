import Foundation

class Search {

    /*
        Реализовать функцию  fuzzysearch как в редакторе  sublime text 3.
        Для незнакомых с редактором и/или термином  fuzzysearch, более формальное
        название —  approximate string matching (нахождение приблизительного соответствия строк).Решение должно иметь сложность O(n)
        Пример работы:
        fuzzysearch('car', 'cartwheel');        // true
        fuzzysearch('cwhl', 'wcartwheel');       // true
        fuzzysearch('cwheel', 'cartwheel');     // true
        fuzzysearch('cartwheel', 'cartwheel');  // true
        fuzzysearch('cwheeel', 'cartwheel');    // false
        fuzzysearch('lw', 'cartwheel');         // false
    */


    public static func fuzzySearch(_ search: String, _ source: String) -> Bool {
        return false
    }
}
