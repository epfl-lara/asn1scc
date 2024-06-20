; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31958 () Bool)

(assert start!31958)

(declare-datatypes ((T!22791 0))(
  ( (T!22792 (val!82 Int)) )
))
(declare-fun t!702 () T!22791)

(declare-fun choose!114 (T!22791) T!22791)

(assert (=> start!31958 (not (= (choose!114 t!702) t!702))))

(declare-fun tp_is_empty!165 () Bool)

(assert (=> start!31958 tp_is_empty!165))

(declare-fun bs!13186 () Bool)

(assert (= bs!13186 start!31958))

(declare-fun m!249255 () Bool)

(assert (=> bs!13186 m!249255))

(check-sat (not start!31958) tp_is_empty!165)
(check-sat)
(get-model)

(declare-fun d!53323 () Bool)

(declare-fun choose!116 (T!22791) T!22791)

(assert (=> d!53323 (= (choose!114 t!702) (choose!116 t!702))))

(declare-fun bs!13188 () Bool)

(assert (= bs!13188 d!53323))

(declare-fun m!249259 () Bool)

(assert (=> bs!13188 m!249259))

(assert (=> start!31958 d!53323))

(check-sat (not d!53323) tp_is_empty!165)
(check-sat)
(get-model)

(declare-fun d!53329 () Bool)

(declare-fun res!132521 () T!22791)

(assert (=> d!53329 (= res!132521 t!702)))

(assert (=> d!53329 tp_is_empty!165))

(assert (=> d!53329 (= (choose!116 t!702) res!132521)))

(assert (=> d!53323 d!53329))

(check-sat tp_is_empty!165)
