; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70838 () Bool)

(assert start!70838)

(declare-datatypes ((T!62469 0))(
  ( (T!62470 (val!511 Int)) )
))
(declare-datatypes ((array!20140 0))(
  ( (array!20141 (arr!9869 (Array (_ BitVec 32) T!62469)) (size!8777 (_ BitVec 32))) )
))
(declare-fun arr!327 () array!20140)

(assert (=> start!70838 (bvsgt #b00000000000000000000000000000000 (size!8777 arr!327))))

(declare-fun e!230625 () Bool)

(declare-fun array_inv!8329 (array!20140) Bool)

(assert (=> start!70838 (and (array_inv!8329 arr!327) e!230625)))

(declare-fun b!320504 () Bool)

(declare-fun tp_is_empty!1023 () Bool)

(declare-fun mapRes!3244 () Bool)

(assert (=> b!320504 (= e!230625 (and tp_is_empty!1023 mapRes!3244))))

(declare-fun condMapEmpty!3244 () Bool)

(declare-fun mapDefault!3244 () T!62469)

(assert (=> b!320504 (= condMapEmpty!3244 (= (arr!9869 arr!327) ((as const (Array (_ BitVec 32) T!62469)) mapDefault!3244)))))

(declare-fun mapIsEmpty!3244 () Bool)

(assert (=> mapIsEmpty!3244 mapRes!3244))

(declare-fun mapNonEmpty!3244 () Bool)

(declare-fun tp!3244 () Bool)

(assert (=> mapNonEmpty!3244 (= mapRes!3244 (and tp!3244 tp_is_empty!1023))))

(declare-fun mapKey!3244 () (_ BitVec 32))

(declare-fun mapRest!3244 () (Array (_ BitVec 32) T!62469))

(declare-fun mapValue!3244 () T!62469)

(assert (=> mapNonEmpty!3244 (= (arr!9869 arr!327) (store mapRest!3244 mapKey!3244 mapValue!3244))))

(assert (= (and b!320504 condMapEmpty!3244) mapIsEmpty!3244))

(assert (= (and b!320504 (not condMapEmpty!3244)) mapNonEmpty!3244))

(assert (= start!70838 b!320504))

(declare-fun m!458817 () Bool)

(assert (=> start!70838 m!458817))

(declare-fun m!458819 () Bool)

(assert (=> mapNonEmpty!3244 m!458819))

(check-sat (not start!70838) (not mapNonEmpty!3244) tp_is_empty!1023)
(check-sat)
(get-model)

(declare-fun d!104946 () Bool)

(assert (=> d!104946 (= (array_inv!8329 arr!327) (bvsge (size!8777 arr!327) #b00000000000000000000000000000000))))

(assert (=> start!70838 d!104946))

(declare-fun condMapEmpty!3250 () Bool)

(declare-fun mapDefault!3250 () T!62469)

(assert (=> mapNonEmpty!3244 (= condMapEmpty!3250 (= mapRest!3244 ((as const (Array (_ BitVec 32) T!62469)) mapDefault!3250)))))

(declare-fun mapRes!3250 () Bool)

(assert (=> mapNonEmpty!3244 (= tp!3244 (and tp_is_empty!1023 mapRes!3250))))

(declare-fun mapIsEmpty!3250 () Bool)

(assert (=> mapIsEmpty!3250 mapRes!3250))

(declare-fun mapNonEmpty!3250 () Bool)

(declare-fun tp!3250 () Bool)

(assert (=> mapNonEmpty!3250 (= mapRes!3250 (and tp!3250 tp_is_empty!1023))))

(declare-fun mapRest!3250 () (Array (_ BitVec 32) T!62469))

(declare-fun mapKey!3250 () (_ BitVec 32))

(declare-fun mapValue!3250 () T!62469)

(assert (=> mapNonEmpty!3250 (= mapRest!3244 (store mapRest!3250 mapKey!3250 mapValue!3250))))

(assert (= (and mapNonEmpty!3244 condMapEmpty!3250) mapIsEmpty!3250))

(assert (= (and mapNonEmpty!3244 (not condMapEmpty!3250)) mapNonEmpty!3250))

(declare-fun m!458825 () Bool)

(assert (=> mapNonEmpty!3250 m!458825))

(check-sat (not mapNonEmpty!3250) tp_is_empty!1023)
(check-sat)
