import 'package:fabric/fabric.dart';
import 'package:flutter/material.dart';
import '../components/fabric_drawer.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _pushNotifications = true;
  bool _emailDigest = true;
  bool _securityAlerts = true;
  bool _compactMode = false;
  String _themeSelection = 'system';

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
        title: const Text('Configurações'),
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                tooltip: 'Voltar',
                onPressed: () => Navigator.pop(context),
              )
            : null,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            children: <Widget>[
              // Card do Perfil do Usuário
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: theme.colorScheme.primary,
                        foregroundColor: theme.colorScheme.onPrimary,
                        child: const Text(
                          'AS',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    'Alexandre Silva',
                                    style:
                                        theme.textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: tokens.surfaceElevated,
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                      color: tokens.borderColor,
                                    ),
                                  ),
                                  child: Text(
                                    'PRO',
                                    style:
                                        theme.textTheme.labelSmall?.copyWith(
                                      fontSize: 9.5,
                                      fontWeight: FontWeight.w700,
                                      color: theme.colorScheme.primary,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'alexandre.silva@empresa.com',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: tokens.mutedForeground,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      OutlinedButton(
                        onPressed: () => _showFeedback('Editar perfil'),
                        child: const Text('Editar'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 36),

              // Seção: Aparência
              _SectionHeader(title: 'APARÊNCIA', tokens: tokens, theme: theme),
              const SizedBox(height: 10),
              Card(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Tema do Aplicativo',
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Selecione sua preferência de visualização.',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: tokens.mutedForeground,
                            ),
                          ),
                          const SizedBox(height: 12),
                          SegmentedButton<String>(
                            segments: const <ButtonSegment<String>>[
                              ButtonSegment<String>(
                                value: 'light',
                                icon: Icon(Icons.light_mode_outlined, size: 16),
                                label: Text('Claro'),
                              ),
                              ButtonSegment<String>(
                                value: 'dark',
                                icon: Icon(Icons.dark_mode_outlined, size: 16),
                                label: Text('Escuro'),
                              ),
                              ButtonSegment<String>(
                                value: 'system',
                                icon: Icon(Icons.devices_outlined, size: 16),
                                label: Text('Sistema'),
                              ),
                            ],
                            selected: <String>{_themeSelection},
                            onSelectionChanged: (Set<String> newSelection) {
                              setState(() {
                                _themeSelection = newSelection.first;
                              });
                              _showFeedback('Tema alterado para: $_themeSelection');
                            },
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 1,
                      color: tokens.borderColor.withValues(alpha: 0.6),
                    ),
                    SwitchListTile(
                      title: const Text('Modo Alta Densidade'),
                      subtitle: const Text(
                        'Reduz espaçamentos para exibir mais dados na tela.',
                      ),
                      value: _compactMode,
                      onChanged: (bool value) {
                        setState(() {
                          _compactMode = value;
                        });
                        _showFeedback(
                          value
                              ? 'Alta densidade ativada'
                              : 'Alta densidade desativada',
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 36),

              // Seção: Notificações
              _SectionHeader(
                title: 'NOTIFICAÇÕES',
                tokens: tokens,
                theme: theme,
              ),
              const SizedBox(height: 10),
              Card(
                child: Column(
                  children: <Widget>[
                    SwitchListTile(
                      title: const Text('Notificações Push'),
                      subtitle: const Text(
                        'Alertas em tempo real sobre vendas e movimentações.',
                      ),
                      value: _pushNotifications,
                      onChanged: (bool value) {
                        setState(() {
                          _pushNotifications = value;
                        });
                      },
                    ),
                    Divider(
                      height: 1,
                      color: tokens.borderColor.withValues(alpha: 0.6),
                    ),
                    SwitchListTile(
                      title: const Text('Resumo Semanal por E-mail'),
                      subtitle: const Text(
                        'Relatório consolidado de métricas todo domingo.',
                      ),
                      value: _emailDigest,
                      onChanged: (bool value) {
                        setState(() {
                          _emailDigest = value;
                        });
                      },
                    ),
                    Divider(
                      height: 1,
                      color: tokens.borderColor.withValues(alpha: 0.6),
                    ),
                    SwitchListTile(
                      title: const Text('Alertas de Segurança'),
                      subtitle: const Text(
                        'Avisos sobre novos acessos e alterações de senha.',
                      ),
                      value: _securityAlerts,
                      onChanged: (bool value) {
                        setState(() {
                          _securityAlerts = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 36),

              // Seção: Plano & Assinatura
              _SectionHeader(
                title: 'PLANO & ASSINATURA',
                tokens: tokens,
                theme: theme,
              ),
              const SizedBox(height: 10),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Cabeçalho do Plano: Ícone + Título + Badge de Status
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: theme.colorScheme.primary.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: theme.colorScheme.primary.withValues(alpha: 0.2),
                                width: 1,
                              ),
                            ),
                            child: Icon(
                              Icons.workspace_premium_rounded,
                              size: 24,
                              color: theme.colorScheme.primary,
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Flexible(
                                      child: Text(
                                        'Plano Fabric Enterprise',
                                        style: theme.textTheme.titleMedium?.copyWith(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16.5,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 2.5,
                                      ),
                                      decoration: BoxDecoration(
                                        color: tokens.successColor.withValues(alpha: 0.12),
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(
                                          color: tokens.successColor.withValues(alpha: 0.3),
                                          width: 1,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Container(
                                            width: 5,
                                            height: 5,
                                            decoration: BoxDecoration(
                                              color: tokens.successColor,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            'Ativo',
                                            style: TextStyle(
                                              fontSize: 10.5,
                                              fontWeight: FontWeight.w700,
                                              color: tokens.successColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Renovação automática em 14 de Dezembro, 2026',
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: tokens.mutedForeground,
                                    fontSize: 12.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Bloco de Preço & Cobrança com Respiro
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          color: tokens.surfaceElevated,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: tokens.borderColor.withValues(alpha: tokens.isDark ? 0.35 : 0.7),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'VALOR DA ASSINATURA',
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    color: tokens.mutedForeground,
                                    fontSize: 10.5,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.6,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: <Widget>[
                                    Text(
                                      r'R$ 290',
                                      style: theme.textTheme.headlineSmall?.copyWith(
                                        fontWeight: FontWeight.w800,
                                        letterSpacing: -0.5,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      '/mês',
                                      style: theme.textTheme.bodyMedium?.copyWith(
                                        color: tokens.mutedForeground,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: (tokens.isDark ? Colors.white : Colors.black).withValues(alpha: 0.05),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                'Faturamento anual',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: tokens.mutedForeground,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Botões de Ação com Espaçamento Amplo
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () => _showFeedback('Abrindo histórico de faturas...'),
                              child: const Text('Ver Faturas'),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: FilledButton(
                              onPressed: () => _showFeedback('Gerenciar faturamento'),
                              child: const Text('Gerenciar'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 36),

              // Seção: Conta & Segurança
              _SectionHeader(
                title: 'SEGURANÇA & SESSÃO',
                tokens: tokens,
                theme: theme,
              ),
              const SizedBox(height: 10),
              Card(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: const Icon(Icons.lock_outline_rounded),
                      title: const Text('Alterar Senha'),
                      subtitle: const Text('Última alteração há 3 meses'),
                      trailing: const Icon(Icons.chevron_right_rounded),
                      onTap: () => _showFeedback('Abrindo troca de senha...'),
                    ),
                    Divider(
                      height: 1,
                      color: tokens.borderColor.withValues(alpha: 0.6),
                    ),
                    ListTile(
                      leading: const Icon(Icons.devices_rounded),
                      title: const Text('Dispositivos Conectados'),
                      subtitle: const Text('2 sessões ativas no momento'),
                      trailing: const Icon(Icons.chevron_right_rounded),
                      onTap: () =>
                          _showFeedback('Listando sessões ativas...'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),

              // Botão de Logout Destrutivo
              OutlinedButton.icon(
                icon: Icon(
                  Icons.logout_rounded,
                  size: 18,
                  color: theme.colorScheme.error,
                ),
                label: Text(
                  'Encerrar Sessão',
                  style: TextStyle(color: theme.colorScheme.error),
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: theme.colorScheme.error.withValues(alpha: 0.4),
                  ),
                ),
                onPressed: () {
                  showDialog<void>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Encerrar Sessão'),
                      content: const Text(
                        'Tem certeza que deseja sair da sua conta?',
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancelar'),
                        ),
                        FilledButton(
                          style: FilledButton.styleFrom(
                            backgroundColor: theme.colorScheme.error,
                            foregroundColor: theme.colorScheme.onError,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            _showFeedback('Sessão encerrada com sucesso.');
                          },
                          child: const Text('Sair'),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),

              // Rodapé de Versão
              Center(
                child: Text(
                  'Fabric Design System • v1.0.0',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: tokens.mutedForeground,
                    fontSize: 11,
                  ),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
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
