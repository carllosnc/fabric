import 'package:fabric/fabric.dart';
import 'package:flutter/material.dart';
import '../components/fabric_drawer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isFollowing = false;

  final List<_ProjectItem> _projects = const <_ProjectItem>[
    _ProjectItem(
      name: 'fabric_design_system',
      description:
          'Camada de design system pura para Flutter Material 3, sem widgets wrappers proprietários.',
      language: 'Dart',
      languageColor: Color(0xFF00B4AB),
      stars: 482,
      forks: 56,
      isPinned: true,
    ),
    _ProjectItem(
      name: 'flutter_density_tokens',
      description:
          'Conjunto de tokens e escalas tipográficas compactas para aplicações profissionais.',
      language: 'Dart',
      languageColor: Color(0xFF00B4AB),
      stars: 215,
      forks: 24,
      isPinned: true,
    ),
    _ProjectItem(
      name: 'material3_palette_generator',
      description:
          'Gerador de swatches neutros e dinâmicos para temas claro e escuro de alta legibilidade.',
      language: 'TypeScript',
      languageColor: Color(0xFF3178C6),
      stars: 128,
      forks: 19,
      isPinned: false,
    ),
    _ProjectItem(
      name: 'mobile_analytics_sdk',
      description:
          'SDK leve de telemetria e métricas para Flutter com buffer local e sincronização offline.',
      language: 'Kotlin',
      languageColor: Color(0xFF7F52FF),
      stars: 94,
      forks: 11,
      isPinned: false,
    ),
  ];

  final List<_ActivityItem> _activities = const <_ActivityItem>[
    _ActivityItem(
      action: 'Publicou a release v1.0.0 de fabric_design_system',
      time: 'Há 2 horas',
      icon: Icons.rocket_launch_rounded,
    ),
    _ActivityItem(
      action: 'Abriu o Pull Request #42: "Refactor typography scale"',
      time: 'Ontem às 18:30',
      icon: Icons.merge_type_rounded,
    ),
    _ActivityItem(
      action: 'Adicionou 4 novas telas de exemplo no showcase',
      time: 'Há 2 dias',
      icon: Icons.dashboard_customize_rounded,
    ),
    _ActivityItem(
      action: 'Criou o repositório material3_palette_generator',
      time: 'Há 5 dias',
      icon: Icons.add_circle_outline_rounded,
    ),
  ];

  final List<String> _skills = const <String>[
    'Flutter',
    'Dart',
    'Material Design 3',
    'UI/UX Architecture',
    'Design Tokens',
    'Design Systems',
    'Open Source',
    'TypeScript',
  ];

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final FabricThemeExtension tokens = context.fabricTokens;

    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text('Perfil'),
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                tooltip: 'Voltar',
                onPressed: () => Navigator.pop(context),
              )
            : null,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.share_outlined, size: 20),
            tooltip: 'Compartilhar perfil',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Link do perfil copiado!')),
              );
            },
          ),
        ],
      ),
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder:
              (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverToBoxAdapter(
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 760),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // Header: Avatar e Ações de Perfil
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // Avatar com borda temática
                              Container(
                                padding: const EdgeInsets.all(2.5),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: tokens.borderColor,
                                    width: 1.5,
                                  ),
                                ),
                                child: CircleAvatar(
                                  radius: 36,
                                  backgroundColor: theme.colorScheme.primary,
                                  foregroundColor: theme.colorScheme.onPrimary,
                                  child: const Text(
                                    'AS',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),

                              // Informações de Nome, Cargo e Tag
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Flexible(
                                          child: Text(
                                            'Alexandre Silva',
                                            style: theme.textTheme.titleMedium
                                                ?.copyWith(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 18,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Icon(
                                          Icons.verified_rounded,
                                          size: 18,
                                          color: theme.colorScheme.primary,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      '@alexandresilva • São Paulo, Brasil',
                                      style:
                                          theme.textTheme.bodySmall?.copyWith(
                                        color: tokens.mutedForeground,
                                        fontSize: 12,
                                      ),
                                    ),
                                    const SizedBox(height: 10),

                                    // Botões de Ação (Seguir / Mensagem)
                                    Row(
                                      children: <Widget>[
                                        _isFollowing
                                            ? OutlinedButton.icon(
                                                icon: const Icon(
                                                  Icons.check_rounded,
                                                  size: 16,
                                                ),
                                                label: const Text('Seguindo'),
                                                onPressed: () {
                                                  setState(() {
                                                    _isFollowing = false;
                                                  });
                                                },
                                              )
                                            : FilledButton.icon(
                                                icon: const Icon(
                                                  Icons.person_add_outlined,
                                                  size: 16,
                                                ),
                                                label: const Text('Seguir'),
                                                onPressed: () {
                                                  setState(() {
                                                    _isFollowing = true;
                                                  });
                                                },
                                              ),
                                        const SizedBox(width: 8),
                                        OutlinedButton(
                                          onPressed: () {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                  'Abrindo conversa direta...',
                                                ),
                                              ),
                                            );
                                          },
                                          child: const Text('Mensagem'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),

                          // Bio do Usuário
                          Text(
                            'Design Systems Architect & Flutter Engineer. Criando interfaces limpas, densas e acessíveis para produtos digitais de alta performance.',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              height: 1.4,
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Métricas de Perfil (Projetos, Seguidores, Seguindo)
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  _ProfileStat(
                                    label: 'Projetos',
                                    value: '24',
                                    theme: theme,
                                    tokens: tokens,
                                  ),
                                  Container(
                                    width: 1,
                                    height: 24,
                                    color: tokens.borderColor,
                                  ),
                                  _ProfileStat(
                                    label: 'Seguidores',
                                    value: _isFollowing ? '1.485' : '1.484',
                                    theme: theme,
                                    tokens: tokens,
                                  ),
                                  Container(
                                    width: 1,
                                    height: 24,
                                    color: tokens.borderColor,
                                  ),
                                  _ProfileStat(
                                    label: 'Seguindo',
                                    value: '286',
                                    theme: theme,
                                    tokens: tokens,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // TabBar Fixada no Scroll
              SliverPersistentHeader(
                pinned: true,
                delegate: _TabBarHeaderDelegate(
                  TabBar(
                    tabs: const <Widget>[
                      Tab(text: 'Projetos (4)'),
                      Tab(text: 'Atividade'),
                      Tab(text: 'Sobre'),
                    ],
                  ),
                  theme.scaffoldBackgroundColor,
                  tokens.borderColor,
                ),
              ),
            ];
          },
          body: TabBarView(
            children: <Widget>[
              // Aba 1: Projetos
              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 760),
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    itemCount: _projects.length,
                    itemBuilder: (BuildContext context, int index) {
                      final _ProjectItem project = _projects[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Card(
                          margin: EdgeInsets.zero,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Projeto: ${project.name}'),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  // Linha Superior: Nome + Badge Pin
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.folder_outlined,
                                            size: 18,
                                            color: theme.colorScheme.primary,
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            project.name,
                                            style: theme.textTheme.titleSmall
                                                ?.copyWith(
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                      if (project.isPinned)
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 6,
                                            vertical: 2,
                                          ),
                                          decoration: BoxDecoration(
                                            color: tokens.surfaceElevated,
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            border: Border.all(
                                              color: tokens.borderColor,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Icon(
                                                Icons.push_pin_outlined,
                                                size: 11,
                                                color: tokens.mutedForeground,
                                              ),
                                              const SizedBox(width: 3),
                                              Text(
                                                'Fixado',
                                                style: theme
                                                    .textTheme.labelSmall
                                                    ?.copyWith(
                                                  fontSize: 9.5,
                                                  color: tokens.mutedForeground,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
                                  const SizedBox(height: 6),

                                  // Descrição
                                  Text(
                                    project.description,
                                    style:
                                        theme.textTheme.bodySmall?.copyWith(
                                      color: tokens.mutedForeground,
                                      height: 1.35,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Divider(
                                    height: 1,
                                    color: tokens.borderColor.withValues(
                                      alpha: 0.6,
                                    ),
                                  ),
                                  const SizedBox(height: 10),

                                  // Linha Inferior: Linguagem + Stars + Forks
                                  Row(
                                    children: <Widget>[
                                      // Linguagem
                                      Container(
                                        width: 8,
                                        height: 8,
                                        decoration: BoxDecoration(
                                          color: project.languageColor,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        project.language,
                                        style: theme.textTheme.bodySmall
                                            ?.copyWith(
                                          fontSize: 11.5,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(width: 16),

                                      // Stars
                                      Icon(
                                        Icons.star_outline_rounded,
                                        size: 14,
                                        color: tokens.mutedForeground,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        project.stars.toString(),
                                        style: theme.textTheme.bodySmall
                                            ?.copyWith(
                                          fontSize: 11.5,
                                          color: tokens.mutedForeground,
                                        ),
                                      ),
                                      const SizedBox(width: 16),

                                      // Forks
                                      Icon(
                                        Icons.alt_route_rounded,
                                        size: 14,
                                        color: tokens.mutedForeground,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        project.forks.toString(),
                                        style: theme.textTheme.bodySmall
                                            ?.copyWith(
                                          fontSize: 11.5,
                                          color: tokens.mutedForeground,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              // Aba 2: Atividade
              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 760),
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    itemCount: _activities.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(height: 8),
                    itemBuilder: (BuildContext context, int index) {
                      final _ActivityItem activity = _activities[index];
                      return Card(
                        margin: EdgeInsets.zero,
                        child: ListTile(
                          leading: Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: tokens.surfaceElevated,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: tokens.borderColor),
                            ),
                            child: Icon(
                              activity.icon,
                              size: 18,
                              color: theme.colorScheme.primary,
                            ),
                          ),
                          title: Text(
                            activity.action,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: Text(
                            activity.time,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: tokens.mutedForeground,
                              fontSize: 11.5,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              // Aba 3: Sobre
              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 760),
                  child: ListView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    children: <Widget>[
                      // Competências Técnicas
                      Card(
                        margin: EdgeInsets.zero,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Competências & Tecnologias',
                                style: theme.textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: _skills.map((String skill) {
                                  return Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: tokens.surfaceElevated,
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(
                                        color: tokens.borderColor,
                                      ),
                                    ),
                                    child: Text(
                                      skill,
                                      style: theme.textTheme.bodySmall
                                          ?.copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),

                      // Informações de Contato & Redes
                      Card(
                        margin: EdgeInsets.zero,
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              leading: const Icon(Icons.link_rounded),
                              title: const Text('github.com/alexandresilva'),
                              subtitle: const Text('Código aberto e projetos'),
                              trailing: const Icon(
                                Icons.open_in_new_rounded,
                                size: 16,
                              ),
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Abrindo link externo...'),
                                  ),
                                );
                              },
                            ),
                            Divider(
                              height: 1,
                              color: tokens.borderColor.withValues(alpha: 0.6),
                            ),
                            ListTile(
                              leading: const Icon(Icons.email_outlined),
                              title: const Text('alexandre.silva@empresa.com'),
                              subtitle: const Text('E-mail profissional'),
                              trailing: const Icon(
                                Icons.content_copy_rounded,
                                size: 16,
                              ),
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('E-mail copiado!'),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileStat extends StatelessWidget {
  const _ProfileStat({
    required this.label,
    required this.value,
    required this.theme,
    required this.tokens,
  });

  final String label;
  final String value;
  final ThemeData theme;
  final FabricThemeExtension tokens;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          value,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
            letterSpacing: -0.2,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: tokens.mutedForeground,
            fontSize: 11.5,
          ),
        ),
      ],
    );
  }
}

class _TabBarHeaderDelegate extends SliverPersistentHeaderDelegate {
  _TabBarHeaderDelegate(this.tabBar, this.backgroundColor, this.borderColor);

  final TabBar tabBar;
  final Color backgroundColor;
  final Color borderColor;

  @override
  double get minExtent => tabBar.preferredSize.height + 1;

  @override
  double get maxExtent => tabBar.preferredSize.height + 1;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border(
          bottom: BorderSide(color: borderColor),
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 760),
          child: tabBar,
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(_TabBarHeaderDelegate oldDelegate) {
    return false;
  }
}

class _ProjectItem {
  const _ProjectItem({
    required this.name,
    required this.description,
    required this.language,
    required this.languageColor,
    required this.stars,
    required this.forks,
    required this.isPinned,
  });

  final String name;
  final String description;
  final String language;
  final Color languageColor;
  final int stars;
  final int forks;
  final bool isPinned;
}

class _ActivityItem {
  const _ActivityItem({
    required this.action,
    required this.time,
    required this.icon,
  });

  final String action;
  final String time;
  final IconData icon;
}
