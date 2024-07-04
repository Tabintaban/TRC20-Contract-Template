pragma solidity ^0.5.0;

/**
 * @dev Interface of the TRC20 standard as defined in the EIP. Does not include
 * the optional functions; to access them see {TRC20Detailed}.
 * @dev Интерфейс стандарта TRC20, как определено в EIP. Не включает в себя
 * дополнительные функции; чтобы получить к ним доступ, смотрите {TRC20Detailed}.
 */
interface ITRC20 {
    /**
     * @dev Returns the amount of tokens in existence.
     * @dev Возвращает количество существующих токенов.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     * @dev Возвращает количество токенов, принадлежащих `аккаунту`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     *
     * @dev перемещает токены суммы из учетной записи вызывающего абонента в учетную запись получателя.
     *
     * Возвращает логическое значение, указывающее, была ли операция выполнена успешно.
     *
     * Генерирует событие {Transfer}.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     *
     * @dev возвращает оставшееся количество токенов, которые будет использовать "spender".
     * разрешено тратить средства от имени "владельца" через {transferFrom}. Это
     * по умолчанию значение равно нулю.
     *
     * Это значение изменяется при вызове {approve} или {transferFrom}.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     * 
     * @dev устанавливает "amount" в качестве резерва "spender" для токенов вызывающей стороны.
     *
     * Возвращает логическое значение, указывающее, была ли операция выполнена успешно.
     *
     * ВАЖНО: Помните, что изменение резерва с помощью этого метода сопряжено с риском
     * что кто-то может использовать как старую, так и новую надбавку при неудачном оформлении транзакции.
     * Одно из возможных решений для смягчения этой проблемы
     * условие состоит в том, чтобы сначала уменьшить размер надбавки за расходование средств до 0, а затем установить
     * желаемое значение:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Генерирует событие {Утверждение}.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.

     * @dev перемещает токены "сумма" от "отправителя" к "получателю", используя механизм
     * резервирования. затем `сумма` вычитается из счета вызывающего абонента.
     * пособие.
     *
     * Возвращает логическое значение, указывающее, была ли операция выполнена успешно.
     *
     * Генерирует событие {Передача}.
     */
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.

     * @dev генерируется, когда токены "value" перемещаются с одной учетной записи ("from") на другую.
     * другой ("кому`).
     *
     * Обратите внимание, что "значение" может быть равно нулю.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     *
     * @dev Выдается, когда размер надбавки "спонсора" для "владельца" устанавливается с помощью
     * вызова {approve}. "значение" - это новая надбавка.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}
