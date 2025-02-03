import kotlin.math.pow

fun main() {
    val m = readln().toLong()
    var k = 0
    if (m <= 1) {
        println("No answer!")
    } else {
        while (4.0.pow(k.toDouble()) < m) {
            k++
        }
        println(k - 1)
    }
}