$(function () {
    'use strict';

    $.fn.cart = function () {
        this.off('change.cart');
        this.off('click.cart');

        this.delegate('.js-cart__item', 'click.cart', function (event) {
            var el = this,
                parent = el.parentNode;

            if ($(event.target).parents('.js-cart__delete').length > 0) {
                parent.removeChild(el);
                $('.js-cart').trigger('update');
                $(parent).trigger('change.cart');
                event.stopPropagation();
            }
        });
    };
});
