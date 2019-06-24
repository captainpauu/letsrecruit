'use strict';

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

new (function () {
    function global() {
        _classCallCheck(this, global);

        this.bindEvent();
    }

    _createClass(global, [{
        key: 'bindEvent',
        value: function bindEvent() {
            $(document).ready(function () {

                $('#sidebarCollapse').on('click', function () {
                    $('#sidebar, #content').toggleClass('active');
                });

                $('#dataTable').DataTable();

                $('#interviewRequestTable').DataTable({
                    "order": [[4, "desc"]]
                });
            });
        }
    }]);

    return global;
}())();
//# sourceMappingURL=global.js.map