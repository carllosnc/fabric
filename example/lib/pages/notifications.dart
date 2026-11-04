import 'package:fabric/fabric.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../components/fabric_drawer.dart';

enum NotificationCategory {
  security('Segurança', Icons.shield_outlined),
  projects('Projetos', Icons.code_rounded),
  billing('Faturamento', Icons.credit_card_outlined),
  system('Sistema', Icons.dns_outlined),
  mentions('Menções', Icons.alternate_email_rounded);

  const NotificationCategory(this.label, this.icon);
  final String label;
  final IconData icon;
}

class _NotificationItem {
  _NotificationItem({
    required this.id,
    required this.title,
    required this.description,
    required this.timestamp,
    required this.category,
    required this.group,
    this.isRead = false,
    this.actionLabel,
    this.details,
  });

  final String id;
  final String title;
  final String description;
  final String timestamp;
  final NotificationCategory category;
  final String group;
  bool isRead;
  final String? actionLabel;
  final String? details;
}

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  String _selectedCategory = 'Todos';

  late final List<_NotificationItem> _notifications = <_NotificationItem>[
    _NotificationItem(
      id: '1',
      title: 'Alerta de Segurança: Novo Acesso',
      description:
          'Detectado login via Chrome no macOS a partir de São Paulo, Brasil. Caso não reconheça, revogue imediatamente a sessão.',
      timestamp: 'Há 12 min',
      category: NotificationCategory.security,
      group: 'Hoje',
      isRead: false,
      actionLabel: 'Verificar Acesso',
      details:
          'IP de Origem: 189.40.72.105\nDispositivo: Apple MacBook Pro (macOS 15.1)\nNavegador: Google Chrome 130.0\nLocal aproximado: São Paulo - SP, Brasil\nStatus: Sessão ativa',
    ),
    _NotificationItem(
      id: '2',
      title: 'Mariana Santos mencionou você em #design-system',
      description:
          '"@carlos.fabric você pode conferir o contraste dos novos tokens de cores base no dark mode antes do merge da branch?"',
      timestamp: 'Há 45 min',
      category: NotificationCategory.mentions,
      group: 'Hoje',
      isRead: false,
      actionLabel: 'Responder',
      details:
          'Canal: #design-system-core\nThread: Revisão de Contraste WCAG AAA (PR #142)\nAutor: Mariana Santos (Staff Designer)\nData: Hoje às 14:02',
    ),
    _NotificationItem(
      id: '3',
      title: 'Pull Request #89 Aprovado com Sucesso',
      description:
          'Seu pull request "feat: concentric border radius tokens & settings redesign" recebeu aprovação de 2 revisores.',
      timestamp: 'Há 2 horas',
      category: NotificationCategory.projects,
      group: 'Hoje',
      isRead: false,
      actionLabel: 'Ver Pull Request',
      details:
          'Repositório: fabric/core-ui\nRevisores: Alexandre Silva, Débora Lima\nChecks de CI: 88/88 testes passando\nBranch: master <- feat/concentric-radius',
    ),
    _NotificationItem(
      id: '4',
      title: 'Fatura de Novembro Processada com Sucesso',
      description:
          'O pagamento recorrente da assinatura Plano Pro no valor de R\$ 290,00 foi confirmado.',
      timestamp: 'Ontem, 16:30',
      category: NotificationCategory.billing,
      group: 'Ontem',
      isRead: true,
      actionLabel: 'Ver Fatura',
      details:
          'Número da Fatura: FAB-2026-11-0941\nValor: R\$ 290,00 / mês\nMétodo: Cartão de Crédito com final 4022\nPróxima renovação: 04/12/2026',
    ),
    _NotificationItem(
      id: '5',
      title: 'Deploy em Produção Concluído (v1.2.4)',
      description:
          'A versão 1.2.4 do Fabric Theme foi publicada nos nós de borda sem instabilidades ou regressões detectadas.',
      timestamp: 'Ontem, 11:15',
      category: NotificationCategory.system,
      group: 'Ontem',
      isRead: true,
      actionLabel: 'Ver Telemetria',
      details:
          'Ambiente: Produção (Global Edge)\nTempo de build: 1m 42s\nLatência média p95: 18ms\nErros 5xx: 0.00%',
    ),
    _NotificationItem(
      id: '6',
      title: 'Backup Automático de Banco de Dados Finalizado',
      description:
          'Snapshot diário de 42.8 GB concluído e replicado para o armazenamento seguro em nuvem.',
      timestamp: 'Terça-feira, 03:00',
      category: NotificationCategory.system,
      group: 'Esta semana',
      isRead: true,
      actionLabel: 'Ver Logs',
      details:
          'Tamanho do dump: 42.8 GB\nCriptografia: AES-256 GCM\nDestino: s3://fabric-backups-sa-east-1/daily-snapshot\nChecksum SHA256 verificado',
    ),
    _NotificationItem(
      id: '7',
      title: 'Novo Token de Acesso Pessoal Gerado',
      description:
          'Um novo token com permissões de leitura de pacotes foi emitido a partir de um terminal de desenvolvimento.',
      timestamp: 'Segunda-feira, 19:40',
      category: NotificationCategory.security,
      group: 'Esta semana',
      isRead: true,
      actionLabel: 'Gerenciar Chaves',
      details:
          'Identificador: tk_live_839f20c\nEscopos: packages:read, org:members:read\nValidade: 90 dias (expira em Fevereiro/2027)\nCriado por: CLI via macOS',
    ),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  int get _unreadCount =>
      _notifications.where((_NotificationItem item) => !item.isRead).length;

  List<_NotificationItem> get _filteredNotifications {
    return _notifications.where((_NotificationItem item) {
      // 1. Filtro por chip
      if (_selectedCategory == 'Não lidas' && item.isRead) {
        return false;
      }
      if (_selectedCategory != 'Todos' &&
          _selectedCategory != 'Não lidas' &&
          item.category.label != _selectedCategory) {
        return false;
      }

      // 2. Filtro por busca
      if (_searchQuery.isNotEmpty) {
        final String query = _searchQuery.toLowerCase();
        final bool matchesTitle = item.title.toLowerCase().contains(query);
        final bool matchesDesc = item.description.toLowerCase().contains(query);
        final bool matchesCategory =
            item.category.label.toLowerCase().contains(query);
        if (!matchesTitle && !matchesDesc && !matchesCategory) {
          return false;
        }
      }

      return true;
    }).toList();
  }

  void _markAllAsRead() {
    final int unreadBefore = _unreadCount;
    if (unreadBefore == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Todas as notificações já foram lidas.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    setState(() {
      for (final _NotificationItem item in _notifications) {
        item.isRead = true;
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$unreadBefore notificações marcadas como lidas.'),
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {},
        ),
      ),
    );
  }

  void _toggleReadStatus(_NotificationItem item) {
    setState(() {
      item.isRead = !item.isRead;
    });
    HapticFeedback.lightImpact();
  }

  void _deleteNotification(_NotificationItem item) {
    setState(() {
      _notifications.removeWhere((_NotificationItem el) => el.id == item.id);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Notificação removida.'),
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(
          label: 'Desfazer',
          onPressed: () {
            setState(() {
              _notifications.add(item);
            });
          },
        ),
      ),
    );
  }

  void _showNotificationDetails(_NotificationItem item) {
    if (!item.isRead) {
      setState(() {
        item.isRead = true;
      });
    }

    final ThemeData theme = Theme.of(context);
    final FabricThemeExtension tokens = context.fabricTokens;

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      useSafeArea: true,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Header com ícone e categoria
                Row(
                  children: <Widget>[
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        item.category.icon,
                        color: theme.colorScheme.onPrimary,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: tokens.surfaceElevated,
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                    color: tokens.borderColor.withValues(alpha: 0.7),
                                  ),
                                ),
                                child: Text(
                                  item.category.label,
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 10.5,
                                    fontWeight: FontWeight.w600,
                                    color: tokens.mutedForeground,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Flexible(
                                child: Text(
                                  item.timestamp,
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: tokens.mutedForeground,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item.title,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Descrição principal
                Text(
                  item.description,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    height: 1.5,
                  ),
                ),

                if (item.details != null) ...<Widget>[
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: tokens.surfaceElevated,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: tokens.borderColor),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'INFORMAÇÕES ADICIONAIS',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: tokens.mutedForeground,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.8,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item.details!,
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontFamily: 'monospace',
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],

                const SizedBox(height: 24),

                // Ações do rodapé
                Row(
                  children: <Widget>[
                    if (item.actionLabel != null)
                      Expanded(
                        child: FilledButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(this.context).showSnackBar(
                              SnackBar(
                                content: Text('Ação: ${item.actionLabel}'),
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                          },
                          icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                          label: Text(item.actionLabel!),
                        ),
                      ),
                    if (item.actionLabel != null) const SizedBox(width: 12),
                    OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Fechar'),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final FabricThemeExtension tokens = context.fabricTokens;
    final List<_NotificationItem> filtered = _filteredNotifications;

    // Agrupamento por data (Hoje, Ontem, Esta semana)
    final Map<String, List<_NotificationItem>> grouped =
        <String, List<_NotificationItem>>{};
    for (final _NotificationItem item in filtered) {
      grouped.putIfAbsent(item.group, () => <_NotificationItem>[]).add(item);
    }

    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Flexible(
              child: Text(
                'Notificações',
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (_unreadCount > 0) ...<Widget>[
              const SizedBox(width: 8),
              Badge.count(
                count: _unreadCount,
                backgroundColor: theme.colorScheme.primary,
                textColor: theme.colorScheme.onPrimary,
              ),
            ],
          ],
        ),
        actions: <Widget>[
          IconButton(
            tooltip: 'Marcar todas como lidas',
            icon: const Icon(Icons.done_all_rounded),
            onPressed: _markAllAsRead,
          ),
          PopupMenuButton<String>(
            tooltip: 'Mais opções',
            icon: const Icon(Icons.more_vert_rounded),
            onSelected: (String value) {
              if (value == 'mark_all') {
                _markAllAsRead();
              } else if (value == 'clear_filters') {
                setState(() {
                  _searchController.clear();
                  _searchQuery = '';
                  _selectedCategory = 'Todos';
                });
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'mark_all',
                child: Row(
                  children: <Widget>[
                    Icon(Icons.checklist_rounded, size: 20),
                    SizedBox(width: 10),
                    Text('Marcar todas como lidas'),
                  ],
                ),
              ),
              const PopupMenuItem<String>(
                value: 'clear_filters',
                child: Row(
                  children: <Widget>[
                    Icon(Icons.filter_alt_off_outlined, size: 20),
                    SizedBox(width: 10),
                    Text('Limpar filtros'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          // Header: Barra de Pesquisa e Chips de Filtro abaixo
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 16),

                // Barra de Pesquisa com padding horizontal de 16
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    controller: _searchController,
                    onChanged: (String value) {
                      setState(() {
                        _searchQuery = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Buscar por título, projeto ou mensagem...',
                      prefixIcon: const Icon(Icons.search_rounded),
                      suffixIcon: _searchQuery.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.clear_rounded),
                              onPressed: () {
                                _searchController.clear();
                                setState(() {
                                  _searchQuery = '';
                                });
                              },
                            )
                          : null,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: tokens.borderColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: tokens.borderColor),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // Chips de Categoria abaixo da busca com scroll edge-to-edge e padding interno
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: <Widget>[
                      _buildCategoryChip('Todos'),
                      const SizedBox(width: 8),
                      _buildCategoryChip('Não lidas'),
                      const SizedBox(width: 8),
                      _buildCategoryChip('Segurança'),
                      const SizedBox(width: 8),
                      _buildCategoryChip('Projetos'),
                      const SizedBox(width: 8),
                      _buildCategoryChip('Faturamento'),
                      const SizedBox(width: 8),
                      _buildCategoryChip('Sistema'),
                      const SizedBox(width: 8),
                      _buildCategoryChip('Menções'),
                    ],
                  ),
                ),

                if (_searchQuery.isNotEmpty || _selectedCategory != 'Todos') ...<Widget>[
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            '${filtered.length} ${filtered.length == 1 ? 'resultado encontrado' : 'resultados encontrados'}',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: tokens.mutedForeground,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _searchController.clear();
                              _searchQuery = '';
                              _selectedCategory = 'Todos';
                            });
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: const Size(50, 30),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: const Text('Limpar filtros'),
                        ),
                      ],
                    ),
                  ),
                ],
                const SizedBox(height: 4),
              ],
            ),
          ),

          // Lista de Notificações ou Empty State
          if (filtered.isEmpty)
            SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                          color: tokens.surfaceElevated,
                          shape: BoxShape.circle,
                          border: Border.all(color: tokens.borderColor),
                        ),
                        child: Icon(
                          _selectedCategory == 'Não lidas'
                              ? Icons.done_all_rounded
                              : Icons.notifications_none_rounded,
                          size: 34,
                          color: tokens.mutedForeground,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        _selectedCategory == 'Não lidas'
                            ? 'Tudo em dia!'
                            : 'Nenhuma notificação encontrada',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _selectedCategory == 'Não lidas'
                            ? 'Você não possui notificações não lidas no momento.'
                            : 'Tente alterar a pesquisa ou selecionar outra categoria.',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: tokens.mutedForeground,
                        ),
                      ),
                      const SizedBox(height: 20),
                      OutlinedButton(
                        onPressed: () {
                          setState(() {
                            _selectedCategory = 'Todos';
                            _searchController.clear();
                            _searchQuery = '';
                          });
                        },
                        child: const Text('Ver todas as notificações'),
                      ),
                    ],
                  ),
                ),
              ),
            )
          else
            ...grouped.entries.map((MapEntry<String, List<_NotificationItem>> entry) {
              return SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      if (index == 0) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(4, 20, 4, 10),
                          child: Text(
                            entry.key.toUpperCase(),
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: tokens.mutedForeground,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.1,
                              fontSize: 11,
                            ),
                          ),
                        );
                      }
                      final _NotificationItem item = entry.value[index - 1];
                      return _NotificationCardItem(
                        item: item,
                        onTap: () => _showNotificationDetails(item),
                        onToggleRead: () => _toggleReadStatus(item),
                        onDelete: () => _deleteNotification(item),
                        onAction: () {
                          if (item.actionLabel != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Ação: ${item.actionLabel}'),
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                          }
                        },
                      );
                    },
                    childCount: entry.value.length + 1,
                  ),
                ),
              );
            }),

          const SliverToBoxAdapter(
            child: SizedBox(height: 36),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String category) {
    final bool isSelected = _selectedCategory == category;

    return FilterChip(
      label: Text(category),
      selected: isSelected,
      onSelected: (bool selected) {
        setState(() {
          _selectedCategory = category;
        });
      },
    );
  }
}

class _NotificationCardItem extends StatelessWidget {
  const _NotificationCardItem({
    required this.item,
    required this.onTap,
    required this.onToggleRead,
    required this.onDelete,
    required this.onAction,
  });

  final _NotificationItem item;
  final VoidCallback onTap;
  final VoidCallback onToggleRead;
  final VoidCallback onDelete;
  final VoidCallback onAction;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final FabricThemeExtension tokens = context.fabricTokens;

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Linha Superior: Ícone, Título, Badge de Categoria, Timestamp e Menu
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Container de Ícone Temático com alto contraste (38x38, raio 10)
                  Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: item.isRead
                          ? (tokens.isDark ? tokens.swatch.shade800 : tokens.swatch.shade200)
                          : theme.colorScheme.primary,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: item.isRead
                            ? tokens.borderColor
                            : theme.colorScheme.primary,
                        width: 1,
                      ),
                    ),
                    child: Icon(
                      item.category.icon,
                      color: item.isRead
                          ? (tokens.isDark ? tokens.swatch.shade200 : tokens.swatch.shade800)
                          : theme.colorScheme.onPrimary,
                      size: 19,
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Título, Categoria e Data
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            if (!item.isRead) ...<Widget>[
                              Container(
                                width: 7,
                                height: 7,
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.primary,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 6),
                            ],
                            Expanded(
                              child: Text(
                                item.title,
                                style: theme.textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: <Widget>[
                            // Badge de Categoria estilo Fabric (pill compacto)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 5,
                                vertical: 1.5,
                              ),
                              decoration: BoxDecoration(
                                color: tokens.surfaceElevated,
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: tokens.borderColor.withValues(alpha: 0.7),
                                ),
                              ),
                              child: Text(
                                item.category.label,
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: tokens.mutedForeground,
                                ),
                              ),
                            ),
                            const SizedBox(width: 6),
                            Flexible(
                              child: Text(
                                '•  ${item.timestamp}',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: tokens.mutedForeground,
                                  fontSize: 11.5,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Menu Popup de 3 Pontos
                  PopupMenuButton<String>(
                    icon: Icon(
                      Icons.more_vert_rounded,
                      color: tokens.mutedForeground,
                      size: 18,
                    ),
                    tooltip: 'Opções da notificação',
                    padding: EdgeInsets.zero,
                    onSelected: (String value) {
                      if (value == 'toggle_read') {
                        onToggleRead();
                      } else if (value == 'delete') {
                        onDelete();
                      }
                    },
                    itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                      PopupMenuItem<String>(
                        value: 'toggle_read',
                        child: Row(
                          children: <Widget>[
                            Icon(
                              item.isRead
                                  ? Icons.mark_email_unread_outlined
                                  : Icons.done_rounded,
                              size: 18,
                            ),
                            const SizedBox(width: 8),
                            Text(item.isRead
                                ? 'Marcar como não lida'
                                : 'Marcar como lida'),
                          ],
                        ),
                      ),
                      const PopupMenuItem<String>(
                        value: 'delete',
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.delete_outline_rounded,
                                size: 18, color: Colors.red),
                            SizedBox(width: 8),
                            Text('Excluir', style: TextStyle(color: Colors.red)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // Descrição
              Text(
                item.description,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: item.isRead
                      ? tokens.mutedForeground
                      : theme.colorScheme.onSurface,
                  fontSize: 12.5,
                  height: 1.4,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              // Rodapé com Ações Contextuais (se houver ação definida)
              if (item.actionLabel != null) ...<Widget>[
                const SizedBox(height: 10),
                Divider(
                  height: 1,
                  color: tokens.borderColor.withValues(alpha: 0.5),
                ),
                const SizedBox(height: 6),
                Row(
                  children: <Widget>[
                    TextButton.icon(
                      onPressed: onAction,
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      icon: const Icon(Icons.arrow_outward_rounded, size: 14),
                      label: Text(
                        item.actionLabel!,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      tooltip: item.isRead
                          ? 'Marcar como não lida'
                          : 'Marcar como lida',
                      icon: Icon(
                        item.isRead
                            ? Icons.mark_email_unread_outlined
                            : Icons.check_circle_outline_rounded,
                        size: 18,
                        color: tokens.mutedForeground,
                      ),
                      visualDensity: VisualDensity.compact,
                      onPressed: onToggleRead,
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
