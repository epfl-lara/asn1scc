; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74034 () Bool)

(assert start!74034)

(declare-datatypes ((T!66465 0))(
  ( (T!66466 (val!529 Int)) )
))
(declare-datatypes ((array!21277 0))(
  ( (array!21278 (arr!10325 (Array (_ BitVec 32) T!66465)) (size!9233 (_ BitVec 32))) )
))
(declare-fun a!404 () array!21277)

(assert (=> start!74034 (bvsgt #b00000000000000000000000000000000 (size!9233 a!404))))

(declare-fun e!236045 () Bool)

(declare-fun array_inv!8785 (array!21277) Bool)

(assert (=> start!74034 (and (array_inv!8785 a!404) e!236045)))

(declare-fun b!326727 () Bool)

(declare-fun tp_is_empty!1059 () Bool)

(declare-fun mapRes!3301 () Bool)

(assert (=> b!326727 (= e!236045 (and tp_is_empty!1059 mapRes!3301))))

(declare-fun condMapEmpty!3301 () Bool)

(declare-fun mapDefault!3301 () T!66465)

(assert (=> b!326727 (= condMapEmpty!3301 (= (arr!10325 a!404) ((as const (Array (_ BitVec 32) T!66465)) mapDefault!3301)))))

(declare-fun mapIsEmpty!3301 () Bool)

(assert (=> mapIsEmpty!3301 mapRes!3301))

(declare-fun mapNonEmpty!3301 () Bool)

(declare-fun tp!3301 () Bool)

(assert (=> mapNonEmpty!3301 (= mapRes!3301 (and tp!3301 tp_is_empty!1059))))

(declare-fun mapValue!3301 () T!66465)

(declare-fun mapKey!3301 () (_ BitVec 32))

(declare-fun mapRest!3301 () (Array (_ BitVec 32) T!66465))

(assert (=> mapNonEmpty!3301 (= (arr!10325 a!404) (store mapRest!3301 mapKey!3301 mapValue!3301))))

(assert (= (and b!326727 condMapEmpty!3301) mapIsEmpty!3301))

(assert (= (and b!326727 (not condMapEmpty!3301)) mapNonEmpty!3301))

(assert (= start!74034 b!326727))

(declare-fun m!464569 () Bool)

(assert (=> start!74034 m!464569))

(declare-fun m!464571 () Bool)

(assert (=> mapNonEmpty!3301 m!464571))

(check-sat (not start!74034) (not mapNonEmpty!3301) tp_is_empty!1059)
(check-sat)
(get-model)

(declare-fun d!107816 () Bool)

(assert (=> d!107816 (= (array_inv!8785 a!404) (bvsge (size!9233 a!404) #b00000000000000000000000000000000))))

(assert (=> start!74034 d!107816))

(declare-fun condMapEmpty!3307 () Bool)

(declare-fun mapDefault!3307 () T!66465)

(assert (=> mapNonEmpty!3301 (= condMapEmpty!3307 (= mapRest!3301 ((as const (Array (_ BitVec 32) T!66465)) mapDefault!3307)))))

(declare-fun mapRes!3307 () Bool)

(assert (=> mapNonEmpty!3301 (= tp!3301 (and tp_is_empty!1059 mapRes!3307))))

(declare-fun mapIsEmpty!3307 () Bool)

(assert (=> mapIsEmpty!3307 mapRes!3307))

(declare-fun mapNonEmpty!3307 () Bool)

(declare-fun tp!3307 () Bool)

(assert (=> mapNonEmpty!3307 (= mapRes!3307 (and tp!3307 tp_is_empty!1059))))

(declare-fun mapKey!3307 () (_ BitVec 32))

(declare-fun mapRest!3307 () (Array (_ BitVec 32) T!66465))

(declare-fun mapValue!3307 () T!66465)

(assert (=> mapNonEmpty!3307 (= mapRest!3301 (store mapRest!3307 mapKey!3307 mapValue!3307))))

(assert (= (and mapNonEmpty!3301 condMapEmpty!3307) mapIsEmpty!3307))

(assert (= (and mapNonEmpty!3301 (not condMapEmpty!3307)) mapNonEmpty!3307))

(declare-fun m!464577 () Bool)

(assert (=> mapNonEmpty!3307 m!464577))

(check-sat (not mapNonEmpty!3307) tp_is_empty!1059)
(check-sat)
