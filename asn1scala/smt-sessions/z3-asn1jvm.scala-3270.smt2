; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74108 () Bool)

(assert start!74108)

(declare-fun mapNonEmpty!3397 () Bool)

(declare-fun mapRes!3397 () Bool)

(declare-fun tp!3397 () Bool)

(declare-fun tp_is_empty!1113 () Bool)

(assert (=> mapNonEmpty!3397 (= mapRes!3397 (and tp!3397 tp_is_empty!1113))))

(declare-datatypes ((T!66699 0))(
  ( (T!66700 (val!556 Int)) )
))
(declare-fun mapValue!3397 () T!66699)

(declare-fun mapKey!3397 () (_ BitVec 32))

(declare-fun mapRest!3397 () (Array (_ BitVec 32) T!66699))

(declare-datatypes ((array!21336 0))(
  ( (array!21337 (arr!10352 (Array (_ BitVec 32) T!66699)) (size!9260 (_ BitVec 32))) )
))
(declare-fun a!407 () array!21336)

(assert (=> mapNonEmpty!3397 (= (arr!10352 a!407) (store mapRest!3397 mapKey!3397 mapValue!3397))))

(declare-fun mapIsEmpty!3397 () Bool)

(assert (=> mapIsEmpty!3397 mapRes!3397))

(declare-fun b!326937 () Bool)

(declare-fun e!236193 () Bool)

(assert (=> b!326937 (= e!236193 (bvsgt #b00000000000000000000000000000000 (size!9260 a!407)))))

(declare-datatypes ((Unit!22154 0))(
  ( (Unit!22155) )
))
(declare-fun lt!448670 () Unit!22154)

(declare-fun i!907 () (_ BitVec 32))

(declare-fun rec!123 (array!21336 (_ BitVec 32)) Unit!22154)

(assert (=> b!326937 (= lt!448670 (rec!123 a!407 (bvsub i!907 #b00000000000000000000000000000001)))))

(declare-fun b!326938 () Bool)

(declare-fun e!236194 () Bool)

(assert (=> b!326938 (= e!236194 (and tp_is_empty!1113 mapRes!3397))))

(declare-fun condMapEmpty!3397 () Bool)

(declare-fun mapDefault!3397 () T!66699)

(assert (=> b!326938 (= condMapEmpty!3397 (= (arr!10352 a!407) ((as const (Array (_ BitVec 32) T!66699)) mapDefault!3397)))))

(declare-fun b!326939 () Bool)

(declare-fun res!268403 () Bool)

(assert (=> b!326939 (=> (not res!268403) (not e!236193))))

(declare-fun arrayRangesEq!1870 (array!21336 array!21336 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!326939 (= res!268403 (arrayRangesEq!1870 a!407 a!407 i!907 (size!9260 a!407)))))

(declare-fun b!326940 () Bool)

(declare-fun res!268401 () Bool)

(assert (=> b!326940 (=> (not res!268401) (not e!236193))))

(assert (=> b!326940 (= res!268401 (not (= i!907 #b00000000000000000000000000000000)))))

(declare-fun res!268402 () Bool)

(assert (=> start!74108 (=> (not res!268402) (not e!236193))))

(assert (=> start!74108 (= res!268402 (and (bvsle #b00000000000000000000000000000000 i!907) (bvsle i!907 (size!9260 a!407))))))

(assert (=> start!74108 e!236193))

(assert (=> start!74108 true))

(declare-fun array_inv!8807 (array!21336) Bool)

(assert (=> start!74108 (and (array_inv!8807 a!407) e!236194)))

(assert (= (and start!74108 res!268402) b!326939))

(assert (= (and b!326939 res!268403) b!326940))

(assert (= (and b!326940 res!268401) b!326937))

(assert (= (and b!326938 condMapEmpty!3397) mapIsEmpty!3397))

(assert (= (and b!326938 (not condMapEmpty!3397)) mapNonEmpty!3397))

(assert (= start!74108 b!326938))

(declare-fun m!464773 () Bool)

(assert (=> mapNonEmpty!3397 m!464773))

(declare-fun m!464775 () Bool)

(assert (=> b!326937 m!464775))

(declare-fun m!464777 () Bool)

(assert (=> b!326939 m!464777))

(declare-fun m!464779 () Bool)

(assert (=> start!74108 m!464779))

(check-sat (not b!326939) (not b!326937) tp_is_empty!1113 (not mapNonEmpty!3397) (not start!74108))
(check-sat)
