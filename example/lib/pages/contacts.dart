import 'package:fabric/fabric.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../components/fabric_drawer.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  String _searchQuery = '';
  String _selectedDepartment = 'Todos';
  final TextEditingController _searchController = TextEditingController();

  final List<_ContactItem> _contacts = <_ContactItem>[
    _ContactItem(
      id: '1',
      name: 'Ana Clara Souza',
      role: 'Staff Product Designer',
      department: 'Design',
      email: 'ana.souza@empresa.com',
      phone: '+55 (11) 98765-4321',
      initials: 'AC',
      isFavorite: true,
      status: 'Online',
    ),
    _ContactItem(
      id: '2',
      name: 'Alexandre Silva',
      role: 'Design Systems Architect',
      department: 'Engenharia',
      email: 'alexandre.silva@empresa.com',
      phone: '+55 (11) 99123-4567',
      initials: 'AS',
      isFavorite: true,
      status: 'Online',
    ),
    _ContactItem(
      id: '3',
      name: 'Beatriz Mendes',
      role: 'Senior Flutter Developer',
      department: 'Engenharia',
      email: 'beatriz.mendes@empresa.com',
      phone: '+55 (21) 98888-1122',
      initials: 'BM',
      isFavorite: false,
      status: 'Ausente',
    ),
    _ContactItem(
      id: '4',
      name: 'Carlos Eduardo',
      role: 'VP of Product',
      department: 'Produto',
      email: 'carlos.eduardo@empresa.com',
      phone: '+55 (11) 97777-3344',
      initials: 'CE',
      isFavorite: true,
      status: 'Ocupado',
    ),
    _ContactItem(
      id: '5',
      name: 'Débora Lima',
      role: 'Tech Lead Mobile',
      department: 'Engenharia',
      email: 'debora.lima@empresa.com',
      phone: '+55 (31) 99654-7890',
      initials: 'DL',
      isFavorite: false,
      status: 'Online',
    ),
    _ContactItem(
      id: '6',
      name: 'Eduardo Rocha',
      role: 'Brand & Visual Designer',
      department: 'Design',
      email: 'eduardo.rocha@empresa.com',
      phone: '+55 (41) 98111-2233',
      initials: 'ER',
      isFavorite: false,
      status: 'Offline',
    ),
    _ContactItem(
      id: '7',
      name: 'Fernanda Gomes',
      role: 'Product Operations Manager',
      department: 'Produto',
      email: 'fernanda.gomes@empresa.com',
      phone: '+55 (11) 97222-8899',
      initials: 'FG',
      isFavorite: true,
      status: 'Online',
    ),
    _ContactItem(
      id: '8',
      name: 'Gabriel Martins',
      role: 'DevOps & Cloud Engineer',
      department: 'Engenharia',
      email: 'gabriel.martins@empresa.com',
      phone: '+55 (19) 98333-4455',
      initials: 'GM',
      isFavorite: false,
      status: 'Ausente',
    ),
    _ContactItem(
      id: '9',
      name: 'Helena Duarte',
      role: 'UX Researcher',
      department: 'Design',
      email: 'helena.duarte@empresa.com',
      phone: '+55 (11) 99444-5566',
      initials: 'HD',
      isFavorite: false,
      status: 'Online',
    ),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _showContactDetails(_ContactItem contact) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      useSafeArea: true,
      builder: (BuildContext context) {
        final ThemeData theme = Theme.of(context);
        final FabricThemeExtension tokens = context.fabricTokens;

        return StatefulBuilder(
          builder: (BuildContext context, void Function(void Function()) setModalState) {
            final Color deptColor = _getDepartmentColor(contact.department, tokens.isDark);

            return Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 6,
                bottom: MediaQuery.of(context).viewInsets.bottom + 24,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    // Avatar em destaque com Cor Base e Alto Contraste
                    Center(
                      child: Column(
                        children: <Widget>[
                          _ContactAvatar(
                            name: contact.name,
                            initials: contact.initials,
                            radius: 38,
                            status: contact.status,
                            isDark: tokens.isDark,
                            borderColor: theme.scaffoldBackgroundColor,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            contact.name,
                            textAlign: TextAlign.center,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            contact.role,
                            textAlign: TextAlign.center,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: tokens.mutedForeground,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                decoration: BoxDecoration(
                                  color: deptColor.withValues(alpha: tokens.isDark ? 0.2 : 0.1),
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                    color: deptColor.withValues(alpha: tokens.isDark ? 0.4 : 0.3),
                                    width: 1,
                                  ),
                                ),
                                child: Text(
                                  contact.department,
                                  style: TextStyle(
                                    fontSize: 11.5,
                                    fontWeight: FontWeight.w600,
                                    color: deptColor,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              _StatusIndicator(
                                status: contact.status,
                                tokens: tokens,
                                theme: theme,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 22),

                    // Ações Rápidas (Ligar / Chat / E-mail / Favorito)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        _ActionButton(
                          icon: Icons.phone_outlined,
                          label: 'Ligar',
                          onTap: () {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Ligando para ${contact.name}...')),
                            );
                          },
                          theme: theme,
                          tokens: tokens,
                        ),
                        _ActionButton(
                          icon: Icons.chat_bubble_outline_rounded,
                          label: 'Mensagem',
                          onTap: () {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Abrindo chat com ${contact.name}...'),
                              ),
                            );
                          },
                          theme: theme,
                          tokens: tokens,
                        ),
                        _ActionButton(
                          icon: Icons.email_outlined,
                          label: 'E-mail',
                          onTap: () {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('E-mail: ${contact.email}')),
                            );
                          },
                          theme: theme,
                          tokens: tokens,
                        ),
                        _ActionButton(
                          icon: contact.isFavorite ? Icons.star_rounded : Icons.star_outline_rounded,
                          label: contact.isFavorite ? 'Favorito' : 'Favoritar',
                          iconColor: contact.isFavorite
                              ? (tokens.isDark ? const Color(0xFFFBBF24) : const Color(0xFFD97706))
                              : null,
                          onTap: () {
                            setState(() {
                              contact.isFavorite = !contact.isFavorite;
                            });
                            setModalState(() {});
                          },
                          theme: theme,
                          tokens: tokens,
                        ),
                      ],
                    ),
                    const SizedBox(height: 22),
                    Divider(height: 1, color: tokens.borderColor.withValues(alpha: 0.6)),
                    const SizedBox(height: 12),

                    // Detalhes com opção de cópia rápida
                    _DetailRow(
                      icon: Icons.phone_outlined,
                      title: 'Celular Corporativo',
                      value: contact.phone,
                      tokens: tokens,
                      theme: theme,
                    ),
                    _DetailRow(
                      icon: Icons.email_outlined,
                      title: 'E-mail Profissional',
                      value: contact.email,
                      tokens: tokens,
                      theme: theme,
                    ),
                    _DetailRow(
                      icon: Icons.business_outlined,
                      title: 'Departamento',
                      value: contact.department,
                      tokens: tokens,
                      theme: theme,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _showNewContactSheet() {
    final TextEditingController nameCtrl = TextEditingController();
    final TextEditingController roleCtrl = TextEditingController();
    final TextEditingController emailCtrl = TextEditingController();
    final TextEditingController phoneCtrl = TextEditingController();
    String dept = 'Engenharia';

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      useSafeArea: true,
      builder: (BuildContext context) {
        final ThemeData theme = Theme.of(context);
        final FabricThemeExtension tokens = context.fabricTokens;

        return StatefulBuilder(
          builder: (BuildContext context, void Function(void Function()) setModalState) {
            final String rawName = nameCtrl.text.trim();
            final List<String> parts = rawName.split(' ');
            final String liveInitials = rawName.isEmpty
                ? '?'
                : (parts.length > 1 && parts.last.isNotEmpty
                    ? '${parts.first[0]}${parts.last[0]}'.toUpperCase()
                    : rawName.substring(0, rawName.length >= 2 ? 2 : 1).toUpperCase());

            return Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 8,
                bottom: MediaQuery.of(context).viewInsets.bottom + 24,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    // Header com Live Avatar Preview
                    Center(
                      child: Column(
                        children: <Widget>[
                          _ContactAvatar(
                            name: rawName.isEmpty ? 'Novo Contato' : rawName,
                            initials: liveInitials,
                            radius: 34,
                            status: 'Online',
                            isDark: tokens.isDark,
                            borderColor: theme.scaffoldBackgroundColor,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Novo Contato',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Adicione um novo colega de equipe ao catálogo.',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: tokens.mutedForeground,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    TextField(
                      controller: nameCtrl,
                      onChanged: (_) => setModalState(() {}),
                      decoration: const InputDecoration(
                        labelText: 'Nome Completo',
                        prefixIcon: Icon(Icons.person_outline_rounded),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: roleCtrl,
                      decoration: const InputDecoration(
                        labelText: 'Cargo / Função',
                        prefixIcon: Icon(Icons.badge_outlined),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: emailCtrl,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'E-mail Profissional',
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: phoneCtrl,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelText: 'Telefone Corporativo',
                        prefixIcon: Icon(Icons.phone_outlined),
                      ),
                    ),
                    const SizedBox(height: 12),
                    DropdownButtonFormField<String>(
                      initialValue: dept,
                      decoration: const InputDecoration(
                        labelText: 'Departamento',
                        prefixIcon: Icon(Icons.business_outlined),
                      ),
                      items: const <DropdownMenuItem<String>>[
                        DropdownMenuItem<String>(
                          value: 'Engenharia',
                          child: Text('Engenharia'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Design',
                          child: Text('Design'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Produto',
                          child: Text('Produto'),
                        ),
                      ],
                      onChanged: (String? val) {
                        if (val != null) {
                          setModalState(() {
                            dept = val;
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 22),
                    FilledButton.icon(
                      icon: const Icon(Icons.check_rounded, size: 18),
                      label: const Text('Salvar Contato'),
                      onPressed: () {
                        if (nameCtrl.text.trim().isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Por favor, informe o nome do contato.')),
                          );
                          return;
                        }

                        setState(() {
                          _contacts.insert(
                            0,
                            _ContactItem(
                              id: DateTime.now().millisecondsSinceEpoch.toString(),
                              name: nameCtrl.text.trim(),
                              role: roleCtrl.text.trim().isEmpty
                                  ? 'Membro da Equipe'
                                  : roleCtrl.text.trim(),
                              department: dept,
                              email: emailCtrl.text.trim().isEmpty
                                  ? 'sem-email@empresa.com'
                                  : emailCtrl.text.trim(),
                              phone: phoneCtrl.text.trim().isEmpty
                                  ? '+55 (11) 90000-0000'
                                  : phoneCtrl.text.trim(),
                              initials: liveInitials == '?' ? 'NC' : liveInitials,
                              isFavorite: false,
                              status: 'Online',
                            ),
                          );
                        });
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Contato salvo com sucesso!')),
                        );
                      },
                    ),
                  ],
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

    final List<_ContactItem> favorites =
        _contacts.where((_ContactItem c) => c.isFavorite).toList();

    final List<_ContactItem> filteredContacts = _contacts.where((_ContactItem c) {
      final bool matchesSearch = _searchQuery.isEmpty ||
          c.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          c.role.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          c.department.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          c.email.toLowerCase().contains(_searchQuery.toLowerCase());

      if (!matchesSearch) {
        return false;
      }

      if (_selectedDepartment == 'Todos') {
        return true;
      }
      if (_selectedDepartment == 'Favoritos') {
        return c.isFavorite;
      }
      return c.department == _selectedDepartment;
    }).toList();

    // Ordenação alfabética
    filteredContacts.sort((_ContactItem a, _ContactItem b) => a.name.compareTo(b.name));

    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text('Contatos'),
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                tooltip: 'Voltar',
                onPressed: () => Navigator.pop(context),
              )
            : null,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showNewContactSheet,
        icon: const Icon(Icons.person_add_rounded),
        label: const Text('Novo Contato'),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 760),
          child: ListView(
            padding: const EdgeInsets.only(top: 16, bottom: 88),
            children: <Widget>[
              // 1. Campo de Busca com contador e limpeza rápida
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: _searchController,
                  onChanged: (String value) {
                    setState(() {
                      _searchQuery = value.trim();
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Buscar por nome, cargo ou e-mail...',
                    prefixIcon: const Icon(Icons.search_rounded),
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        if (_searchQuery.isNotEmpty)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                            margin: const EdgeInsets.only(right: 6),
                            decoration: BoxDecoration(
                              color: tokens.borderColor.withValues(alpha: 0.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              '${filteredContacts.length}',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: tokens.mutedForeground,
                              ),
                            ),
                          ),
                        if (_searchQuery.isNotEmpty)
                          IconButton(
                            icon: const Icon(Icons.clear_rounded, size: 18),
                            tooltip: 'Limpar busca',
                            onPressed: () {
                              _searchController.clear();
                              setState(() {
                                _searchQuery = '';
                              });
                            },
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // 2. Favoritos em Destaque (Carrossel com Avatares Maiores e Cores Base)
              if (_searchQuery.isEmpty && favorites.isNotEmpty) ...<Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.star_rounded,
                        size: 16,
                        color: tokens.isDark
                            ? const Color(0xFFFBBF24)
                            : const Color(0xFFD97706),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'FAVORITOS EM DESTAQUE',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: tokens.mutedForeground,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.8,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 104,
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    scrollDirection: Axis.horizontal,
                    itemCount: favorites.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(width: 14),
                    itemBuilder: (BuildContext context, int index) {
                      final _ContactItem contact = favorites[index];
                      return InkWell(
                        borderRadius: BorderRadius.circular(14),
                        onTap: () => _showContactDetails(contact),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                          child: Column(
                            children: <Widget>[
                              _ContactAvatar(
                                name: contact.name,
                                initials: contact.initials,
                                radius: 28,
                                status: contact.status,
                                isDark: tokens.isDark,
                                borderColor: theme.scaffoldBackgroundColor,
                              ),
                              const SizedBox(height: 8),
                              SizedBox(
                                width: 70,
                                child: Text(
                                  contact.name.split(' ').first,
                                  textAlign: TextAlign.center,
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 12),
              ],

              // 3. Filtros Rápidos por Departamento com Contadores
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: <String>[
                    'Todos',
                    'Favoritos',
                    'Engenharia',
                    'Design',
                    'Produto',
                  ].map((String dept) {
                    final bool isSelected = _selectedDepartment == dept;
                    final int count;
                    if (dept == 'Todos') {
                      count = _contacts.length;
                    } else if (dept == 'Favoritos') {
                      count = favorites.length;
                    } else {
                      count = _contacts.where((_ContactItem c) => c.department == dept).length;
                    }

                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: FilterChip(
                        label: Text('$dept ($count)'),
                        selected: isSelected,
                        onSelected: (bool selected) {
                          setState(() {
                            _selectedDepartment = dept;
                          });
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 16),

              // 4. Lista de Contatos com Novos Cards Elegantes & Avatares de Alto Contraste
              if (filteredContacts.isEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 48,
                    horizontal: 24,
                  ),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.person_search_rounded,
                          size: 44,
                          color: tokens.mutedForeground,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Nenhum contato encontrado',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Tente buscar por outro termo ou selecione outro departamento.',
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: tokens.mutedForeground,
                          ),
                        ),
                        if (_searchQuery.isNotEmpty || _selectedDepartment != 'Todos') ...<Widget>[
                          const SizedBox(height: 14),
                          OutlinedButton.icon(
                            icon: const Icon(Icons.refresh_rounded, size: 16),
                            label: const Text('Limpar Filtros'),
                            onPressed: () {
                              _searchController.clear();
                              setState(() {
                                _searchQuery = '';
                                _selectedDepartment = 'Todos';
                              });
                            },
                          ),
                        ],
                      ],
                    ),
                  ),
                )
              else
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: filteredContacts.length,
                  itemBuilder: (BuildContext context, int index) {
                    final _ContactItem contact = filteredContacts[index];
                    final String currentLetter = contact.name[0].toUpperCase();
                    final bool isFirstOfLetter = index == 0 ||
                        filteredContacts[index - 1].name[0].toUpperCase() !=
                            currentLetter;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        if (isFirstOfLetter)
                          Padding(
                            padding: const EdgeInsets.fromLTRB(18, 14, 18, 6),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 2.5),
                                  decoration: BoxDecoration(
                                    color: theme.colorScheme.primary.withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                      color: theme.colorScheme.primary.withValues(alpha: 0.25),
                                      width: 1,
                                    ),
                                  ),
                                  child: Text(
                                    currentLetter,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                      color: theme.colorScheme.primary,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Divider(
                                    height: 1,
                                    color: tokens.borderColor.withValues(alpha: 0.5),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        _ContactCardItem(
                          contact: contact,
                          tokens: tokens,
                          theme: theme,
                          onTap: () => _showContactDetails(contact),
                          onToggleFavorite: () {
                            setState(() {
                              contact.isFavorite = !contact.isFavorite;
                            });
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: const Duration(seconds: 2),
                                content: Text(
                                  contact.isFavorite
                                      ? '${contact.name} adicionado(a) aos favoritos'
                                      : '${contact.name} removido(a) dos favoritos',
                                ),
                              ),
                            );
                          },
                          onCall: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Ligando para ${contact.name} (${contact.phone})...'),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}

/// Item de Contato Redesenhado em Formato de Card Elegante
class _ContactCardItem extends StatelessWidget {
  const _ContactCardItem({
    required this.contact,
    required this.tokens,
    required this.theme,
    required this.onTap,
    required this.onToggleFavorite,
    required this.onCall,
  });

  final _ContactItem contact;
  final FabricThemeExtension tokens;
  final ThemeData theme;
  final VoidCallback onTap;
  final VoidCallback onToggleFavorite;
  final VoidCallback onCall;

  @override
  Widget build(BuildContext context) {
    final Color deptColor = _getDepartmentColor(contact.department, tokens.isDark);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4.5),
      decoration: BoxDecoration(
        color: tokens.surfaceElevated,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: tokens.borderColor.withValues(alpha: tokens.isDark ? 0.35 : 0.7),
          width: 1,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            child: Row(
              children: <Widget>[
                // Avatar Grande (Raio 27 = Diâmetro 54px) com Cor Base e Alto Contraste
                _ContactAvatar(
                  name: contact.name,
                  initials: contact.initials,
                  radius: 27,
                  status: contact.status,
                  isDark: tokens.isDark,
                  borderColor: tokens.surfaceElevated,
                ),
                const SizedBox(width: 14),

                // Informações Textuais (Hierarquia Clara)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              contact.name,
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 14.5,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1.5),
                            decoration: BoxDecoration(
                              color: deptColor.withValues(alpha: tokens.isDark ? 0.2 : 0.1),
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: deptColor.withValues(alpha: tokens.isDark ? 0.4 : 0.3),
                                width: 0.8,
                              ),
                            ),
                            child: Text(
                              contact.department,
                              style: TextStyle(
                                fontSize: 10.5,
                                fontWeight: FontWeight.w600,
                                color: deptColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 3),
                      Text(
                        contact.role,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: tokens.mutedForeground,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 3),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.email_outlined,
                            size: 12,
                            color: tokens.mutedForeground.withValues(alpha: 0.8),
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              contact.email,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: tokens.mutedForeground.withValues(alpha: 0.8),
                                fontSize: 11,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Ações Rápidas Trailing
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.phone_outlined, size: 18),
                      tooltip: 'Ligar para ${contact.name}',
                      visualDensity: VisualDensity.compact,
                      onPressed: onCall,
                    ),
                    IconButton(
                      icon: Icon(
                        contact.isFavorite ? Icons.star_rounded : Icons.star_outline_rounded,
                        size: 20,
                        color: contact.isFavorite
                            ? (tokens.isDark
                                ? const Color(0xFFFBBF24)
                                : const Color(0xFFD97706))
                            : tokens.mutedForeground.withValues(alpha: 0.6),
                      ),
                      tooltip: contact.isFavorite
                          ? 'Remover dos favoritos'
                          : 'Adicionar aos favoritos',
                      visualDensity: VisualDensity.compact,
                      onPressed: onToggleFavorite,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Avatar de Alto Contraste utilizando cores base do tema (primary / onPrimary)
class _ContactAvatar extends StatelessWidget {
  const _ContactAvatar({
    required this.name,
    required this.initials,
    required this.radius,
    this.status,
    this.isDark = false,
    this.borderColor,
  });

  final String name;
  final String initials;
  final double radius;
  final String? status;
  final bool isDark;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final FabricThemeExtension tokens = context.fabricTokens;

    // Cores base do tema com alto contraste garantido
    final Color avatarBg = theme.colorScheme.primary;
    final Color avatarFg = theme.colorScheme.onPrimary;

    final Widget avatarBody = Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: avatarBg,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: (isDark ? Colors.black : tokens.swatch.shade900).withValues(alpha: isDark ? 0.35 : 0.14),
            blurRadius: 4,
            offset: const Offset(0, 1.5),
          ),
        ],
        border: Border.all(
          color: borderColor ?? (isDark ? Colors.white24 : tokens.borderColor.withValues(alpha: 0.5)),
          width: 1.5,
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        initials,
        style: TextStyle(
          color: avatarFg,
          fontSize: radius * 0.56,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.3,
        ),
      ),
    );

    if (status == null) {
      return avatarBody;
    }

    final double dotSize = (radius * 0.44).clamp(11.0, 16.0);
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        avatarBody,
        Positioned(
          right: 0,
          bottom: 0,
          child: _PresenceDot(
            status: status!,
            tokens: tokens,
            theme: theme,
            size: dotSize,
            ringColor: borderColor ?? tokens.surfaceElevated,
          ),
        ),
      ],
    );
  }
}

/// Indicador de Presença com Anel de Proteção
class _PresenceDot extends StatelessWidget {
  const _PresenceDot({
    required this.status,
    required this.tokens,
    required this.theme,
    this.size = 13.0,
    this.ringColor,
  });

  final String status;
  final FabricThemeExtension tokens;
  final ThemeData theme;
  final double size;
  final Color? ringColor;

  @override
  Widget build(BuildContext context) {
    Color color;
    switch (status) {
      case 'Online':
        color = tokens.successColor;
        break;
      case 'Ausente':
        color = theme.brightness == Brightness.dark
            ? const Color(0xFFFBBF24)
            : const Color(0xFFD97706);
        break;
      case 'Ocupado':
        color = theme.colorScheme.error;
        break;
      case 'Offline':
      default:
        color = tokens.mutedForeground;
        break;
    }

    final Color effectiveRing = ringColor ?? tokens.surfaceElevated;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(
          color: effectiveRing,
          width: 2.5,
        ),
      ),
    );
  }
}

/// Status Pill para a Modal de Detalhes
class _StatusIndicator extends StatelessWidget {
  const _StatusIndicator({
    required this.status,
    required this.tokens,
    required this.theme,
  });

  final String status;
  final FabricThemeExtension tokens;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    Color color;
    switch (status) {
      case 'Online':
        color = tokens.successColor;
        break;
      case 'Ausente':
        color = theme.brightness == Brightness.dark
            ? const Color(0xFFFBBF24)
            : const Color(0xFFD97706);
        break;
      case 'Ocupado':
        color = theme.colorScheme.error;
        break;
      case 'Offline':
      default:
        color = tokens.mutedForeground;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color.withValues(alpha: 0.25),
          width: 0.8,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 5),
          Text(
            status,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

/// Botão de Ação Rápida
class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
    required this.theme,
    required this.tokens,
    this.iconColor,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final ThemeData theme;
  final FabricThemeExtension tokens;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Column(
          children: <Widget>[
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: tokens.surfaceElevated,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: tokens.borderColor.withValues(alpha: tokens.isDark ? 0.35 : 0.7),
                ),
              ),
              child: Icon(
                icon,
                size: 20,
                color: iconColor ?? theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: theme.textTheme.labelSmall?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Linha de Detalhes Copiável
class _DetailRow extends StatelessWidget {
  const _DetailRow({
    required this.icon,
    required this.title,
    required this.value,
    required this.tokens,
    required this.theme,
  });

  final IconData icon;
  final String title;
  final String value;
  final FabricThemeExtension tokens;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: tokens.surfaceElevated,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: tokens.borderColor.withValues(alpha: tokens.isDark ? 0.35 : 0.7),
          ),
        ),
        child: Icon(icon, size: 18),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 12,
          color: tokens.mutedForeground,
        ),
      ),
      subtitle: Text(
        value,
        style: theme.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.content_copy_rounded, size: 18),
        tooltip: 'Copiar $title',
        onPressed: () {
          Clipboard.setData(ClipboardData(text: value));
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('$title copiado!')),
          );
        },
      ),
    );
  }
}

class _ContactItem {
  _ContactItem({
    required this.id,
    required this.name,
    required this.role,
    required this.department,
    required this.email,
    required this.phone,
    required this.initials,
    required this.isFavorite,
    required this.status,
  });

  final String id;
  final String name;
  final String role;
  final String department;
  final String email;
  final String phone;
  final String initials;
  bool isFavorite;
  final String status;
}

Color _getDepartmentColor(String department, bool isDark) {
  switch (department) {
    case 'Engenharia':
      return isDark ? const Color(0xFF60A5FA) : const Color(0xFF2563EB);
    case 'Design':
      return isDark ? const Color(0xFFA78BFA) : const Color(0xFF7C3AED);
    case 'Produto':
      return isDark ? const Color(0xFFFBBF24) : const Color(0xFFD97706);
    default:
      return isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B);
  }
}
