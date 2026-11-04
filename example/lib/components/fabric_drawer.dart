import 'package:fabric/fabric.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  void _navigateTo(BuildContext context, String routeName) {
    Navigator.pop(context);
    final String? currentRoute = ModalRoute.of(context)?.settings.name;

    if (routeName == '/') {
      Navigator.popUntil(context, (Route<dynamic> route) => route.isFirst);
      return;
    }

    if (currentRoute != routeName) {
      Navigator.pushNamed(context, routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    final FabricThemeExtension tokens = context.fabricTokens;
    final ThemeData theme = Theme.of(context);
    final String? currentRoute = ModalRoute.of(context)?.settings.name;

    return Drawer(
      child: Column(
        children: <Widget>[
          // Header refinado com tipografia proporcional
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 14,
              left: 16,
              right: 16,
              bottom: 14,
            ),
            decoration: BoxDecoration(
              color: tokens.surfaceElevated,
              border: Border(
                bottom: BorderSide(color: tokens.borderColor),
              ),
            ),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 16,
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: theme.colorScheme.onPrimary,
                  child: const Icon(Icons.layers_rounded, size: 18),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              'Fabric Theme',
                              style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 13.5,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Badge(
                            label: const Text('v1.2'),
                            backgroundColor: theme.colorScheme.primary,
                            textColor: theme.colorScheme.onPrimary,
                          ),
                        ],
                      ),
                      const SizedBox(height: 1),
                      Text(
                        'Design System & Showcase',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: tokens.mutedForeground,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Lista de navegação com densidade compacta
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 6),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
                  child: Text(
                    'NAVEGAÇÃO',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: tokens.mutedForeground,
                      fontWeight: FontWeight.w600,
                      fontSize: 10.5,
                      letterSpacing: 0.8,
                    ),
                  ),
                ),
                _DrawerItem(
                  icon: Icons.widgets_outlined,
                  selectedIcon: Icons.widgets_rounded,
                  title: 'Catálogo de Componentes',
                  subtitle: 'Tokens, inputs e superfícies',
                  isSelected: currentRoute == null || currentRoute == '/',
                  onTap: () => _navigateTo(context, '/'),
                ),
                _DrawerItem(
                  icon: Icons.view_sidebar_outlined,
                  selectedIcon: Icons.view_sidebar_rounded,
                  title: 'Navigation Rail',
                  subtitle: 'Layout lateral responsivo',
                  isSelected: currentRoute == '/navigation_rail',
                  onTap: () => _navigateTo(context, '/navigation_rail'),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
                  child: Text(
                    'EXEMPLOS DE TELAS',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: tokens.mutedForeground,
                      fontWeight: FontWeight.w600,
                      fontSize: 10.5,
                      letterSpacing: 0.8,
                    ),
                  ),
                ),
                _DrawerItem(
                  icon: Icons.dashboard_outlined,
                  selectedIcon: Icons.dashboard_rounded,
                  title: 'Dashboard SaaS',
                  subtitle: 'Métricas, KPIs e transações',
                  isSelected: currentRoute == '/dashboard',
                  onTap: () => _navigateTo(context, '/dashboard'),
                ),
                _DrawerItem(
                  icon: Icons.login_outlined,
                  selectedIcon: Icons.login_rounded,
                  title: 'Tela de Login',
                  subtitle: 'Formulário completo com tema nativo',
                  isSelected: currentRoute == '/login',
                  onTap: () => _navigateTo(context, '/login'),
                ),
                _DrawerItem(
                  icon: Icons.check_circle_outline_rounded,
                  selectedIcon: Icons.check_circle_rounded,
                  title: 'Tarefas & Demandas',
                  subtitle: 'Quadro estilo Linear com filtros',
                  isSelected: currentRoute == '/tasks',
                  onTap: () => _navigateTo(context, '/tasks'),
                ),
                _DrawerItem(
                  icon: Icons.shopping_bag_outlined,
                  selectedIcon: Icons.shopping_bag_rounded,
                  title: 'Resumo de Checkout',
                  subtitle: 'Carrinho, frete e pagamento Pix',
                  isSelected: currentRoute == '/checkout',
                  onTap: () => _navigateTo(context, '/checkout'),
                ),
                _DrawerItem(
                  icon: Icons.person_outline_rounded,
                  selectedIcon: Icons.person_rounded,
                  title: 'Perfil & Portfólio',
                  subtitle: 'Tabs, repositórios e atividade',
                  isSelected: currentRoute == '/profile',
                  onTap: () => _navigateTo(context, '/profile'),
                ),
                _DrawerItem(
                  icon: Icons.contacts_outlined,
                  selectedIcon: Icons.contacts_rounded,
                  title: 'Lista de Contatos',
                  subtitle: 'Diretório, favoritos e detalhes',
                  isSelected: currentRoute == '/contacts',
                  onTap: () => _navigateTo(context, '/contacts'),
                ),
                _DrawerItem(
                  icon: Icons.notifications_outlined,
                  selectedIcon: Icons.notifications_rounded,
                  title: 'Notificações & Atividades',
                  subtitle: 'Central de alertas, menções e inbox',
                  isSelected: currentRoute == '/notifications',
                  onTap: () => _navigateTo(context, '/notifications'),
                ),
                _DrawerItem(
                  icon: Icons.settings_outlined,
                  selectedIcon: Icons.settings_rounded,
                  title: 'Configurações',
                  subtitle: 'Perfil, preferências e segurança',
                  isSelected: currentRoute == '/settings',
                  onTap: () => _navigateTo(context, '/settings'),
                ),
              ],
            ),
          ),

          // Rodapé sutil e compacto
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: tokens.borderColor)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Text(
                    'Fabric UI Design System',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: tokens.mutedForeground,
                      fontSize: 11,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                Badge(
                  label: const Text('Online'),
                  backgroundColor: tokens.surfaceElevated,
                  textColor: tokens.mutedForeground,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  const _DrawerItem({
    required this.icon,
    required this.selectedIcon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.isSelected = false,
  });

  final IconData icon;
  final IconData selectedIcon;
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final FabricThemeExtension tokens = context.fabricTokens;
    final ThemeData theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
      child: ListTile(
        dense: true,
        visualDensity: const VisualDensity(horizontal: 0, vertical: -2),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        selected: isSelected,
        selectedTileColor: theme.colorScheme.primary.withValues(alpha: 0.08),
        leading: Icon(
          isSelected ? selectedIcon : icon,
          size: 20,
          color: isSelected ? theme.colorScheme.primary : null,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 13,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            color: isSelected ? theme.colorScheme.primary : null,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: tokens.mutedForeground,
            fontSize: 11,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
