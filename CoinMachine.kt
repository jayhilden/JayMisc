import java.util.*

enum class Coin(val value: Int, val order: Int) {
    QUARTER(25, 1),
    DIME(10, 2),
    NICKLE(5, 3),
    PENNY(1, 4),

    ;

    fun next(): Coin? {
        return Coin.values().firstOrNull { it.order == this.order + 1 }
    }

}

class CoinMachine(private var available: MutableMap<Coin, Int>) {
    fun makeChange(amount: Int): List<Coin> { //throw if can't make change
        val coinsToReturn = Stack<Coin>()
        val currentState = available.toMutableMap()//make copy
        var amountLeft = amount
        var currentCoin: Coin? = Coin.values().single { it.order == 1 }

        while (amountLeft > 0 && currentCoin != null) {
            val nextCoin = getNextCoin(amountLeft, currentState, currentCoin)
            if (nextCoin == null) {
                if (coinsToReturn.size == 0) {
                    throw IllegalStateException("could not get next coin, could not pop anything off the top")
                }
                val popped = coinsToReturn.pop()
                println("backtracking, popping off $popped")
                amountLeft += popped.value
                currentState[popped] = currentState[popped]!! + 1
                currentCoin = popped.next()
            } else {
                amountLeft -= nextCoin.value
                currentState[nextCoin] = currentState[nextCoin]!! - 1
                coinsToReturn.push(nextCoin)
            }
        }

        if (amountLeft != 0) {
            //we didn't make it
            throw IllegalStateException("made it to the end, but still had $amountLeft and couldn't complete")
        }
        available = currentState
        return coinsToReturn
    }

    private fun getNextCoin(amountLeft: Int, currentState: MutableMap<Coin, Int>, currentCoin: Coin): Coin? {
        var workingCoin: Coin? = currentCoin
        while (workingCoin != null) {
            val availableCoinCount = currentState[workingCoin] ?: 0
            if (amountLeft >= workingCoin.value && availableCoinCount > 0) {
                return workingCoin
            }
            workingCoin = workingCoin.next()
        }
        return null
    }
}
