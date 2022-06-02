import com.amazon.relayassetservice.api.model.Coin
import com.amazon.relayassetservice.api.model.CoinMachine
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.assertThrows
import kotlin.test.assertEquals

class CoinMachineTests {
    @Test
    fun easy() {
        val machine = CoinMachine(mutableMapOf(Coin.QUARTER to 1))

        val change = machine.makeChange(25)

        assertEquals(listOf(Coin.QUARTER), change)
    }

    @Test
    fun easy2() {
        val machine = CoinMachine(mutableMapOf(
            Coin.QUARTER to 0,
            Coin.NICKLE to 5,
        ))

        val change = machine.makeChange(25)

        assertEquals(listOf(Coin.NICKLE,Coin.NICKLE,Coin.NICKLE,Coin.NICKLE,Coin.NICKLE,), change)
    }

    @Test
    fun easy3() {
        val machine = CoinMachine(mutableMapOf(
            Coin.QUARTER to 0,
            Coin.DIME to 100,
            Coin.NICKLE to 100,
        ))

        val change = machine.makeChange(25)

        assertEquals(listOf(Coin.DIME,Coin.DIME,Coin.NICKLE,), change)
    }

    @Test
    fun hard1() {
        val machine = CoinMachine(mutableMapOf(
            Coin.QUARTER to 100,
            Coin.DIME to 100,
            Coin.NICKLE to 0,
        ))

        val change = machine.makeChange(80)

        assertEquals(listOf(Coin.QUARTER,Coin.QUARTER,Coin.DIME,Coin.DIME,Coin.DIME), change)
    }

    @Test
    fun hard2() {
        val machine = CoinMachine(mutableMapOf(
            Coin.QUARTER to 100,
            Coin.DIME to 0,
            Coin.NICKLE to 0,
            Coin.PENNY to 4,
        ))

        assertThrows<IllegalStateException> {
            machine.makeChange(80)
        }
    }
}
