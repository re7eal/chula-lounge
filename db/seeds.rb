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
							{ 	title: "Introduction to ICE",
									number: '2143101',
									description: "Fundamental engineering concepts and practices. Technology concepts and trends underlying current and future 
											uses of information and communication technology. Introduction to engineering management including 
											important aspects of management science.",
									year: 1,
									semester: 1
								},

								{ 	title: "English for Engineering I",
									number: '5500111',
									description: "Grammar; use of simple sentences; writing mechanics and process; writing and vision aids to good English.",
									year: 1,
									semester: 1
								},

								{ 	title: "Communicative English I",
									number: '5501112',
									description: "",
									year: 1,
									semester: 1
								},

								{ 	title: "English for Engineering II",
									number: '5500222',
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

								{ 	title: "Probability and Statistics for Information and Communication Engineering",
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
									semester: 2,
								},

								{ 	title: "Chemistry for Engineers",
									number: '2302105',
									description: "",
									year: 1,
									semester: 1,
								},

								{ 	title: "General Chemistry Laboratory",
									number: '2302103',
									description: "",
									year: 1,
									semester: 1,
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
=begin								#Year 2/2
								{ 	title: "Technical Communication for International Engineers",
									number: '2143222',
									description: "How to write a descriptions or documents related to engineering",
									year:,
									semester:
								},

								{ 	title: "Signal and Linear Systems",
									number: '2143221',
									description: "Fundamental engineering concepts and practices. Technology concepts and trends underlying current and future 
											uses of information and communication technology. Introduction to engineering management including 
											important aspects of management science.",
									year:,
									semester:
								},

								{ 	title: "Application Programming",
									number: '2143231',
									description: "Application programming methodology; object-oriented programming, event-driven programming; 
											Multithreading; error and exception handling; application programming interface (API), graphical user interface 
											(GUI).",
									year:,
									semester:
								},

								{ 	title: "Computer Architecture and Organization",
									number: '2143241',
									description: "Performance metrics; central processing unit; hardwired and microprogram of control units; instruction level 
											parallelism: pipeline, superscalar; memory system: cache memory, virtual memory, disk array; development and 
											future of architecture.",
									year:,
									semester:
								},
								#Year 3/1
								{ 	title: "Principles of Software Engineering",
									number: '2143303',
									description: "Design tools and techniques, top down design, modular design, software tools, debugging, test data; software 
											reliability, theory and concepts, errors and faults and estimating, reliability models, availability models; 
											management techniques, cost estimation, software maintenance. ",
									year:,
									semester:
								},

								{ 	title: "Database Management Systems",
									number: '2143310',
									description: "Database concepts: goals, data independence, relationships, logical and physical organizations, schema and 
											subschema; data models: hierarchical network and relational models; data normalization: first, second, and third 
											normal forms of data relations; canonical schema, data independence; data description language; query 
											facilities: relational algebra, relational calculus, data structures for establishing relations, query functions, design 
											and translation strategies; file organization and file security: data integrity and reliability. ",
									year:,
									semester:
								},

								{ 	title: "Operations Management",
									number: '2143304',
									description: "Operations strategies; inventory and distribution management; capacity management; aggregate planning; 
											master production scheduling; material requirements planning; operation scheduling; project management.",
									year:,
									semester:
								},

								{ 	title: "Introduction to Communication",
									number: '2143301',
									description: "Signal and noise analysis; analog and digital modulation and detection systems; Nyquist sampling theorem,
											quantization; digital baseband systems; digital modulation such as ASK, PSK, FSK, MSK and QAM; information 
											transmission, synchronization and channel coding; applications of communication systems.",
									year:,
									semester:
								},
								#Year 3/2
								{ 	title: "Telecommunication Systems",
									number: '2143321',
									description: "Introduction to telecommunication services and systems; signal transmission in telecommunication networks, 
											twisted pair, coaxcial cable, terrestrial microwave system, satellite microwave system, optical fiber system; 
											switching architecture, circuit and packet; basic queuing theory and traffic analysis; network design and 
											optimization; OSI model; Broadband networks, IP networks, WDM networks, SONET/SDH, Gigabit networks.",
									year:,
									semester:
								},

								{ 	title: "Engineering Management for International Engineers",
									number: '2143310',
									description: "Risk Mangement, Finance, Quality Management,",
									year:,
									semester:
								},

								{ 	title: "Enterprise Information Systems",
									number: '2143323',
									description: "Enterprise information systems; information technology infrastructure; impact of information systems on 
											organizations; information technology and business strategy; e-business and e-commerce; ethical and social 
											issues related to technology; technology decisions; business value of information systems.",
									year:,
									semester:		
								},

								{ 	title: "Software Project Management",
									number: '2143324',
									description: "Essence of software project management; scope of software project; project management approaches; project 
											estimation; software quality assurance; case study on project life cycle.",
									year:,
									semester:
								},

								{ 	title: "Principles of Data Communication",
									number: '2143322',
									description: "Introduction to data communications and networks, Layered protocols and network architectures, Basic of data 
											transmission (characteristics of transmission media, modulation, multiplexing), Data link protocols (error 
											detection, error correction, data link control protocols), Point-to-point protocols at network layer (routing, flow 
											control, error recovery), Delay models (basic queuing theory), Multi-access communications (Aloha, CSMA, 
											multi-access reservations), System design considerations.",
									year:,
									semester:
								},
								#Year 4/1
								{ 	title: "Multimedia Engineering",
									number: '2143404',
									description: "Introduction to Multimedia Engineering. Text Coding Standards Image Coding Standards. Video Coding 
											Standards. Audio Coding Standards. Speech Coding Standards. IP networks. Wireless networks. Multimedia 
											Communication Protocols. Multimedia Communication Applications.",
									year:,
									semester:
								},

								{ 	title: "Telecommunication Management",
									number: '2143407',
									description: "Telecommunication Technology and Trends. Telecommunication Markets. Telecommunication Economics. 
											Telecommunication Law and Policy. Telecommunication Licensing. Competition in Telecommunication 
											Business. Telecommunication Project Management.",
									year:,
									semester:
								},

								{ 	title: "User Interface Design",
									number: '2143416',
									description: "Design, implementation, and evaluation of human computer interfaces",
									year:,
									semester:
								},

								{ 	title: "Ubiquitous Computing",
									number: '2143418',
									description: "Introduction to ubiquitous computing, overview and basic terminologies, visions and fundamental challenges, 
											wireless transport, mobile IP, wireless ad hoc networks, wireless sensor networks, medium access control for 
											wireless sensor networks, middleware, programming wireless networks of embedded systems.",
									year:,
									semester:
								},

								{ 	title: "Introduction to Stochastic Modeling",
									number: '2143420',
									description: "Stochastic processes and models in operations research; discrete and continuous time parameter; Markov chains; 
											queuing theory; inventory theory; simulation",
									year:,
									semester:
								},

								{ 	title: "Optimization: Theory and Applications",
									number: '2143421',
									description: "Introduction to the theory, algorithms, and applications of optimization; optimization methodologies: linear 
											programming, network optimization, integer programming, decision trees, and dynamic programming; 
											applications to logistics, manufacturing, transportation, marketing, project management and finance.",
									year:,
									semester:
								},

								{ 	title: "Modern Web Development in Practice",
									number: '2143496',
									description: "Developing Web using Ruby on rails",
									year:,
									semester:
								},

								{ 	title: "High Technology Entrepreneurship",
									number: '2143423',
									description: "Becoming a new startup",
									year:,
									semester:
								},

								{ 	title: "Object-oriented Techniques",
									number: '2143412',
									description: "Techniques of Object-Oriented Analysis (OOA) and Design (OOD) covering managing complexity, using data 
											and procedural abstraction, encapsulation, hierarchies, and decomposition of problems into classes and objects. 
											The concepts introduced include overloading, multiple inheritance and polymorphism; the analysis, design and 
											implementation phases of software development, use case driven object-oriented development methodology, 
											and design patterns and Unified Modelling Language (UML).",
									year:,
									semester:
								},

								{ 	title: "Teletraffic Engineering and Network Optimization ",
									number: '2143408',
									description: "Teletraffic engineering overview; quality of service and network performance optimization; classification of 
											teletraffic engineering systems and traffic parameters; traffic data collection techniques and statistics; modeling 
											of non-queuing/loss-type system and queuing/delay-type system; modeling of system with mobile users; 
											fundamentals of network simulation; real-time network management and long-term network planning; 
											application of optimization techniques in network controls; case studies in network design.",
									year:,
									semester:
								},
								#Year4/2
								{ 	title: " Netcentric Architecture ",
									number: '2143401',
									description: "Principles of network applications, protocols, services (HTTP, FTP, SMTP, DNS, Peer-to-peer file sharing), 
											Web caching, Content distribution networks, Socket programming, Client-server model, Transport layer (TCP, 
											UDP), Reliable data transfer, Congestion control, Virtual circuit and datagram networks, The Internet Protocol 
											(IP), Routing in the Internet, Broadcast and multicast routing, Multimedia networking, Security in computer 
											networks, Network management.",
									year:,
									semester:
								},

								{ 	title: "System Integration",
									number: '2143406',
									description: "System Integration Definition; Communication Systems; Intelligent building Automation; Networking 
											Technology and Cabling System Management; Introduction to Communication System Design; Related 
											standards for Communication Systems Integration; Compatibility and Interoperability Analysis; Hardware vs. 
											Software Integration; Network Integration; Enterprise Application Integration; Management of Risk from 
											Integration; Interpersonal skills and Communications for System Engineer; Case Studies in System Integration.",
									year:,
									semester:
								},

								{ 	title: "Signal Transmission System ",
									number: '2143410',
									description: "Transmission lines, transmission line equations, transmission line analysis for sinusoidal waveforms, 
											transmission line analysis for pulse waveforms, basic of plane wave propagation in free space, basic of signal 
											transmission in optical fiber, signal dispersion in optical fiber, fundamental of antenna, basic antenna 
											parameters, design of transmission link, link budget.",
									year:,
									semester:
								},

								{ 	title: "System Security",
									number: '2143417',
									description: "Techniques for achieving security in multi-user computer systems and distributed computer systems. Topics: 
											physical security; discretionary and mandatory access control; biometrics; information-flow models of security; 
											covert channels; elementary cryptography; public-key cryptography; logic of authentication; electronic cash; 
											viruses; firewalls; electronic voting; risk assessment; secure web browsers.",
									year:,
									semester:
								},

								{ 	title: "Game Design and Development Process",
									number: '2143425',
									description: "",
									year:,
									semester:
								},

								{ 	title: "Computer Graphics",
									number: '2143424',
									description: "",
									year:,
									semester:
								},

								{ 	title: "Supply Chain Management",
									number: '2104441',
									description: "Definition of a supply chain; coordination difficulties; pitfalls and opportunities in supply chain management; 
											inventory/service tradeoffs; performance measurement and incentives; global supply chain management; mass 
											customization; supplier management; design and redesign of products and processes for supply chain 
											management; tools for analysis; industrial applications; current industry initiatives.",
									year:,
									semester:
								},

								{ 	title: "Principle of Wireless Communication",
									number: '2143409',
									description: "Introduction to design analysis and fundamental limits of wireless transmission systems. Wireless channel and 
											system models, multipath fading; equalization, channel coding and diversity; resource management and power 
											control; multiple antenna and MIMO systems; space-time codes and decoding algorithms; multiple-access 
											techniques and multiuser detection; cellular and ad-hoc network topologies; OFDM and ultrawideband systems; 
											Wireless LANs and MANs, cellular system standards. ",
									year:,
									semester:
								},

								{ 	title: " Data Warehousing ",
									number: '2143411',
									description: "Data warehouse design, Data Modeling, database design and database access",
									year:,
									semester:
								},
=end
							#Nano Course
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
=begin								#Year 2/2
								{ 	title: "Dynamics and Vibrations",
									number: '2141263',
									description: "",
									curriculum_id: ,
									semester:
								},

								{ 	title: "Electronic Devices I",
									number: '2141273',
									description: "",
									curriculum_id: ,
									semester:
								},

								{ 	title: "Electrical and Electronics Laboratory",
									number: '2141274'
									description: "",
									curriculum_id: ,
									semester:
								},

								{ 	title: "Biochemistry for NANO Engineers",
									number: '2310229',
									description: "",
									curriculum_id: ,
									semester:
								},

								{ 	title: "Statistic for Physical Science",
									number: '2603284',
									description: "",
									curriculum_id: ,
									semester:
								},
								#Year 3/1
								{ 	title: "Material Characterization",
									number: '2141303',
									description: "",
									curriculum_id: ,
									semester:
								},

								{ 	title: "Measurement and Instrumentation",
									number: '2141375',
									description: "",
									curriculum_id: ,
									semester:
								},

								{ 	title: "Micro and NanofabricationTechnology",
									number: '2141310',
									description: "",
									curriculum_id: ,
									semester:
								},

								{ 	title: "Quantum Mechanics for Engineers",
									number: '2141331',
									description: "",
									curriculum_id: ,
									semester:
								},

								{ 	title: "Nanopolymer Engineering",
									number: '2141341',
									description: "",
									curriculum_id: ,
									semester:
								},

								{ 	title: "Molecular Chemistry",
									number: '2141345',
									description: "",
									curriculum_id: ,
									semester:
								},

								{ 	title: "Reaction Engineering",
									number: '2141346',
									description: "",
									curriculum_id: ,
									semester:
								},

								{ 	title: "Fluid Mechanics for International Engineers",
									number: '2141365',
									description: "",
									curriculum_id: ,
									semester:
								},
								#Year 3/2
								{ 	title: "Transport Phenomena",
									number: '2141366',
									description: "",
									curriculum_id: ,
									semester:
								},

								{ 	title: "Statistical Thermodynamics",
									number: '2141368',
									description: "",
									curriculum_id: ,
									semester:
								},

								{ 	title: "Control Engineering ",
									number: '2141376',
									description: "",
									curriculum_id: ,
									semester:
								},
								#Year 4/1
								{ 	title: "IT for Communications",
									number: '2141481',
									description: "",
									curriculum_id: ,
									semester:
								},

								{ 	title: "Nano Seminar",
									number: '2141490',
									description: "",
									curriculum_id: ,
									semester:
								},

								{ 	title: "Research Methodology",
									number: '2141491',
									description: "",
									curriculum_id: ,
									semester:
								},

								{ 	title: "Electronic Device II",
									number: '2141473',
									description: "",
									curriculum_id: ,
									semester:
								},

								{ 	title: "Introduction to VLSI Technolgy",
									number: '2141475',
									description: "",
									curriculum_id: ,
									semester:
								},

								{ 	title: "Effective Problem Solving for Industry",
									number: '2141513',
									description: "",
									curriculum_id: ,
									semester:
								},

								{ 	title: "Nanomaterial Synthesis by Aerosol Process",
									number: '2141553',
									description: "",
									curriculum_id: ,
									semester:
								},

								{ 	title: "Cell and Molecular Biology",
									number: '2141591',
									description: "",
									curriculum_id: ,
									semester:
								},

								{ 	title: "Microbionanotechnology",
									number: '2141511',
									description: "",
									curriculum_id: ,
									semester:
								},

								{ 	title: "Microbionanotechnology",
									number: '2141551',
									description: "",
									curriculum_id: ,
									semester:
								},

								{ 	title: "Nanoelectronics",
									number: '2141417',
									description: "",
									curriculum_id: ,
									semester:
								},
								#Year 4/2
=end
							#Aero
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
									number: '2603284',
									description: "Fundamental knowledge in Probability; Permutation and combination, central tendency; measurement of 
											variability; hypothesis testing; application of computer in linear regression calculation; validity of regression 
											using t-test; comparison between different regression models; use of software for analysis of experimental data in 
											engineering.",
									year: 2,
									semester: 1
								},

								#Adme
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
								}

							])


	Curriculums = Curriculum.create ([ 
										
										{ 	id: 1 ,
											name: "Information and Communication",
											abbreviation: "ICE",
											faculty_id: 1,
											:courses => Course.where(:number=>['2140201',
																				'2140202',
																				'2143201',
																				'2143203',
																				'2143310',
																				'2190101',
																				'2190151',
																				'2301107',
																				'2302103',
																				'2302105',
																				'2304153',
																				'2304193',
																				'5501112',
																				'5500222'
																				])
									},

										{ 	id: 2 ,
											name: "Automotive Design and Manufacturing",
											abbreviation: "ADME",
											faculty_id: 1,  
											:courses => Course.where(:number=>['2142211',
																				'2142241',
																				'2142261',
																				'2301312',
																				'2304154',
																				'2304194'])
										},

										{ 	id: 3 ,
											name: "Aerospace",
											abbreviation: "AERO",
											faculty_id: 1,
											:courses => Course.where(:number=>['2145201',
																				'2145211',
																				'2145212',
																				'2301201',
																				'2603284'])

										},

										{ 	id: 4 ,
											name: "Nano",
											abbreviation: "NANO",
											faculty_id: 1 ,
											:courses => Course.where(:number=>[ '2141201',
																				'2141223',
																				'2141261',
																				'2141270',
																				'2302203',
																				'2302231'])										
										}

									])

	Faculties = Faculty.create 	([

									{ 	id: 1,
										name: "Faculty of Engineering",
										abbreviation: "ISE"
									},

									{ 	id: 2,
										name: "Faculty of Commerce and Accountancy",
										abbreviation: "BBA"
									},

									{ 	id: 3,
										name: "Faculty of Economics",
										abbreviation: "EBA"
									},

									{ 	id: 4,
										name: "Faculty of Science",
										abbreviation: "BSAC"
									},

									{ 	id: 5,
										name: "Faculty of Arts",
										abbreviation: "BALAC"
									},

									{ 	id: 6,
										name: "Faculty of Psychology",
										abbreviation: "JIPP"
									},

									{ 	id: 7,
										name: "Faculty of Architecture",
										abbreviation: "INDA"
									},

									{ 	id: 8,
										name: "Faculty of Communication Arts",
										abbreviation: "COMARTS"
									}				

								])
	Users = User.create ([
		{
			id: 1,
			name: "Fiam"
		},
		{
			id: 2,
			name: "Poon"
		},
		{
			id: 4,
			name: "Knights"
		}
		])
	Comments = Comment.create([
		{ 
			content: "This course is so so easy",
			user_id: 1,
			course_id: 1
		},
		{ 
			content: "This course is ironically hard",
			user_id: 2,
			course_id: 1

		},

		{ 
			content: "Test Time Stamp",
			user_id: 4,
			course_id: 2

		}
	])

	Likes = Like.create([
		{
			user_id: 1,
			comment_id: 1
		}

		])

	Dislikes = Dislike.create([
		{
			user_id:2,
			comment_id:2
		}

		])
	Professors = Professor.create([
		{
			name: "Sivabudj",
			last_name: "Umpudh"
		}
		])

	Teaches = Teach.create([
		{
			year: 2012,
			professor_id: 1,
			course_id: 1
		},
		{
			year: 2013,
			professor_id: 1,
			course_id: 1
		}
		
		])	
