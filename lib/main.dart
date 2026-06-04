import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const PortfolioApp());
}

const _ink = Color(0xFF101820);
const _teal = Color(0xFF00897B);
const _mint = Color(0xFFE8F5F1);
const _paper = Color(0xFFFAFBF8);
const _line = Color(0xFFE3E8E4);
const _gold = Color(0xFFF4B942);

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marlu Enriquez | Flutter Developer',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: _paper,
        colorScheme: ColorScheme.fromSeed(
          seedColor: _teal,
          brightness: Brightness.light,
          primary: _teal,
          surface: _paper,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontWeight: FontWeight.w800, height: 1.02),
          headlineMedium: TextStyle(fontWeight: FontWeight.w800, height: 1.15),
          titleLarge: TextStyle(fontWeight: FontWeight.w800),
          titleMedium: TextStyle(fontWeight: FontWeight.w700),
          bodyLarge: TextStyle(height: 1.6),
          bodyMedium: TextStyle(height: 1.55),
        ).apply(bodyColor: _ink, displayColor: _ink, fontFamily: 'Arial'),
      ),
      home: const PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatelessWidget {
  const PortfolioHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SelectionArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              HeroSection(),
              SectionShell(child: SkillsSection()),
              SectionShell(tinted: true, child: ProjectsSection()),
              SectionShell(child: ExperienceSection()),
              SectionShell(tinted: true, child: EducationSection()),
              FooterSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isNarrow = width < 820;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: _ink),
      child: SafeArea(
        bottom: false,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1180),
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                isNarrow ? 20 : 34,
                22,
                isNarrow ? 20 : 34,
                isNarrow ? 48 : 74,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _TopNav(),
                  const SizedBox(height: 58),
                  Flex(
                    direction: isNarrow ? Axis.vertical : Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: isNarrow ? 0 : 7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const _Pill(
                              label: 'Flutter Developer | Cebu, Philippines',
                            ),
                            const SizedBox(height: 24),
                            Text(
                              'Marlu A. Enriquez',
                              style: Theme.of(context).textTheme.displayLarge
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontSize: isNarrow ? 44 : 74,
                                    letterSpacing: 0,
                                  ),
                            ),
                            const SizedBox(height: 18),
                            Text(
                              'I build offline-first mobile apps, POS workflows, sync architecture, and practical tools using Flutter, SQLite, Supabase, and solid IT infrastructure experience.',
                              style: Theme.of(context).textTheme.bodyLarge
                                  ?.copyWith(
                                    color: Colors.white.withValues(alpha: .82),
                                    fontSize: isNarrow ? 17 : 20,
                                  ),
                            ),
                            const SizedBox(height: 28),
                            Wrap(
                              spacing: 12,
                              runSpacing: 12,
                              children: const [
                                LinkButton(
                                  label: 'View GitHub',
                                  icon: Icons.code,
                                  url: 'https://github.com/marluxdxd',
                                ),
                                LinkButton(
                                  label: 'Download CV',
                                  icon: Icons.download,
                                  url:
                                      'assets/assets/docs/Marlu_Enriquez_CV.pdf',
                                ),
                                LinkButton(
                                  label: 'Email Me',
                                  icon: Icons.mail_outline,
                                  url: 'mailto:marluaenriquez@gmail.com',
                                  filled: false,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: isNarrow ? 0 : 44,
                        height: isNarrow ? 36 : 0,
                      ),
                      Expanded(
                        flex: isNarrow ? 0 : 4,
                        child: const _ProfilePanel(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TopNav extends StatelessWidget {
  const _TopNav();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.flutter_dash, color: _gold, size: 28),
        const SizedBox(width: 10),
        Text(
          'Marlu.dev',
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(color: Colors.white),
        ),
        const Spacer(),
        _NavLink(label: 'Projects', url: 'https://github.com/marluxdxd'),
        const SizedBox(width: 16),
        _NavLink(
          label: 'Play Store',
          url:
              'https://play.google.com/store/apps/details?id=com.sukibarato.store',
        ),
      ],
    );
  }
}

class _NavLink extends StatelessWidget {
  const _NavLink({required this.label, required this.url});

  final String label;
  final String url;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => openUrl(url),
      child: Text(label, style: const TextStyle(color: Colors.white)),
    );
  }
}

class _ProfilePanel extends StatelessWidget {
  const _ProfilePanel();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 390),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .08),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white.withValues(alpha: .14)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: AspectRatio(
              aspectRatio: 4 / 3,
              child: Image.asset(
                'assets/images/marlu-profile.jpeg',
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          const SizedBox(height: 18),
          const _FactRow(icon: Icons.phone_android, text: '+63 931 919 9484'),
          const _FactRow(
            icon: Icons.alternate_email,
            text: 'marluaenriquez@gmail.com',
          ),
          const _FactRow(
            icon: Icons.location_on_outlined,
            text: 'Cebu, Cebu 6000',
          ),
        ],
      ),
    );
  }
}

class _FactRow extends StatelessWidget {
  const _FactRow({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(icon, color: _gold, size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Text(text, style: const TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

class SectionShell extends StatelessWidget {
  const SectionShell({super.key, required this.child, this.tinted = false});

  final Widget child;
  final bool tinted;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: tinted ? _mint : _paper,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1180),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 64),
            child: child,
          ),
        ),
      ),
    );
  }
}

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeading(
          eyebrow: 'Core stack',
          title: 'Developer with mobile product and IT operations range.',
        ),
        const SizedBox(height: 26),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: const [
            SkillChip('Flutter'),
            SkillChip('Dart'),
            SkillChip('Android Development'),
            SkillChip('SQLite'),
            SkillChip('Supabase'),
            SkillChip('REST API'),
            SkillChip('SQL Server'),
            SkillChip('C#'),
            SkillChip('Unity Game Development'),
            SkillChip('Server Maintenance'),
            SkillChip('Network Troubleshooting'),
            SkillChip('System Administration'),
          ],
        ),
      ],
    );
  }
}

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final narrow = MediaQuery.sizeOf(context).width < 840;
    final cards = [
      ProjectCard(
        title: 'HoMa POS',
        role: 'Flutter Developer | March 2025 - Present',
        description:
            'A cross-platform Point-of-Sale app for small stores with sales transactions, inventory management, barcode scanning, offline-first SQLite storage, and Supabase cloud sync.',
        image: 'assets/images/homa-play-store.png',
        tags: const ['Flutter', 'Dart', 'SQLite', 'Supabase', 'REST API'],
        url:
            'https://play.google.com/store/apps/details?id=com.sukibarato.store',
      ),
      ProjectCard(
        title: 'MARHON26 Repository',
        role: 'Flutter app repository',
        description:
            'A production-minded mobile app codebase with Android, iOS, web, desktop targets, Supabase integration, and active iteration across privacy, UI, and reliability work.',
        image: 'assets/images/github-marhon26.png',
        tags: const ['Flutter', 'GitHub', 'Supabase', 'Mobile App'],
        url: 'https://github.com/marluxdxd/MARHON26',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeading(
          eyebrow: 'Featured work',
          title: 'Real apps, real users, and practical engineering.',
        ),
        const SizedBox(height: 26),
        Flex(
          direction: narrow ? Axis.vertical : Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var i = 0; i < cards.length; i++) ...[
              Expanded(flex: narrow ? 0 : 1, child: cards[i]),
              if (i != cards.length - 1)
                SizedBox(width: narrow ? 0 : 20, height: narrow ? 20 : 0),
            ],
          ],
        ),
      ],
    );
  }
}

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SectionHeading(
          eyebrow: 'Work history',
          title: 'Hands-on support, infrastructure, and software delivery.',
        ),
        SizedBox(height: 22),
        TimelineItem(
          period: 'May 2023 - Current',
          title: 'Technical Support Staff',
          company: 'Mactan Doctors Hospital Inc.',
          points: [
            'Oversee IT operations and supervise two IT staff for efficient service delivery.',
            'Maintain servers, CCTV systems, and network infrastructure.',
            'Lead server migration, backup recovery, and Sophos Firewall coordination.',
          ],
        ),
        TimelineItem(
          period: '2019 - 2023',
          title: 'Technical Support Staff',
          company:
              'Protect Marine Deck and Engine Officers of the Philippines Inc.',
          points: [
            'Supported mission-critical training equipment and operational systems.',
            'Handled hardware, software, and network troubleshooting.',
            'Generated reports to monitor performance and trends.',
          ],
        ),
        TimelineItem(
          period: '2020 - 2021',
          title: 'IT Intern',
          company: 'Azpired Inc. (BPO)',
          points: [
            'Installed and configured Windows and Linux systems.',
            'Assisted PC maintenance, ticketing, and technical support workflows.',
          ],
        ),
      ],
    );
  }
}

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeading(
          eyebrow: 'Education and credentials',
          title: 'Programming foundation with continuous applied learning.',
        ),
        const SizedBox(height: 22),
        Wrap(
          spacing: 18,
          runSpacing: 18,
          children: const [
            InfoTile(
              icon: Icons.school_outlined,
              title: 'BS Information Communication Technology',
              detail:
                  'Cebu Technological University, Major in Programming, 2019',
            ),
            InfoTile(
              icon: Icons.workspace_premium_outlined,
              title: 'Certifications',
              detail:
                  'Leadership and Management Skills, Electronic Drug Price Monitoring System 3.0 and 4.0',
            ),
            InfoTile(
              icon: Icons.translate,
              title: 'Languages',
              detail: 'English, Tagalog, Bisaya',
            ),
          ],
        ),
      ],
    );
  }
}

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: _ink,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1180),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 46),
            child: Wrap(
              spacing: 20,
              runSpacing: 18,
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 560,
                  child: Text(
                    'Available for Flutter developer roles. I bring mobile development, offline sync, POS systems, and dependable IT operations experience.',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      height: 1.35,
                    ),
                  ),
                ),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: const [
                    LinkButton(
                      label: 'Call',
                      icon: Icons.call,
                      url: 'tel:+639319199484',
                    ),
                    LinkButton(
                      label: 'Email',
                      icon: Icons.mail_outline,
                      url: 'mailto:marluaenriquez@gmail.com',
                      filled: false,
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

class SectionHeading extends StatelessWidget {
  const SectionHeading({super.key, required this.eyebrow, required this.title});

  final String eyebrow;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 760),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            eyebrow.toUpperCase(),
            style: const TextStyle(
              color: _teal,
              fontWeight: FontWeight.w800,
              letterSpacing: 0,
            ),
          ),
          const SizedBox(height: 8),
          Text(title, style: Theme.of(context).textTheme.headlineMedium),
        ],
      ),
    );
  }
}

class SkillChip extends StatelessWidget {
  const SkillChip(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: _line),
      ),
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.w700)),
    );
  }
}

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.title,
    required this.role,
    required this.description,
    required this.image,
    required this.tags,
    required this.url,
  });

  final String title;
  final String role;
  final String description;
  final String image;
  final List<String> tags;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: _line),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 6),
                Text(
                  role,
                  style: const TextStyle(
                    color: _teal,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 12),
                Text(description),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [for (final tag in tags) _MiniTag(tag)],
                ),
                const SizedBox(height: 18),
                TextButton.icon(
                  onPressed: () => openUrl(url),
                  icon: const Icon(Icons.open_in_new),
                  label: const Text('Open project'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MiniTag extends StatelessWidget {
  const _MiniTag(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: _mint,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w800),
      ),
    );
  }
}

class TimelineItem extends StatelessWidget {
  const TimelineItem({
    super.key,
    required this.period,
    required this.title,
    required this.company,
    required this.points,
  });

  final String period;
  final String title;
  final String company;
  final List<String> points;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: _line),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.work_outline, color: _teal),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  period,
                  style: const TextStyle(
                    color: _teal,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$title - $company',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                for (final point in points)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text('- $point'),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  const InfoTile({
    super.key,
    required this.icon,
    required this.title,
    required this.detail,
  });

  final IconData icon;
  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      constraints: const BoxConstraints(minHeight: 154),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: _line),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: _teal, size: 30),
          const SizedBox(height: 14),
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Text(detail),
        ],
      ),
    );
  }
}

class _Pill extends StatelessWidget {
  const _Pill({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
      decoration: BoxDecoration(
        color: _gold.withValues(alpha: .18),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: _gold.withValues(alpha: .55)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class LinkButton extends StatelessWidget {
  const LinkButton({
    super.key,
    required this.label,
    required this.icon,
    required this.url,
    this.filled = true,
  });

  final String label;
  final IconData icon;
  final String url;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    final foreground = filled ? _ink : Colors.white;
    final background = filled ? _gold : Colors.transparent;

    return FilledButton.icon(
      style: FilledButton.styleFrom(
        backgroundColor: background,
        foregroundColor: foreground,
        side: filled
            ? null
            : BorderSide(color: Colors.white.withValues(alpha: .45)),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: () => openUrl(url),
      icon: Icon(icon, size: 19),
      label: Text(label),
    );
  }
}

Future<void> openUrl(String value) async {
  final uri = Uri.parse(value);
  if (!await launchUrl(uri, mode: LaunchMode.platformDefault)) {
    throw Exception('Could not open $value');
  }
}
