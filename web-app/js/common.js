/**
 * Exibir mensagens no estilo Growl
 * @param message
 * @param type (pode ser 'info', 'danger', 'waring', 'success' ou null)
 */
function showMessage(message, type) {
	$.bootstrapGrowl(message, {
		type: type,
		offset: {from: 'top', amount: 50}, // 'top', or 'bottom'
		width: 'auto', // (integer, or 'auto')
		delay: 5000,
		align: 'left',
		allow_dismiss: true,
		stackup_spacing: 10 // spacing between consecutively stacked growls.
	});
}