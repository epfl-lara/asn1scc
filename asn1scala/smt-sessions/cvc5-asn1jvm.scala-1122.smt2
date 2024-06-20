; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31956 () Bool)

(assert start!31956)

(declare-datatypes ((T!22789 0))(
  ( (T!22790 (val!81 Int)) )
))
(declare-fun t!702 () T!22789)

(declare-fun choose!113 (T!22789) T!22789)

(assert (=> start!31956 (not (= (choose!113 t!702) t!702))))

(declare-fun tp_is_empty!163 () Bool)

(assert (=> start!31956 tp_is_empty!163))

(declare-fun bs!13185 () Bool)

(assert (= bs!13185 start!31956))

(declare-fun m!249253 () Bool)

(assert (=> bs!13185 m!249253))

(push 1)

(assert (not start!31956))

(assert tp_is_empty!163)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!53325 () Bool)

(declare-fun choose!117 (T!22789) T!22789)

(assert (=> d!53325 (= (choose!113 t!702) (choose!117 t!702))))

(declare-fun bs!13189 () Bool)

(assert (= bs!13189 d!53325))

(declare-fun m!249261 () Bool)

(assert (=> bs!13189 m!249261))

(assert (=> start!31956 d!53325))

(push 1)

(assert (not d!53325))

(assert tp_is_empty!163)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!53331 () Bool)

(declare-fun res!132524 () T!22789)

(assert (=> d!53331 (= res!132524 t!702)))

(assert (=> d!53331 tp_is_empty!163))

(assert (=> d!53331 (= (choose!117 t!702) res!132524)))

(assert (=> d!53325 d!53331))

