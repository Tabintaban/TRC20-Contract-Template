pragma solidity ^0.5.0;

/**
 * @dev Wrappers over Solidity's arithmetic operations with added overflow
 * checks.
 *
 * Arithmetic operations in Solidity wrap on overflow. This can easily result
 * in bugs, because programmers usually assume that an overflow raises an
 * error, which is the standard behavior in high level programming languages.
 * `SafeMath` restores this intuition by reverting the transaction when an
 * operation overflows.
 *
 * Using this library instead of the unchecked operations eliminates an entire
 * class of bugs, so it's recommended to use it always.

 * @dev Обтекает арифметические операции Solidity с добавлением переполнения
 * проверяет.
 *
 * Арифметические операции в Solidity обтекаются при переполнении. Это может легко привести
 * в багах, потому что программисты обычно предполагают, что переполнение вызывает
 * ошибку, что является стандартным поведением в языках программирования высокого уровня.
 * `SafeMath` восстанавливает эту интуицию, возвращая транзакцию при переполнении операции. 
 *
 * Использование этой библиотеки вместо непроверенных операций устраняет целый класс ошибок,
 * поэтому рекомендуется использовать ее всегда.
 */
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     * - Addition cannot overflow.

     * @dev Возвращает сложение двух целых чисел без знака, возвращающееся при
     * переполнении.
     *
     * Аналогично оператору Solidity `+`.
     *
     * Требования:
     * - При сложении не может быть переполнения.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     * - Subtraction cannot overflow.

     * @dev Возвращает вычитание двух целых чисел без знака, возвращающееся при
     * переполнении (когда результат отрицательный).
     *
     * Аналогично оператору Solidity `-`.
     *
     * Требования:
     * - При вычитании не может быть переполнения
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a, "SafeMath: subtraction overflow");
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     * - Multiplication cannot overflow.

     * @dev Возвращает умножение двух целых чисел без знака, возвращающееся при
     * переполнении.
     *
     * Аналогично оператору Solidity `*`.
     *
     * Требования:
     * - При умножении не может быть переполнения.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.

     * @dev Возвращает целочисленное деление двух целых чисел без знака. Возвращает значение при
     * делении на ноль. Результат округляется до нуля.
     *
     * Аналогично оператору Solidity `/`. Примечание: эта функция использует
     * код операции "revert" (который оставляет оставшийся газ нетронутым), в то время как Solidity
     * использует недопустимый код операции для возврата (расходования всего оставшегося газа).
     *
     * Требования:
     * - Делитель не может быть равен нулю.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, "SafeMath: division by zero");
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.

     * @dev Возвращает остаток от деления двух целых чисел без знака. (целое число без знака по модулю),
     * Возвращает значение при делении на ноль.
     *
     * Аналогично оператору Solidity "%`. Эта функция использует `revert`
     * код операции (который оставляет оставшийся газ нетронутым), в то время как Solidity использует
     * недопустимый код операции для возврата (расходования всего оставшегося газа).
     *
     * Требования:
     * - Делитель не может быть равен нулю.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b != 0, "SafeMath: modulo by zero");
        return a % b;
    }
}
