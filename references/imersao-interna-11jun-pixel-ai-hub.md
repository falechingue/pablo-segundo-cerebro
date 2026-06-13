# Imersão Interna — Pixel AI Hub

**Data:** 11 de junho de 2026
**Com:** Bruno Okamoto (Pixel Educação)
**Tema:** A estação de trabalho de IA do Bruno — setup com dois LLMs, Segundo Cérebro no GitHub, governança de agentes, custos e casos de uso.

> Transcrição completa da imersão, liberada pra você jogar no seu próprio **agente / LLM** e extrair o que quiser — criar skills de governança, montar seu Segundo Cérebro, planejar sua estação de trabalho, etc.
> Dica: cole este arquivo no seu agente e peça, por exemplo: *"use esta transcrição do Bruno como base para eu criar minhas skills de governança / meu Segundo Cérebro"*.

---

## Resumo rápido

**Propósito:** compartilhar a configuração avançada da estação de trabalho de IA do Bruno e responder às perguntas da comunidade.

**Principais conclusões**

- **Configuração da estação:** dois LLMs — **Opus 4.8 + Fable 5** (família Mythos), no Claude Code, para trabalho profundo; e **Hermes (com GPT-5.5)** para o dia a dia. As skills **Cérebro** e **Salve** ligam um Segundo Cérebro baseado no GitHub.
- **Colaboração em equipe:** modelo híbrido — estações individuais para deep work + agentes especializados no Telegram. Tudo alimenta o cérebro central da empresa.
- **Governança de agentes:** um agente de governança (**Leonardo da Vinci**) audita todos os outros diariamente quanto a desempenho, segurança e sincronização de memória. Uma rotina mensal no Claude Code audita o próprio agente de governança.
- **Resolução de problemas:** construa primeiro um sistema que funciona, otimize depois. Use arquivos `map.md` para contexto explícito e ferramentas como **Gbrain** para busca semântica. Para custos altos, investigue uso de API e migre para assinatura (OAuth) + fallback mais barato (OpenRouter).

**Próximos passos (do Bruno):** gravar e lançar o novo módulo "Segundo Cérebro" com o template compartilhado; agendar a imersão "Marketing OS" para o próximo mês.

---

## Transcrição completa

**Bruno Okamoto:** É uma noção aqui da onde que eu vou a nível de profundidade técnica ou não. Então eu acho que vai ser legal só eu fazer uma pesquisinha rápida aqui no chat aqui. Deixa eu só abrir a parte de pesquisa aqui, vou colocar aqui no chat para vocês, tá? Multiple choice. Você já montou um segundo cérebro, alguém quer fazer alguma pergunta? Sim, não, não sei o que é isso. Apareceu aí no chat, gente? A pesquisa? Não sei se apareceu ou não. Ainda não. Ué, que porcaria. Ah, submito, ué, que estranho, mano. Como que eu mando pra vocês isso aqui? Ah, acho que foi. Vê aí se deu boa. Vocês receberam um convite pra votar aí numa ferramenta. Carregou aí, gente? Não? Caiu? Ainda não. Bom, então vamos pular.

**Atílio Macoggi:** Carregou, carregou o negócio. Agora chegou.

**Bruno Okamoto:** Porra, então tá, então vamos fazer. Ah, mas tudo bem, pode ser só quem tá no desktop, tá, gente? Não tem problema se você tá no mobile e tal, é só pra eu ter uma noção mesmo aqui, uma amostragem de volumetria aqui de dados. Tá bom. Beleza. Pois é, mano. Próxima vez eu vou me preparar melhor pra isso aí, tá? Bom, é isso, gente. Então, como não tá funcionando direito aí, vamos fazer o seguinte, só levanta a mão pra mim, só pra eu ter uma noção aqui, quem já tem um segundo cérebro? Só levanta a mãozinha aqui, comenta no chat, só pra eu ter uma noção. Levanta a mão que pra mim é mais fácil de contar aqui, tá? Eu sei que muita gente tá apertando de confusão aí. Até agora a gente tem aí uns 5, 10, 14, 14 pessoas de 104, mais alguém, gente? Eu vou considerar que todos esses joinhas voando aí é vocês tentando levantar a mão por acidente, tá? Legal, legal. Tá, 20 pessoas. Ah, então deve ser uma média de uns 30% aqui da sala.

*[Bruno inicia compartilhamento de tela]*

**Bruno Okamoto:** Aham, deve ser umas 20, 30%. Boa. Então tá, gente, bora pra mão na massa. Eu quero passar pra vocês um pouco de como eu tô usando a minha estrutura aqui de conteúdo hoje. Então eu fiz aqui um esboço bem básico pra explicar pra vocês um pouco do que é a minha dinâmica, o que eu tô fazendo, como a gente tá fazendo, que ferramentas eu tô usando. Quem tá pelo celular, infelizmente eu vou mostrar muita coisa, vou tentar narrar, mas a ideia é eu mostrar um pouco pra vocês de como é a minha estrutura completa aqui. A minha expectativa é passar isso em uma hora, no máximo, e eu gostaria que vocês fossem fazendo perguntas ao longo da conversa.

*[Action item: compartilhar gravação + transcrição + documento explicativo com os participantes]*

**Bruno Okamoto:** Então vão perguntando pra mim o que vocês ficaram com dúvida, eu vou em paralelo tentando ler aqui. Essa live vai ficar gravada, gente, podem ficar em paz. Tudo que eu fizer aqui no Hub vai ficar gravado, e eu não só vou gravar, como eu vou pegar a transcrição, vou fazer um material bonitinho, explicativo, e vou mandar pra vocês todo o material mastigado. Então é só mordomia aqui, galera.

Primeiro, a estrutura que eu uso hoje trabalha com o Claude Code, e eu trabalho atualmente com o Hermes e o Open Cloud. Esse setup que eu tô usando só funciona se você tá usando o Claude Code. E quando a gente pensa em Claude Code, hoje a minha estrutura de custo: eu tô gastando em média de R$550 no Claude Code, mas por causa desse carinha aqui chamado Fable, eu tive que fazer um upgrade de mil reais. Então tá caro usar Anthropic, e a tendência é só piorar, então não se preocupem. E a gente tem aqui os R$550 do ChatGPT, que eu tô usando atualmente no Hermes. A VPS tem um custo irrisório, né? Uns R$40 por mês. E o segundo cérebro acaba não tendo custo. Só que como hoje eu tenho aqui na VPS da Hostinger cerca de 8 a 10 agentes, eu tô usando umas 5 ou 6 VPS. Então começa a pesar a conta, mas mesmo assim dá uns R$300 por mês. Então hoje essa minha estrutura de IA, como empreendedor, eu diria que tô gastando em média de uns R$1.800 a R$2.000 por mês na minha estrutura, meu Workstation, contando com APIs e créditos de outras coisas.

Pra dar contexto sobre Claude Code: tudo isso que eu vou falar pra vocês funciona também no Gemini, funciona em outras LLMs. Se você usa o Minimax ou outras ferramentas, isso aqui vai funcionar também. A grande mensagem aqui é muito mais sobre **orquestração** do que sobre funcionalidade. Então abstrai o que você vê como funcionalidade e foca mais na lógica de uso das coisas.

Sobre o **Fable 5** que saiu: o Fable 5 é o MVP do Mythos 5 que eles lançaram. Quando a gente fala de agentic coding, significa que o agente consegue usar o terminal. O Mythos tá dando um salto de 58% pra 80% no coding (Mythos 5). A nível de modelo agêntico — que no final do dia a gente usa um terminal — é um salto muito expressivo. Mas é óbvio que se a gente colocar o Mythos pra usar dentro do Open Claw, deve ser lindo de ver, uma obra de arte. Mas eu diria facilmente que você gasta tipo uns 80, 100 mil por mês, fácil. Então tem que ter um bom uso pra valer 100 mil por mês.

Sobre Knowledge Work (uso pro dia a dia — trabalho administrativo, de pensar, back-office): a gente tá vendo um salto de 1.750/1.769 pontos do ChatGPT para 1.900. É um salto grande, mas não tão grande quanto o Gemini, que tá com 1.300 pontos. O que significa isso pra nós? Que a Anthropic (Cloud) tá investindo muito em verticalização do uso do Mythos. Se você olhar o benchmark deles, vão ver categorias novas: saúde, cyber security, biology, legal. Então o Mythos e o Opus 4.8 começaram a olhar pra essas categorias específicas. Cada vez mais o Mythos vai se tornar especialista em verticais específicas. É um salto bacana, sem contar que a gente tá falando do Fable 5, que deve ser o MVP do Mythos ainda. A Anthropic e a OpenAI tão correndo pra fazer IPO agora, então nesse momento o ChatGPT deve tá correndo pra lançar o 6.0, 5.7. A Anthropic tá puxando a corrida, e isso força a concorrência (Gemini, GPT) a melhorar as IAs pra nós.

Como que eu tô usando o Fable na minha estrutura? Olhando o gráfico de custos: a linha verde é o Opus 4.8, e a linha laranja é o Fable 5. O Fable 5 no médium (pensamento médio) tem um pensamento muito próximo do X-High do 4.8. Quanto mais "burro" (entre aspas) ele fica, mais rápidas são as respostas; quanto mais inteligente, mais lento. No médio, você tá numa velocidade já relativamente inteligente, com pensamento muito parecido com o X-High do Opus 4.8. Quando entra no High e X-High muda drasticamente. O **High do Fable** é muito parecido com o **Max do Opus** — é o sweet spot pra mim. Quando eu quero economizar, uso o Max no 4.8 do Opus. Quando eu quero trabalhar no dia a dia, uso o High do Fable. Às vezes, pra um brainstorm muito específico, uso o X-High. Então uso principalmente High e X-High. Tentei usar o Max por um dia e estourei a sessão com dois prompts — esse Max é pesado.

Eu uso muito o Claude pra duas grandes questões: como superpoderes — orquestração de informações, PRDs, fundação, pautas mais profundas, o que a gente chama de **deep work**. Quando vou fazer um deep work pesado, sento e fico duas, três horas. E eu uso muito o **Dynamic Workflow** que lançaram no Opus 4.8. Dynamic Workflow é quando você lança centenas de agentes em paralelo pra executar algo específico. Consome muito token. O que ele faz: pega um prompt, quebra em várias pequenas tarefas, lança esse trabalho em vários subagentes rodando em paralelo. Todos olham o mesmo problema de ângulos independentes e tentam refutar o trabalho um do outro até chegarem num consenso. A lógica é muito louca — fazer os agentes meio que brigarem entre si pra chegar num consenso. Faltava isso na IA: poder brigar entre ela com as respostas dela pra te trazer uma coisa que faz sentido. Pra mim, esse é o meu uso principal do Claude hoje.

Costumo usar o Claude de duas formas: o Claude Desktop (Claude Code) e o Terminal. No Terminal, eu uso a funcionalidade chamada **Claude Agents** — com ela eu consigo manipular múltiplos agentes ao mesmo tempo. Quando quero trabalhar em até três pautas específicas, sento e trabalho nessas três. Eu poderia trabalhar em 10, mas cheguei à conclusão que cai muita qualidade da cognição quando a gente trabalha com mais de 3 sessões ao mesmo tempo. Então abro 3 sessões, coloco prioridade 1, 2, 3 e trabalho nas 3 integralmente. Quando quero trabalhar em múltiplas tarefas (ex: fazer um vídeo do YouTube), eu mando um agente ver vídeos de outros players falando sobre Hermes no YouTube, um agente olhar o X, um agente olhar meu WhatsApp pra ver o que falam sobre o Hermes no Pixel AI Hub, um agente montar um roteiro, um agente pensar em thumb. Cada texto que eu digito no Claude Agents abre uma nova sessão. Quando quero destrinchar uma pauta em várias tarefas, uso Claude Agents; quando quero trabalhar em até três tópicos profundamente, uso Claude Code na área de trabalho.

Como eu ligo minha estação de trabalho: pra trabalhar com meu Segundo Cérebro, eu tenho duas skills (o que a gente disponibiliza no Hub), chamadas **Salve** e **Cérebro**. As que estão no Hub têm outros nomes; essas eu adaptei pra minha rotina. Toda vez que venho trabalhar numa sessão, eu digito a skill **Cérebro**. Ela carrega uma categoria de arquivos que eu especifiquei como as coisas mais importantes pro Claude puxar pro contexto: pendências, deadlines, últimas decisões, em quais negócios eu estou atuando, o que minha equipe está fazendo, que projetos eu estou trabalhando. Tudo isso é o que eu ensino no curso: quando você monta o workspace dos agentes, você cria um arquivo `pendencias`, um `people`, um `deadlines`. Toda vez que o OpenClaw faz o memory flush (encerra a sessão), ele salva as informações dentro desses arquivos. Então a skill Cérebro carrega todas essas informações: pendências críticas, tarefas, e-mails, o que depende de mim que está travando, iniciativas em progresso, o que terceiros estão travando, decisões recentes, alertas. A partir daqui, tudo o que eu fizer vai pro cérebro do meu agente. Isso é o que a gente chama de **Workstation**. Todos os funcionários da Pixel Educação têm o seu próprio Workstation.

**niltonfilho:** O problema é a gente lembrar de ficar mandando ele salvar, porque às vezes você tá com pancada de assunto, vai falando, ele compacta e esquece tudo. E o meu objetivo maior era ele me ajudar a lembrar. Se eu tiver que lembrar ele de salvar, ele já para de cumprir a função. Eu já falei pra ele ir fazendo as coisas automaticamente, ele promete, e na hora que você vai ver, a VPS tá travada de tanta cron que ele criou automático.

**Bruno Okamoto:** Você tá falando do Claude ou do agente?

**niltonfilho:** Do agente. Eu não tenho Claude.

**Bruno Okamoto:** Ah, tá. Vamos em blocos, Nilton. Guarda essa pergunta — eu tava falando principalmente sobre estação de trabalho. Tudo isso que eu tô explicando não precisa necessariamente ser o Claude, pode ser outra ferramenta. Mas eu vou responder a sua pergunta, vou guardar ela na caixinha.

**Antonio Henrique:** Eu tenho uma que tem a ver com isso. Eu normalmente, quando eu tô no computador, ao invés de usar o Claude Code, eu fico no Telegram falando direto com o agente. Isso por acaso é ruim?

**Bruno Okamoto:** Não é ruim, cara. Eu faço muito isso também. Deixo muito o meu Telegram aberto e trabalho. Só que eu gosto de fazer trabalhos específicos usando o Claude. Pra Amora, por exemplo, eu deixo o thinking dela menor pra responder mais rápido, e faço trabalhos mais cotidianos: contexto, mexer numa skill, lembrar, puxar um report, fazer uma análise. Quando eu quero fazer um trabalho mais pesado (tipo reorganizar toda a estrutura do Pixel AI Hub), eu prefiro fazer no Claude. É muito mais uma preferência de LLM do que de ser agente. Mas eu uso muito a Amora.

**Antonio Henrique:** Entendi, mas se eu puder fazer isso e pagar token pra usar via agente, você acha que daria o mesmo resultado?

**Bruno Okamoto:** Daria o mesmo resultado. Acho que você não precisa ter as duas assinaturas; é só um charme ter duas.

**Antonio Henrique:** A minha luta é que o agente tá levando a vida pra responder, mas depois a gente fala disso.

**Bruno Okamoto:** Se ele demora muito é contexto cheio, ou você tá usando o effort alto. Se você mudar o effort dele pro normal, ele tende a melhorar. Mas a gente conversa depois.

**Maurício Denari:** Bruno, o uso do Claude: você pode fazer um planejamento, um estudo, e o resultado já poder subir pra memória? Porque hoje basicamente você tem que ficar copiando o conteúdo, jogando pra um ponto MD, acumulando isso. Hoje você tem alguma ligação dessa interface com as memórias?

**Bruno Okamoto:** 100%. O cérebro carrega o meu Second Brain. E a skill **Salve** é a skill que, quando eu termino uma sessão, eu rodo e ela categoriza tudo: injeta o contexto dentro de todas as categorias (pendências, etc.). Quando eu trabalho numa sessão do Claude, ao terminar ele fala "criei uma pendência nova pro Bruno", "o Bruno criou um novo projeto que tem uma deadline", "o Bruno falou do Pedro aqui, preciso colocar o Pedro". O Claude cria uma organização que o meu agente usa, e tudo que tá nesses arquivos são meus arquivos principais de gestão da minha vida. Não preciso usar o segundo cérebro pra saber qual projeto eu tava trabalhando ontem; deixo as coisas mais críticas nesses arquivos. O meu agente e o Claude sabem exatamente com quem eu falei, o que está pendente.

**Maurício Denari:** É uma armazenagem local, então?

**Bruno Okamoto:** Não, tudo pro GitHub. É exatamente o que eu ensino no curso: nas primeiras aulas eu falo de duas coisas importantes — o GitHub e o Workspace. O Workspace é onde eu ensino vocês a criar essas categorias. O GitHub é onde eu ensino vocês a criar esse backup — um faz backup, o outro organiza a estrutura, que vira o seu Second Brain. Quando eu dou o Salve no Claude, ele salva tudo dentro desse Second Brain. Durante o trabalho do Claude, fica local; quando você roda o Salve, vai pingar no Second Brain. Eu tenho dois Second Brains: o meu pessoal e o da minha empresa. Tô tentando não ser muito técnico aqui, mas se eu for, podem me fazer perguntas.

**Bruno Branco:** Você falou que todo colaborador da Pixel tem uma estação de trabalho. O que é esse conceito de estação de trabalho?

**Bruno Okamoto:** Estação de trabalho, pra mim, são alguns pilares. Se você chega na empresa e fala "quero que todo mundo use o Claude a partir de amanhã", cada funcionário vai usar de um jeito, e quando fecha o computador aquele contexto fica só localmente. Os pilares: (1) todos os funcionários usam Claude no computador; (2) todos estão linkados no Segundo Cérebro da empresa; (3) todos têm as skills de Salve e Cérebro; (4) todo mundo tem os mesmos conhecimentos — aqui na empresa, toda semana a gente tem uma hora pra ensinar a galera a usar IA, do estagiário ao diretor. Esses pilares juntos a gente chama de Workstation.

**Bruno Branco:** Entendi, obrigado por esclarecer.

**Antonio Henrique:** Tem tudo a ver com o que ele falou. Eu tô fazendo uma coisa parecida, só que tenho 46 pessoas no time, liberei pra 10%, e tô botando todo mundo rodando via Telegram, com vários agentes organizados por área. Porque, sendo uma escola, eu não acho que o time tenha conhecimento técnico básico pra usar via Claude.

**Bruno Okamoto:** Super concordo. Aqui é a mesma coisa. Mesmo com o arquivo padrão e os treinamentos, nem todo mundo consegue usar Claude de forma coerente. A gente também tem o nosso Telegram da empresa, com relatórios, operações, marketing, conteúdo. A nossa equipe inteira usa os nossos agentes ali. A gente tem um agente de conteúdo, o **Dexter** — ele fica o dia inteiro mapeando coisas na internet, gera pautas e vai criando um sistema de score (funil), de trending até ideas e hot ideas. A Beatriz, minha social media, pega uma pauta dali pra fazer brainstorming. Ela tem um tópico no Telegram chamado "Dexter Beatriz" e fica falando com ele por ali. Toda a minha equipe usa pontualmente os agentes pra coisas específicas — é o modelo que funciona melhor. A gente tem um agente pra marketing, um pra operação, e cada um fica num tópico com função específica. O Telegram funciona muito bem pra equipe.

**Antonio Henrique:** Igualzinho ao que eu tô fazendo. Estão todos eles rodando na mesma VPS, cada um com uma "roupa" diferente do BotFather. É do mesmo jeito que você faz? Ou botou em VPS diferentes pra não dar delay? E tudo na mesma assinatura?

**Bruno Okamoto:** Meio que na mesma VPS. Às vezes é o mesmo agente, só que eu crio um perfil diferente — no Hermes dá pra criar múltiplos perfis. Então crio três perfis diferentes, mas é o mesmo agente. Depende do uso: se é um agente pouco usado (tipo só de relatório), eu não vou criar uma VPS só pra ele.

**Antonio Henrique:** A minha luta tem a ver com isso: como tem muita gente usando, ele tá ficando pesado demais e não é contexto.

**Bruno Okamoto:** Se tá pesado demais, você tem que **fatiar** ele. Essa é a minha linha de corte: quando o agente começa a ficar pesado com muita gente usando, fatia. Se você tem um agente pra marketing, operação, vendas, CRM, RP, financeiro e ele começou a ficar lento, fatia (administrativo e marketing em dois, etc.).

**Antonio Henrique:** A minha questão é dele ficar lento. Não são os agentes que a equipe usa — esses respondem rápido. Por organização, eu uso um agente main que roda absolutamente tudo. Esse agente main é que tá lento pra cacete. Tá tudo na mesma VPS, cada um com o seu arroba.

**Bruno Okamoto:** Entendi. Eu precisaria entender melhor, mas não vou atrapalhar agora, depois a gente vê.

**Antonio Henrique:** Isso não é pauta pra agora. Vamos embora, valeu.

**Rodrigo Baggio:** Bruno, eu já uso algo parecido com a tua skill de Salve dentro do Claude Code. Mas eu tenho usado muito Claude Code por causa de código mesmo (produto). Hoje meu segundo cérebro eu cheguei a criar, mas não criei meu agente, porque preciso que um app interno fique pronto antes, que é por onde ele vai atuar. Minha dúvida: como eu tenho vários projetos de software por fora, eu deveria também colocar todos esses projetos pra que o meu Claude Code atualizasse o meu segundo cérebro? Porque meus projetos estão cada um no seu repositório do GitHub.

**Bruno Okamoto:** Não necessariamente. O que você pode fazer — e é o que eu faço aqui e funciona super bem — é criar um **mapa**. Toda vez que iniciar uma sessão no Claude, dentro da skill Cérebro, faça ele carregar um documento chamado `mapa.md`.

*[Action item: instalar o GitHub CLI no Claude Code + agente; conectar aos repositórios]*

**Bruno Okamoto:** Esse mapa aponta pra toda a sua estrutura: "aqui estão minhas skills, meus projetos, meu conteúdo, minha empresa, minha vida pessoal". E você instala o **GitHub CLI**, tanto dentro do Claude como dentro do seu agente, e aí ambos podem acessar todos os projetos. Se quer trabalhar em algo específico, pode estar no Claude no computador, aí saiu e quer continuar on the go no Telegram (entrou num Uber, pega um áudio e continua): "a gente parou aqui fazendo isso, quero que você continue revisando as PRs". E eu vou te falar: o Codex pra código, na minha visão, tem funcionado melhor que o Claude. A maioria dos apps que eu tenho feito, eu uso a Amora, ou o **Replit**. Agora tô montando um app 100% no Replit — acho o design do Replit maravilhoso e o preço bom.

**Rodrigo Baggio:** Então é só resolver a questão do mapa em cada projeto e o Claude Code atualizar esse mapa dentro do meu segundo cérebro? Eu tenho um mapa de cada projeto lá dentro e ele atualiza?

**Bruno Okamoto:** É uma forma. É tudo sobre criatividade — quanto mais criativo você for, melhor performa sua IA. Eu tenho um mapa que toda vez que meu agente acorda e o Claude vai trabalhar, ele carrega. O mapa mostra onde estão todas as pastas e o que tem dentro de cada uma. Tem duas formas: ou você cria um mapa + um índex (tipo um `Projects.md`, que eu tenho aqui), e obriga seu agente e o Claude, toda vez que finalizar uma sessão (skill Salve), a atualizar o `Projects.md` independente do projeto. Assim você sempre tem um mapa e o agente sabe o status de cada projeto. Outra forma: põe tudo dentro do mapa, com cada projeto e a descrição do estágio. Ou cria um arquivo `pendencias` por projeto. É muito sobre o modelo que você quiser. O mais importante: na era da IA, a coisa mais importante é sempre **contexto**. Quanto mais contexto, melhor. Se tá tudo fatiado em 30 lugares, sem problema, mas o seu agente precisa saber disso. Cria um mapa, aponta pra onde tá tudo, explica o que tem em cada lugar.

**Rodrigo Baggio:** Show, valeu.

**Erick Velez:** Minha dúvida: eu tô meio com hiperfoco nessa questão do segundo cérebro, mas com dificuldade de estruturar, porque tenho algumas frentes — meu trabalho do dia a dia ("CLT") e dois projetos pessoais da minha empresa. Como segmentar? Qual deve ser minha preocupação com o tamanho do contexto que ele pode gerar? Vai atrapalhar se eu colocar tudo concentrado numa coisa só com várias pastas? Não vai chegar uma hora que aquilo vai ficar grande demais e caro?

**Bruno Okamoto:** Se vai ficar mais caro e complexo? Não, isso é totalmente contornável. Se você instalar o **Gbrain**, por exemplo, ou qualquer sistema de memória de embeddings/retrieval, ele faz pesquisas como se fosse o Google. Não é que ele vai ler tudo. Se você tiver um contexto de um milhão de linhas, ele não lê um milhão de linhas; ele procura a palavra-chave que você tá pesquisando, como num banco de dados. O Gbrain resolve esse problema. O **Hermes** também tem quatro camadas de pesquisa — funciona muito bem pra contextos grandes. Pra você ter uma ideia, eu tô com 17 arquivos de Markdown — 17 megas. São cinco meses usando todo dia o meu agente, mapeando tudo: WhatsApp, transcrição de reunião, e-mails, calendário, tudo que passa na minha vida online cai no meu segundo cérebro.

**Erick Velez:** São quatro bíblias aí. Mas carrega tudo isso quando você chama o `/cérebro`?

**Bruno Okamoto:** Não, ele não carrega tudo. É por isso que eu tenho esses arquivos categorizados. Quando eu chamo o `/cérebro`, ele carrega só as categorias principais.

**Erick Velez:** Eu tava querendo ir pro Hermes exatamente por causa dessa camada de otimização. Meu receio era criar um void absurdo de ideias e perder a funcionalidade. Como é a estrutura do Hermes? Porque o Hermes, por padrão, tem toda aquela otimização que você fez na mão quando definiu a estrutura do workspace. Isso conflita?

**Bruno Okamoto:** Não conflita. Independente da forma como a gente trabalha, você pode forçar ele a trabalhar do jeito que quiser. Você pode fatiar a memória do agente de várias formas: pastas por empresa, por profissão, casa, CLT. Pode quebrar múltiplos GitHubs (GitHub CLT, GitHub pessoal). Tanto faz se vai ser um grande blocão ou vários bloquinhos. Todos os agentes vão ter o mesmo padrão de memória. Se você pega o OpenClaw e instala o **Roncho** e o **Gbrain**, você resolve o problema de memória do OpenClaw. Se instala dentro do Hermes, dá uma camada a mais de memória. Mas é muito pouco provável você conseguir lotar o contexto do seu agente a ponto de ficar pesado demais — a não ser que você seja uma empresa gerando muito markdown todo dia (muito ticket, suporte). O seu agente já gera daily notes. A Amora tem cinco meses de vida; todos os dias gerou uma daily note, tem centenas. Quando peço pra ela lembrar de algo de dois meses atrás, ela lembra exatamente. Funciona muito bem. Eu só me preocuparia com isso lá na frente — acho que você tá fazendo over engineering da sua preocupação. O nosso problema é que mexer em agentes é muito gostoso, e a gente quer só a nata, o melhor do top. Só que o melhor do top é impossível, porque todo dia sai coisa melhor (skill nova, repositório novo, ferramenta nova). A conclusão que eu cheguei: monta uma parada que funciona e te atende, fica nisso e segue em frente. Depois que montou seu agente e seu segundo cérebro, qual é o próximo passo? Esquece o cérebro, vai implementar o agente pra automatizar sua rotina.

*[Action item: migrar pro Hermes; instalar Roncho + Gbrain; testar memória]*

**Bruno Okamoto:** Eu fiquei semanas bitolado nesse negócio de Second Brain — mapa, hot, projects — pra deixar perfeito pra gravar o curso. E cheguei à conclusão que não foi o Pareto, não mudou tanto a linha. Eric, faz o básico: monta o repositório, migra pro Hermes, instala o Roncho, testa e segue em frente. Se um dia tiver um problema de contexto, você volta e arruma — já mais experiente.

**Erick Velez:** Complementando: os seus funcionários que usam Workspace, cada um tem um cérebro próprio ou todos compartilham o único da empresa?

**Bruno Okamoto:** Eu tenho o meu cérebro pessoal (da Amora) e a gente tem o cérebro da empresa. Tudo que a nossa equipe faz nos agentes do Telegram cai no segundo cérebro da empresa. Todos os meus sócios e eu, quando trabalhamos no Claude ou nos agentes, rodamos o **Salve**. O Salve faz a propagação semântica: atualiza pendências, decisões, pessoas, projetos, métricas, skills e mapas, e faz um push pro cérebro da empresa. Toda vez que eu trabalho no meu computador, eu atualizo a Amora e a empresa — porque eu sou o dono, 99,9% do que faço no computador é trabalho. Mas nem tudo que eu faço na Amora vai pro Second Brain da empresa (tipo planejar minha viagem em julho). Quando quero salvar algo específico, falo "Amora, salva no Second Brain da Pixel". Computador: 100% pessoal e empresa. Amora: salvo on-demand pra empresa.

**@EslonAguiar:** *(adiado — Claudio na frente)*

**Erick Velez / Bruno:** *(continuação sobre memória)*

**Claudio Pereira:** *(áudio com problema, pergunta pelo chat)*

**@EslonAguiar:** Quando eu entrei na Pixel, eu já tinha um segundo cérebro configurado que eu mesmo fiz. A tua metodologia funciona melhor que a minha, mas a minha já está bastante alimentada. E eu não uso via GitHub — tá no Google Drive. Tenho o Claude no computador local, tudo puxa de uma pasta "offline" no Google Drive, e tenho na VPS com o agente Open Cloud, sincronizando a cada 1-3 minutos. O que você aconselha? Quero mudar pra forma como você trabalha.

**Bruno Okamoto:** Vamos fatiar. Primeiro: eu estou regravando toda a trilha do Pixel AI Hub e vou lançar uma nova aula só de Second Brain, com esse template (pendências, people, hot, projects). Eu recomendaria você esperar eu regravar essa aula, pegar o template e pedir pro seu Claude montar um **PRD** de transferência de segundo cérebro + limpeza. Aproveitaria pra fazer uma higienização, jogar conteúdo velho fora.

*[Action item: criar mapa no GitHub apontando pros arquivos do Drive; PRD de migração; limpar o Drive]*

**@EslonAguiar:** Não sei o que é PRD.

**Bruno Okamoto:** PRD é Product Requirement Document — um documento. Eu uso pra qualquer coisa que envolva planejamento. E por que eu não recomendo o Google Drive? Porque o Drive foi feito pra humanos, não pra agentes. Toda vez que o agente trabalha com o Drive, a dinâmica é mal menos. Minha esposa usa o Drive no agente dela. A minha recomendação: faça tudo no GitHub a nível de contexto/arquivo de texto. O que não for contexto, o que for arquivo, você cria um mapa no GitHub apontando pros arquivos do Google Drive ("aqui tá a pasta X, aqui minhas finanças"). Assim seu agente sempre vai saber. Depois você decide se libera acesso ao Drive. Mas eu jogaria tudo no GitHub.

**Bruno Okamoto:** Sobre o novo curso: vou ficar aqui até as nove nessa imersão. Quando terminar, quem quiser fica comigo e eu repasso toda a trilha de conteúdo nova que estou montando, e adoraria feedbacks.

**Atílio Macoggi:** Brunão, tenho três perguntas. A primeira: hoje eu toco três frentes (quatro com a pessoal). Como que eu construo? Teria que construir quatro cérebros pra dividir essas frentes? Hoje eu sigo o modelo que você passou — tenho a categoria de projetos e cada frente é um projeto.

**Bruno Okamoto:** Mas por que você mudaria isso?

**Atílio Macoggi:** Exatamente, essa é a minha dúvida.

**Bruno Okamoto:** Essa é a resposta que eu não sei. Ontem eu destrinchei aquela trilha do segundo cérebro e não cheguei a uma conclusão se mudo ou não. O conselho que dei pro outro rapaz: segue em frente, seu segundo cérebro já tá funcionando. A grande estrutura do segundo cérebro é um lugar onde você põe todo o contexto de todos os seus negócios (e pessoais, se quiser), e toda vez que transacionar entre ferramentas (Hermes, OpenClaw, Claude, Gemini, Higgsfield, Canvas), você leva todo o contexto, e qualquer ferramenta, ao ligar o segundo cérebro, navega na sua estrutura. Se você já tem um que funciona, não tem motivo pra mudar.

**Atílio Macoggi:** Na verdade, hoje eu só uso OpenClaw, porque nem o Claude eu sei usar. É o objetivo de eu estar aqui hoje, aprender a conectar.

**Bruno Okamoto:** Não precisa. Esse conselho eu dou pros meus amigos que não entendem nada de IA: escolhe uma IA e fica com ela. Funciona super bem. É um certo preciosismo ficar pulando de ferramenta — quem faz isso é a galera mais nerdona, que gosta de testar (Claude, Higgsfield, Gemini). Mas no final do dia, se tá te levando aonde precisa e você tá feliz, não tem motivo pra gastar mais dinheiro com outras ferramentas.

**Atílio Macoggi:** Segunda pergunta: o Gbrain. Numa aula você fala do Gbrain. Na mentoria semana passada perguntei pro Guilherme; ele falou "instala tudo". Mas quando eu vou jogar o Gbrain pro meu agente, ele apita de tudo jeito ("não instala, isso é perigoso"). Não sei se coloco ou não, se vale o risco. Fiz uma atualização do Open Claw semana retrasada e deu muito errado; as últimas duas rodaram lindo. Não sei se atualizo pro Gbrain ou só o que ele fala que devo puxar.

**Bruno Okamoto:** Nunca fatie um software, só fatie skills. O Gbrain é uma composição muito maior, múltiplas ferramentas; se você fatiar, perde a estrutura. Seu agente é VPS ou Managed?

**Atílio Macoggi:** VPS.

**Bruno Okamoto:** Então deixa eu te dar uma dica. Quando acessar sua VPS na Hostinger, vai no canto inferior esquerdo, tem um "API". O principal que ele apita é que vai conflitar com o sistema de governança e auditoria (tem uma pancada de cron rodando pra manter o workspace organizado). Cara, eu não instalaria nada que possa quebrar alguma coisa sua, isso é um fato. Mas: você pega a chave API da sua VPS, cria um novo token de API do seu agente, joga pro OpenClaw e pede pra ele **tirar um snapshot uma vez por dia e deletar o do dia anterior**. Tira uma foto, deleta o do dia anterior. Isso é a mesma coisa que a Hostinger te vende por R$30/mês de backup.

*[Action item: criar token de API da VPS na Hostinger; configurar snapshot diário + deletar backup do dia anterior]*

**Atílio Macoggi:** Eu já faço isso, toda atualização eu faço.

**Bruno Okamoto:** Então manda bala no Gbrain, velho. Se quebrar tudo, você tem um backup do dia anterior. Você já devia ter me dito isso, eu te poupava 10 minutos.

**Atílio Macoggi:** A próxima: eu segui o modelo de arquivo seu (hot, pendência), mas o meu não rodou belezinha, não alimentou. Eu não conseguia saber se o arquivo tava atualizado, tinha que ficar pedindo. Pra ter mais controle, eu conectei ele com o Todoist (meu programa de tarefa). Mas com a integração ele fica um pouco lento. Tem alguma forma de agilizar essas conexões via API?

**Bruno Okamoto:** Primeiro, por que não tá funcionando direito: esse arquivo não é atualizado em tempo real, nunca. O que a Amora faz? Todos os dias ela lê as memórias do dia que o agente gerou e, a partir delas, categoriza pendências, deadlines, etc. Não é na sessão, não é um Chrome rodando a cada cinco minutos. Você trabalha o dia inteiro, e no final do dia a Amora roda um cron que pega tudo que aconteceu no Claude e no agente (vira Daily Note). Ela lê o Daily Note e categoriza: pendências, pessoas, projetos, hot. A skill Salve também já joga o que é "hot". Não fica tentando pegar a chuva caindo com peneira; espera cair tudo, passa um copinho e pega. Faz a logística reversa.

*[Action item: instalar Gbrain + Roncho na VPS; testar memória]*

**Atílio Macoggi:** Entendi. Boa.

**Bruno Okamoto:** Pode instalar o Gbrain. Só faz um snapshot, pede pro agente tirar uma foto da VPS agora, e manda bala. Se der merda, volta.

**Atílio Macoggi:** Só põe o Gbrain e o Roncho, então?

**Bruno Okamoto:** São propostas diferentes, então eu colocaria os dois.

**Claudio Pereira:** Bruno, você tá me ouvindo agora? Quando você falou do exemplo de fatiar o agente — quando você fatia, como você gerencia essa centralização pra um contexto superior do que foi tratado naquele agente? Você tem um agente de relatório, um de saque, um de atendimento interno, externo, suporte a vendas. Como você consolida esse conhecimento gerado em cada conversa?

**Bruno Okamoto:** Boa, eu estou pondo isso na nova aula. Toda essa estrutura aqui são só dois agentes meus: a **Amora** e o **Dexter**. Eu tenho tipo oito ou nove agentes. Como administrar nove agentes? É só você criar uma **estrutura de governança**. A gente tem um agente chamado **Leonardo da Vinci** (o Léo). O Léo, todos os dias, analisa todos os agentes e todas as tarefas. Ele chega no segundo cérebro da empresa, onde caem os trabalhos da equipe (Mora, Bia, Bruno, Caio), olha o trabalho de todo mundo e classifica: "isso aqui é dado sensível", "isso não pode ir pro segundo cérebro", "vazou uma chave token aqui", "esse agente, o cron quebrou (devia rodar às 12h e não rodou)", "a Mora, o backup dela falhou". Então todo dia a gente tem esse agente que audita agentes. Você pede pra ele olhar se está fazendo commit pro segundo cérebro, se os crons estão funcionando, se a memória RAM está muito alta, se está vazando informação confidencial. E dá pra ir além: numa recomendação que dei pra um aluno, ele criou um cron pra perguntar pro agente o que os funcionários estão fazendo todos os dias. Você pode navegar em todas as esferas (segundo cérebro, infraestrutura, dia a dia, projetos) só auditando. A gente criou um sistema de alerta: classifica em alerta crítico ou besteira. Besteira ele corrige sozinho (não fez commit, cron quebrou). Crítico (vazou dado sensível, um funcionário quebrou algo) a gente intervém.

**Claudio Pereira:** Respondeu maravilhosamente. Última: é a mesma preocupação de quem usa um load balancer na frente de três application servers. Quem supervisiona o Léo pra saber se o Léo não quebrou?

**Bruno Okamoto:** Excelente pergunta. Eu uso o **Claude**. Crio uma rotina no Claude que **uma vez por mês audita o Léo**.

**Claudio Pereira:** Obrigado, cara.

**Bruno Okamoto:** Essa minha estrutura é mais robusta porque eu tenho essa flexibilidade. Vocês não precisam seguir ao pé da letra, é só inspiração — essa é a grande mensagem da aula. O Bruno perguntou se as skills do Da Vinci estão no curso. Não estão, mas se quiserem eu gravo uma aula sobre governança. O que você faz: pega a transcrição dessa imersão, pega a transcrição da minha aula e pede pro agente "quero criar skills de governança, use essa transcrição do Bruno como base". As skills têm que ser feitas pra se adaptar à sua realidade, não você a elas.

*[Action item: gravar aula de governança; compartilhar com a comunidade]*

**Bruno Okamoto:** Sobre a imersão de marketing, peço desculpas a quem entrou pra ver o marketing — a gente quer lançar esse produto de marketing com um over delivery (não só conteúdo, mas um sistema e um agente funcionando pra marketing). Não tive tempo esse mês, então joguei pro mês que vem pra não entregar algo malfeito. Sobre relançar o curso do Hub: vou falar uma data que vai ser um chute, mas a expectativa da equipe é correr pra lançar tudo até o final da primeira semana de julho. A meta é lançar em junho; a gordura é a primeira semana de julho.

**Joaquin Colman:** Olá Bruno. Falo espanhol, vou fazer um esforço pra falar português, me desculpa pelos erros. Tenho um micro-SaaS de CRM pra corretores de seguros na América Latina, com US$3 mil de MRR, ticket médio de US$250. Meu funil já funciona: anuncio no Meta, agendamento, um closer fechando 25-30%. Pra chegar a US$10 mil de MRR, tenho três alavancas: aumentar o volume de anúncio no mesmo país, expandir pra Argentina com o mesmo criativo, ou aumentar o ticket médio cobrando mais dos corretores grandes. Em que ordem você puxaria?

**Bruno Okamoto:** Como é uma pergunta que foge do nosso contexto de agentes, eu vou tentar encaixar ela no contexto de agentes. O que eu faria no seu lugar usando OpenClaw e Hermes:

*[Action item: construir agente de Meta Ads — API, lições aprendidas, geração de criativos (Canva/Figma)]*

**Bruno Okamoto:** A primeira coisa: eu criaria um agente pra fazer gestão de todas as minhas campanhas do Meta Ads. Você pode pegar um agente e colocar ele pra mapear suas campanhas do Meta, tirar lições aprendidas e criar novos criativos automaticamente. A cadeia: você conecta ele na API do Meta, puxa os dados, tira lições aprendidas (cria um arquivo `lessons learned` com o que funciona em cada campanha), e entra numa estrutura de usar o agente pra criar criativos com as lições aprendidas. Conecta o agente em MCPs (Canva, Figma, outros de design) e pede pra gerar tipo 50-80 criativos novos por semana, baseado no que ele mapeia que funciona. Essa estrutura eu vou liberar dentro do **Marketing OS** mês que vem. Uma coisa que eu faria pra sair de 3 pra 10k de MRR: focar no que está funcionando (Meta Ads). A gente montou um relatório de Meta Ads — meu agente foi lá, pegou todos os criativos via API, colocou a receita, quanto gastou, o ROAS, escreveu uma tendência (atenção, estável) e recomendou monitorar/manter/desativar campanhas. Teve uma campanha com ROAS de 5.67 e o agente falou "promova essa campanha". Outro exemplo: falei com o Léo e ele criou os criativos pra mim — "olhei nos reportes dos aprendizados que você sugeriu criar dois criativos estáticos novos, um no ângulo delegação, outro no ângulo sistema, usando o formato stack". Ele gerou os dois (post 4:5 e story 9:16), 100% automaticamente, com lições aprendidas.

*[Action item: construir agente de SEO — DataforSEO, mapeamento de keywords, posts de blog]*

**Bruno Okamoto:** A segunda coisa: usar agente pra fazer SEO. SEO de conteúdo pra blog com agentes. Deixaria um agente mapeando palavras-chave (existe uma ferramenta chamada **DataforSEO**, que é pra agentes). Pluga essa ferramenta e todos os dias o agente fica mapeando palavras-chave na internet, e a partir delas cria posts usando uma skill de SEO. Então eu faria essas duas coisas imediatamente pra chegar em 10k de MRR.

**Atílio Macoggi:** No curso de vocês, não estavam rodando "pausar campanha, subir campanha" de maneira automática. Agora já estão fazendo isso?

**Bruno Okamoto:** Não, ainda não faço isso. Tenho medo de levar ban, então prefiro não fazer ainda. A Meta lançou o Meta CLI; em tese ela fez isso pra você usar com IA, então em tese deveria funcionar. Mas eu fico com cagaço — a nossa conta movimenta às vezes meio milhão em anúncio por mês. Se eu levo o ban, perco muito aprendizado e inteligência. Então prefiro não arriscar.

**Bruno Okamoto:** Joaquin, eu sei que você tá nesse momento de tracionar seu SaaS, fico muito feliz por você já estar em 3K de MRR. Minha recomendação como seu tutor: dê um **double down** no que está funcionando. Fica no Meta Ads e bate até 10K de MRR, e faz SEO pra médio-longo prazo.

**Adriana Duarte:** Ô Bruno, quanto conteúdo. Sobre o criativo que você fez com o agente: o que eu sinto falta hoje, quando pego o Claude, o GPT, é não seguir as diretrizes da minha empresa (cores, logos). Tem alguma skill, algum squad, algo que você usa pra que os agentes sigam o branding?

**Bruno Okamoto:** Não tem uma skill, mas o que eu fiz: criei um documento completo chamado **Brand Assets**, onde coloquei tudo do meu branding (cores, fontes, logos, referências, templates). E adicionei vários templates de documentos: como eu envio muito relatório, pedi pra ele manter um branding de relatório; faço muito vídeo do YouTube, um template de vídeo. Quanto mais contexto do seu branding, melhor. Você tem que mencionar pro seu agente que isso existe: põe no `soul` dele (ou no `agents`, ou no `tools`) "você tem que seguir sempre os padrões de branding que estão nesta pasta". Toda vez que ele acordar, vai ler o arquivo de branding e seguir. Três coisas: (1) ter esse design system bem completo numa pasta; (2) ter bastante template (e-mail, criativo); (3) *(a terceira fugiu)*.

*[Action item: criar documento Brand Assets + templates; adicionar instrução no soul do agente]*

**Adriana Duarte:** Pra mim agentes é novidade, entrei em maio, até tô com problema com meu agente (deu problema com o Roncho e não consigo voltar, parou desde sábado, já falei com o Guilherme). Mas venho desenvolvendo um design system da minha empresa via Claude. Já liguei o MCP do Canva no Claude e não deu certo, a coisa sai totalmente errada. Marca é uma das maiores dores que tenho — minha entrada na IA foi por marketing mesmo, e seguir um brand book/design system é dificílimo.

**Bruno Okamoto:** O André Gabriel deu uma dica muito boa: quando ele quer seguir 100%, ele consegue pedindo pra criar um **script de Python**. Com o script de Python ele faz redondo, da forma que você quer — só que você tem que acertar o template. Então volta pra ter um template. Se você pedir pro seu Claude fazer com código usando Python, naquela arte ele sempre vai fazer da mesma forma — mas você vai ter que ir refinando até acertar. Outra coisa legal: testa o **Claude Design**. Você já testou?

**Adriana Duarte:** Comecei a testar, mas não tive muito sucesso. Voltei pra fazer todo o Design System dentro do Claude usando o Terminal.

*[Action item: experimentar scripts Python pra criativos com brand compliance]*

**Bruno Okamoto:** No final do dia, Adri, você vai ter que tentar de várias formas até achar uma que funciona, mas código tende a dar certo. Brand é uma coisa mais complexa, é muito "de lua". Mas eu nunca testei código, então vale a pena testar essa recomendação do André.

**(participante):** Posso colaborar? Eu tive o mesmo problema. No **Claude Chat**, passando um brand book pra ele, ele cria um carrossel exatamente no estilo que eu gostaria, com a minha logo, cores, identidade visual. O que eu fiz: pedi pro meu Claude Code replicar exatamente o que o Claude faz no Claude Chat — ele cria alguns arquivos, um HTML, renderiza pelo navegador e gera a imagem em SVG.

*[Action item: testar Claude Chat com brand book; replicar o workflow de carrossel no Claude Code]*

**Rodrigo Baggio:** Adriana, tu já tentou no Claude Chat normal, na web, passando teu brand book? Ele consegue te entregar algo que faça sentido pra tua realidade?

**Adriana Duarte:** Não, nunca; já tentei no passado, depois fui pro terminal do Claude com o Canva, mas não deu certo. Fazer todo meu brand book no Claude Design também não consegui um efeito tão bacana.

**Adriana Bessa:** Bruno, é outra Adriana. Não sei se você viu o que o Karpathy fez em termos de indexação — ele sugeriu uma wiki, automaticamente você coloca no prompt e ele já cria o resumo e um log. Queria saber se você acha que faz mais sentido do que só criar o mapa. E outra coisa que me incomoda: eu ter que ficar toda hora falando "salva, essa é uma decisão importante". Não tem outra forma de automatizar isso?

**Bruno Okamoto:** Um dos motivos que eu coloquei o Hermes na Amora é porque ele funciona melhor com compactação. Um dos defeitos do Open Claw é a feature **Memory Flush**: em tese, quando o Open Claw chega a 70% da sessão, ele deveria pegar a conversa e salvar tudo. Só que tem vezes que ele não salva e explode o contexto — aí fica lento, demora pra responder, esquece as coisas. Nativamente, no Open Claw, a única forma de salvar o que é relevante é ficar pedindo. Se você quer parar de salvar toda hora, minha recomendação é migrar pro Hermes. Isso pra mim foi a dor número um ou dois no Open Claw.

*[Action item: migrar pro Hermes; configurar cron de sync com o Git a cada 30 min]*

**Adriana Bessa:** E a questão da wiki, você acha que vale a pena?

**Bruno Okamoto:** Testei e achei que não fez muita diferença. O mapa já resolve. A wiki é pra um cara que usa IA da hora que acorda até dormir e lida com 700 fontes de conteúdo — é muito avançado. Testei por um mês (todo o meu Obsidian foi feito por essa wiki) e voltei pro básico.

**Adriana Bessa:** Você usa conexão via MCP ou continua só comitando normal no Git?

**Bruno Okamoto:** Tenho CLI. No agente eu crio um cron e peço pra ele **sincronizar a cada 30 minutos** e subir tudo pro segundo cérebro sempre. E no Claude eu fico pedindo pra ele salvar (toda vez que termino uma sessão, mando um Salve).

**vilela:** Sobre o segundo cérebro: criei o mapa, melhorou, mas eu tenho que ficar repetindo e às vezes passar o caminho pra ele usar uma skill ou buscar uma nota/backlog, porque eu misturei coisas (não guardo só skill, guardo anotações, notas, backlog, mesma estrutura do Git). Dependendo do modelo: com o Claude ele é bem assertivo; com o OpenClaw + Codex ou outra LLM, às vezes ele carrega a skill pela metade, ou não acha e tenta inventar. Acho que ele não está conseguindo indexar o segundo cérebro pra achar as coisas. Coloquei o mapa, algumas coisas ajudaram, outras continuam dando ruim. Qual a melhor abordagem? Pensei em pgvector pra indexar/busca semântica, mas não me aprofundei.

*[Action item: refinar mapas de agente/skills; instalar Gbrain; testar memória]*

**Bruno Okamoto:** O mapa você tem que colocar nos arquivos raízes do seu agente. Eu coloquei o mapa dentro do agente (no `tools`), então ele sempre carrega numa nova sessão. E coloquei um mapa dentro da pasta de skills também — `mapa` e `index`. Dentro do mapa de skills ele explica o que é cada skill, pra que eu uso. Tenho 144 skills, então o mapa explica pra qual categoria de ferramentas eu uso cada uma (Analytics, Content, Education, Marketing). A moral: sempre coloco muita direção — "aqui dentro existe a pasta skills; dentro dela essas categorias; dentro dessas pastas, essas skills, e cada uma faz X". Primeira resposta: refina mais os mapas, coloca mapa em tudo, indexa tudo. Segunda: testa o **Gbrain** — a memória dele no meu agente OpenClaw funciona super bem.

**vilela:** Não conheço o Gbrain.

**Bruno Okamoto:** O Gbrain é uma estrutura de memória mais avançada, do Gary Tan. Se você pesquisar, o Gary Tan é o presidente da Y Combinator (maior aceleradora de startups do mundo) e é um nerdão dev raiz. Ele constrói uma porrada de coisa, e uma delas é o Gbrain — essa estrutura de retrieval, grafo e embeddings. Ele cria várias camadas de pesquisa semântica dentro do seu agente. Você acessa `github.com/gbrain`, pede pro seu agente instalar (faz um backup antes). É um pouco mais avançado.

**vilela:** Meio que todos eles são muito parecidos.

**Bruno Okamoto:** Todos vão te levar pro mesmo lugar: melhorar a memória do agente. Se você entende a questão técnica, beleza, entende a do Gbrain. Se não entende, vai no Gbrain que não tem erro. Não conheço o pgvector. E o **Roncho** funciona pra salvar personalidade. *(demonstra: "Amora, entra na memória do Roncho e me diz o que tem lá sobre nós — não dê dados particulares, estou numa imersão ao vivo com 200 alunos")*.

**dilksongomes:** Olá Brunão. Tenho uma empresa, hoje 8 pessoas rodando direto, e a gente conseguiu executar muita tarefa repetitiva. A gente faz gestão de energia no mercado livre de energia e gestão de recarga de veículos elétricos. A camada operacional inteira eu consegui colocar no Open Cloud, muita coisa, mas virou uma estrutura sem métrica. Dei um passo pra trás e comecei a escrever o mapa organizacional da empresa, peguei umas skills do dia 2 da Pixel pra trazer permissionamento e auditoria. Só que nos últimos 15 dias meu custo subiu muito — quase R$5 mil só de Codex. Nos últimos 60 dias foram em torno de US$5 mil a US$5,6 mil. Essa camada operacional, eu poderia colocar ela fora do Codex pra não estourar meu limite e economizar? Segunda parte: qual a melhor forma de estruturar meus processos da empresa (camada tática, estratégica)? A gente pega o POP, joga pro agente, ele começa a editar, mas o documento é tão parrudo que vem faturando R$50, R$70, R$100, e eu paro com medo de gastar demais.

**Bruno Okamoto:** Por que você tá pagando API? Por que você não usa assinatura? Você não assistiu as aulas, Dilkson? A primeira coisa que a gente ensina é como logar dentro do ChatGPT. Você gastou (muito) sendo que podia ter gastado R$2 mil.

**dilksongomes:** Mas eu uso o OAuth, tô todo logado no OAuth do GPT. Estourei o limite mês passado e fiquei esperando porque não queria gastar.

**Bruno Okamoto:** Se tá no OAuth, não devia estar na API. Eu rodo oito agentes numa assinatura de mil reais, inclusive o OpenClawzinho e o Brunozinho, que falam com mais de 5-8 mil alunos por dia — muita mensagem, muito contexto, crons a cada segundo. Não acho que seja volume, acho que seja configuração. A sugestão: chama o **Gui Andrade** e marca uma reunião, e ele te ajuda a ver onde você tá sangrando, porque você não devia estar usando API. US$6 mil é muita coisa. Pra estar gastando isso, é porque tem alguma operação com muito cron rodando, muito contexto, na API pura. Às vezes o agente tá mentindo pra você. O pessoal tá falando que sua chave vazou. Dá uma olhada com o Gui Andrade.

*[Action item: agendar auditoria de custos com o Gui Andrade; configurar fallback no OpenRouter; revisar API vs OAuth]*

**Bruno Okamoto:** E outra coisa: muda o fallback. Se você tá no rate limit, pode pôr um fallback mais barato — um fallback da OpenRouter, tipo R$100 numa LLM chinesa (um Qwen 3.6 da vida), que é bem baratinho. Tira tudo que envolver a API da OpenAI.

**Érico:** Bruno, tô implementando aqui na empresa, já tenho meu agente pessoal e o da empresa. Você disse que tem a Amora e o Dexter — o Dexter é um subagente da Amora ou um agente independente em outra VPS?

**Bruno Okamoto:** Independente, em outra VPS. Eu não misturo nada com a Amora, ela é minha baby. Não ponho nada na VPS dela.

**Érico:** Eu tenho um agente numa VPS separada só pra empresa, e ontem dei acesso pra 10 pessoas. Futuramente, se eu quiser um agente por departamento, você indica criar sub-agentes do agente principal ou criar um agente separado em outra VPS? Qual o tamanho — 40 funcionários.

**Bruno Okamoto:** Eu deixaria um agente por coisas mais macro: um pra marketing e vendas, um pra operação e suporte, pegando duas ou três áreas. 40 pessoas não é muito grande nem pequeno. Só vale a pena ter muitos agentes se você lida com muita coisa (igual o Dilkson). Se você tem uma área core que demanda muito volume (ex: logística num e-commerce, que passa muita API), aí eu teria um agente dedicado. Minha área de conteúdo é core (por isso o Dexter), minha área de marketing é core (por isso o Léo). Põe agente dedicado onde é core e tem muito volume; áreas sem volume não precisam (pode dividir com outras). Nossa área de vendas puxa o agente pra saber quantos leads estão parados no CRM — não precisa de dedicado.

**Érico:** Se eu separasse os agentes, como eu encaixaria o principal pra coordenar os outros e fazer auditoria?

**Bruno Okamoto:** Muito fácil. Você pluga uma coisa chamada **Tailscale**. Contrata múltiplas VPS, instala o Tailscale dentro de todas, e pede pro seu agente criar todos os outros agentes. Aí pede pra ele criar crons de governança e higienização — ele vai ficar auditando todos os agentes todo dia. Deixa o seu agente como Big Boss. É só instalar o Tailscale em todas as VPS, tudo que for um computador. O Git ajuda; tenta instalar sozinho, ela é meio tricky mas não é muito técnica.

*[Action item: instalar Tailscale em todas as VPS; construir agente de governança; configurar auditoria mensal]*

**Pedro Thomaz:** Hoje eu crio os agentes todos pelo Claude (uso Claude e Hermes), mas crio tudo pelo Claude usando SSH, vou direto na VPS. Dou acesso SSH pro agente principal e mando ele auditar todos os outros via SSH.

**Bruno Okamoto:** Exatamente. No final do dia é pensar sempre em blocos: "eu tô nesse bloco, quero criar mais blocos, como esses blocos se conectam". Por isso eu gosto de desenhar — tudo que a gente faz na empresa a gente desenha, funciona maravilhosamente.

**Pedro Thomaz:** Bruno, eu entrei na plataforma agora, te conheço há um tempo. Tenho 20 anos de trabalho em back-office, conheço muito de processo administrativo, sempre tive um pé na tecnologia mas como intermediador entre o negócio e a equipe de TI. Me aventurei, vi uma oportunidade (pessoal me pedindo automação), e isso tá virando uma segunda renda. Minha dúvida: eu tenho receio, sou um cara correto e sistemático, de como vou vender um software se eu não sou desenvolvedor. Se der algum pau. Vou fazer um hackathon sozinho esse final de semana. Como vocês podem me ajudar na parte de código, pra acompanhar se der algum pau? E o quão você acredita que é perene esse lance de conseguir fazer uma coisa sem entender nada de código?

**Bruno Okamoto:** Dependendo da resposta, os devs vão me crucificar nessa imersão, então vou tentar não dar uma resposta sem sentido. O que eu recomendaria: tem uma coisa trending forte agora, que o Boris (da Anthropic) falou, chamado **Barra Loop** (`/loop`). Você já ouviu falar?

*[Action item: implementar loop de autocorreção diário no Replit pros projetos]*

**Bruno Okamoto:** Eu não faço mais software; quando faço, faço no Replit (que já tem um sistema de auditoria de funcionalidades). Mas o que eu faria: colocar esse loop pra rodar todos os dias dentro do repositório dos softwares que você tá construindo, pra ele identificar buracos e autocorrigir, num loop contínuo de achar falhas, corrigir e testar. Agora, é difícil você saber o que blindar a nível de segurança se você não tem conhecimento técnico — como vai saber as boas práticas de segurança pro Claude fazer por você, se você não sabe o que é? É uma posição de merda, porque eu também não sou técnico, sou que nem você. Imagina, eu tenho uma audiência grande, se lanço um app e a galera destrói. Acontece bastante. Só que normalmente o pessoal me segue de gente boa: "Bruno, eu podia ter te fudido, mas achei uma falha aqui e aqui tá como corrigi". Tenta usar a IA pra criar esses loops de autocorreção, mas não sei se a IA tá pronta pra criar produto 100% de IA. Dá pra fazer muita coisa, mas tem que estar ciente dos riscos. Essa é uma pergunta que eu não sei responder bem.

**Diego Tardivo:** Bruno, minha dúvida é sobre a estrutura agêntica do time. Cada colaborador tem uma workstation e faz o Save. Cada colaborador tem um agente, ou trabalham com um agente especialista no Telegram por tópicos/projeto? Aí dão o Save e isso é comitado no repositório único do GitHub? A gente tá começando a estruturar o time agêntico e a dúvida é se cada pessoa precisa ter um agente, ou se um agente especialista dá conta.

**Bruno Okamoto:** Como a gente contrata muito aluno (tipo o próprio Gui Andrade, nosso diretor de marketing), a galera já traz os seus agentes. É difícil eu chegar e falar "parem de usar seus agentes, usem só o Telegram". A gente tem o Telegram com todas as coisas da Pixel. Mas tem muita gente que a gente contratou que já tinha seu OpenClaw, seu Hermes. O que a gente faz com todo mundo é conectar todo mundo no segundo cérebro da Pixel. Mesmo que você esteja no seu agente pessoal, usando Claude, OpenClaw, ou no grupo do Telegram com vários tópicos, independente do que você usa, tudo vai pra cá. A gente tem uma pasta no GitHub chamada **inbox**. Tudo que todo mundo trabalha, independente da ferramenta, todos os dias vem pra esse inbox. Tem a Amora, a Beatriz, eu, o Caio (CEO), o Gabriel (diretor de marketing), o Jarvis (agente do Caio), o Matheus, o Oliver. O Gui tem a pasta dele e o OpenClaw dele — ele trabalha no Claude e joga ali; o OpenClaw dele trabalha e joga ali. Não importa o meio, o que importa é sempre apre­sentar tudo que foi trabalhado pro segundo cérebro.

*[Action item: criar inbox no GitHub da empresa; rotear o trabalho do time pra lá]*

**Bruno Okamoto:** E pra não confundir: o **Gbrain não é o segundo cérebro**. O Gbrain é só uma ferramenta de pesquisa, serve pra melhorar a pesquisa. O segundo cérebro, no final do dia, é o **GitHub**.

**Diego Tardivo:** Você não usa nada de Supabase, tudo no Git?

**Bruno Okamoto:** Não, eu uso bastante **Supabase**. É onde a gente usa nosso CRM. A gente usa Supabase e Vercel. Telegram, WhatsApp, reuniões, Gmail — tudo isso fica no Supabase. Porque se eu jogasse todas as conversas do meu WhatsApp e Telegram no GitHub, ia explodir o contexto. CRM dos alunos do Hub, do minicurso, tudo Supabase. E o agente **sintetiza** isso pro GitHub. Todo dia a Amora abre meu WhatsApp, puxa do Supabase: "Bruno, você teve 48 conversas no privado hoje, essas pessoas eu conheço". Ela pega as pessoas que eu conheço e salva em `People` no segundo cérebro. Eu só deixo entrar conversas que eu permito; as que não permiti (sem match) não entram no segundo cérebro. Tudo isso no Supabase. (O pessoal pede "ensina a usar o Supabase", mas já tem uma aula disso na plataforma.)

**adomj / (participante):** *(perguntas finais sobre a diferença entre agentes dedicados e VPS separadas)*

**Bruno Okamoto:** Eu tentaria sempre ficar com a linha do mínimo possível. Se você tem que pensar "eu preciso ter muitos agentes", você precisa saber o que cada agente vai fazer e por quê. Se não souber a resposta, não teria muitos agentes — teria só um agente, uma VPS. Por vários motivos: contexto (todos os agentes vão precisar de contexto; se tiver cinco, você dá cinco contextos o tempo todo), cinco governanças, cinco higienizações, cinco vezes 25 crons cada um, cinco vezes 25 skills cada um. Muito trampo. Pra você ter uma ideia, eu abri uma vaga aqui na minha empresa de R$20 mil de salário por mês só pra fazer **gestão de agentes**. Quando você escala muito essa questão de agentes, fica caro e trabalhoso cuidar de tudo (segurança, guardrails, infraestrutura). Respondendo: o mínimo de agentes possível. Se precisar de mais VPS, minha recomendação é sempre contratar a **KVM4** (uns 8-10 GB de RAM, 100 GB de SSD) — ela cabe 3 agentes. Evite ao máximo criar muitos agentes que você só acha que vai ser legal.

**(participante):** Eu fico achando que tô colocando muita coisa pra uma natura pequena. Uso sua referência do OpenClawzinho que atende essa porrada de mensagens e acho que tô viajando.

**Bruno Okamoto:** Sabe o que eu sinto? Que os alunos se preocupam demais com problemas que não aconteceram ainda. Grande parte das perguntas hoje foram de problemas que não aconteceram. Não se preocupa — espera ter o problema e você resolve. Tenta sempre simplificar. Na era da IA a gente tenta muito fazer over engineering, porque é gostoso de mexer, mas cuidado, senão você perde o foco. O foco é: você tá gastando R$1.100 por mês de assinatura de IA; se essa IA não tá te gerando no mínimo R$1.100 por mês, você tá perdendo dinheiro. Como eu uso essa IA pra ganhar dinheiro? Se você perde muito tempo na parte técnica, deixa de aplicar ela onde ela poderia estar te gerando dinheiro ou economia. Antes de ficar contratando um monte de agente e VPS, pensa "como eu ganho dinheiro usando meu agente agora?".

**Claudio Pereira:** Duas perguntas simples: quando usar MCP e quando usar API? E provocando pro seu próximo curso: usar toda essa tecnologia no ambiente Microsoft 365 com SharePoint, pra sair do Copilot/Copilot Studio.

**Bruno Okamoto:** Eu pessoalmente prefiro **API** do que MCP. Minha recomendação sempre vai ser **API ou CLI**, porque MCP fica desconectando com muita frequência, isso me incomoda profundamente. MCP só se não tiver outra opção. Sobre Microsoft, eu não sei responder, desculpa — eu não uso Microsoft, não conheço SharePoint. A experiência que tive com um aluno tentando conectar o Open Cloud dentro da Microsoft foi horrível; a Microsoft é horrível pra liberar API, tem muita burocracia.

**Claudio Pereira:** Eu tenho aplicações em Laravel usando a autenticação da Microsoft 365 via **Graph API** — tendo acesso ao admin do tenant, você consegue criar essas conexões. Eu trabalho com muitas empresas no ecossistema Microsoft 365, e não existe algo tão acessível economicamente como esse conjunto (OpenClaw, Hermes). Tô pensando seriamente na Microsoft Graph API.

**Bruno Okamoto:** Não foi muito útil minha resposta, desculpa, mas você consegue achar outros alunos com situações parecidas e conversar com eles, porque não é minha área de expertise.

**Claudio Pereira:** Você ajudou pra caramba — você acabou de me dizer, de forma subliminar, que tem uma grande oportunidade. Vamos atrás dela.

**Bruno Okamoto:** Sempre tem. Então, senhores, acho que estamos por aí — eu tô desde as seis da manhã trabalhando hoje. Obrigado pela participação. Desculpa não ter conseguido ver a questão do Marketing OS. Tá encerrado, espero que tenham aprendido uma coisa ou outra nova. Vou gravar, pegar a transcrição, montar um documento bem legal e mandar pra vocês — vou liberar todo o material. Quem quiser ficar 15 minutinhos pra gente passar as trilhas novas, eu posso passar. Mas vocês já estão dispensados. Muito obrigado a todos que ficaram até o fim. Dia dos namorados é amanhã — não esqueçam de comprar um presente. A Amora não me deixa esquecer essas coisas. Valeu, gente. Mano, tem muito conteúdo pra pôr no Hub ainda. Aos poucos a gente vai colocando tudo.

---

*Transcrição da imersão interna do Pixel AI Hub · 11/06/2026 · Bruno Okamoto. Material liberado para os alunos usarem em seus próprios agentes e LLMs.*
