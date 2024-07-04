pragma solidity ^0.5.0;

import "./ITRC20.sol";

/**
 * @dev Optional functions from the TRC20 standard.
*  @dev Дополнительных функций из стандарта TRC20.
 */
contract TRC20Detailed is ITRC20 {
    string private _name;
    string private _symbol;
    uint8 private _decimals;

    /**
     * @dev Sets the values for `name`, `symbol`, and `decimals`. All three of
     * these values are immutable: they can only be set once during
     * construction.
     * @dev Устанавливает значения для `name`, `symbol` и `decimals`. Все три из
     * этих значений являются неизменяемыми: они могут быть установлены только один раз во время
     * построения.
     */
    constructor (string memory name, string memory symbol, uint8 decimals) public {
        _name = name;
        _symbol = symbol;
        _decimals = decimals;
    }

    /**
     * @dev Returns the name of the token.
     * @dev Возвращает имя токена.
     */
    function name() public view returns (string memory) {
        return _name;
    }

    /**
     * @dev Returns the symbol of the token, usually a shorter version of the
     * name.
     * @dev Возвращает символ токена, обычно это сокращенная версия имени.
     */
    function symbol() public view returns (string memory) {
        return _symbol;
    }

    /**
     * @dev Returns the number of decimals used to get its user representation.
     * For example, if `decimals` equals `2`, a balance of `505` tokens should
     * be displayed to a user as `5,05` (`505 / 10 ** 2`).
     *
     * Tokens usually opt for a value of 18, imitating the relationship between
     * Ether and Wei.
     *
     * NOTE: This information is only used for _display_ purposes: it in
     * no way affects any of the arithmetic of the contract, including
     * {ITRC20-balanceOf} and {ITRC20-transfer}.
     *
     * @dev Возвращает количество десятичных знаков, используемых для получения пользовательского представления.
     * Например, если `decimals` равно `2`, то остаток токенов `505` должен составлять
     * будет отображаться пользователю в виде `5,05` (`505 / 10 ** 2`).
     *
     * Токены обычно имеют значение 18, имитируя соотношение между
     * Ether и Wei.
     *
     * ПРИМЕЧАНИЕ: Эта информация используется только в целях демонстрации: она никоим
     * образом не влияет на какие-либо арифметические параметры контракта, включая
     * {ITRC20-Баланс} и {ITRC20-перевод}.
     */
    function decimals() public view returns (uint8) {
        return _decimals;
    }
}

