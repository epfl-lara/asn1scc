; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74074 () Bool)

(assert start!74074)

(declare-datatypes ((Unit!22149 0))(
  ( (Unit!22150) )
))
(declare-fun lt!448658 () Unit!22149)

(declare-datatypes ((T!66595 0))(
  ( (T!66596 (val!544 Int)) )
))
(declare-datatypes ((array!21310 0))(
  ( (array!21311 (arr!10340 (Array (_ BitVec 32) T!66595)) (size!9248 (_ BitVec 32))) )
))
(declare-fun a!404 () array!21310)

(declare-fun rec!121 (array!21310 (_ BitVec 32)) Unit!22149)

(assert (=> start!74074 (= lt!448658 (rec!121 a!404 (size!9248 a!404)))))

(declare-fun arrayRangesEq!1860 (array!21310 array!21310 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> start!74074 (not (arrayRangesEq!1860 a!404 a!404 #b00000000000000000000000000000000 (size!9248 a!404)))))

(declare-fun e!236108 () Bool)

(declare-fun array_inv!8799 (array!21310) Bool)

(assert (=> start!74074 (and (array_inv!8799 a!404) e!236108)))

(declare-fun b!326799 () Bool)

(declare-fun tp_is_empty!1089 () Bool)

(declare-fun mapRes!3355 () Bool)

(assert (=> b!326799 (= e!236108 (and tp_is_empty!1089 mapRes!3355))))

(declare-fun condMapEmpty!3355 () Bool)

(declare-fun mapDefault!3355 () T!66595)

(assert (=> b!326799 (= condMapEmpty!3355 (= (arr!10340 a!404) ((as const (Array (_ BitVec 32) T!66595)) mapDefault!3355)))))

(declare-fun mapIsEmpty!3355 () Bool)

(assert (=> mapIsEmpty!3355 mapRes!3355))

(declare-fun mapNonEmpty!3355 () Bool)

(declare-fun tp!3355 () Bool)

(assert (=> mapNonEmpty!3355 (= mapRes!3355 (and tp!3355 tp_is_empty!1089))))

(declare-fun mapRest!3355 () (Array (_ BitVec 32) T!66595))

(declare-fun mapValue!3355 () T!66595)

(declare-fun mapKey!3355 () (_ BitVec 32))

(assert (=> mapNonEmpty!3355 (= (arr!10340 a!404) (store mapRest!3355 mapKey!3355 mapValue!3355))))

(assert (= (and b!326799 condMapEmpty!3355) mapIsEmpty!3355))

(assert (= (and b!326799 (not condMapEmpty!3355)) mapNonEmpty!3355))

(assert (= start!74074 b!326799))

(declare-fun m!464671 () Bool)

(assert (=> start!74074 m!464671))

(declare-fun m!464673 () Bool)

(assert (=> start!74074 m!464673))

(declare-fun m!464675 () Bool)

(assert (=> start!74074 m!464675))

(declare-fun m!464677 () Bool)

(assert (=> mapNonEmpty!3355 m!464677))

(check-sat (not start!74074) (not mapNonEmpty!3355) tp_is_empty!1089)
(check-sat)
(get-model)

(declare-fun d!107836 () Bool)

(assert (=> d!107836 (arrayRangesEq!1860 a!404 a!404 #b00000000000000000000000000000000 (size!9248 a!404))))

(declare-fun lt!448664 () Unit!22149)

(declare-fun e!236114 () Unit!22149)

(assert (=> d!107836 (= lt!448664 e!236114)))

(declare-fun c!15481 () Bool)

(assert (=> d!107836 (= c!15481 (= (size!9248 a!404) #b00000000000000000000000000000000))))

(assert (=> d!107836 (and (bvsle #b00000000000000000000000000000000 (size!9248 a!404)) (bvsle (size!9248 a!404) (size!9248 a!404)))))

(assert (=> d!107836 (= (rec!121 a!404 (size!9248 a!404)) lt!448664)))

(declare-fun b!326807 () Bool)

(declare-fun Unit!22153 () Unit!22149)

(assert (=> b!326807 (= e!236114 Unit!22153)))

(declare-fun b!326808 () Bool)

(assert (=> b!326808 (= e!236114 (rec!121 a!404 (bvsub (size!9248 a!404) #b00000000000000000000000000000001)))))

(assert (= (and d!107836 c!15481) b!326807))

(assert (= (and d!107836 (not c!15481)) b!326808))

(assert (=> d!107836 m!464673))

(declare-fun m!464687 () Bool)

(assert (=> b!326808 m!464687))

(assert (=> start!74074 d!107836))

(declare-fun d!107838 () Bool)

(declare-fun res!268313 () Bool)

(declare-fun e!236119 () Bool)

(assert (=> d!107838 (=> res!268313 e!236119)))

(assert (=> d!107838 (= res!268313 (= #b00000000000000000000000000000000 (size!9248 a!404)))))

(assert (=> d!107838 (= (arrayRangesEq!1860 a!404 a!404 #b00000000000000000000000000000000 (size!9248 a!404)) e!236119)))

(declare-fun b!326813 () Bool)

(declare-fun e!236120 () Bool)

(assert (=> b!326813 (= e!236119 e!236120)))

(declare-fun res!268314 () Bool)

(assert (=> b!326813 (=> (not res!268314) (not e!236120))))

(assert (=> b!326813 (= res!268314 (= (select (arr!10340 a!404) #b00000000000000000000000000000000) (select (arr!10340 a!404) #b00000000000000000000000000000000)))))

(declare-fun b!326814 () Bool)

(assert (=> b!326814 (= e!236120 (arrayRangesEq!1860 a!404 a!404 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!9248 a!404)))))

(assert (= (and d!107838 (not res!268313)) b!326813))

(assert (= (and b!326813 res!268314) b!326814))

(declare-fun m!464689 () Bool)

(assert (=> b!326813 m!464689))

(assert (=> b!326813 m!464689))

(declare-fun m!464691 () Bool)

(assert (=> b!326814 m!464691))

(assert (=> start!74074 d!107838))

(declare-fun d!107840 () Bool)

(assert (=> d!107840 (= (array_inv!8799 a!404) (bvsge (size!9248 a!404) #b00000000000000000000000000000000))))

(assert (=> start!74074 d!107840))

(declare-fun condMapEmpty!3361 () Bool)

(declare-fun mapDefault!3361 () T!66595)

(assert (=> mapNonEmpty!3355 (= condMapEmpty!3361 (= mapRest!3355 ((as const (Array (_ BitVec 32) T!66595)) mapDefault!3361)))))

(declare-fun mapRes!3361 () Bool)

(assert (=> mapNonEmpty!3355 (= tp!3355 (and tp_is_empty!1089 mapRes!3361))))

(declare-fun mapIsEmpty!3361 () Bool)

(assert (=> mapIsEmpty!3361 mapRes!3361))

(declare-fun mapNonEmpty!3361 () Bool)

(declare-fun tp!3361 () Bool)

(assert (=> mapNonEmpty!3361 (= mapRes!3361 (and tp!3361 tp_is_empty!1089))))

(declare-fun mapKey!3361 () (_ BitVec 32))

(declare-fun mapValue!3361 () T!66595)

(declare-fun mapRest!3361 () (Array (_ BitVec 32) T!66595))

(assert (=> mapNonEmpty!3361 (= mapRest!3355 (store mapRest!3361 mapKey!3361 mapValue!3361))))

(assert (= (and mapNonEmpty!3355 condMapEmpty!3361) mapIsEmpty!3361))

(assert (= (and mapNonEmpty!3355 (not condMapEmpty!3361)) mapNonEmpty!3361))

(declare-fun m!464693 () Bool)

(assert (=> mapNonEmpty!3361 m!464693))

(check-sat (not d!107836) (not b!326808) (not b!326814) (not mapNonEmpty!3361) tp_is_empty!1089)
(check-sat)
