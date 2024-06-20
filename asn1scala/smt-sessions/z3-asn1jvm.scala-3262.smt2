; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74042 () Bool)

(assert start!74042)

(declare-fun b!326744 () Bool)

(declare-fun e!236059 () Bool)

(declare-fun tp_is_empty!1065 () Bool)

(declare-fun mapRes!3313 () Bool)

(assert (=> b!326744 (= e!236059 (and tp_is_empty!1065 mapRes!3313))))

(declare-fun condMapEmpty!3313 () Bool)

(declare-datatypes ((T!66491 0))(
  ( (T!66492 (val!532 Int)) )
))
(declare-datatypes ((array!21284 0))(
  ( (array!21285 (arr!10328 (Array (_ BitVec 32) T!66491)) (size!9236 (_ BitVec 32))) )
))
(declare-fun a!404 () array!21284)

(declare-fun mapDefault!3313 () T!66491)

(assert (=> b!326744 (= condMapEmpty!3313 (= (arr!10328 a!404) ((as const (Array (_ BitVec 32) T!66491)) mapDefault!3313)))))

(declare-fun mapIsEmpty!3313 () Bool)

(assert (=> mapIsEmpty!3313 mapRes!3313))

(declare-fun b!326743 () Bool)

(declare-fun e!236060 () Bool)

(declare-fun arrayRangesEq!1857 (array!21284 array!21284 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!326743 (= e!236060 (not (arrayRangesEq!1857 a!404 a!404 (size!9236 a!404) (size!9236 a!404))))))

(declare-fun res!268299 () Bool)

(assert (=> start!74042 (=> (not res!268299) (not e!236060))))

(assert (=> start!74042 (= res!268299 (bvsle #b00000000000000000000000000000000 (size!9236 a!404)))))

(assert (=> start!74042 e!236060))

(declare-fun array_inv!8788 (array!21284) Bool)

(assert (=> start!74042 (and (array_inv!8788 a!404) e!236059)))

(declare-fun mapNonEmpty!3313 () Bool)

(declare-fun tp!3313 () Bool)

(assert (=> mapNonEmpty!3313 (= mapRes!3313 (and tp!3313 tp_is_empty!1065))))

(declare-fun mapRest!3313 () (Array (_ BitVec 32) T!66491))

(declare-fun mapKey!3313 () (_ BitVec 32))

(declare-fun mapValue!3313 () T!66491)

(assert (=> mapNonEmpty!3313 (= (arr!10328 a!404) (store mapRest!3313 mapKey!3313 mapValue!3313))))

(assert (= (and start!74042 res!268299) b!326743))

(assert (= (and b!326744 condMapEmpty!3313) mapIsEmpty!3313))

(assert (= (and b!326744 (not condMapEmpty!3313)) mapNonEmpty!3313))

(assert (= start!74042 b!326744))

(declare-fun m!464585 () Bool)

(assert (=> b!326743 m!464585))

(declare-fun m!464587 () Bool)

(assert (=> start!74042 m!464587))

(declare-fun m!464589 () Bool)

(assert (=> mapNonEmpty!3313 m!464589))

(check-sat (not b!326743) (not start!74042) (not mapNonEmpty!3313) tp_is_empty!1065)
(check-sat)
(get-model)

(declare-fun d!107820 () Bool)

(declare-fun res!268307 () Bool)

(declare-fun e!236071 () Bool)

(assert (=> d!107820 (=> res!268307 e!236071)))

(assert (=> d!107820 (= res!268307 (= (size!9236 a!404) (size!9236 a!404)))))

(assert (=> d!107820 (= (arrayRangesEq!1857 a!404 a!404 (size!9236 a!404) (size!9236 a!404)) e!236071)))

(declare-fun b!326755 () Bool)

(declare-fun e!236072 () Bool)

(assert (=> b!326755 (= e!236071 e!236072)))

(declare-fun res!268308 () Bool)

(assert (=> b!326755 (=> (not res!268308) (not e!236072))))

(assert (=> b!326755 (= res!268308 (= (select (arr!10328 a!404) (size!9236 a!404)) (select (arr!10328 a!404) (size!9236 a!404))))))

(declare-fun b!326756 () Bool)

(assert (=> b!326756 (= e!236072 (arrayRangesEq!1857 a!404 a!404 (bvadd (size!9236 a!404) #b00000000000000000000000000000001) (size!9236 a!404)))))

(assert (= (and d!107820 (not res!268307)) b!326755))

(assert (= (and b!326755 res!268308) b!326756))

(declare-fun m!464597 () Bool)

(assert (=> b!326755 m!464597))

(assert (=> b!326755 m!464597))

(declare-fun m!464599 () Bool)

(assert (=> b!326756 m!464599))

(assert (=> b!326743 d!107820))

(declare-fun d!107822 () Bool)

(assert (=> d!107822 (= (array_inv!8788 a!404) (bvsge (size!9236 a!404) #b00000000000000000000000000000000))))

(assert (=> start!74042 d!107822))

(declare-fun condMapEmpty!3319 () Bool)

(declare-fun mapDefault!3319 () T!66491)

(assert (=> mapNonEmpty!3313 (= condMapEmpty!3319 (= mapRest!3313 ((as const (Array (_ BitVec 32) T!66491)) mapDefault!3319)))))

(declare-fun mapRes!3319 () Bool)

(assert (=> mapNonEmpty!3313 (= tp!3313 (and tp_is_empty!1065 mapRes!3319))))

(declare-fun mapIsEmpty!3319 () Bool)

(assert (=> mapIsEmpty!3319 mapRes!3319))

(declare-fun mapNonEmpty!3319 () Bool)

(declare-fun tp!3319 () Bool)

(assert (=> mapNonEmpty!3319 (= mapRes!3319 (and tp!3319 tp_is_empty!1065))))

(declare-fun mapKey!3319 () (_ BitVec 32))

(declare-fun mapRest!3319 () (Array (_ BitVec 32) T!66491))

(declare-fun mapValue!3319 () T!66491)

(assert (=> mapNonEmpty!3319 (= mapRest!3313 (store mapRest!3319 mapKey!3319 mapValue!3319))))

(assert (= (and mapNonEmpty!3313 condMapEmpty!3319) mapIsEmpty!3319))

(assert (= (and mapNonEmpty!3313 (not condMapEmpty!3319)) mapNonEmpty!3319))

(declare-fun m!464601 () Bool)

(assert (=> mapNonEmpty!3319 m!464601))

(check-sat (not b!326756) (not mapNonEmpty!3319) tp_is_empty!1065)
(check-sat)
