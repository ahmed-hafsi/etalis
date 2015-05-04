swipl -g "open('../results.txt',append,FH), ['../../src/ep_sparql/ep_sparql.P'], set_etalis_flag(output_temporary_files,on), set_etalis_flag(logging_to_file,on), set_etalis_flag(store_fired_events,on), ep_sparql_parse('SELECT ?company ?sum WHERE { ?w start ?t } SEQ { aggregate(sum(?price),rdf(?company,hasStockPrice,?price),?sum) }',ParsedEPQuery),  assert(external_trigger(select_event/1)), assert(external_trigger(rdf/3)), nl, write('ParsedEPQuery: '), write(ParsedEPQuery), nl, ep_sparql_compile(ParsedEPQuery,CEPRules,ResultComplexEvent), compile_internal_event_rules(main,CEPRules), nl, write('CEPRules: '), write(CEPRules), nl,  nl, event(rdf(now,start,0)), event(rdf(company1,hasStockPrice,1)), event(rdf(company1,hasStockPrice,2)), findall(stored_event(event(select_event([company1,3]),T)),stored_event(event(select_event([company1,3]),T)),List), (List=[stored_event(event(select_event([company1,3]),[datime(_,_,_,_,_,_,_),datime(_,_,_,_,_,_,_)]))] -> write(FH,'ep_sparql_10\t\t\tpassed\n'),write('ep_sparql_10\t\t\tpassed\n') ; write(FH,'ep_sparql_10\t\tfailed\n'),write('ep_sparql_10\t\tfailed\n') ),halt."
