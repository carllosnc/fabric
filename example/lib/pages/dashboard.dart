import 'package:fabric/fabric.dart';
import 'package:flutter/material.dart';
import '../components/fabric_drawer.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String _selectedRange = '30D';
  String _selectedFilter = 'Todos';

  late final List<_TransactionItem> _allTransactions = <_TransactionItem>[
    _TransactionItem(
      customer: 'Stark Industries',
      plan: 'Plano Enterprise',
      date: 'Hoje, 15:42',
      amount: r'+ R$ 14.800,00',
      isPositive: true,
      status: 'Concluído',
      initials: 'SI',
    ),
    _TransactionItem(
      customer: 'Acme Corporation',
      plan: 'Plano Pro',
      date: 'Hoje, 12:18',
      amount: r'+ R$ 290,00',
      isPositive: true,
      status: 'Concluído',
      initials: 'AC',
    ),
    _TransactionItem(
      customer: 'Design Studio Brasil',
      plan: 'Upgrade Licenças',
      date: 'Ontem, 19:05',
      amount: r'+ R$ 450,00',
      isPositive: true,
      status: 'Concluído',
      initials: 'DS',
    ),
    _TransactionItem(
      customer: 'Dev Labs Agência',
      plan: 'Plano Starter',
      date: 'Ontem, 08:30',
      amount: r'+ R$ 49,00',
      isPositive: true,
      status: 'Pendente',
      initials: 'DL',
    ),
    _TransactionItem(
      customer: 'Nexus Tech Ltda',
      plan: 'Cancelamento',
      date: '02 Nov, 17:12',
      amount: r'- R$ 290,00',
      isPositive: false,
      status: 'Estorno',
      initials: 'NT',
    ),
    _TransactionItem(
      customer: 'Pixel Craft Studio',
      plan: 'Plano Pro',
      date: '01 Nov, 14:20',
      amount: r'+ R$ 290,00',
      isPositive: true,
      status: 'Concluído',
      initials: 'PC',
    ),
  ];

  Future<void> _handleRefresh() async {
    await Future<void>.delayed(const Duration(milliseconds: 600));
    if (mounted) {
      setState(() {});
    }
  }

  void _showNewSaleSheet() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      useSafeArea: true,
      builder: (BuildContext context) {
        return _NewSaleBottomSheet(
          onSaleCreated: (_TransactionItem newSale) {
            setState(() {
              _allTransactions.insert(0, newSale);
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Venda de ${newSale.customer} registrada com sucesso!',
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final FabricThemeExtension tokens = context.fabricTokens;

    final List<_TransactionItem> filteredTransactions =
        _allTransactions.where((_TransactionItem item) {
      if (_selectedFilter == 'Todos') {
        return true;
      }
      return item.status == _selectedFilter;
    }).toList();

    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text('Dashboard'),
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                tooltip: 'Voltar',
                onPressed: () => Navigator.pop(context),
              )
            : null,
        actions: <Widget>[
          FilledButton.icon(
            onPressed: _showNewSaleSheet,
            icon: const Icon(Icons.add_rounded, size: 16),
            label: const Text('Nova Venda'),
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              visualDensity: VisualDensity.compact,
              textStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 4),
          IconButton(
            icon: const Badge(
              smallSize: 7,
              child: Icon(Icons.notifications_outlined, size: 20),
            ),
            tooltip: 'Notificações',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Nenhuma notificação não lida.')),
              );
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 680),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // 1. Cabeçalho Vertical (Sem disputa lateral de espaço)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Visão Geral',
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Acompanhe o faturamento e métricas da operação.',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: tokens.mutedForeground,
                        ),
                      ),
                      const SizedBox(height: 14),

                      // Seletor de período em largura total com rótulos compactos e sem ícone check
                      SizedBox(
                        width: double.infinity,
                        child: SegmentedButton<String>(
                          showSelectedIcon: false,
                          segments: const <ButtonSegment<String>>[
                            ButtonSegment<String>(
                              value: '30D',
                              label: Text(
                                '30D',
                                maxLines: 1,
                                softWrap: false,
                                overflow: TextOverflow.ellipsis,
                              ),
                              tooltip: 'Últimos 30 dias',
                            ),
                            ButtonSegment<String>(
                              value: '90D',
                              label: Text(
                                '90D',
                                maxLines: 1,
                                softWrap: false,
                                overflow: TextOverflow.ellipsis,
                              ),
                              tooltip: 'Últimos 90 dias',
                            ),
                            ButtonSegment<String>(
                              value: '1A',
                              label: Text(
                                '1 Ano',
                                maxLines: 1,
                                softWrap: false,
                                overflow: TextOverflow.ellipsis,
                              ),
                              tooltip: 'Último ano',
                            ),
                            ButtonSegment<String>(
                              value: 'Tudo',
                              label: Text(
                                'Tudo',
                                maxLines: 1,
                                softWrap: false,
                                overflow: TextOverflow.ellipsis,
                              ),
                              tooltip: 'Todo o histórico',
                            ),
                          ],
                          selected: <String>{_selectedRange},
                          onSelectionChanged: (Set<String> newSelection) {
                            setState(() {
                              _selectedRange = newSelection.first;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // 2. Hero Card de Faturamento (Linha única sem quebras)
                  Card(
                    margin: EdgeInsets.zero,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'FATURAMENTO CONSOLIDADO',
                            style: theme.textTheme.labelSmall?.copyWith(
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.8,
                              color: tokens.mutedForeground,
                              fontSize: 11,
                            ),
                          ),
                          const SizedBox(height: 8),

                          // Valor amplo com FittedBox para escala segura
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              r'R$ 48.250,00',
                              style: theme.textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.w800,
                                letterSpacing: -0.6,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),

                          // Variação percentual abaixo do valor
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 3.5,
                                ),
                                decoration: BoxDecoration(
                                  color: tokens.successColor.withValues(
                                    alpha: 0.12,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Icon(
                                      Icons.arrow_upward_rounded,
                                      size: 13,
                                      color: tokens.successColor,
                                    ),
                                    const SizedBox(width: 3),
                                    Text(
                                      '+14.2%',
                                      style: TextStyle(
                                        fontSize: 11.5,
                                        fontWeight: FontWeight.w700,
                                        color: tokens.successColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'vs período anterior',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: tokens.mutedForeground,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 18),

                          // Divisor e Meta Mensal
                          Divider(
                            height: 1,
                            color: tokens.borderColor.withValues(alpha: 0.6),
                          ),
                          const SizedBox(height: 14),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                r'Meta do mês: R$ 50.000,00',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: tokens.mutedForeground,
                                ),
                              ),
                              Text(
                                '96.5% atingido',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: tokens.successColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: const LinearProgressIndicator(
                              value: 0.965,
                              minHeight: 6,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 3. Métricas Secundárias em Cartão Único e Limpo
                  Card(
                    margin: EdgeInsets.zero,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Assinantes Ativos',
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      color: tokens.mutedForeground,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    '1.284',
                                    style: theme.textTheme.titleLarge?.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: tokens.successColor.withValues(
                                    alpha: 0.12,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  '+96 este mês',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: tokens.successColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 1,
                          color: tokens.borderColor.withValues(alpha: 0.6),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Ticket Médio',
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      color: tokens.mutedForeground,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    r'R$ 290,00',
                                    style: theme.textTheme.titleLarge?.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'por cliente',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: tokens.mutedForeground,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // 4. Cabeçalho Integrado com Filtro Dropdown Elegante (Sem chips soltos)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'Transações Recentes',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 7,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: tokens.surfaceElevated,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: tokens.borderColor.withValues(
                                  alpha: 0.8,
                                ),
                              ),
                            ),
                            child: Text(
                              '${filteredTransactions.length}',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: tokens.mutedForeground,
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Filtro Integrado em Menu Compacto
                      PopupMenuButton<String>(
                        initialValue: _selectedFilter,
                        tooltip: 'Filtrar por status',
                        onSelected: (String value) {
                          setState(() {
                            _selectedFilter = value;
                          });
                        },
                        itemBuilder: (BuildContext context) =>
                            const <PopupMenuEntry<String>>[
                          PopupMenuItem<String>(
                            value: 'Todos',
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.clear_all_rounded, size: 18),
                                SizedBox(width: 10),
                                Text('Todos'),
                              ],
                            ),
                          ),
                          PopupMenuItem<String>(
                            value: 'Concluído',
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.check_circle_outline_rounded,
                                  size: 18,
                                  color: Color(0xFF10B981),
                                ),
                                SizedBox(width: 10),
                                Text('Concluído'),
                              ],
                            ),
                          ),
                          PopupMenuItem<String>(
                            value: 'Pendente',
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.schedule_rounded,
                                  size: 18,
                                  color: Color(0xFFF59E0B),
                                ),
                                SizedBox(width: 10),
                                Text('Pendente'),
                              ],
                            ),
                          ),
                          PopupMenuItem<String>(
                            value: 'Estorno',
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.replay_rounded,
                                  size: 18,
                                  color: Color(0xFFEF4444),
                                ),
                                SizedBox(width: 10),
                                Text('Estorno'),
                              ],
                            ),
                          ),
                        ],
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5.5,
                          ),
                          decoration: BoxDecoration(
                            color: _selectedFilter == 'Todos'
                                ? tokens.surfaceElevated
                                : theme.colorScheme.primary.withValues(
                                    alpha: 0.12,
                                  ),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: _selectedFilter == 'Todos'
                                  ? tokens.borderColor
                                  : theme.colorScheme.primary.withValues(
                                      alpha: 0.4,
                                    ),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(
                                Icons.filter_list_rounded,
                                size: 14,
                                color: _selectedFilter == 'Todos'
                                    ? tokens.mutedForeground
                                    : theme.colorScheme.primary,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                _selectedFilter,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: _selectedFilter == 'Todos'
                                      ? theme.colorScheme.onSurface
                                      : theme.colorScheme.primary,
                                ),
                              ),
                              const SizedBox(width: 2),
                              Icon(
                                Icons.arrow_drop_down_rounded,
                                size: 18,
                                color: tokens.mutedForeground,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Lista Unificada de Transações (Superfície Única)
                  if (filteredTransactions.isEmpty)
                    Card(
                      margin: EdgeInsets.zero,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 40,
                          horizontal: 24,
                        ),
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.inbox_outlined,
                                size: 36,
                                color: tokens.mutedForeground,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Nenhuma transação encontrada',
                                style: theme.textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Não há registros com o status "$_selectedFilter".',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: tokens.mutedForeground,
                                ),
                              ),
                              const SizedBox(height: 12),
                              TextButton.icon(
                                onPressed: () {
                                  setState(() {
                                    _selectedFilter = 'Todos';
                                  });
                                },
                                icon: const Icon(
                                  Icons.clear_all_rounded,
                                  size: 16,
                                ),
                                label: const Text('Limpar filtro'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  else
                    Card(
                      clipBehavior: Clip.antiAlias,
                      margin: EdgeInsets.zero,
                      child: Column(
                        children: <Widget>[
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: filteredTransactions.length,
                            separatorBuilder:
                                (BuildContext context, int index) => Divider(
                              height: 1,
                              indent: 68,
                              color: tokens.borderColor.withValues(alpha: 0.6),
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              final _TransactionItem item =
                                  filteredTransactions[index];
                              return InkWell(
                                onTap: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        '${item.customer}: ${item.amount} (${item.status})',
                                      ),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 13,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: theme.colorScheme
                                              .surfaceContainerHighest,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: tokens.borderColor,
                                            width: 1.2,
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          item.initials,
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w700,
                                            color: theme.colorScheme.onSurface,
                                            letterSpacing: -0.2,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            // Linha Superior: Nome do Cliente à esquerda, Valor à direita
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Expanded(
                                                  child: Text(
                                                    item.customer,
                                                    style: theme
                                                        .textTheme.titleSmall
                                                        ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 8),
                                                Text(
                                                  item.amount,
                                                  style: theme
                                                      .textTheme.titleSmall
                                                      ?.copyWith(
                                                    fontWeight: FontWeight.w700,
                                                    color: item.isPositive
                                                        ? tokens.successColor
                                                        : theme
                                                            .colorScheme.error,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 3),
                                            // Linha Inferior: Plano à esquerda, Data e Status à direita
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Expanded(
                                                  child: Text(
                                                    item.plan,
                                                    style: theme
                                                        .textTheme.bodySmall
                                                        ?.copyWith(
                                                      color: tokens
                                                          .mutedForeground,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 8),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    Text(
                                                      item.date,
                                                      style: theme
                                                          .textTheme.bodySmall
                                                          ?.copyWith(
                                                        color: tokens
                                                            .mutedForeground,
                                                        fontSize: 11.5,
                                                      ),
                                                    ),
                                                    if (item.status !=
                                                        'Concluído') ...<Widget>[
                                                      const SizedBox(width: 6),
                                                      Container(
                                                        width: 5,
                                                        height: 5,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: item.status ==
                                                                  'Pendente'
                                                              ? (theme.brightness ==
                                                                      Brightness
                                                                          .dark
                                                                  ? const Color(
                                                                      0xFFFBBF24)
                                                                  : const Color(
                                                                      0xFFB45309))
                                                              : theme
                                                                  .colorScheme
                                                                  .error,
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                      ),
                                                      const SizedBox(width: 4),
                                                      Text(
                                                        item.status,
                                                        style: TextStyle(
                                                          fontSize: 11,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: item.status ==
                                                                  'Pendente'
                                                              ? (theme.brightness ==
                                                                      Brightness
                                                                          .dark
                                                                  ? const Color(
                                                                      0xFFFBBF24)
                                                                  : const Color(
                                                                      0xFFB45309))
                                                              : theme
                                                                  .colorScheme
                                                                  .error,
                                                        ),
                                                      ),
                                                    ],
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          Divider(
                            height: 1,
                            color: tokens.borderColor.withValues(alpha: 0.6),
                          ),
                          InkWell(
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text('Abrindo histórico completo...'),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Center(
                                child: Text(
                                  'Ver histórico completo →',
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: theme.colorScheme.primary,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TransactionItem {
  const _TransactionItem({
    required this.customer,
    required this.plan,
    required this.date,
    required this.amount,
    required this.isPositive,
    required this.status,
    required this.initials,
  });

  final String customer;
  final String plan;
  final String date;
  final String amount;
  final bool isPositive;
  final String status;
  final String initials;
}

class _NewSaleBottomSheet extends StatefulWidget {
  const _NewSaleBottomSheet({
    required this.onSaleCreated,
  });

  final ValueChanged<_TransactionItem> onSaleCreated;

  @override
  State<_NewSaleBottomSheet> createState() => _NewSaleBottomSheetState();
}

class _NewSaleBottomSheetState extends State<_NewSaleBottomSheet> {
  final TextEditingController _customerController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  String _selectedPlan = 'Plano Pro • Mensal';
  String _selectedStatus = 'Concluído';

  @override
  void dispose() {
    _customerController.dispose();
    _amountController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    final String customer = _customerController.text.trim();
    final String rawAmount = _amountController.text.trim();

    if (customer.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, informe o nome do cliente.')),
      );
      return;
    }

    final String amountFormatted = rawAmount.isNotEmpty
        ? (rawAmount.startsWith('R\$') ? '+ $rawAmount' : '+ R\$ $rawAmount')
        : r'+ R$ 290,00';

    final String initials = customer.length >= 2
        ? customer.substring(0, 2).toUpperCase()
        : customer.toUpperCase();

    final _TransactionItem newSale = _TransactionItem(
      customer: customer,
      plan: _selectedPlan,
      date: 'Agora mesmo',
      amount: amountFormatted,
      isPositive: true,
      status: _selectedStatus,
      initials: initials,
    );

    widget.onSaleCreated(newSale);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final FabricThemeExtension tokens = context.fabricTokens;

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.88,
        maxWidth: 640,
      ),
      child: Column(
        children: <Widget>[
          // Header com título e fechar
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 14, 16, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Registrar Nova Venda',
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Atualize a receita e histórico da operação.',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: tokens.mutedForeground,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close_rounded, size: 20),
                  tooltip: 'Fechar',
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            color: tokens.borderColor.withValues(alpha: 0.6),
          ),

          // Formulário com rolagem segura e espaçamento confortável
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(
                24,
                24,
                24,
                MediaQuery.of(context).viewInsets.bottom + 32,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Cliente
                  Text(
                    'CLIENTE / EMPRESA',
                    style: theme.textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.8,
                      color: tokens.mutedForeground,
                      fontSize: 11,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _customerController,
                    decoration: const InputDecoration(
                      hintText: 'Ex: Nubank, Stone, XP Inc...',
                      prefixIcon: Icon(Icons.business_rounded),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Plano Contratado
                  Text(
                    'PLANO OU SERVIÇO',
                    style: theme.textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.8,
                      color: tokens.mutedForeground,
                      fontSize: 11,
                    ),
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    initialValue: _selectedPlan,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.workspace_premium_rounded),
                    ),
                    items: const <DropdownMenuItem<String>>[
                      DropdownMenuItem<String>(
                        value: 'Plano Enterprise • Anual',
                        child: Text('Plano Enterprise • Anual'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Plano Pro • Mensal',
                        child: Text('Plano Pro • Mensal'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Plano Starter • Mensal',
                        child: Text('Plano Starter • Mensal'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Upgrade Licenças • Assentos',
                        child: Text('Upgrade Licenças • Assentos'),
                      ),
                    ],
                    onChanged: (String? value) {
                      if (value != null) {
                        setState(() {
                          _selectedPlan = value;
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 24),

                  // Valor
                  Text(
                    r'VALOR DA TRANSAÇÃO (R$)',
                    style: theme.textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.8,
                      color: tokens.mutedForeground,
                      fontSize: 11,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _amountController,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    decoration: const InputDecoration(
                      hintText: 'Ex: 2.450,00',
                      prefixIcon: Icon(Icons.payments_rounded),
                      prefixText: r'R$ ',
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Status
                  Text(
                    'STATUS DO PAGAMENTO',
                    style: theme.textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.8,
                      color: tokens.mutedForeground,
                      fontSize: 11,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: SegmentedButton<String>(
                      showSelectedIcon: false,
                      segments: const <ButtonSegment<String>>[
                        ButtonSegment<String>(
                          value: 'Concluído',
                          label: Text(
                            'Concluído (Pago)',
                            maxLines: 1,
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                          ),
                          icon: Icon(
                            Icons.check_circle_outline_rounded,
                            size: 16,
                          ),
                        ),
                        ButtonSegment<String>(
                          value: 'Pendente',
                          label: Text(
                            'Pendente (Faturado)',
                            maxLines: 1,
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                          ),
                          icon: Icon(
                            Icons.schedule_rounded,
                            size: 16,
                          ),
                        ),
                      ],
                      selected: <String>{_selectedStatus},
                      onSelectionChanged: (Set<String> newSelection) {
                        setState(() {
                          _selectedStatus = newSelection.first;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Observações
                  Text(
                    'OBSERVAÇÕES (OPCIONAL)',
                    style: theme.textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.8,
                      color: tokens.mutedForeground,
                      fontSize: 11,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _notesController,
                    maxLines: 2,
                    decoration: const InputDecoration(
                      hintText: 'Nota fiscal, canal de aquisição...',
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Botões de Ação
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancelar'),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: FilledButton.icon(
                          style: FilledButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          onPressed: _handleSubmit,
                          icon: const Icon(Icons.check_rounded, size: 18),
                          label: const Text('Registrar Venda'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
