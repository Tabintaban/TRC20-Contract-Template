pragma solidity ^0.5.0;

import "./ITRC20.sol";
import "./SafeMath.sol";

/**
 * @dev Implementation of the {ITRC20} interface.
 *
 * This implementation is agnostic to the way tokens are created. This means
 * that a supply mechanism has to be added in a derived contract using {_mint}.
 * For a generic mechanism see {TRC20Mintable}.
 *
 * TIP: For a detailed writeup see our guide
 * https://forum.zeppelin.solutions/t/how-to-implement-erc20-supply-mechanisms/226[How
 * to implement supply mechanisms].
 *
 * We have followed general OpenZeppelin guidelines: functions revert instead
 * of returning `false` on failure. This behavior is nonetheless conventional
 * and does not conflict with the expectations of TRC20 applications.
 *
 * Additionally, an {Approval} event is emitted on calls to {transferFrom}.
 * This allows applications to reconstruct the allowance for all accounts just
 * by listening to said events. Other implementations of the EIP may not emit
 * these events, as it isn't required by the specification.
 *
 * Finally, the non-standard {decreaseAllowance} and {increaseAllowance}
 * functions have been added to mitigate the well-known issues around setting
 * allowances. See {ITRC20-approve}.

* @dev-реализация интерфейса {ITRC20}.
 *
 * Эта реализация не зависит от способа создания токенов. Это означает
 *, что механизм предоставления должен быть добавлен в производный контракт с использованием {_mint}.
 * Общий механизм приведен в {TRC20Mintable}.
 *
 * СОВЕТ: Подробное описание приведено в нашем руководстве
 * https://forum.zeppelin.solutions/t/how-to-implement-erc20-supply-mechanisms/226 [Как
 * реализовать механизмы поставок].
 *
 * Мы следовали общим рекомендациям OpenZeppelin: вместо этого функции возвращаются
 * для возврата "false" в случае сбоя. Тем не менее, это обычное поведение
 * и не противоречит ожиданиям приложений TRC20.
 *
 * Кроме того, при вызовах {transferFrom} генерируется событие {Approval}.
 * Это позволяет приложениям восстанавливать резерв по всем счетам только в том случае, если
 * прослушивая указанные события. Другие реализации EIP могут не выдавать
 * эти события, поскольку это не требуется спецификацией.
 *
 * И, наконец, нестандартное {уменьшение допустимого
 */
contract TRC20 is ITRC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowances;

    uint256 private _totalSupply;

    /**
     * @dev See {ITRC20-totalSupply}.
     * @dev Смотрите {ITRC20-totalSupply}.
     */
    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    /**
     * @dev See {ITRC20-balanceOf}.
     * @dev Видит {ITRC20-balanceOf}.
     */
    function balanceOf(address account) public view returns (uint256) {
        return _balances[account];
    }

    /**
     * @dev See {ITRC20-transfer}.
     *
     * Requirements:
     *
     * - `recipient` cannot be the zero address.
     * - the caller must have a balance of at least `amount`.

    * @dev Смотрите в разделе {ITRC20-transfer}.
     *
     * Требования:
     *
     * - `получатель` не может быть нулевым адресом.
     * - у вызывающего абонента должен быть баланс не менее `суммы`.
     */
    function transfer(address recipient, uint256 amount) public returns (bool) {
        _transfer(msg.sender, recipient, amount);
        return true;
    }

    /**
     * @dev See {ITRC20-allowance}.
     * @dev Смотрите {ITRC20-allowance}.
     */
    function allowance(address owner, address spender) public view returns (uint256) {
        return _allowances[owner][spender];
    }

    /**
     * @dev See {ITRC20-approve}.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.

    * @dev Смотрите в разделе {ITRC20-approve}.
     *
     * Требования:
     *
     * - `spender` не может быть нулевым адресом.
     */
    function approve(address spender, uint256 value) public returns (bool) {
        _approve(msg.sender, spender, value);
        return true;
    }

    /**
     * @dev See {ITRC20-transferFrom}.
     *
     * Emits an {Approval} event indicating the updated allowance. This is not
     * required by the EIP. See the note at the beginning of {TRC20};
     *
     * Requirements:
     * - `sender` and `recipient` cannot be the zero address.
     * - `sender` must have a balance of at least `value`.
     * - the caller must have allowance for `sender`'s tokens of at least
     * `amount`.

    * @dev Видит {ITRC20-transferFrom}.
     *
     * Генерирует событие {Утверждение}, указывающее на обновленную надбавку. Это не
     * требуется EIP. Смотрите примечание в начале {TRC20};
     *
     * Требования:
     * - `отправитель" и "получатель" не могут быть нулевыми адресами.
     * - у "отправителя" должен быть баланс не менее "value".
     * - у вызывающего абонента должен быть запас токенов `отправителя" не менее чем на
     * `сумму`.
     */
    function transferFrom(address sender, address recipient, uint256 amount) public returns (bool) {
        _transfer(sender, recipient, amount);
        _approve(sender, msg.sender, _allowances[sender][msg.sender].sub(amount));
        return true;
    }

    /**
     * @dev Atomically increases the allowance granted to `spender` by the caller.
     *
     * This is an alternative to {approve} that can be used as a mitigation for
     * problems described in {ITRC20-approve}.
     *
     * Emits an {Approval} event indicating the updated allowance.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
    
     * @dev автоматически увеличивает размер пособия, предоставляемого "спонсору" вызывающей стороной.
     *
     * Это альтернатива {одобрить}, которая может быть использована для устранения
     * проблем, описанных в {ITRC20-одобрить}.
     *
     * Генерирует событие {Утверждение}, указывающее на обновленное пособие.
     *
     * Требования:
     *
     * - Адрес "отправитель" не может быть нулевым.
     */
    function increaseAllowance(address spender, uint256 addedValue) public returns (bool) {
        _approve(msg.sender, spender, _allowances[msg.sender][spender].add(addedValue));
        return true;
    }

    /**
     * @dev Atomically decreases the allowance granted to `spender` by the caller.
     *
     * This is an alternative to {approve} that can be used as a mitigation for
     * problems described in {ITRC20-approve}.
     *
     * Emits an {Approval} event indicating the updated allowance.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     * - `spender` must have allowance for the caller of at least
     * `subtractedValue`.

    * @dev автоматически уменьшает размер пособия, предоставляемого "спонсору" вызывающей стороной.
     *
     * Это альтернатива {одобрить}, которая может быть использована для устранения
     * проблем, описанных в {ITRC20-одобрить}.
     *
     * Генерирует событие {Утверждение}, указывающее на обновленную надбавку.
     *
     * Требования:
     *
     * - `spender` не может быть нулевым адресом.
     * - "spender" должен иметь надбавку для вызывающего абонента, по крайней мере, в размере
     * `Вычитаемое значение`.
     */
    function decreaseAllowance(address spender, uint256 subtractedValue) public returns (bool) {
        _approve(msg.sender, spender, _allowances[msg.sender][spender].sub(subtractedValue));
        return true;
    }

    /**
     * @dev Moves tokens `amount` from `sender` to `recipient`.
     *
     * This is internal function is equivalent to {transfer}, and can be used to
     * e.g. implement automatic token fees, slashing mechanisms, etc.
     *
     * Emits a {Transfer} event.
     *
     * Requirements:
     *
     * - `sender` cannot be the zero address.
     * - `recipient` cannot be the zero address.
     * - `sender` must have a balance of at least `amount`.

    * @dev Перемещает количество токенов от "отправителя" к "получателю".
     *
     * Эта внутренняя функция эквивалентна {transfer} и может быть использована для
     * например, для реализации автоматической оплаты токенами, механизмов сокращения и т.д.
     *
     * Генерирует событие {Transfer}.
     *
     * Требования:
     *
     * - `отправитель" не может быть нулевым адресом.
     * - "получатель" не может быть нулевым адресом.
     * - у "отправителя" должен быть баланс не менее `суммы`.
     */
    function _transfer(address sender, address recipient, uint256 amount) internal {
        require(sender != address(0), "TRC20: transfer from the zero address");
        require(recipient != address(0), "TRC20: transfer to the zero address");

        _balances[sender] = _balances[sender].sub(amount);
        _balances[recipient] = _balances[recipient].add(amount);
        emit Transfer(sender, recipient, amount);
    }

    /** @dev Creates `amount` tokens and assigns them to `account`, increasing
     * the total supply.
     *
     * Emits a {Transfer} event with `from` set to the zero address.
     *
     * Requirements
     *
     * - `to` cannot be the zero address.

    @dev создает токены "amount" и присваивает их "account", увеличивая
     * общее предложение.
     *
     * Запускает событие {Transfer} с нулевым адресом `from`.
     *
     * Требования
     *
     * - `to` не может быть нулевым адресом.
     */
    function _mint(address account, uint256 amount) internal {
        require(account != address(0), "TRC20: mint to the zero address");

        _totalSupply = _totalSupply.add(amount);
        _balances[account] = _balances[account].add(amount);
        emit Transfer(address(0), account, amount);
    }

     /**
     * @dev Destroys `amount` tokens from `account`, reducing the
     * total supply.
     *
     * Emits a {Transfer} event with `to` set to the zero address.
     *
     * Requirements
     *
     * - `account` cannot be the zero address.
     * - `account` must have at least `amount` tokens.

    * @dev удаляет токены "amount" из "account", уменьшая
    * общий запас.
     *
     * Генерирует событие {Transfer} с нулевым адресом `to`.
     *
     * Требования
     *
     * - `account` не может быть нулевым адресом.
     * - на `аккаунте` должно быть как минимум `количество` токенов.
     */
    function _burn(address account, uint256 value) internal {
        require(account != address(0), "TRC20: burn from the zero address");

        _totalSupply = _totalSupply.sub(value);
        _balances[account] = _balances[account].sub(value);
        emit Transfer(account, address(0), value);
    }

    /**
     * @dev Sets `amount` as the allowance of `spender` over the `owner`s tokens.
     *
     * This is internal function is equivalent to `approve`, and can be used to
     * e.g. set automatic allowances for certain subsystems, etc.
     *
     * Emits an {Approval} event.
     *
     * Requirements:
     *
     * - `owner` cannot be the zero address.
     * - `spender` cannot be the zero address.

    * @dev устанавливает "amount" в качестве надбавки "spender" к токенам "owner".
     *
     * Эта внутренняя функция эквивалентна "approve" и может использоваться, 
     * например, для установки автоматических надбавок для определенных подсистем и т.д.
     *
     * Генерирует событие {Утверждение}.
     *
     * Требования:
     *
     * - `владелец` не может быть нулевым адресом.
     * - "отправитель` не может быть нулевым адресом.
     */
    function _approve(address owner, address spender, uint256 value) internal {
        require(owner != address(0), "TRC20: approve from the zero address");
        require(spender != address(0), "TRC20: approve to the zero address");

        _allowances[owner][spender] = value;
        emit Approval(owner, spender, value);
    }

    /**
     * @dev Destoys `amount` tokens from `account`.`amount` is then deducted
     * from the caller's allowance.
     *
     * See {_burn} and {_approve}.

    * @dev списывает количество токенов со счета Destoys.`сумма` затем вычитается
     * из суммы, причитающейся звонящему.
     *
     * Смотрите разделы {_burn} и {_ approve}.
     */
    function _burnFrom(address account, uint256 amount) internal {
        _burn(account, amount);
        _approve(account, msg.sender, _allowances[account][msg.sender].sub(amount));
    }
}
