; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74114 () Bool)

(assert start!74114)

(declare-fun mapIsEmpty!3406 () Bool)

(declare-fun mapRes!3406 () Bool)

(assert (=> mapIsEmpty!3406 mapRes!3406))

(declare-fun b!326973 () Bool)

(declare-fun res!268428 () Bool)

(declare-fun e!236211 () Bool)

(assert (=> b!326973 (=> (not res!268428) (not e!236211))))

(declare-fun i!907 () (_ BitVec 32))

(assert (=> b!326973 (= res!268428 (not (= i!907 #b00000000000000000000000000000000)))))

(declare-fun b!326974 () Bool)

(declare-fun res!268430 () Bool)

(assert (=> b!326974 (=> (not res!268430) (not e!236211))))

(declare-datatypes ((T!66725 0))(
  ( (T!66726 (val!559 Int)) )
))
(declare-datatypes ((array!21342 0))(
  ( (array!21343 (arr!10355 (Array (_ BitVec 32) T!66725)) (size!9263 (_ BitVec 32))) )
))
(declare-fun a!407 () array!21342)

(declare-fun arrayRangesEq!1871 (array!21342 array!21342 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!326974 (= res!268430 (arrayRangesEq!1871 a!407 a!407 i!907 (size!9263 a!407)))))

(declare-fun res!268429 () Bool)

(assert (=> start!74114 (=> (not res!268429) (not e!236211))))

(assert (=> start!74114 (= res!268429 (and (bvsle #b00000000000000000000000000000000 i!907) (bvsle i!907 (size!9263 a!407))))))

(assert (=> start!74114 e!236211))

(assert (=> start!74114 true))

(declare-fun e!236212 () Bool)

(declare-fun array_inv!8808 (array!21342) Bool)

(assert (=> start!74114 (and (array_inv!8808 a!407) e!236212)))

(declare-fun mapNonEmpty!3406 () Bool)

(declare-fun tp!3406 () Bool)

(declare-fun tp_is_empty!1119 () Bool)

(assert (=> mapNonEmpty!3406 (= mapRes!3406 (and tp!3406 tp_is_empty!1119))))

(declare-fun mapKey!3406 () (_ BitVec 32))

(declare-fun mapRest!3406 () (Array (_ BitVec 32) T!66725))

(declare-fun mapValue!3406 () T!66725)

(assert (=> mapNonEmpty!3406 (= (arr!10355 a!407) (store mapRest!3406 mapKey!3406 mapValue!3406))))

(declare-fun b!326975 () Bool)

(assert (=> b!326975 (= e!236211 false)))

(declare-datatypes ((Unit!22158 0))(
  ( (Unit!22159) )
))
(declare-fun lt!448679 () Unit!22158)

(declare-fun rec!125 (array!21342 (_ BitVec 32)) Unit!22158)

(assert (=> b!326975 (= lt!448679 (rec!125 a!407 (bvsub i!907 #b00000000000000000000000000000001)))))

(declare-fun b!326976 () Bool)

(assert (=> b!326976 (= e!236212 (and tp_is_empty!1119 mapRes!3406))))

(declare-fun condMapEmpty!3406 () Bool)

(declare-fun mapDefault!3406 () T!66725)

(assert (=> b!326976 (= condMapEmpty!3406 (= (arr!10355 a!407) ((as const (Array (_ BitVec 32) T!66725)) mapDefault!3406)))))

(assert (= (and start!74114 res!268429) b!326974))

(assert (= (and b!326974 res!268430) b!326973))

(assert (= (and b!326973 res!268428) b!326975))

(assert (= (and b!326976 condMapEmpty!3406) mapIsEmpty!3406))

(assert (= (and b!326976 (not condMapEmpty!3406)) mapNonEmpty!3406))

(assert (= start!74114 b!326976))

(declare-fun m!464797 () Bool)

(assert (=> b!326974 m!464797))

(declare-fun m!464799 () Bool)

(assert (=> start!74114 m!464799))

(declare-fun m!464801 () Bool)

(assert (=> mapNonEmpty!3406 m!464801))

(declare-fun m!464803 () Bool)

(assert (=> b!326975 m!464803))

(check-sat (not mapNonEmpty!3406) tp_is_empty!1119 (not b!326974) (not start!74114) (not b!326975))
(check-sat)
