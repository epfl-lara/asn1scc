; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31960 () Bool)

(assert start!31960)

(declare-datatypes ((T!22793 0))(
  ( (T!22794 (val!83 Int)) )
))
(declare-fun t!702 () T!22793)

(declare-fun choose!115 (T!22793) T!22793)

(assert (=> start!31960 (not (= (choose!115 t!702) t!702))))

(declare-fun tp_is_empty!167 () Bool)

(assert (=> start!31960 tp_is_empty!167))

(declare-fun bs!13187 () Bool)

(assert (= bs!13187 start!31960))

(declare-fun m!249257 () Bool)

(assert (=> bs!13187 m!249257))

(push 1)

(assert (not start!31960))

(assert tp_is_empty!167)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!53327 () Bool)

(declare-fun choose!118 (T!22793) T!22793)

(assert (=> d!53327 (= (choose!115 t!702) (choose!118 t!702))))

(declare-fun bs!13190 () Bool)

(assert (= bs!13190 d!53327))

(declare-fun m!249263 () Bool)

(assert (=> bs!13190 m!249263))

(assert (=> start!31960 d!53327))

(push 1)

(assert (not d!53327))

(assert tp_is_empty!167)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

