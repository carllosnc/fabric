import 'package:fabric/fabric.dart';
import 'package:flutter/material.dart';
import '../components/fabric_drawer.dart';

enum TaskStatus {
  todo,
  inProgress,
  done;

  String get label {
    switch (this) {
      case TaskStatus.todo:
        return 'A Fazer';
      case TaskStatus.inProgress:
        return 'Em Andamento';
      case TaskStatus.done:
        return 'Concluída';
    }
  }
}

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  TaskStatus? _selectedStatus;
  String? _selectedProject;
  String? _selectedPriority;

  final List<String> _availableProjects = const <String>[
    'Design System',
    'Mobile App',
    'Backend API',
    'DevOps',
    'Documentação',
  ];

  final List<String> _availablePriorities = const <String>[
    'Alta',
    'Média',
    'Baixa',
  ];

  final List<_TaskItem> _tasks = <_TaskItem>[
    _TaskItem(
      id: 'FAB-104',
      title: 'Auditar contraste dos botões secundários',
      description: 'Garantir que a proporção de contraste atinja WCAG 2.1 AA em todos os modos.',
      project: 'Design System',
      priority: 'Alta',
      dueDate: 'Hoje',
      status: TaskStatus.inProgress,
      assignee: 'AS',
    ),
    _TaskItem(
      id: 'FAB-108',
      title: 'Integrar SDK de analytics no checkout',
      description: 'Rastrear conversões de planos Enterprise e upgrades em tempo real.',
      project: 'Backend API',
      priority: 'Média',
      dueDate: '10 Nov',
      status: TaskStatus.inProgress,
      assignee: 'FL',
    ),
    _TaskItem(
      id: 'FAB-105',
      title: 'Implementar animação do TabBar indicator',
      description: 'Refinar a espessura da linha e transição elástica entre abas.',
      project: 'Mobile App',
      priority: 'Média',
      dueDate: 'Amanhã',
      status: TaskStatus.todo,
      assignee: 'MC',
    ),
    _TaskItem(
      id: 'FAB-101',
      title: 'Revisar tokens semânticos no modo escuro',
      description: 'Alinhar as variáveis de surface e borderColor com a escala Grey900.',
      project: 'Design System',
      priority: 'Alta',
      dueDate: 'Hoje',
      status: TaskStatus.todo,
      assignee: 'AS',
    ),
    _TaskItem(
      id: 'FAB-102',
      title: 'Otimizar pipeline de build do Flutter',
      description: 'Reduzir o tempo de bundling dos assets e ícones vetoriais no CI.',
      project: 'DevOps',
      priority: 'Baixa',
      dueDate: '08 Nov',
      status: TaskStatus.done,
      assignee: 'FL',
    ),
    _TaskItem(
      id: 'FAB-099',
      title: 'Atualizar documentação de componentes no README',
      description: 'Inserir novos exemplos de uso dos botões e temas de inputs nativos.',
      project: 'Documentação',
      priority: 'Baixa',
      dueDate: 'Ontem',
      status: TaskStatus.done,
      assignee: 'MC',
    ),
    _TaskItem(
      id: 'FAB-098',
      title: 'Adicionar testes de unidade para badge theme',
      description: 'Verificar alinhamento óptico e propriedades do BadgeThemeData.',
      project: 'Design System',
      priority: 'Alta',
      dueDate: 'Ontem',
      status: TaskStatus.done,
      assignee: 'AS',
    ),
    _TaskItem(
      id: 'FAB-095',
      title: 'Ajustar contraste dos chips no tema dark',
      description: 'Elevar legibilidade do texto não-selecionado no swatch Grey.',
      project: 'Design System',
      priority: 'Média',
      dueDate: '01 Nov',
      status: TaskStatus.done,
      assignee: 'MC',
    ),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  int get _activeFiltersCount {
    int count = 0;
    if (_selectedStatus != null) count++;
    if (_selectedProject != null) count++;
    if (_selectedPriority != null) count++;
    return count;
  }

  void _clearFilters() {
    setState(() {
      _selectedStatus = null;
      _selectedProject = null;
      _selectedPriority = null;
      _searchQuery = '';
      _searchController.clear();
    });
  }

  List<_TaskItem> _filterTasks(List<_TaskItem> source) {
    return source.where((_TaskItem item) {
      if (_searchQuery.isNotEmpty) {
        final String query = _searchQuery.toLowerCase();
        final bool matchesTitle = item.title.toLowerCase().contains(query);
        final bool matchesId = item.id.toLowerCase().contains(query);
        final bool matchesProject = item.project.toLowerCase().contains(query);
        final bool matchesDesc = item.description.toLowerCase().contains(query);
        if (!matchesTitle && !matchesId && !matchesProject && !matchesDesc) {
          return false;
        }
      }

      if (_selectedStatus != null && item.status != _selectedStatus) {
        return false;
      }

      if (_selectedProject != null && item.project != _selectedProject) {
        return false;
      }

      if (_selectedPriority != null && item.priority != _selectedPriority) {
        return false;
      }

      return true;
    }).toList();
  }

  void _cycleTaskStatus(_TaskItem task) {
    setState(() {
      switch (task.status) {
        case TaskStatus.todo:
          task.status = TaskStatus.inProgress;
          break;
        case TaskStatus.inProgress:
          task.status = TaskStatus.done;
          break;
        case TaskStatus.done:
          task.status = TaskStatus.todo;
          break;
      }
    });
  }

  void _deleteTask(_TaskItem task) {
    final int index = _tasks.indexOf(task);
    if (index == -1) return;

    setState(() {
      _tasks.removeAt(index);
    });

    final ScaffoldMessengerState messenger = ScaffoldMessenger.of(context);
    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(
      SnackBar(
        content: Text('Demanda "${task.title}" removida.'),
        action: SnackBarAction(
          label: 'Desfazer',
          onPressed: () {
            if (!mounted) return;
            setState(() {
              _tasks.insert(index, task);
            });
          },
        ),
      ),
    );
  }

  void _showFilterSheet() {
    TaskStatus? tempStatus = _selectedStatus;
    String? tempProject = _selectedProject;
    String? tempPriority = _selectedPriority;

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (BuildContext context) {
        final ThemeData theme = Theme.of(context);
        final FabricThemeExtension tokens = context.fabricTokens;

        return StatefulBuilder(
          builder: (BuildContext context, void Function(void Function()) setSheetState) {
            // Contagem com os filtros temporários
            final int previewCount = _tasks.where((_TaskItem item) {
              if (tempStatus != null && item.status != tempStatus) return false;
              if (tempProject != null && item.project != tempProject) return false;
              if (tempPriority != null && item.priority != tempPriority) return false;
              return true;
            }).length;

            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    // Cabeçalho do Filtro
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Filtrar Demandas',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setSheetState(() {
                              tempStatus = null;
                              tempProject = null;
                              tempPriority = null;
                            });
                          },
                          child: const Text('Redefinir'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Filtro 1: Status
                    Text(
                      'STATUS DA DEMANDA',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: tokens.mutedForeground,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: <Widget>[
                        ChoiceChip(
                          label: const Text('Todos'),
                          selected: tempStatus == null,
                          onSelected: (bool selected) {
                            if (selected) {
                              setSheetState(() => tempStatus = null);
                            }
                          },
                        ),
                        ...TaskStatus.values.map((TaskStatus s) {
                          return ChoiceChip(
                            label: Text(s.label),
                            selected: tempStatus == s,
                            onSelected: (bool selected) {
                              setSheetState(() {
                                tempStatus = selected ? s : null;
                              });
                            },
                          );
                        }),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Filtro 2: Projeto
                    Text(
                      'PROJETO',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: tokens.mutedForeground,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: <Widget>[
                        ChoiceChip(
                          label: const Text('Todos'),
                          selected: tempProject == null,
                          onSelected: (bool selected) {
                            if (selected) {
                              setSheetState(() => tempProject = null);
                            }
                          },
                        ),
                        ..._availableProjects.map((String p) {
                          return ChoiceChip(
                            label: Text(p),
                            selected: tempProject == p,
                            onSelected: (bool selected) {
                              setSheetState(() {
                                tempProject = selected ? p : null;
                              });
                            },
                          );
                        }),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Filtro 3: Prioridade
                    Text(
                      'PRIORIDADE',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: tokens.mutedForeground,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: <Widget>[
                        ChoiceChip(
                          label: const Text('Todas'),
                          selected: tempPriority == null,
                          onSelected: (bool selected) {
                            if (selected) {
                              setSheetState(() => tempPriority = null);
                            }
                          },
                        ),
                        ..._availablePriorities.map((String pr) {
                          return ChoiceChip(
                            label: Text(pr),
                            selected: tempPriority == pr,
                            onSelected: (bool selected) {
                              setSheetState(() {
                                tempPriority = selected ? pr : null;
                              });
                            },
                          );
                        }),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Botão Aplicar
                    FilledButton(
                      onPressed: () {
                        setState(() {
                          _selectedStatus = tempStatus;
                          _selectedProject = tempProject;
                          _selectedPriority = tempPriority;
                        });
                        Navigator.pop(context);
                      },
                      child: Text('Aplicar Filtros ($previewCount resultados)'),
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

  void _showNewTaskSheet() {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descController = TextEditingController();
    TaskStatus newStatus = TaskStatus.inProgress;
    String newPriority = 'Alta';
    String newProject = 'Design System';
    String newDueDate = 'Hoje';

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (BuildContext context) {
        final ThemeData theme = Theme.of(context);

        return StatefulBuilder(
          builder: (BuildContext context, void Function(void Function()) setModalState) {
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 0,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 20,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'Nova Demanda',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Adicione uma nova tarefa com detalhes e prazo.',
                      style: theme.textTheme.bodySmall,
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        labelText: 'Título da Demanda',
                        prefixIcon: Icon(Icons.assignment_outlined),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: descController,
                      maxLines: 2,
                      decoration: const InputDecoration(
                        labelText: 'Descrição / Detalhes',
                        prefixIcon: Icon(Icons.notes_rounded),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: DropdownButtonFormField<TaskStatus>(
                            initialValue: newStatus,
                            style: theme.textTheme.bodyMedium,
                            decoration: const InputDecoration(labelText: 'Status'),
                            items: TaskStatus.values.map((TaskStatus s) {
                              return DropdownMenuItem<TaskStatus>(
                                value: s,
                                child: Text(s.label),
                              );
                            }).toList(),
                            onChanged: (TaskStatus? val) {
                              if (val != null) {
                                setModalState(() => newStatus = val);
                              }
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            initialValue: newPriority,
                            style: theme.textTheme.bodyMedium,
                            decoration: const InputDecoration(labelText: 'Prioridade'),
                            items: _availablePriorities.map((String pr) {
                              return DropdownMenuItem<String>(
                                value: pr,
                                child: Text(pr),
                              );
                            }).toList(),
                            onChanged: (String? val) {
                              if (val != null) {
                                setModalState(() => newPriority = val);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            initialValue: newProject,
                            style: theme.textTheme.bodyMedium,
                            decoration: const InputDecoration(labelText: 'Projeto'),
                            items: _availableProjects.map((String p) {
                              return DropdownMenuItem<String>(
                                value: p,
                                child: Text(p),
                              );
                            }).toList(),
                            onChanged: (String? val) {
                              if (val != null) {
                                setModalState(() => newProject = val);
                              }
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                            ),
                            icon: const Icon(Icons.calendar_today_outlined, size: 16),
                            label: Text(newDueDate, overflow: TextOverflow.ellipsis),
                            onPressed: () async {
                              final DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now().subtract(const Duration(days: 30)),
                                lastDate: DateTime.now().add(const Duration(days: 365)),
                              );
                              if (picked != null) {
                                setModalState(() {
                                  newDueDate = '${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}';
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    FilledButton(
                      onPressed: () {
                        if (titleController.text.trim().isEmpty) {
                          return;
                        }
                        setState(() {
                          final int nextId = 100 + _tasks.length + 1;
                          _tasks.insert(
                            0,
                            _TaskItem(
                              id: 'FAB-$nextId',
                              title: titleController.text.trim(),
                              description: descController.text.trim().isEmpty
                                  ? 'Sem descrição detalhada.'
                                  : descController.text.trim(),
                              project: newProject,
                              priority: newPriority,
                              dueDate: newDueDate,
                              status: newStatus,
                              assignee: 'AS',
                            ),
                          );
                        });
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Demanda criada com sucesso!')),
                        );
                      },
                      child: const Text('Criar Demanda'),
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

    final int totalCount = _tasks.length;
    final int doneCount = _tasks.where((_TaskItem t) => t.status == TaskStatus.done).length;
    final int todoCount = _tasks.where((_TaskItem t) => t.status == TaskStatus.todo).length;
    final int inProgressCount = _tasks.where((_TaskItem t) => t.status == TaskStatus.inProgress).length;
    final double sprintProgress = totalCount > 0 ? (doneCount / totalCount) : 0.0;
    final int progressPercent = (sprintProgress * 100).round();

    final List<_TaskItem> filteredList = _filterTasks(_tasks);

    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Demandas', style: TextStyle(fontWeight: FontWeight.w600)),
            Text(
              'Sprint 42 • $doneCount de $totalCount concluídas ($progressPercent%)',
              style: theme.textTheme.labelSmall?.copyWith(
                color: tokens.mutedForeground,
                fontSize: 11,
              ),
            ),
          ],
        ),
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                tooltip: 'Voltar',
                onPressed: () => Navigator.pop(context),
              )
            : Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const Icon(Icons.menu),
                    tooltip: 'Menu',
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  );
                },
              ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: const Icon(Icons.add_task_rounded),
              tooltip: 'Nova Demanda',
              onPressed: _showNewTaskSheet,
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2.0),
          child: LinearProgressIndicator(
            value: sprintProgress,
            minHeight: 2.0,
            backgroundColor: tokens.borderColor.withValues(alpha: 0.3),
            valueColor: AlwaysStoppedAnimation<Color>(
              theme.brightness == Brightness.dark
                  ? const Color(0xFF34D399)
                  : const Color(0xFF059669),
            ),
          ),
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            children: <Widget>[
              // BARRA DE PESQUISA & FILTRO MOBILE UNIFICADOS
              Container(
                padding: const EdgeInsets.fromLTRB(14, 12, 14, 10),
                decoration: BoxDecoration(
                  color: theme.scaffoldBackgroundColor,
                  border: Border(
                    bottom: BorderSide(color: tokens.borderColor.withValues(alpha: 0.6)),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    // Linha 1: SearchBar + Botão de Filtro com Badge
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: SearchBar(
                            controller: _searchController,
                            hintText: 'Buscar por título, ID ou tag...',
                            side: WidgetStateProperty.all(
                              BorderSide(color: tokens.borderColor),
                            ),
                            leading: Icon(
                              Icons.search_rounded,
                              size: 18,
                              color: tokens.mutedForeground,
                            ),
                            trailing: _searchQuery.isNotEmpty
                                ? <Widget>[
                                    IconButton(
                                      icon: const Icon(Icons.clear_rounded, size: 16),
                                      onPressed: () {
                                        _searchController.clear();
                                        setState(() => _searchQuery = '');
                                      },
                                    ),
                                  ]
                                : null,
                            onChanged: (String val) {
                              setState(() => _searchQuery = val.trim());
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        // Botão de Filtros com Badge dinâmico nativo
                        _activeFiltersCount > 0
                            ? Badge(
                                label: Text('$_activeFiltersCount'),
                                child: IconButton.outlined(
                                  icon: const Icon(Icons.tune_rounded, size: 18),
                                  tooltip: 'Filtros avançados',
                                  onPressed: _showFilterSheet,
                                ),
                              )
                            : IconButton.outlined(
                                icon: const Icon(Icons.tune_rounded, size: 18),
                                tooltip: 'Filtros avançados',
                                onPressed: _showFilterSheet,
                              ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Linha 2: Filtros de Status com contagem e Badges ativos úteis
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          // Abas rápidas de status com volume real de demandas
                          ChoiceChip(
                            label: Text('Todas ($totalCount)'),
                            selected: _selectedStatus == null,
                            onSelected: (bool selected) {
                              if (selected) setState(() => _selectedStatus = null);
                            },
                          ),
                          const SizedBox(width: 6),
                          ChoiceChip(
                            label: Text('A Fazer ($todoCount)'),
                            selected: _selectedStatus == TaskStatus.todo,
                            onSelected: (bool selected) {
                              setState(() {
                                _selectedStatus = selected ? TaskStatus.todo : null;
                              });
                            },
                          ),
                          const SizedBox(width: 6),
                          ChoiceChip(
                            label: Text('Em execução ($inProgressCount)'),
                            selected: _selectedStatus == TaskStatus.inProgress,
                            onSelected: (bool selected) {
                              setState(() {
                                _selectedStatus = selected ? TaskStatus.inProgress : null;
                              });
                            },
                          ),
                          const SizedBox(width: 6),
                          ChoiceChip(
                            label: Text('Concluídas ($doneCount)'),
                            selected: _selectedStatus == TaskStatus.done,
                            onSelected: (bool selected) {
                              setState(() {
                                _selectedStatus = selected ? TaskStatus.done : null;
                              });
                            },
                          ),

                          // Chips contextuais: surgem apenas quando filtros avançados estão ativos
                          if (_selectedProject != null) ...<Widget>[
                            const SizedBox(width: 6),
                            InputChip(
                              avatar: const Icon(Icons.folder_outlined, size: 14),
                              label: Text(_selectedProject!),
                              selected: true,
                              onDeleted: () => setState(() => _selectedProject = null),
                            ),
                          ],
                          if (_selectedPriority != null) ...<Widget>[
                            const SizedBox(width: 6),
                            InputChip(
                              avatar: const Icon(Icons.flag_outlined, size: 14),
                              label: Text(_selectedPriority!),
                              selected: true,
                              onDeleted: () => setState(() => _selectedPriority = null),
                            ),
                          ],

                          // Botão de ação para limpar todos os filtros ativos
                          if (_activeFiltersCount > 0 || _searchQuery.isNotEmpty) ...<Widget>[
                            const SizedBox(width: 6),
                            ActionChip(
                              avatar: const Icon(Icons.close_rounded, size: 13),
                              label: const Text('Limpar filtros'),
                              onPressed: _clearFilters,
                            ),
                          ],
                        ],
                      ),
                    ),

                    // Linha 3: Resumo discreto de itens visíveis
                    Padding(
                      padding: const EdgeInsets.only(top: 8, left: 2, right: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Mostrando ${filteredList.length} de $totalCount demandas',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: tokens.mutedForeground,
                              fontSize: 10.5,
                            ),
                          ),
                          if (_activeFiltersCount > 0)
                            GestureDetector(
                              onTap: _clearFilters,
                              child: Text(
                                'Redefinir filtros',
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: theme.colorScheme.error,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10.5,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // LISTA DE DEMANDAS MOBILE (Vertical, sem overflow)
              Expanded(
                child: filteredList.isEmpty
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.search_off_rounded,
                                size: 44,
                                color: tokens.mutedForeground,
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'Nenhuma demanda encontrada',
                                style: theme.textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Tente redefinir os filtros ou buscar por outro termo.',
                                textAlign: TextAlign.center,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: tokens.mutedForeground,
                                ),
                              ),
                              const SizedBox(height: 16),
                              OutlinedButton.icon(
                                icon: const Icon(Icons.filter_alt_off_rounded, size: 16),
                                label: const Text('Limpar Filtros'),
                                onPressed: _clearFilters,
                              ),
                            ],
                          ),
                        ),
                      )
                    : ListView.separated(
                        padding: const EdgeInsets.fromLTRB(14, 12, 14, 80),
                        itemCount: filteredList.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(height: 10),
                        itemBuilder: (BuildContext context, int index) {
                          final _TaskItem task = filteredList[index];
                          return _buildTaskMobileCard(context, task, theme, tokens);
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTaskMobileCard(
    BuildContext context,
    _TaskItem task,
    ThemeData theme,
    FabricThemeExtension tokens,
  ) {
    final bool isDone = task.status == TaskStatus.done;
    final bool isInProgress = task.status == TaskStatus.inProgress;

    return Dismissible(
      key: ValueKey<String>(task.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: theme.colorScheme.errorContainer,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          Icons.delete_outline_rounded,
          color: theme.colorScheme.onErrorContainer,
        ),
      ),
      onDismissed: (_) => _deleteTask(task),
      child: Card(
        margin: EdgeInsets.zero,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => _cycleTaskStatus(task),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // LINHA SUPERIOR DO CARD: [Status Button] [ID] [Prioridade] .... [Prazo] [Avatar]
                Row(
                  children: <Widget>[
                    // Botão de Status Interativo
                    GestureDetector(
                      onTap: () => _cycleTaskStatus(task),
                      child: _buildStatusIcon(task.status, theme, tokens),
                    ),
                    const SizedBox(width: 8),

                    // ID Monospaçado (FAB-104)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1.5),
                      decoration: BoxDecoration(
                        color: tokens.surfaceElevated,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: tokens.borderColor.withValues(alpha: 0.7)),
                      ),
                      child: Text(
                        task.id,
                        style: TextStyle(
                          fontFamily: 'monospace',
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: tokens.mutedForeground,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),

                    // Badge de Prioridade
                    _buildPriorityPill(task.priority, theme, tokens),

                    const Spacer(),

                    // Prazo
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.calendar_today_outlined,
                          size: 11,
                          color: task.dueDate == 'Hoje'
                              ? theme.colorScheme.error
                              : tokens.mutedForeground,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          task.dueDate,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: task.dueDate == 'Hoje' ? FontWeight.w600 : FontWeight.w500,
                            color: task.dueDate == 'Hoje'
                                ? theme.colorScheme.error
                                : tokens.mutedForeground,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 8),

                    // Avatar Responsável
                    CircleAvatar(
                      radius: 11,
                      backgroundColor: tokens.surfaceElevated,
                      foregroundColor: theme.colorScheme.onSurface,
                      child: Text(
                        task.assignee,
                        style: const TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // CORPO DO CARD: Título e Descrição (100% da largura, sem truncar)
                Text(
                  task.title,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 13.5,
                    decoration: isDone ? TextDecoration.lineThrough : null,
                    color: isDone ? tokens.mutedForeground : null,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  task.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: tokens.mutedForeground,
                    fontSize: 11.5,
                    height: 1.35,
                  ),
                ),

                const SizedBox(height: 10),
                Divider(
                  height: 1,
                  color: tokens.borderColor.withValues(alpha: 0.5),
                ),
                const SizedBox(height: 8),

                // RODAPÉ DO CARD: Tag de Projeto à esquerda, Status e Ações à direita
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // Tag de Projeto
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2.5),
                      decoration: BoxDecoration(
                        color: tokens.surfaceElevated,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: tokens.borderColor),
                      ),
                      child: Text(
                        task.project,
                        style: theme.textTheme.labelSmall?.copyWith(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: tokens.mutedForeground,
                        ),
                      ),
                    ),

                    // Status textual com micro-ícone
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        if (isInProgress) ...<Widget>[
                          Container(
                            width: 6,
                            height: 6,
                            decoration: const BoxDecoration(
                              color: Color(0xFFD97706),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Em execução',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: theme.brightness == Brightness.dark
                                  ? const Color(0xFFFBBF24)
                                  : const Color(0xFFB45309),
                            ),
                          ),
                        ] else if (isDone) ...<Widget>[
                          Icon(
                            Icons.check_rounded,
                            size: 13,
                            color: theme.brightness == Brightness.dark
                                ? const Color(0xFF34D399)
                                : const Color(0xFF059669),
                          ),
                          const SizedBox(width: 3),
                          Text(
                            'Concluído',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: theme.brightness == Brightness.dark
                                  ? const Color(0xFF34D399)
                                  : const Color(0xFF059669),
                            ),
                          ),
                        ] else ...<Widget>[
                          Container(
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: tokens.mutedForeground.withValues(alpha: 0.5),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'A Fazer',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: tokens.mutedForeground,
                            ),
                          ),
                        ],

                        const SizedBox(width: 4),
                        // Menu de Opções Rápido
                        PopupMenuButton<String>(
                          padding: EdgeInsets.zero,
                          iconSize: 16,
                          icon: Icon(
                            Icons.more_vert_rounded,
                            color: tokens.mutedForeground,
                          ),
                          onSelected: (String action) {
                            if (action == 'toggle') {
                              _cycleTaskStatus(task);
                            } else if (action == 'delete') {
                              _deleteTask(task);
                            }
                          },
                          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                            PopupMenuItem<String>(
                              value: 'toggle',
                              child: Text(
                                isDone ? 'Reabrir demanda' : 'Avançar status',
                                style: const TextStyle(fontSize: 12.5),
                              ),
                            ),
                            const PopupMenuDivider(),
                            PopupMenuItem<String>(
                              value: 'delete',
                              child: Text(
                                'Excluir demanda',
                                style: TextStyle(
                                  fontSize: 12.5,
                                  color: theme.colorScheme.error,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
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

  Widget _buildStatusIcon(TaskStatus status, ThemeData theme, FabricThemeExtension tokens) {
    switch (status) {
      case TaskStatus.inProgress:
        return Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: theme.brightness == Brightness.dark
                  ? const Color(0xFFFBBF24)
                  : const Color(0xFFD97706),
              width: 2,
            ),
          ),
          child: Center(
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: theme.brightness == Brightness.dark
                    ? const Color(0xFFFBBF24)
                    : const Color(0xFFD97706),
              ),
            ),
          ),
        );
      case TaskStatus.done:
        return Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: theme.brightness == Brightness.dark
                ? const Color(0xFF34D399)
                : const Color(0xFF059669),
          ),
          child: const Center(
            child: Icon(
              Icons.check_rounded,
              size: 13,
              color: Colors.white,
            ),
          ),
        );
      case TaskStatus.todo:
        return Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: tokens.mutedForeground.withValues(alpha: 0.6),
              width: 1.5,
            ),
          ),
        );
    }
  }

  Widget _buildPriorityPill(
    String priority,
    ThemeData theme,
    FabricThemeExtension tokens,
  ) {
    Color color;
    switch (priority) {
      case 'Alta':
        color = theme.colorScheme.error;
        break;
      case 'Média':
        color = theme.brightness == Brightness.dark
            ? const Color(0xFFFBBF24)
            : const Color(0xFFB45309);
        break;
      case 'Baixa':
      default:
        color = tokens.mutedForeground;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1.5),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color.withValues(alpha: 0.25), width: 0.8),
      ),
      child: Text(
        priority,
        style: TextStyle(
          fontSize: 9.5,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}

class _TaskItem {
  _TaskItem({
    required this.id,
    required this.title,
    required this.description,
    required this.project,
    required this.priority,
    required this.dueDate,
    required this.status,
    required this.assignee,
  });

  final String id;
  final String title;
  final String description;
  final String project;
  final String priority;
  final String dueDate;
  TaskStatus status;
  final String assignee;
}
