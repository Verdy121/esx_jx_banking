$(window).ready(function () {
	window.addEventListener('message', function (event) {
		let data = event.data;

		if (data.showMenu) {
			$('#tabletti').fadeIn();
			$('#container').fadeIn();
			$('#menu').fadeIn();
			$('#deposit_amount').val(data.player.money);

			let bankAmount = 0;
			for (let i = 0; i < data.player.accounts.length; i++) {
				if (data.player.accounts[i].name == 'bank') {
					bankAmount = data.player.accounts[i].money;
				}
			}

			$('#withdraw_amount').val(bankAmount);
		} else if (data.hideAll) {
			$('#tabletti').fadeOut();
			$('#container').fadeOut();
		}
	});

	document.onkeyup = function (data) {
		if (data.which == 27) {
			$.post('http://esx_jx_banking/escape', '{}');
		}
	};

	$('#tabletti').hide();
	$('#container').hide();

	$('#deposit_btn').on('click', function () {
		$.post('http://esx_jx_banking/deposit', JSON.stringify({
			amount: $('#deposit_amount').val()
		}));

		$('#deposit_amount').val(0);
	})

	$('#deposit_amount').on("keyup", function (e) {
		if (e.keyCode == 13) {
			$.post('http://esx_jx_banking/deposit', JSON.stringify({
				amount: $('#deposit_amount').val()
			}));

			$('#deposit_amount').val(0);
		}
	});

	$('#withdraw_btn').on('click', function () {
		$.post('http://esx_jx_banking/withdraw', JSON.stringify({
			amount: $('#withdraw_amount').val()
		}));

		$('#withdraw_amount').val(0);
	});

	$('#withdraw_amount').on("keyup", function (e) {
		if (e.keyCode == 13) {
			$.post('http://esx_jx_banking/withdraw', JSON.stringify({
				amount: $('#withdraw_amount').val()
			}));

			$('#withdraw_amount').val(0);
		}
	});

});
