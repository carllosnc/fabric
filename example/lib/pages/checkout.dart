import 'package:fabric/fabric.dart';
import 'package:flutter/material.dart';
import '../components/fabric_drawer.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final List<_CartItem> _items = <_CartItem>[
    _CartItem(
      id: '1',
      name: 'Teclado Mecânico Compacto',
      variant: 'Switches Brown • Layout ABNT2',
      unitPrice: 349.90,
      quantity: 1,
      icon: Icons.keyboard_outlined,
    ),
    _CartItem(
      id: '2',
      name: 'Mouse Sem Fio Ergonômico',
      variant: 'Sensor Óptico 16.000 DPI • Grafite',
      unitPrice: 189.00,
      quantity: 1,
      icon: Icons.mouse_outlined,
    ),
    _CartItem(
      id: '3',
      name: 'Mousepad Desk Mat Feltro',
      variant: 'Tamanho XL (90x40cm) • Cinza Escuro',
      unitPrice: 79.90,
      quantity: 2,
      icon: Icons.crop_landscape_rounded,
    ),
  ];

  String _selectedPayment = 'pix';
  String? _appliedCoupon = 'FABRIC10';
  final TextEditingController _couponController =
      TextEditingController(text: 'FABRIC10');

  @override
  void dispose() {
    _couponController.dispose();
    super.dispose();
  }

  double get _subtotal => _items.fold(
        0.0,
        (double sum, _CartItem item) => sum + (item.unitPrice * item.quantity),
      );

  double get _discount =>
      _appliedCoupon != null ? (_subtotal * 0.10) : 0.0;

  double get _shipping => _subtotal >= 200 ? 0.0 : 25.0;

  double get _pixExtraDiscount =>
      _selectedPayment == 'pix' ? ((_subtotal - _discount) * 0.05) : 0.0;

  double get _total =>
      _subtotal - _discount - _pixExtraDiscount + _shipping;

  void _showFeedback(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final FabricThemeExtension tokens = context.fabricTokens;

    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text('Finalizar Pedido'),
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                tooltip: 'Voltar',
                onPressed: () => Navigator.pop(context),
              )
            : null,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          border: Border(top: BorderSide(color: tokens.borderColor)),
        ),
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Total a pagar',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: tokens.mutedForeground,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'R\$ ${_total.toStringAsFixed(2).replaceAll('.', ',')}',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.3,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                FilledButton.icon(
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),
                  icon: const Icon(Icons.check_circle_outline_rounded, size: 18),
                  label: const Text('Confirmar Pedido'),
                  onPressed: _items.isEmpty
                      ? null
                      : () {
                          showDialog<void>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Pedido Realizado! 🎉'),
                              content: Text(
                                'Seu pedido de R\$ ${_total.toStringAsFixed(2).replaceAll('.', ',')} foi registrado com sucesso via ${_selectedPayment.toUpperCase()}.',
                              ),
                              actions: <Widget>[
                                FilledButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        },
                ),
              ],
            ),
          ),
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 760),
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            children: <Widget>[
              // Endereço de Entrega
              _SectionHeader(
                title: 'ENDEREÇO DE ENTREGA',
                tokens: tokens,
                theme: theme,
              ),
              const SizedBox(height: 8),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: tokens.surfaceElevated,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: tokens.borderColor),
                        ),
                        child: Icon(
                          Icons.location_on_outlined,
                          size: 20,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Av. Paulista, 1578 • Apto 102',
                              style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Bela Vista, São Paulo - SP • CEP 01310-200',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: tokens.mutedForeground,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      TextButton(
                        onPressed: () => _showFeedback('Editar endereço'),
                        child: const Text('Alterar'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Itens do Pedido
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _SectionHeader(
                    title: 'ITENS DO PEDIDO (${_items.length})',
                    tokens: tokens,
                    theme: theme,
                  ),
                  if (_items.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: Text(
                        'Frete Grátis acima de R\$ 200',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: tokens.successColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 8),
              if (_items.isEmpty)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 36,
                      horizontal: 24,
                    ),
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.remove_shopping_cart_outlined,
                            size: 40,
                            color: tokens.mutedForeground,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Seu carrinho está vazio',
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              else
                for (int i = 0; i < _items.length; i++) ...<Widget>[
                  _buildCartItem(theme, tokens, _items[i]),
                  if (i < _items.length - 1) const SizedBox(height: 12),
                ],
              const SizedBox(height: 24),

              // Cupom de Desconto
              _SectionHeader(
                title: 'CUPOM DE DESCONTO',
                tokens: tokens,
                theme: theme,
              ),
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _couponController,
                      decoration: InputDecoration(
                        labelText: 'Código do Cupom',
                        hintText: 'Ex: FABRIC10',
                        prefixIcon:
                            const Icon(Icons.confirmation_number_outlined),
                        suffixIcon: _appliedCoupon != null
                            ? IconButton(
                                icon: const Icon(Icons.clear_rounded, size: 18),
                                onPressed: () {
                                  setState(() {
                                    _appliedCoupon = null;
                                    _couponController.clear();
                                  });
                                  _showFeedback('Cupom removido.');
                                },
                              )
                            : null,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  SizedBox(
                    height: 48,
                    child: FilledButton.tonal(
                      onPressed: () {
                        final String code =
                            _couponController.text.trim().toUpperCase();
                        if (code == 'FABRIC10') {
                          setState(() {
                            _appliedCoupon = code;
                          });
                          _showFeedback('Cupom FABRIC10 aplicado! (10% OFF)');
                        } else if (code.isEmpty) {
                          _showFeedback('Digite um código de cupom.');
                        } else {
                          _showFeedback('Cupom inválido ou expirado.');
                        }
                      },
                      child: const Text('Aplicar'),
                    ),
                  ),
                ],
              ),
              if (_appliedCoupon != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 4),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.check_circle_rounded,
                        size: 14,
                        color: tokens.successColor,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Cupom $_appliedCoupon aplicado: 10% de desconto',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: tokens.successColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 24),

              // Forma de Pagamento
              _SectionHeader(
                title: 'FORMA DE PAGAMENTO',
                tokens: tokens,
                theme: theme,
              ),
              const SizedBox(height: 8),
              Card(
                child: RadioGroup<String>(
                  groupValue: _selectedPayment,
                  onChanged: (String? value) {
                    if (value != null) {
                      setState(() {
                        _selectedPayment = value;
                      });
                    }
                  },
                  child: Column(
                    children: <Widget>[
                      RadioListTile<String>(
                        value: 'pix',
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 4,
                        ),
                        secondary: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: tokens.successColor.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            '5% OFF',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: tokens.successColor,
                            ),
                          ),
                        ),
                        title: const Text('Pix Instantâneo'),
                        subtitle:
                            const Text('Aprovação imediata e desconto extra'),
                      ),
                      Divider(
                        height: 1,
                        color: tokens.borderColor.withValues(alpha: 0.6),
                      ),
                      const RadioListTile<String>(
                        value: 'credit_card',
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 4,
                        ),
                        title: Text('Cartão de Crédito'),
                        subtitle: Text('Em até 6x sem juros'),
                      ),
                      Divider(
                        height: 1,
                        color: tokens.borderColor.withValues(alpha: 0.6),
                      ),
                      const RadioListTile<String>(
                        value: 'boleto',
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 4,
                        ),
                        title: Text('Boleto Bancário'),
                        subtitle: Text('Vencimento em 3 dias úteis'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Resumo de Valores
              _SectionHeader(
                title: 'RESUMO DOS VALORES',
                tokens: tokens,
                theme: theme,
              ),
              const SizedBox(height: 8),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: <Widget>[
                      _PriceSummaryRow(
                        label: 'Subtotal dos produtos',
                        value:
                            'R\$ ${_subtotal.toStringAsFixed(2).replaceAll('.', ',')}',
                        theme: theme,
                        tokens: tokens,
                      ),
                      const SizedBox(height: 10),
                      if (_discount > 0) ...<Widget>[
                        _PriceSummaryRow(
                          label: 'Desconto Cupom (10%)',
                          value:
                              '- R\$ ${_discount.toStringAsFixed(2).replaceAll('.', ',')}',
                          theme: theme,
                          tokens: tokens,
                          valueColor: tokens.successColor,
                        ),
                        const SizedBox(height: 10),
                      ],
                      if (_pixExtraDiscount > 0) ...<Widget>[
                        _PriceSummaryRow(
                          label: 'Desconto Pix (5%)',
                          value:
                              '- R\$ ${_pixExtraDiscount.toStringAsFixed(2).replaceAll('.', ',')}',
                          theme: theme,
                          tokens: tokens,
                          valueColor: tokens.successColor,
                        ),
                        const SizedBox(height: 10),
                      ],
                      _PriceSummaryRow(
                        label: 'Frete para São Paulo',
                        value: _shipping == 0
                            ? 'Grátis'
                            : 'R\$ ${_shipping.toStringAsFixed(2).replaceAll('.', ',')}',
                        theme: theme,
                        tokens: tokens,
                        valueColor:
                            _shipping == 0 ? tokens.successColor : null,
                      ),
                      const SizedBox(height: 14),
                      Divider(
                        height: 1,
                        color: tokens.borderColor.withValues(alpha: 0.6),
                      ),
                      const SizedBox(height: 14),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Valor Total',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'R\$ ${_total.toStringAsFixed(2).replaceAll('.', ',')}',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.3,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCartItem(
    ThemeData theme,
    FabricThemeExtension tokens,
    _CartItem item,
  ) {
    final double itemTotal = item.unitPrice * item.quantity;
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Top Row: Ícone + Detalhes + Total do Item
            Row(
              children: <Widget>[
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: tokens.surfaceElevated,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: tokens.borderColor,
                    ),
                  ),
                  child: Icon(
                    item.icon,
                    size: 20,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        item.name,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.variant,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: tokens.mutedForeground,
                          fontSize: 12,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'R\$ ${itemTotal.toStringAsFixed(2).replaceAll('.', ',')}',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.2,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Divider(
              height: 1,
              color: tokens.borderColor.withValues(
                alpha: 0.6,
              ),
            ),
            const SizedBox(height: 12),
            // Bottom Row: Preço unitário e Stepper de quantidade
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'R\$ ${item.unitPrice.toStringAsFixed(2).replaceAll('.', ',')} cada',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: tokens.mutedForeground,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: tokens.surfaceElevated,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: tokens.borderColor,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          item.quantity > 1
                              ? Icons.remove_rounded
                              : Icons.delete_outline_rounded,
                          size: 16,
                          color: item.quantity == 1
                              ? theme.colorScheme.error
                              : null,
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 32,
                          minHeight: 32,
                        ),
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            if (item.quantity > 1) {
                              item.quantity--;
                            } else {
                              _items.remove(item);
                            }
                          });
                        },
                      ),
                      SizedBox(
                        width: 28,
                        child: Center(
                          child: Text(
                            item.quantity.toString(),
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.add_rounded,
                          size: 16,
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 32,
                          minHeight: 32,
                        ),
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            item.quantity++;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PriceSummaryRow extends StatelessWidget {
  const _PriceSummaryRow({
    required this.label,
    required this.value,
    required this.theme,
    required this.tokens,
    this.valueColor,
  });

  final String label;
  final String value;
  final ThemeData theme;
  final FabricThemeExtension tokens;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: tokens.mutedForeground,
          ),
        ),
        Text(
          value,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: valueColor,
          ),
        ),
      ],
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.title,
    required this.tokens,
    required this.theme,
  });

  final String title;
  final FabricThemeExtension tokens;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Text(
        title,
        style: theme.textTheme.labelSmall?.copyWith(
          color: tokens.mutedForeground,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.8,
          fontSize: 11,
        ),
      ),
    );
  }
}

class _CartItem {
  _CartItem({
    required this.id,
    required this.name,
    required this.variant,
    required this.unitPrice,
    required this.quantity,
    required this.icon,
  });

  final String id;
  final String name;
  final String variant;
  final double unitPrice;
  int quantity;
  final IconData icon;
}
