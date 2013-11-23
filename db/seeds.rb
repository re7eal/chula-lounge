# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html

puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name(role)
  puts 'role: ' << role
end
puts 'DEFAULT USERS'
user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << user.name
user.confirm!
user.add_role :admin


	courses = Course.create([#ICE - Course
								{ 	title: "Communicative English I",
									number: '5501112',
									description: "Communicative English",
									year: 1,
									semester: 1
								},

								{ 	title: "Engineering Graphics",
									number: '2183101',
									description: "Lettering; orthographic projections; sketching and drawing; pictorial drawing; dimensioning; tolerancing and 
											geometrical tolerancing; section; working drawing; mechanical parts drawing; introduction to CAD.",
									year: 1,
									semester: 2
								},

								{ 	title: "Communication and Presentation Skills",
									number: '5501214',
									description: "Use of more complex sentences; expressive and creative writing; writing research papers and technical reports. ",
									year: 1,
									semester: 2
								},

								{ 	title: "Calculus I",
									number: '2301107',
									description: "Limit, continuity, differentiation and integration of real valued functions of a real variable and their 
											applications; techniques of integration; improper integrals.",
									year: 1,
									semester: 1
								},

								{ 	title: "Calculus II",
									number: '2301108',
									description: "Mathematical induction; sequences and series of real numbers; Taylor series expansion and approximation of 
											elementary functions; numerical integration; vectors, lines and planes in three dimensional space; calculus of 
											vector valued functions of one variable; calculus of real valued functions of two variables; introduction to 
											differential equations and their applications.",
									year: 1,
									semester: 2
								},

								{ 	title: "Physics for Engineers",
									number: '2304153',
									description: "Mechanics of particles and rigid bodies, properties of matter, fluid mechanics, heat, vibrations and waves, 
											elements of electromagnetism, optics, modern physics.",
									year: 1,
									semester: 1
								},

								{ 	title: "Physics Laboratory for Engineers",
									number: '2304193',
									description: "Measurement and precision; experiments on simple harmonic motion, radius of gyration, dynamics of rotation, 
											velocity of sound, viscosity of fluids.",
									year: 1,
									semester: 1
								},

								{ 	title: "Computer Programming",
									number: '2190101',
									description: "Computer concepts; computer components; hardware and software interaction; EDP concepts; program design 
											and development methodology; high-level language programming. ",
									year: 1,
									semester: 1
								},

								{ 	title: "Computer Programming Lab",
									number: '2190151',
									description: "Programming in high-level language, programming tools, programming styles and convention, debugging.",
									year: 1,
									semester: 1
								},

								{ 	title: "Probability and Statistics for ICE",
									number: '2143122',
									description: "Discrete probability; probability space, counting techniques, conditional probability and independent events, 
											random variables, binomial and multinomial distributions, Poisson distribution, Bayes theorem, expected value, 
											conditional expectation, variance; continuous probability.",
									year: 1,
									semester: 2
								},

								{ 	title: "Discrete Mathematics",
									number: '2143110',
									description: "Sets, relations, functions, theorem and proof; combinatorics; counting, principle of inclusion exclusion, 
											recurrent relations, generating functions; graphs and trees; introduction to number theory. ",
									year: 1,
									semester: 2
								},


								{ 	title: "Chemistry for Engineers",
									number: '2302105',
									description: "dsds",
									year: 1,
									semester: 2
								},

								{ 	title: "General Chemistry Laboratory",
									number: '2302103',
									description: "dsds",
									year: 1,
									semester: 2
								},

								{ 	title: "Introduction to ICE",
									number: '2143101',
									description: "Fundamental engineering concepts and practices. Technology concepts and trends underlying current and future 
											uses of information and communication technology. Introduction to engineering management including 
											important aspects of management science.",
									year: 1,
									semester: 1
								},


								#Year 2/1
								{ 	title: "Electrical Circuits",
									number: '2140201',
									description: "DC circuit analysis; Kirchhoff laws; Thevenin and Norton theorem, semiconductor devices; op amps; 
											digital circuit; DC motor.",
									year: 2,
									semester: 1,
								},

								{ 	title: "Electrical Circuits Lab",
									number: '2140202',
									description: "Practices on simple circuits.",
									year: 2,
									semester: 1
								},

								{ 	title: "Advanced Mathematics Methods",
									number: '2143201',
									description: "First order differential equations; ordinary differential equations of higher order; series solution of ordinary 
											linear differential equations; Fourier series; Fourier transfroms; Laplace transforms; orthogonal functions and 
											application to boundary value problems; introduction to complex analysis; advanced matrix algebra; vector 
											calculus.",
									year: 2,
									semester: 1
								},

								{ 	title: "Fundamental Data Structure and Algorithm",
									number: '2143203',
									description: "Basic data types, trees, basic operations on sets, sorting and searching, algorithm design techniques, memory management.",
									year: 2,
									semester: 1
								},

								{ 	title: "Engineering Economic and Data Analysis",
									number: '2143310',
									description: "Interest formulations; time value of money; equivalent value and rate of return; project analysis and evaluation; 
											cost analysis; break even point, Analysis of decisions in engineering under uncertainty; decision tree, expected 
											monetary value and expected utility; expected value of perfect information and sampling information; basis for 
											expected utility theory; rating and ranking of alternatives using multiple criteria; case studies.",
									year: 2,
									semester: 1
								},
								#Year 2/2
								{ 	title: "Technical Communication for International Engineers",
									number: '2143222',
									description: "How to write a descriptions or documents related to engineering",
									year: 2,
									semester: 2
								},

								{ 	title: "Signal and Linear Systems",
									number: '2143221',
									description: "Fundamental engineering concepts and practices. Technology concepts and trends underlying current and future 
											uses of information and communication technology. Introduction to engineering management including 
											important aspects of management science.",
									year: 2,
									semester: 2
								},

								{ 	title: "Application Programming",
									number: '2143231',
									description: "Application programming methodology; object-oriented programming, event-driven programming; 
											Multithreading; error and exception handling; application programming interface (API), graphical user interface 
											(GUI).",
									year: 2,
									semester: 2
								},

								{ 	title: "Computer Architecture and Organization",
									number: '2143241',
									description: "Performance metrics; central processing unit; hardwired and microprogram of control units; instruction level 
											parallelism: pipeline, superscalar; memory system: cache memory, virtual memory, disk array; development and 
											future of architecture.",
									year: 2,
									semester: 2
								},
								#Year 3/1
								{ 	title: "Principles of Software Engineering",
									number: '2143303',
									description: "Design tools and techniques, top down design, modular design, software tools, debugging, test data; software 
											reliability, theory and concepts, errors and faults and estimating, reliability models, availability models; 
											management techniques, cost estimation, software maintenance. ",
									year: 3,
									semester: 1
								},

								{ 	title: "Database Management Systems",
									number: '2143310',
									description: "Database concepts: goals, data independence, relationships, logical and physical organizations, schema and 
											subschema; data models: hierarchical network and relational models; data normalization: first, second, and third 
											normal forms of data relations; canonical schema, data independence; data description language; query 
											facilities: relational algebra, relational calculus, data structures for establishing relations, query functions, design 
											and translation strategies; file organization and file security: data integrity and reliability. ",
									year: 3,
									semester: 1
								},

								{ 	title: "Operations Management",
									number: '2143304',
									description: "Operations strategies; inventory and distribution management; capacity management; aggregate planning; 
											master production scheduling; material requirements planning; operation scheduling; project management.",
									year: 3,
									semester: 1
								},

								{ 	title: "Introduction to Communication",
									number: '2143301',
									description: "Signal and noise analysis; analog and digital modulation and detection systems; Nyquist sampling theorem,
											quantization; digital baseband systems; digital modulation such as ASK, PSK, FSK, MSK and QAM; information 
											transmission, synchronization and channel coding; applications of communication systems.",
									year: 3,
									semester: 1
								},
								#Year 3/2
								{ 	title: "Telecommunication Systems",
									number: '2143321',
									description: "Introduction to telecommunication services and systems; signal transmission in telecommunication networks, 
											twisted pair, coaxcial cable, terrestrial microwave system, satellite microwave system, optical fiber system; 
											switching architecture, circuit and packet; basic queuing theory and traffic analysis; network design and 
											optimization; OSI model; Broadband networks, IP networks, WDM networks, SONET/SDH, Gigabit networks.",
									year: 3,
									semester: 2
								},

								{ 	title: "Engineering Management for International Engineers",
									number: '2140302',
									description: "Risk Mangement, Finance, Quality Management,",
									year: 3,
									semester: 2
								},

								{ 	title: "Enterprise Information Systems",
									number: '2143323',
									description: "Enterprise information systems; information technology infrastructure; impact of information systems on 
											organizations; information technology and business strategy; e-business and e-commerce; ethical and social 
											issues related to technology; technology decisions; business value of information systems.",
									year: 3,
									semester: 2	
								},

								{ 	title: "Software Project Management",
									number: '2143324',
									description: "Essence of software project management; scope of software project; project management approaches; project 
											estimation; software quality assurance; case study on project life cycle.",
									year: 3,
									semester: 2
								},

								{ 	title: "Principles of Data Communication",
									number: '2143322',
									description: "Introduction to data communications and networks, Layered protocols and network architectures, Basic of data 
											transmission (characteristics of transmission media, modulation, multiplexing), Data link protocols (error 
											detection, error correction, data link control protocols), Point-to-point protocols at network layer (routing, flow 
											control, error recovery), Delay models (basic queuing theory), Multi-access communications (Aloha, CSMA, 
											multi-access reservations), System design considerations.",
									year: 3,
									semester: 2
								},
								#Year 4/1
								{ 	title: "Multimedia Engineering",
									number: '2143404',
									description: "Introduction to Multimedia Engineering. Text Coding Standards Image Coding Standards. Video Coding 
											Standards. Audio Coding Standards. Speech Coding Standards. IP networks. Wireless networks. Multimedia 
											Communication Protocols. Multimedia Communication Applications.",
									year: 4,
									semester: 1
								},

								{ 	title: "Telecommunication Management",
									number: '2143407',
									description: "Telecommunication Technology and Trends. Telecommunication Markets. Telecommunication Economics. 
											Telecommunication Law and Policy. Telecommunication Licensing. Competition in Telecommunication 
											Business. Telecommunication Project Management.",
									year: 4,
									semester: 1
								},

								{ 	title: "User Interface Design",
									number: '2143416',
									description: "Design, implementation, and evaluation of human computer interfaces",
									year: 4,
									semester: 1
								},

								{ 	title: "Ubiquitous Computing",
									number: '2143418',
									description: "Introduction to ubiquitous computing, overview and basic terminologies, visions and fundamental challenges, 
											wireless transport, mobile IP, wireless ad hoc networks, wireless sensor networks, medium access control for 
											wireless sensor networks, middleware, programming wireless networks of embedded systems.",
									year: 4,
									semester: 1
								},

								{ 	title: "Introduction to Stochastic Modeling",
									number: '2143420',
									description: "Stochastic processes and models in operations research; discrete and continuous time parameter; Markov chains; 
											queuing theory; inventory theory; simulation",
									year: 4,
									semester: 1
								},

								{ 	title: "Optimization: Theory and Applications",
									number: '2143421',
									description: "Introduction to the theory, algorithms, and applications of optimization; optimization methodologies: linear 
											programming, network optimization, integer programming, decision trees, and dynamic programming; 
											applications to logistics, manufacturing, transportation, marketing, project management and finance.",
									year: 4,
									semester: 1
								},

								{ 	title: "Modern Web Development in Practice",
									number: '2143496',
									description: "Developing Web using Ruby on rails",
									year: 4,
									semester: 1
								},

								{ 	title: "High Technology Entrepreneurship",
									number: '2143423',
									description: "Becoming a new startup",
									year: 4,
									semester: 1
								},

								{ 	title: "Object-oriented Techniques",
									number: '2143412',
									description: "Techniques of Object-Oriented Analysis (OOA) and Design (OOD) covering managing complexity, using data 
											and procedural abstraction, encapsulation, hierarchies, and decomposition of problems into classes and objects. 
											The concepts introduced include overloading, multiple inheritance and polymorphism; the analysis, design and 
											implementation phases of software development, use case driven object-oriented development methodology, 
											and design patterns and Unified Modelling Language (UML).",
									year: 4,
									semester: 1
								},

								{ 	title: "Teletraffic Engineering and Network Optimization ",
									number: '2143408',
									description: "Teletraffic engineering overview; quality of service and network performance optimization; classification of 
											teletraffic engineering systems and traffic parameters; traffic data collection techniques and statistics; modeling 
											of non-queuing/loss-type system and queuing/delay-type system; modeling of system with mobile users; 
											fundamentals of network simulation; real-time network management and long-term network planning; 
											application of optimization techniques in network controls; case studies in network design.",
									year: 4,
									semester: 1
								},

								{ 	title: "Satellite Communication",
									number: '2143498',
									description: "Special Topics in ICE",
									year: 4,
									semester: 1
								},
								#Year4/2

								{ 	title: "Logic Design and Synthesis",
									number: '2143497',
									description: "Special Topics in ICE",
									year: 4,
									semester: 2
								},

								{ 	title: " Netcentric Architecture ",
									number: '2143401',
									description: "Principles of network applications, protocols, services (HTTP, FTP, SMTP, DNS, Peer-to-peer file sharing), 
											Web caching, Content distribution networks, Socket programming, Client-server model, Transport layer (TCP, 
											UDP), Reliable data transfer, Congestion control, Virtual circuit and datagram networks, The Internet Protocol 
											(IP), Routing in the Internet, Broadcast and multicast routing, Multimedia networking, Security in computer 
											networks, Network management.",
									year: 4,
									semester: 2
								},

								{ 	title: "System Integration",
									number: '2143406',
									description: "System Integration Definition; Communication Systems; Intelligent building Automation; Networking 
											Technology and Cabling System Management; Introduction to Communication System Design; Related 
											standards for Communication Systems Integration; Compatibility and Interoperability Analysis; Hardware vs. 
											Software Integration; Network Integration; Enterprise Application Integration; Management of Risk from 
											Integration; Interpersonal skills and Communications for System Engineer; Case Studies in System Integration.",
									year: 4,
									semester: 2
								},

								{ 	title: "Signal Transmission System ",
									number: '2143410',
									description: "Transmission lines, transmission line equations, transmission line analysis for sinusoidal waveforms, 
											transmission line analysis for pulse waveforms, basic of plane wave propagation in free space, basic of signal 
											transmission in optical fiber, signal dispersion in optical fiber, fundamental of antenna, basic antenna 
											parameters, design of transmission link, link budget.",
									year: 4,
									semester: 2
								},

								{ 	title: "System Security",
									number: '2143417',
									description: "Techniques for achieving security in multi-user computer systems and distributed computer systems. Topics: 
											physical security; discretionary and mandatory access control; biometrics; information-flow models of security; 
											covert channels; elementary cryptography; public-key cryptography; logic of authentication; electronic cash; 
											viruses; firewalls; electronic voting; risk assessment; secure web browsers.",
									year: 4,
									semester: 2
								},

								{ 	title: "Game Design and Development Process",
									number: '2143425',
									description: "Game Design and Development Process",
									year: 4,
									semester: 2
								},

								{ 	title: "Computer Graphics",
									number: '2143424',
									description: "Computer Graphics",
									year: 4,
									semester: 2
								},

								{ 	title: "Supply Chain Management",
									number: '2104441',
									description: "Definition of a supply chain; coordination difficulties; pitfalls and opportunities in supply chain management; 
											inventory/service tradeoffs; performance measurement and incentives; global supply chain management; mass 
											customization; supplier management; design and redesign of products and processes for supply chain 
											management; tools for analysis; industrial applications; current industry initiatives.",
									year: 4,
									semester: 2
								},

								{ 	title: "Principle of Wireless Communication",
									number: '2143409',
									description: "Introduction to design analysis and fundamental limits of wireless transmission systems. Wireless channel and 
											system models, multipath fading; equalization, channel coding and diversity; resource management and power 
											control; multiple antenna and MIMO systems; space-time codes and decoding algorithms; multiple-access 
											techniques and multiuser detection; cellular and ad-hoc network topologies; OFDM and ultrawideband systems; 
											Wireless LANs and MANs, cellular system standards. ",
									year: 4,
									semester: 2
								},

								{ 	title: " Data Warehousing ",
									number: '2143411',
									description: "Data warehouse design, Data Modeling, database design and database access",
									year: 4,
									semester: 2
								},

							#Nano Course
								{ 	title: "Biology for Engineers",
									number: '2303111',
									description: "Biology for Engineers",
									year: 1,
									semester: 2
								},

								{ 	title: "Biology Lab. for Engineers",
									number: '2303112',
									description: "Biology Lab. for Engineers",
									year: 1,
									semester: 2
								},

								{ 	title: "Basic Organic Chemistry",
									number: '2302202',
									description: "Structure and bonding, stereochemistry, spectroscopy, hydrocarbon, halogen containing 
												compounds, oxygen containing compounds, nitrogen containing compounds, 
												biomolecules.",
									year: 1,
									semester: 2
								},

								#Year 2/1
								{ 	title: "Engineering Materials II",
									number: '2141201',
									description: "High-temperature materials: reactions of metals with various environmental media at 
											high temperature; mechanism of creep; diffusion of vacancies; screw and edge 
											dislocation movement; grain boundary sliding; selection of metals for high-temperature 
											ambient. Refractory materials and their classification; properties of important refractory 
											materials; composite materials: types and properties of composite materials; fiber and 
											their interfaces; geometrical properties; elasticity; nanomaterials.",
									year: 2,
									semester: 1
								},

								{ 	title: "Mathematics for Nanotechnology",
									number: '2141223',
									description: "Mathematical knowledge and skills for nanotechnology.",
									year: 2,
									semester: 1
								},

								{ 	title: "Statics and Mechanics of Materials",
									number: '2141261',
									description: "Analysis of force systems and their equilibria as applied to engineering systems. Stresses 
											and strains; mechanical properties of materials; hooke law, elastic modulus, stress in 
											beam, shear force, bending moment diagram, torsion, buckling of columns, mohr circle.",
									year: 2,
									semester: 1
								},

								{ 	title: "Electrical Circuits",
									number: '2141270',
									description: "Circuit elements; Kirchhoff laws and reference directions; elementary concepts of 
											network graphs; resistive circuits; node and mesh analysis; Thevenin theorem and Norton 
											theorem; first-order and second- order circuits; step responses; zero-input and zero-state 
											responses; transient and steady-stale responses; exponential excitations; elementary 
											transfer functions; periodic waveforms; Fourier series; sinusoidal waveforms; phasor 
											representations; impedances and admittances; sinusoidal steady-state analysis; 
											frequency responses; three-phase circuits.",
									year: 2,
									semester: 1
								},

								{ 	title: "Organic Chemistry Laboratory",
									number: '2302203',
									description: "Fundamental laboratory techniques concerning the separation, purification and 
											determination of physical constants of organic compounds; chemical reactions of organic 
											compounds of various functional groups; synthesis of certain target molecules.",
									year: 2,
									semester: 1
								},

								{ 	title: "Physical Chemistry 1",
									number: '2302231',
									description: "The nature of physical chemistry; gases and liquids; solid states; symmetry; atomic 
											structure and quantum chemistry; chemical bonding; the investigation for molecular 
											structure; nuclear chemistry; the laws of chemical thermodynamics; free energy and 
											chemical equilibrium; phases rule.",
									year: 2,
									semester: 1
								},
								#Year 2/2
								{ 	title: "Dynamics and Vibrations",
									number: '2141263',
									description: "Analysis of system with single and multi degree of freedom; free and forced vibration; 
											determination of natural frequencies of structures; Modal analysis; Lagrange equations.",
									year: 2,
									semester: 2
								},

								{ 	title: "Electronic Devices I",
									number: '2141273',
									description: "Atoms and electrons; energy band and charge carriers in semiconductors; excess carriers 
											in semiconductors; junctions; PN junction diode; bipolar junction transistors; field effect 
											transistors; integrated circuits; lasers.",
									year: 2,
									semester: 2
								},

								{ 	title: "Electrical and Electronics Laboratory",
									number: '2141274',
									description: "A laboratory work on electric circuits and measurements: multimeter; oscilloscope; dc 
											circuits; ac circuits; semiconductor diodes; photoelectric devices; and transistors.",
									year: 2,
									semester: 2
								},

								{ 	title: "Biochemistry for NANO Engineers",
									number: '2310229',
									description: "Introductory to biochemistry: some basic techniques used in biochemical studies; 
											chemical and biological properties of biomolecules; enzyme; metabolism of food stuff, 
											with emphasis on energy yielding compounds; biosyntheses of nucleic acids and proteins; 
											and modes of metabolic regulation.",
									year: 2,
									semester: 2
								},

								{ 	title: "Statistics for Physical Science",
									number: '2603284',
									description: "Fundamental knowledge in Probability; Permutation and combination, central tendency; measurement of 
											variability; hypothesis testing; application of computer in linear regression calculation; validity of regression 
											using t-test; comparison between different regression models; use of software for analysis of experimental data in 
											engineering.",
									year: 2,
									semester: 2
								},

								#Year 3/1
								{ 	title: "Material Characterization",
									number: '2141303',
									description: "Optical Microscopy, Scanning Probe Microscopy (SPM), Field Emission Scanning Electron 
											Microscopy (FE SEM), Transmission Electron Microscopy (TEM) and Scanning TEM (STEM), 
											Focused Ion Beam (FIB), Energy Dispersive XRay Spectroscopy (EDS), XRay Reflectivity 
											and Total Reflection XRay Fluorescence, Auger Electron Spectroscopy (AES), Secondary 
											Ion Mass Spectrometry (SIMS), Surface Secondary Ion Mass Spectrometry Extended 
											Profile (Surface SIMS XP), Time of Flight Secondary Ion Mass Spectrometry (TOF SIMS). 
											LC MS, GC MS, IR, FTIR.",
									year: 3,
									semester: 1
								},

								{ 	title: "Measurement and Instrumentation",
									number: '2141375',
									description: "Basic electromechanical techniques used in modern instrumentation and control systems; 
											use of transducers and actuators; signal conditioning, grounding, and shielding; analog 
											and digital signal processing and feedback control methods with emphasis on frequency 
											domain techniques; low level measurements; lock in technique; frequency response of 
											continuous and discrete systems.",
									year: 3,
									semester: 1
								},

								{ 	title: "Micro and NanofabricationTechnology",
									number: '2141310',
									description: "Crystal growth: vapor phase epitaxy (VPE), liquid phase epitaxy (LPE), molecular beam 
											epitaxy (MBE), solid state diffusion, metal-organic chemical vapour deposition (MOCVD), 
											vacuum technology; device fabrication: inversion layer in MOS structure, thermal 
											oxidation, ion implantation, metallization, optical lithography, electron beam lithography, 
											pattern transfer, wet and dry etching, reactive ion etching.",
									year: 3,
									semester: 1
								},

								{ 	title: "Quantum Mechanics for Engineers",
									number: '2141331',
									description: "Dual nature of waves and particles; the postulates of quantum mechanics; concepts of 
											function spaces and Hermitian operators; superposition principles and compatible 
											observables; Schrödinger equation and problems in one dimension; hydrogen atom; 
											angular momentum; wavefunctions of electrons in confined potentials.",
									year: 3,
									semester: 1
								},

								{ 	title: "Nanopolymer Engineering",
									number: '2141341',
									description: "Definitions and basic concepts; crystalline and glassy polymers; molecular architecture; 
											conformation and morphology; polymer synthesis; transition phenomena; mechanical 
											properties affected by the transition phenomena; theory of rubber elasticity; polymer 
											rheology; types of mechanical deformations; simple rheological response; viscoelastic 
											properties of polymer; linear viscoelastic models; synthesis of controlled architecture 
											polymers; morphology characterization; block copolymers; polymer surfaces and 
											interfaces; nano-effects in polymer blends and composites; applications of polymer 
											nanotechnology for electronics and photonics.",
									year: 3,
									semester: 1
								},

								{ 	title: "Molecular Chemistry",
									number: '2141345',
									description: "Fundamental concepts of molecular chemistry and its applications in both organic 
											synthesis and catalysis.",
									year: 3,
									semester: 1
								},

								{ 	title: "Reaction Engineering",
									number: '2141346',
									description: "Fundamentals of reaction engineering; reaction rate laws; kinetics; mechanisms of 
											homogeneous and heterogeneous reactions; analysis of rate data; diffusion limitations; 
											design of industrial reactors.",
									year: 3,
									semester: 1
								},

								{ 	title: "Fluid Mechanics for International Engineers",
									number: '2141365',
									description: "Properties of fluid; equilibrium of fluid at rest; definition and method of flow analysis; 
											continuity momentum and energy equation for finite control volumes; stress-strain 
											relations for Newtonian fluids; equation of continuity and motion; dimensional analysis; laminar and turbulent flow; boundary layer concepts, flow in pipes; turbomachinery; 
											compressible flow.",
									year: 3,
									semester: 1
								},
								#Year 3/2
								{ 	title: "Transport Phenomena",
									number: '2141366',
									description: "Fluid mechanics; mass, energy, and momentum balances on various systems; laminar 
											and turbulent flow in pipes, porous media, and equipment; boundary layer and potential 
											flow theories and applications of mass and energy transport phenomena, emphasizing 
											their analogies and contrasts; Fourier's law; steady and unsteady thermal conduction; 
											heat transfer coefficients. Fick’s law.",
									year: 3,
									semester: 2
								},

								{ 	title: "Statistical Thermodynamics",
									number: '2141368',
									description: "Fundamental concepts; first law and its consequences; entropy and the second law; 
											combined first and second laws; energy states and energy levels; macrostates and 
											microstates; thermodynamics probability; statistical interpretation of entropy; distribution 
											functions; molecular partition function; applications of statistics to gases and other 
											systems.",
									year: 3,
									semester: 2
								},

								{ 	title: "Control Engineering ",
									number: '2141376',
									description: "Closed-loop and open loop feedback control systems; mathematical models of physical 
											systems; block diagrams; signal flow graphs; time domain responses; the performance of 
											feedback control systems; the stability of linear feedback systems; essential principles of 
											feedback; the root locus method; frequency response method; stability of the frequency 
											domain, time-domain analysis of control systems: the design and compensation of 
											feedback control system.",
									year: 3 ,
									semester: 2
								},
								#Year 4/1
								{ 	title: "IT for Communications",
									number: '2141481',
									description: "IT skills in technical communication. Presentation skills. Usage of computer softwares for 
											effective communication.",
									year: 4,
									semester: 1
								},

								{ 	title: "Nano Seminar",
									number: '2141490',
									description: "Seminar on interesting topics related to nanoengineering. ",
									year: 4,
									semester: 1
								},

								{ 	title: "Research Methodology",
									number: '2141491',
									description: "Research Formulation, research objectives, basic procedure for doing research. Statistical 
											method for research, analysis of data and its implication.",
									year: 4,
									semester: 1
								},

								{ 	title: "Electronic Device II",
									number: '2141473',
									description: "Current status of VLSI chip technology and its limits, including Moore's Laws, band-gap 
											engineering, advanced semiconductor materials: GaAs and SiGe, Advanced semicondutor 
											structures: heterostructures quantum wells and superlattices, Advanced semiconductor 
											devices",
									year: 4,
									semester: 1
								},

								{ 	title: "Introduction to VLSI Technolgy",
									number: '2141475',
									description: "Fundamentals of digital and analogue circuits.",
									year: 4,
									semester: 1
								},

								{ 	title: "Effective Problem Solving for Industry",
									number: '2141513',
									description: "Special Topics in Nano Engineering",
									year: 4,
									semester: 1
								},

								{ 	title: "Nanomaterial Synthesis by Aerosol Process",
									number: '2141553',
									description: "Special Topics in Nano Engineering",
									year: 4,
									semester: 1
								},

								{ 	title: "Cell and Molecular Biology",
									number: '2141591',
									description: "Cell and Molecular Biology",
									year: 4,
									semester: 1
								},

								{ 	title: "Microbionanotechnology",
									number: '2141511',
									description: "Special Topics in Nano Engineering",
									year: 4,
									semester: 1
								},

								{ 	title: "Nanoelectronics",
									number: '2141417',
									description: "Introduction to nanotechnology, nanoscale fabrication, nanoscale characterizations, SEM, 
											TEM, AFM, 1D quantum structure, quantum wires, 0D quantum structure, quantum dots, 
											single electron devices, carbon nanotubes, molecular electronics, nanostorage, quantum 
											cellular automata, spintronics.",
									year: 4,
									semester: 1
								},
								#Year 4/2
								{ 	title: "Computer Programming for International Engineers",
									number: '2140101',
									description: "Computer concepts; computer components; hardware and software interaction; EDP 
											concepts; program design and development methodology; highlevel language 
											programming",
									year: 4,
									semester: 2
								},

								{ 	title: " Biological Interaction with Materials",
									number: '2141350',
									description: "Basic biological systems that interact with the biomaterials and the range of materials 
											currently used for biomedical applications; appropriate analytical techniques pertinent to 
											biomaterial research and evaluation; selected important medical fields in which 
											biomaterials play a critical role.",
									year: 4,
									semester: 2
								},

								{ 	title: "Failue Mode and Effect Analysis",
									number: '2141360',
									description: "Analysis of the causes of failure in engineering materials and the diagnosis of those 
											causes; prevention of failures by using various techniques; analysis of fracture surfaces; 
											case studies.",
									year: 4,
									semester: 2
								},

								{ 	title: "Biosystems and Biotransport ",
									number: '2141456',
									description: "Application of fundamental chemical engineering principles (mass, heat and momentum 
											transport, kinetics) to the study of biological systems, with emphasis on current 
											bioengineering research.",
									year: 4,
									semester: 2
								},

								{ 	title: "Micro and Nano -Electro Mechanical System",
									number: '2141416',
									description: "Application of fundamental chemical engineering principles (mass, heat and momentum 
											transport, kinetics) to the study of biological systems, with emphasis on current 
											bioengineering research.",
									year: 4,
									semester: 2
								},

								{ 	title: "Optoelectronics",
									number: '2141477',
									description: "Review of Maxwell’s equations; plane wave in simple media; Physics of optical radiation; 
											interaction between optical radiation and matter; principles and applications of 
											optoelectronic devices: sources, detectors as well as other optical materials, devices, 
											components and equipments; nanophotonics.",
									year: 4,
									semester: 2
								},

								{ 	title: "Numerical Method",
									number: '2141514',
									description: "Special Topics in Nano Engineering",
									year: 4,
									semester: 2
								},

								{ 	title: "Engineering Economics and Decision Making Analysis",
									number: '2143210',
									description: "Economics and Decision Making ",
									year: 4,
									semester: 2
								},

								{ 	title: "Logic Design and Synthesis",
									number: '2141512',
									description: "Special Topics in Nano Engineering",
									year: 4,
									semester: 2
								},

#########################################Aero#####################################
							#Year 2/1
								{ 	title: "Introduction to Mechanics",
									number: '2145201',
									description: "Analysis of force systems and their equilibrium as applied to engineering systems; stresses and strains; 
											mechanical properties of materials; hooke law, elastic modulus, stress in beam, shear force, bending moment 
											diagram, torsion, buckling of columns, mohr circle, fundamental of dynamics.",
									year: 2,
									semester: 1
								},

								{ 	title: "Introduction to Aerospace Engineering",
									number: '2145211',
									description: "Basic aerodynamic phenomena and simplified theory, elementary aerospace vehicle performance, stability and 
											control, and design.",
									year: 2,
									semester: 1
								},

								{ 	title: "Thermodynamics for Aerospace Engineering",
									number: '2145212',
									description: "Basic concepts, properties of pure substances and ideal gases, energy and thermal, first law of thermodynamics 
											for closed systems and control volumes, entropy, second law of thermodynamics, second law analysis, 
											introductory cycle analysis; introduction to the combustion and the first law analysis of the reacting system.",
									year: 2,
									semester: 1
								},

								{ 	title: "Advanced Calculus",
									number: '2301201',
									description: "Algebra and calculus of vectors, vector differential operators (gradient, divergence and curl), cylindrical and 
											spherical coordinates, Green Gauss and Stokes theorems, tensors.",
									year: 2,
									semester: 1
								},

								{ 	title: "Statistics for Physical Science",
									number: '2603285',
									description: "Fundamental knowledge in Probability; Permutation and combination, central tendency; measurement of 
											variability; hypothesis testing; application of computer in linear regression calculation; validity of regression 
											using t-test; comparison between different regression models; use of software for analysis of experimental data in 
											engineering.",
									year: 2,
									semester: 1
								},
								#Year 2/2
								{ 	title: "Mechanical Dynamics",
									number: '2142213',
									description: "Motions of particles and rigid body in 2-D; kinematics; kinetics; Newton second law of motion; equation of 
											motion; introduction to 3-D dynamics of rigid body; impulse and momentum; introduction to mechanical 
											vibration; natural frequency; excitation and damping; equations of motion of free and forced vibration.",
									year: 2,
									semester: 2
								},

								{ 	title: "Fluid Mechanics for Aerospace Engineering",
									number: '2145213',
									description: "Introduction to fluid, kinematics of fluid, derivation of continuity, momentum, and energy equations, control 
											volume equations and applications, differential equations and applications, Bernoulli equation, discussion on 
											vorticity and stream function, dimensional analysis, incompressible viscous flow, internal and external flow, 
											boundary layer concept, flow about immersed bodies.",
									year: 2,
									semester: 2
								},

								{ 	title: "Differential Equations",
									number: '2301311',
									description: "Existence and uniqueness theorem of solution of first order equations; initial value problem; Laplace transform; 
											Taylor series expansion of elementary functions; numerical methods; general linear equations; solution in series; 
											linear partial differential equations; boundary value problems.",
									year: 2,
									semester: 2
								},

								{ 	title: "Introduction to Aircraft Design",
									number: '2145221',
									description: "Introduction to aircraft systems, fundamentals to aircraft systems, elements of aerodynamics, airfoils, and wings, 
											aspects of vehicle conceptual design.",
									year: 2,
									semester: 2
								},

								{ 	title: "Aircraft Electricity and Electronics ",
									number: '2145230',
									description: "DC and AC circuits analysis, electrical control devices, analog and digital electronics, electric measuring 
											instruments, electric motors, aircraft electrical systems, radio theory, aircraft communication and navigation 
											systems, autoflight systems.",
									year: 2,
									semester: 2
								},
								#Year 3/2
								{ 	title: "Aerodynamics II ",
									number: '2145312',
									description: "Fundamental of compressible flow, acoustic waves, normal and oblique shock waves, expansion waves, Prandtl Meyer flow, convergent divergent nozzle, flow with friction and heat transfer, unsteady wave motion, 
											perturbation theory, linearized flow and theory of characteristics.",
									year: 3,
									semester: 2
								},

								{ 	title: "Aerospace Engineering Laboratory",
									number: '2145392',
									description: "Laboratory experiment in aerodynamics, structure, propulsion, performance and control.",
									year: 3,
									semester: 2
								},

								{ 	title: "Aircraft Structure II ",
									number: '2145322',
									description: "Longitudinal and lateral dynamic stability and control of aircrafts, general equations of motion, stability 
											derivatives, response to control inputs.",
									year: 3,
									semester: 2
								},

								{ 	title: "Aircraft Dynamic Stability",
									number: '2145302',
									description: "",
									year: 3,
									semester: 2
								},
								#Year 4/2
								{ 	title: "Aircraft Design II ",
									number: '2145412',
									description: "Center of gravity calculation, basic aerodynamics estimation, static stability and control analysis, propulsion 
											consideration and analysis, performance analysis, aircraft cost prediction, preliminary and detailed design 
											concepts, quality control of aircraft conceptual design.",
									year: 4,
									semester: 2
								},

								{ 	title: "Aero Space Engineering Project",
									number: '2145499',
									description: "Group or individual projects on a subject related to aerospace engineering.",
									year: 4,
									semester: 2
								},

								{ 	title: "CAD/CAM/CAE",
									number: '2142355',
									description: "Introduction to CAD/CAM/CAE, 3D solid modeling, design concepts and Implementation; link to manufacturing 
											interface.",
									year: 4,
									semester: 2
								},

								{ 	title: "Failure Analysis and NDT",
									number: '2142434',
									description: "Analysis of the causes of failure and the diagnosis of those causes; physics of failure, concepts of reliability, 
											failure analysis as part of the design process, time based related failure modes, safety factors; case studies; 
											elimination of failures through proper material selection, treatment, and use; case histories; examination of 
											fracture surfaces; laboratory investigations of different failure mechanisms.",
									year: 4,
									semester: 2
								},

								{ 	title: "Aircraft Propulsion ",
									number: '2145401',
									description: "Introduction to propulsion, air breathing and non air breathing engines, brief review of the thermodynamics and 
											compressible flow, basic thrust equation of aircraft gas turbine engines, Brayton cycle, propellers, momentum or 
											actuator disk theory and blade element theory, gas turbine component performance, inlet, compressor, turbine and 
											nozzle, cycle analysis of gas turbine engines, ramjet, turbojet, turbofan and turboprop.",
									year: 4,
									semester: 2
								},

								{ 	title: "Aircraft Repair Philosophy",
									number: '2145496',
									description: "Selected interesting topics in aerospace engineering.",
									year: 4,
									semester: 2
								},

								#Year 3/1
								{ 	title: "Aircraft Performance and Static Stability",
									number: '2145301',
									description: "Introduction to aircraft performance, fundamental of level flight, climb, descent, cruise, takeoff, landing and 
											turning performance for both jet and piston engine aircraft, static stability and control and related aircraft 
											consideration",
									year: 3,
									semester: 1
								},

								{ 	title: "Aerodynamics I ",
									number: '2145311',
									description: "Properties of air, standard atmosphere, conservation principles, continuity, momentum, Euler’s Equation, 
											rotationality, circulation, vortex, lift, drag, potential flow, airfoil characteristics, thin airfoil theory, cambered and 
											flapped airfoil, high lift devices, finite wing theory, panel and vortex lattice methods.",
									year: 3,
									semester: 1
								},

								{ 	title: "Aircraft Structure I",
									number: '2145321',
									description: "Introduction to design of aerospace structures, review of concepts of stress, deformation, strain, and displacement 
											and the equations of elasticity, two dimensional problems in elasticity, energy methods of structural analysis, 
											principles of virtual displacements and virtual forces, bending of thin plates, structural instability; introduction to 
											finite element.",
									year: 3,
									semester: 1
								},

								{ 	title: "Computing Methods in Aerospace Engineering ",
									number: '2145331',
									description: "Basic methods for obtaining numerical solutions with a digital computer, including methods for the solutions of 
											algebraic and transcendental equations, simultaneous linear equations, ordinary and partial differential equations, 
											and curve fitting techniques, comparison of various methods with respect to computational efficiency and 
											accuracy.",
									year: 3,
									semester: 1
								},

								{ 	title: "Aerospace Engineering Laboratory I",
									number: '2145391',
									description: "Laboratory experiment in fluid, strength, heat transfer, aerodynamics; basic measurement and instruments for 
											engineering.",
									year: 3,
									semester: 1
								},
								#Year 4/1
								{ 	title: "Aircraft Propulsion ",
									number: '2145401',
									description: "Introduction to propulsion, air breathing and non air breathing engines, brief review of the thermodynamics and 
											compressible flow, basic thrust equation of aircraft gas turbine engines, Brayton cycle, propellers, momentum or 
											actuator disk theory and blade element theory, gas turbine component performance, inlet, compressor, turbine and 
											nozzle, cycle analysis of gas turbine engines, ramjet, turbojet, turbofan and turboprop.",
									year: 4,
									semester: 1
								},

								{ 	title: "Heat Transfer for International Engineers",
									number: '2142342',
									description: "Modes of heat transfer; general forms of heat conduction equations; steady one dimensional heat conduction; 
											steady two dimensional heat conduction, transient one dimensional heat conduction; introduction of convection 
											and boundary layer; external flow; internal flow; free convection; heat exchangers; introduction of radiation; 
											blackbody radiation and grey surfaces; view factors; radiation exchange between grey, diffuse surfaces in an 
											enclosure.",
									year: 4,
									semester: 1
								},

								{ 	title: "Flight Experience ",
									number: '2145498',
									description: "Selected interesting topics in aerospace engineering.",
									year: 4,
									semester: 1
								},

								{ 	title: "Aircraft Repair Philosophy",
									number: '2145497',
									description: "Selected interesting topics in aerospace engineering.",
									year: 4,
									semester: 1
								},

								{ 	title: "Gas Dynamics",
									number: '2145422 ',
									description: "Introduction to gas dynamics, covering fundamental concepts in thermodynamics and fluid dynamics; molecular 
											and continuum concepts for fluids, first and second laws of thermodynamics, conservation laws for moving 
											fluids, one dimensional compressible flows, shock and expansion waves, flows in nozzles, and two and three dimensional compressible flows.",
									year: 4,
									semester: 1
								},

								{ 	title: "Materials for Aerospace Engineering",
									number: '2145497',
									description: "Selected interesting topics in aerospace engineering.",
									year: 4,
									semester: 1
								},

								{ 	title: "Finite Element Methods and Applications ",
									number: '2142352',
									description: "Basic Principles of Finite Element methods; applications of finite elements in analysis using computer programs.",
									year: 4,
									semester: 1
								},

								{ 	title: "Aerospace Engineering Seminar",
									number: '2145491',
									description: "Discussion of selected topics and case studies in aerospace engineering.",
									year: 4,
									semester: 1
								},

								{ 	title: "Aircraft Design I",
									number: '2145411',
									description: "Conceptual design process, wing design consideration, tail design consideration, undercarriage arrangement 
											consideration, initial take off mass estimation, detailed mass calculation, mission fuel requirement.",
									year: 4,
									semester: 1
								},

######################################Adme#########################################
								{ 	title: "Introduction to Automotive Engineering",
									number: '2142121',
									description: "Basic principles of automotive systems, components, and design; internal combustion engine; transmission; 
											chassis; suspension; steering; brake; body; vehicle aerodynamics and automotive electronics; basic vehicle 
											dynamics; performance and handling.",
									year: 1,
									semester: 2
								},

								{ 	title: "Engineering Materials I",
									number: '2142131',
									description: "Introduction to engineering materials including metallic, polymeric, asphalt, wood, concrete, ceramic, and 
											composite materials; phase equilibrium diagrams and their interpretation; atomic and crystallographic structure; 
											noncrystalline and semi crystalline materials; introduction to microstructure, processing method, properties and 
											their relationships; introduction to materials properties and testing: mechanical, electrical, magnetic, thermal 
											properties; degradation of materials in services from corrosion, wear, and mechanical failures.",
									year: 1,
									semester: 2
								},


								{ 	title: "Automotive Engineering Workshop",
									number: '2142191',
									description: "Hand on study of automotive systems and components; names and function of components and parts; basic 
											mechanical parts; engine; electronic systems; power train; brake systems; steering mechanism; basic diagnosis.",
									year: 1,
									semester: 2
								},

								{ 	title: "Practice on Mach.Tool and Fabrication",
									number: '2140102',
									description: "Measurement systems and precision measurements, principles and use of machine tools; safety; fabrication 
											process of metal; heat treatment; welding",
									year: 1,
									semester: 2
								},

								{ 	title: "Mechanical Statics",
									number: '2142111',
									description: "Force systems; resultants; equilibrium; structure; distributed force; friction; virtual work; stability",
									year: 1,
									semester: 2
								},


								#Year 2/1
								{ 	title: "Mechanical Dynamics",
									number: '2142211',
									description: "Motions of particles and rigid body in 2-D; kinematics; kinetics; Newton second law of motion; equation of 
											motion; introduction to 3-D dynamics of rigid body; impulse and momentum; introduction to mechanical 
											vibration; natural frequency; excitation and damping; equations of motion of free and forced vibration.",
									year: 2,
									semester: 1
								},

								{ 	title: "Thermodynamics for International Engineers",
									number: '2142241',
									description: "Definitions and concepts; properties of pure substances and ideal gases; work and heat; first law of 
											thermodynamics for control mass and control volume; second law of thermodynamics and Carnot cycle; energy; 
											entropy; basic heat transfer and energy conversion; air-standard power cycle and refrigeration cycles; introduction 
											to mixtures of gases; introduction to the combustion and the first law analysis of the reacting system.",
									year: 2,
									semester: 1
								},

								{ 	title: "Introduction to Manufacturing Processes",
									number: '2142261',
									description: "Introduction to concepts in manufacturing; Solidification processing of materials; Sheet metal forming process; 
											Processing of ceramics and plastics; Composite materials and fabrications; Machining; Joining Processes; Heat 
											treatment; Relationships between structure, properties, and manufacturing techniques; Fundamental of 
											manufacturing cost.",
									year: 2,
									semester: 1
								},

								{ 	title: "Differential Equations",
									number: '2301312',
									description: "Existence and uniqueness theorem of solution of first order equations; initial value problem; Laplace transform; 
											Taylor series expansion of elementary functions; numerical methods; general linear equations; solution in series; 
											linear partial differential equations; boundary value problems.",
									year: 2,
									semester: 1
								},

								{ 	title: "Physics and Electronics for Engineers",
									number: '2304154',
									description: "Electricity; DC circuit; AC circuit; basic electronics; solid state devices; electrical actuators.",
									year: 2,
									semester: 1
								},

								{ 	title: "Physics and Electronics Laboratory for Engineers",
									number: '2304194',
									description: "Resistance and electromotive force measurements; experiments on ampmeter, voltmeter, oscilloscope, AC circuit, 
											transistor, lenses and mirrors, polarization, interference, diffraction.",
									year: 2,
									semester: 1
								},

								{ 	title: "Statistics for Physical Science",
									number: '2603284',
									description: "Fundamental knowledge in Probability; Permutation and combination, central tendency; measurement of 
											variability; hypothesis testing; application of computer in linear regression calculation; validity of regression 
											using t-test; comparison between different regression models; use of software for analysis of experimental data in 
											engineering.",
									year: 2,
									semester: 1
								},

								#Year 2/2
								{ 	title: "Electrical Circuits",
									number: '2140211',
									description: "DC circuit analysis; Kirchhoff laws; Thevenin and Norton theorem; semiconductor devices; op-amps; digital 
											circuit; DC motor.",
									year: 2,
									semester: 2 
								},

								{ 	title: "Electrical Circuits Laboratory",
									number: '2140212',
									description: "Electronic instruments; multimeter; oscilloscope; voltage regulators; filter circuit; transistor amplifier circuit; op amp circuits; digital circuits; DC motor.",
									year: 2,
									semester: 2
								},

								{ 	title: "Engineering First",
									number: '2142201',
									description: "Knowledge in the study and practice of engineering. ",
									year: 2,
									semester: 2
								},

								{ 	title: "Dynamics and Vibrations ",
									number: '2142212',
									description: "Analysis of system with single and multi degree of freedom; torsional vibration; free and forced vibration; 
											determination of natural frequencies of structures; discrete system; Modal analysis; methods and techniques to 
											reduce and control vibration; Lagrange equations.",
									year: 2,
									semester: 2
								},

								{ 	title: "Mechanical Solids",
									number: '2142231',
									description: "Force and stress; stresses and strains relationship; Hooke law; modulus of elasticity; stresses in beams; shear 
											force; bending moment diagrams; deflection of beams; torsion; buckling of columns; Mohr circle; combined 
											stresses; failure criterion; safety factors.",
									year: 2,
									semester: 2
								},

								{ 	title: "Fluid Mechanics for International Engineering",
									number: '2142242',
									description: "Introduction and fundamental concepts of fluid mechanics; stress field; fluid static and buoyancy forces; 
											conservation equations of fluid motion in integral form; conservation of mass, momentum, and energy; Euler 
											and Bernoulli equations; introduction to the differential forms of the conservation equations; dimensional analysis 
											and Buckingham Pi theorem; internal incompressible viscous flow; flow in pipes and ducts; flow measurements; 
											introduction to boundary layer concepts.",
									year: 2,
									semester: 2
								},
								#Year 3/1
								{ 	title: "Engineering Management for International Engineers",
									number: '2140302',
									description: "Modern management principles; methods of increasing productivity; human relations; industrial safety; pollution 
											problems; commercial laws; basics of engineering economy, finance, marketing, and project management",
									year: 3,
									semester: 1
								},

								{ 	title: "Mechanics of Machanery for International Engineers",
									number: '2142311',
									description: "Basic mechanisms; gear trains; displacements; velocity and acceleration in machines; statics and dynamics force 
											analysis; balances of rotating and reciprocating masses; gyroscopic effects.",
									year: 3,
									semester: 1
								},

								{ 	title: "Heat Transfer for International Engineers",
									number: '2142341',
									description: "Modes of heat transfer; general forms of heat conduction equations; steady one dimensional heat conduction; 
											steady two dimensional heat conduction, transient one dimensional heat conduction; introduction of convection 
											and boundary layer; external flow; internal flow; free convection; heat exchangers; introduction of radiation; 
											blackbody radiation and grey surfaces; view factors; radiation exchange between grey, diffuse surfaces in an 
											enclosure.",
									year: 3,
									semester: 1
								},

								{ 	title: "Mechanics Engineering System Design",
									number: '2142351',
									description: "Fundamental of mechanical engineering design; properties of materials; theory of failure; fatigue; design of 
											simple machine elements; design project of a simple mechanical machine.",
									year: 3,
									semester: 1
								},

								{ 	title: "Finite Element Method and Applications",
									number: '2142352',
									description: "Basic Principles of Finite Element methods; applications of finite elements in analysis using computer programs.",
									year: 3,
									semester: 1
								},

								{ 	title: "Engineering Mechanical Laboratory",
									number: '2142391',
									description: "Experimentation and basic concepts; error and uncertainty analysis; measurement and instrumentation; data 
											analysis; interpretation of experimental results; reporting of experimental results; basic experiments in solid 
											mechanics, thermodynamics, fluid mechanics and basic engine testing.",
									year: 3,
									semester: 1
								},

								{ 	title: "Automotive Instrument Laboratory",
									number: '2142392',
									description: "Basic electronics; electronic systems in automobiles; engine performance testing; basic automotive diagnosis.",
									year: 3,
									semester: 1
								},

								{ 	title: "System Dynamics and Controls",
									number: '2142425',
									description: "System dynamics modeling; responses; introduction to control systems; feedback control system characteristics; 
											the performance of feedback control systems; the stability of linear feedback systems; essential principles of 
											feedback; the root locus method; time domain analysis and design of control systems; frequency response 
											method; stability of the frequency domain and compensation; use of computer in the design of control systems.",
									year: 3,
									semester: 1
								},

								{ 	title: "Embedded Systems",
									number: '2142492',
									description: "Embedded Systems",
									year: 3,
									semester: 1
								},

								#Year4/1
								{ 	title: "Advanced Manufacturing for Automotive Industry",
									number: '2142361',
									description: "The application of mathematical analysis of manufacturing systems; engineering economics, competitive aspects, 
											and statistical methods in manufacturing; introduction to CAE for manufacturing; advanced processing 
											techniques: joining processes, surface treatments, precision mold and die designs.",
									year: 4,
									semester: 1
								},

								{ 	title: "Automotive Engineering Seminar",
									number: '2142401',
									description: "Selected topics and case studies in automotive engineering; discussion on and analysis of case studies and project 
											presentation.",
									year: 4,
									semester: 1
								},

								{ 	title: "Motor Vehicle Design",
									number: '2142451',
									description: "Systematic approach to automotive design; space defining components; ergonomics; automotive safety and 
											regulations.",
									year: 4,
									semester: 1
								},


								{ 	title: "System Dynamics and Controls",
									number: '2142425',
									description: "System dynamics modeling; responses; introduction to control systems; feedback control system characteristics; 
											the performance of feedback control systems; the stability of linear feedback systems; essential principles of 
											feedback; the root locus method; time domain analysis and design of control systems; frequency response 
											method; stability of the frequency domain and compensation; use of computer in the design of control systems.",
									year: 4,
									semester: 1
								},

								{ 	title: "Embedded Systems",
									number: '2142492',
									description: "Embedded Systems",
									year: 4,
									semester: 1
								},
								#year 3/2
								{ 	title: "Internal Combustion Engine for International Engineers",
									number: '2142321',
									description: "Internal combustion engines; basic principles; fluid flow; thermodynamics; fuels and combustion; ideal fuel air 
											cycle; heat transfer; friction and lubrication; efficiency and emission; different types of engines: spark-ignition 
											and compression-ignition; ignition systems; supercharging and scavenging; performance and testing.",
									year: 3,
									semester: 2
								},

								{ 	title: "CAD/CAM/CAE",
									number: '2142353',
									description: "Introduction to CAD/CAM/CAE, 3D solid modeling, design concepts and Implementation; link to manufacturing 
											interface.",
									year: 3,
									semester: 2
								},

								{ 	title: "Mechanical Engineering System Design",
									number: '2142354',
									description: "Introduction of design process; specification development; planning; conceptual design; product design and 
											evaluation; design for manufacturing and maintenance; a design project on mechanical systems; a design project 
											on thermo fluid systems.",
									year: 3,
									semester: 2
								},

								{ 	title: "Product Development Process ",
									number: '2142362',
									description: "Product requirement and specifications; reverse engineering; use of CMM; product design by CAD.",
									year: 3,
									semester: 2
								},

								{ 	title: "Vehicle Dynamic",
									number: '2142424',
									description: "Dynamics of motor vehicles; properties of pneumatic tire; suspension and steering mechanism; vehicle 
											longitudinal dynamics; linear bicycle models; stability; linear engine models; pleasure in driving.",
									year: 3,
									semester: 2
								},

								{ 	title: "Manufacturing of Composite Material",
									number: '2142432',
									description: "Manufacturing processes of composite materials for automotive engineering; hand lay up, spray up, hot 
											press autoclave techniques, SMC (sheet molding compound) molding, filament winding, pultrusion; material 
											selection and manufacturing of sandwich structures; testing and evaluation of materials; principles of tool section; 
											principles of composite structure repair and recycling.",
									year: 3,
									semester: 2
								},
								#Year 4/2
								{ 	title: "Automotive Engineerng Project",
									number: '2142499',
									description: "Group or individual project on a subject related to automotive engineering and manufacturing",
									year: 4,
									semester: 2
								},

								{ 	title: "Electronic and Instrument for Automobile",
									number: '2142421',
									description: "Introduction to digital circuits; introduction to microprocessors and microprocessors based systems; basic 
											instrumentation; application of different types of instrumentations to automotive systems.",
									year: 4,
									semester: 2
								},

								{ 	title: "Failure Analysis and NDT",
									number: '2142433',
									description: "Analysis of the causes of failure and the diagnosis of those causes; physics of failure, concepts of reliability, 
											failure analysis as part of the design process, time based related failure modes, safety factors; case studies; 
											elimination of failures through proper material selection, treatment, and use; case histories; examination of 
											fracture surfaces; laboratory investigations of different failure mechanisms.",
									year: 4,
									semester: 2
								}

							])


	Curriculums = Curriculum.create ([ 
										
										{ 	id: 1 ,
											name: "Information and Communication",
											abbreviation: "ICE",
											faculty_id: 1,
											:courses => Course.where(:number=>[	'2140201',
																				'2143101',
																				'2140202',
																				'2143110',
																				'2143122',
																				'2143201',
																				'2143203',
																				'2143221',
																				'2143222',
																				'2143231',
																				'2143241',
																				'2143301',
																				'2143303',
																				'2143304',
																				'2143310',
																				'2143321',
																				'2143322',
																				'2143323',
																				'2143324',
																				'2143401',
																				'2143404',
																				'2143406',
																				'2143407',
																				'2143409',
																				'2143410',
																				'2143411',
																				'2143416',
																				'2143417',
																				'2143418',
																				'2143420',
																				'2143421',
																				'2143423',
																				'2143424',
																				'2143425',
																				'2143412',
																				'2143408',
																				'2190101',
																				'2190151',
																				'2301107',
																				'2301108',
																				'2302103',
																				'2302105',
																				'2304153',
																				'2304193',
																				'5501112',
																				'5501214',
																				'2143496',
																				'2143425',
																				'2143424',
																				'2104441',
																				'2143497',
																				'2143498',

																				])
										},
										{ 	id: 2 ,
											name: "Automotive Design and Manufacturing",
											abbreviation: "ADME",
											faculty_id: 1,  
											:courses => Course.where(:number=>[	'2140211',
																				'2140212',
																				'2140302',
																				'2142201',
																				'2142212',
																				'2142231',
																				'2142241',
																				'2142242',
																				'2142261',
																				'2142311',
																				'2142321',
																				'2142341',
																				'2142351',
																				'2142352',
																				'2142353',
																				'2142354',
																				'2142361',
																				'2142362',
																				'2142391',
																				'2142392',
																				'2142401',
																				'2142421',
																				'2142424',
																				'2142425',
																				'2142432',
																				'2142433',
																				'2142451',
																				'2142492',
																				'2142499',
																				'2301312',
																				'2304194',
																				'2603284',
																				'2183101',
																				'2190101',
																				'2190151',
																				'2301107',
																				'2302103',
																				'2302105',
																				'5501214',
																				'2301108',
																				'2304153',
																				'2304193',
																				'5501112',
																				'2142131',
																				'2142111',
																				'2142121',
																				'2142191',
																				'2140102',
																				])
										},

										{ 	id: 3 ,
											name: "Aerospace",
											abbreviation: "AERO",
											faculty_id: 1,
											:courses => Course.where(:number=>[	'2142213',
																				'2142342',
																				'2142352',
																				'2142355',
																				'2142434',
																				'2145201',
																				'2145211',
																				'2145212',
																				'2145213',
																				'2145221',
																				'2145230',
																				'2145301',
																				'2145302',
																				'2145311',
																				'2145312',
																				'2145321',
																				'2145322',
																				'2145331',
																				'2145391',
																				'2145392',
																				'2145401',
																				'2145411',
																				'2145412',
																				'2145420',
																				'2145422',
																				'2145491',
																				'2145497',
																				'2145497',
																				'2145498',
																				'2145498',
																				'2145499',
																				'2301201',
																				'2301311',
																				'2603284',
																				'2183101',
																				'2190101',
																				'2190151',
																				'2301107',
																				'2302103',
																				'2302105',
																				'2304153',
																				'5501214',
																				'2301108',
																				'2304193',
																				'2142131',
																				'5501112'])

										},

										{ 	id: 4 ,
											name: "Nano",
											abbreviation: "NANO",
											faculty_id: 1 ,
											:courses => Course.where(:number=>[ '2140101',
																				'2141201',
																				'5501214',
																				'2301108',
																				'2141223',
																				'2141261',
																				'2141263',
																				'2141270',
																				'2141273',
																				'2141274',
																				'2141303',
																				'2141310',
																				'2141331',
																				'2141341',
																				'2141345',
																				'2141346',
																				'2141350',
																				'2141360',
																				'2141365',
																				'2141366',
																				'2141368',
																				'2141375',
																				'2141376',
																				'2141416',
																				'2141417',
																				'2141456',
																				'2141473',
																				'2141475',
																				'2141477',
																				'2141481',
																				'2141490',
																				'2141491',
																				'2141499',
																				'2141511',
																				'2141512',
																				'2141513',
																				'2141513',
																				'2141514',
																				'2141591',
																				'2143210',
																				'2302203',
																				'2302231',
																				'2310229',
																				'2603285',
																				'2183101',
																				'2190101',
																				'2190151',
																				'2301107',
																				'2302103',
																				'2302105',
																				'2304153',
																				'2304193',
																				'5501112',
																				'2303111',
																				'2303112',
																				'2302202'])										
										}

									])

	Faculties = Faculty.create 	([

									{ 	id: 1,
										name: "Faculty of Engineering",
										abbreviation: "ISE"
									}


								])


	Professors = Professor.create([
		{   name: "Sivabudj",
			last_name: "Umpudh"},
		{   name: "Yan",
			last_name: "Zhao"},
		{   name: "Bunchuay",
			last_name: "Supmonchai"},
		{   name: "Ekachai",
			last_name: "Leelarasmee"},
		{   name: "Suree",
			last_name: "Pumrin"},
		{   name: "Wanchalerm",
			last_name: "Pora"},
		{   name: "Charnchai",
			last_name: "Pluempitiwiriyawej"},
		{   name: "Vishnu",
			last_name: "Kotrajaras"},
		{   name: "Daricha",
			last_name: "Sutivong"},
		{   name: "Panuwat",
			last_name: "Janpugdee"},
		{   name: "Chaiyachet",
			last_name: "Saivichit"},
		{   name: "Pasu",
			last_name: "Kaewplung"},
		{   name: "Chaodit",
			last_name: "Asawakul"},
		{   name: "Chotirat",
			last_name: "Ratanamahatana,"},
		{   name: "Pornsiri",
			last_name: "Muenchaisri"},
		{   name: "Parames",
			last_name: "Chutima"},
		{   name: "Supavadee",
			last_name: "Aramvith"},
		{   name: "Prasit",
			last_name: "Teekaput"},
		{   name: "Chate",
			last_name: "Patanothai"},
		{   name: "Kultida",
			last_name: "Rojviboonchai"},
		{   name: "Naragain",
			last_name: "Phumchusri"},
		{   name: "Wipavee",
			last_name: "Tharmmaphornphilas"},
		{   name: "Dechanuchit",
			last_name: "Katanyutaveetip"},
		{   name: "Thit",
			last_name: "Siriboon"},
		{   name: "Chairat",
			last_name: "Phongphanphanee"},
		{   name: "Dhawat",
			last_name: "Pansatiankul"},
		{   name: "Widhyakorn",
			last_name: "Asdornwised"},
		{   name: "Krung",
			last_name: "Sinapiromsaran"},
		{   name: "Tungrat",
			last_name: "chaichana"},
		{   name: "Richard",
			last_name: "Lemarie"},
		{   name: "Alan",
			last_name: "Connolly"},
		{   name: "Jirada",
			last_name: "Wudthayagorn"},
		{   name: "Atiwong",
			last_name: "Suchato"},
		{   name: "Krerk",
			last_name: "Piromsopa"},
		{   name: "Lunchakorn",
			last_name: "Wutsittikulki"},
		{   name: "Watit",
			last_name: "Benjapolakul"},
		{   name: "Natawut",
			last_name: "Nupairoj"},
		{   name: "Nakornthip",
			last_name: "Prompoon"},
		{   name: "Natcha",
			last_name: "Thawesaengskulthai"},
		{   name: "Damrong",
			last_name: "Thawesaengskulthai"},
		{   name: "Boonwa",
			last_name: "Thapitakkul"},
		{   name: "Vanchai",
			last_name: "Rijiravanich"},
		{   name: "Suthas",
			last_name: "Ratanakuakangwan"},
		{   name: "Varong",
			last_name: "Pavarajarn"},
		{   name: "Taptim",
			last_name: "Angkaew"},
		{   name: "Pizzanu",
			last_name: "Kanongchaiyos"},
		{   name: "Oran",
			last_name: "Kittithirapornchai"},
		{   name: "Kong",
			last_name: "Kritayakirana"},
		{   name: "Peerapon",
			last_name: "Vateekul"},
		{   name: "Setha",
			last_name: "Pan-ngum"},
		{   name: "Nopdanai",
			last_name: "Ajavakom"},
		{   name: "Niphon",
			last_name: "Wansophark"},
		{   name: "Phongsaen",
			last_name: "Pitakwatchara"},
		{   name: "Chotiros",
			last_name: "Surapholchai"},
		{   name: "Teeraphong",
			last_name: "Phongpattanacharoen"},
		{   name: "Seksak",
			last_name: "Asavavisithchai"},
		{   name: "Manop",
			last_name: "Wongsaisuwan"},
		{   name: "Jitkomut",
			last_name: "Songsiri"},
		{   name: "Tawan",
			last_name: "Paphapote"},
		{   name: "Supatana",
			last_name: "Auethavekiat"},
		{   name: "Chanchana",
			last_name: "Tangwongsan"},
		{   name: "Paitoon",
			last_name: "Rashatasakhon"},
		{   name: "Vudhichai",
			last_name: "Parasuk"},
		{   name: "Arporn",
			last_name: "Teeramongkonrasmee"},
		{   name: "Alongkorn",
			last_name: "Pimpin"},	
		{   name: "Wibool",
			last_name: "Piyawattanametha"},
		{   name: "Nakorn",
			last_name: "Phaisangittisakul"},
		{   name: "Sarawut",
			last_name: "Rimdusit"},
		{   name: "Anongnat",
			last_name: "Somwangthanaroj"},
		{   name: "Varun",
			last_name: "Taepaisitphongse"},	
		{   name: "Sorada",
			last_name: "Kanokpanont"},
		{   name: "Akawat",
			last_name: "Sirisuk"},
		{   name: "Asi",
			last_name: "Bunyajitradulya"},
		{   name: "Suthee",
			last_name: "Traivivatana"},
		{   name: "Thanyarat",
			last_name: "Singhanart"},	
		{   name: "Wuthichai",
			last_name: "Wongthatsanekorn"},
		{   name: "Oratai",
			last_name: "Jongprateep"},
		{   name: "Chanin",
			last_name: "Wissawinthanon"},
		{   name: "Pahnit",
			last_name: "Seriburi"},
		{   name: "Viriya",
			last_name: "Udomphol"},	
		{   name: "Yuparwadee",
			last_name: "Satirakul"},
		{   name: "Achariya",
			last_name: "Suriyawong"},
		{   name: "Pimporn",
			last_name: "Uttayarat"},
		{   name: "Kanokporn",
			last_name: "Boonyasirichai"},
		{   name: "Suwimol",
			last_name: "Jetawattana"},	
		{   name: "Siriprapha",
			last_name: "Sanchatjate"},
		{   name: "Bunpote",
			last_name: "Siridechadilok,"},
		{   name: "Anthony",
			last_name: "Whalley"},
		{   name: "Anurat",
			last_name: "Wisitsoraat"},
		{   name: "Orawan",
			last_name: "Satayalai"},	
		{   name: "Thavatchai",
			last_name: "Tayjasanant"},
		{   name: "Lerson",
			last_name: "Tanasugarn"},
		{   name: "Rath",
			last_name: "Pichyangkura"},
		{   name: "Suchart",
			last_name: "Chanama"},
		{   name: "Supaart",
			last_name: "Sirikantaramas"},	
		{   name: "Teerapong",
			last_name: "Buaboocha"},
		{   name: "Kuakaroon",
			last_name: "Krusong"},
		{   name: "Akarin",
			last_name: "Phaibulpanich"},
		{   name: "Tawatchai",
			last_name: "Charinpanitkul"},
		{   name: "Decha",
			last_name: "Chatsiriwech"},	
		{   name: "Soorathep",
			last_name: "Kheawhom"},
		{   name: "David",
			last_name: "Banjerdpongchai"},
		{   name: "Niti",
			last_name: "Yongvanich,"},
		{   name: "Boonrat",
			last_name: "Lohwongwatana,"},
		{   name: "Authur",
			last_name: "McEvily"},
		{   name: "Kasidit",
			last_name: "Nootong,"},
		{   name: "Adisorn",
			last_name: "Tuantranont"},	
		{   name: "Angsumalin",
			last_name: "Senjuntichai"},
		{   name: "Kaukeart",
			last_name: "Boonchukosol,"},
		{   name: "Chirdpun",
			last_name: "Vitoonraporn"},
		{   name: "Somkiat",
			last_name: "Tangjitsitchareon"},
		{   name: "Somchai",
			last_name: "Puajindanetr"},
		{   name: "Anusorn",
			last_name: "Chonwerayuth"},
		{   name: "Sujin",
			last_name: "Khomrutai"},	
		{   name: "Chatchai",
			last_name: "Srinitiwarawong"},
		{   name: "Tonphong",
			last_name: "Kaewkongka"},
		{   name: "Somchai",
			last_name: "Kiatgamolchai"},
		{   name: "Somrit",
			last_name: "Wongmanerod"},
		{   name: "Pramote",
			last_name: "Dechaumphai"},
		{   name: "Witaya",
			last_name: "Wannasuphoprasit"},
		{   name: "Pongtorn",
			last_name: "Charunyakorn"},	
		{   name: "Ratchatin",
			last_name: "Chancharoen"},
		{   name: "Sunhapos",
			last_name: "Chatranuwathana"},
		{   name: "Nuksit",
			last_name: "Noomwongs"},
		{   name: "Chanat",
			last_name: "Ratanasumawong"},
		{   name: "Kanit",
			last_name: "Wattanavichien"},
		{   name: "Itthipon",
			last_name: "Diewwanit"},
		{   name: "Kittiphan",
			last_name: "Bangyeekhan"},	
		{   name: "Phulporn",
			last_name: "Saengbangpla"},
		{   name: "viboon",
			last_name: "Sangveraphunsiri"},
		{   name: "Suradej",
			last_name: "Voranutsoontorn"},
		{   name: "Kuntinee",
			last_name: "Maneeratana"},
		{   name: "Somchai",
			last_name: "Peungperksuk"},
		{   name: "Haruetai",
			last_name: "Lohasiriwat"},
		{   name: "Khanard",
			last_name: "Hussiri"},	
		{   name: "Montian",
			last_name: "Tianprateep"},
		{   name: "Boonchoat",
			last_name: "Paosawatyanyong"},
		{   name: "Wasunthara",
			last_name: "Manklasavadi"},
		{   name: "Truswin",
			last_name: "Raksasataya"},
		{   name: "Jeerasak",
			last_name: "Pitakarnnop"},
		{   name: "Arpiruk",
			last_name: "Hokphanna"},
		{   name: "Boonchai",
			last_name: "Watjatrakul,"},	
		{   name: "Wicha",
			last_name: "Mektrakran"},
		{   name: "Sant",
			last_name: "Sangwornrachasup,"},
		{   name: "Chittin",
			last_name: "Tangthitng,"},
		{   name: "Khamron",
			last_name: "Mekchay,"},
		{   name: "Songkiat",
			last_name: "Sumetkijakan,"},
		{   name: "Pinunta",
			last_name: "Rojratsirikul,"}
		])

