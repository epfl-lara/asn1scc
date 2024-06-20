; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74092 () Bool)

(assert start!74092)

(declare-fun mapIsEmpty!3376 () Bool)

(declare-fun mapRes!3376 () Bool)

(assert (=> mapIsEmpty!3376 mapRes!3376))

(declare-fun mapNonEmpty!3376 () Bool)

(declare-fun tp!3376 () Bool)

(declare-fun tp_is_empty!1101 () Bool)

(assert (=> mapNonEmpty!3376 (= mapRes!3376 (and tp!3376 tp_is_empty!1101))))

(declare-fun mapKey!3376 () (_ BitVec 32))

(declare-datatypes ((T!66647 0))(
  ( (T!66648 (val!550 Int)) )
))
(declare-datatypes ((array!21323 0))(
  ( (array!21324 (arr!10346 (Array (_ BitVec 32) T!66647)) (size!9254 (_ BitVec 32))) )
))
(declare-fun a!407 () array!21323)

(declare-fun mapValue!3376 () T!66647)

(declare-fun mapRest!3376 () (Array (_ BitVec 32) T!66647))

(assert (=> mapNonEmpty!3376 (= (arr!10346 a!407) (store mapRest!3376 mapKey!3376 mapValue!3376))))

(declare-fun b!326859 () Bool)

(declare-fun res!268344 () Bool)

(declare-fun e!236150 () Bool)

(assert (=> b!326859 (=> (not res!268344) (not e!236150))))

(declare-fun i!907 () (_ BitVec 32))

(declare-fun arrayRangesEq!1865 (array!21323 array!21323 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!326859 (= res!268344 (arrayRangesEq!1865 a!407 a!407 i!907 (size!9254 a!407)))))

(declare-fun res!268343 () Bool)

(assert (=> start!74092 (=> (not res!268343) (not e!236150))))

(assert (=> start!74092 (= res!268343 (and (bvsle #b00000000000000000000000000000000 i!907) (bvsle i!907 (size!9254 a!407))))))

(assert (=> start!74092 e!236150))

(assert (=> start!74092 true))

(declare-fun e!236149 () Bool)

(declare-fun array_inv!8802 (array!21323) Bool)

(assert (=> start!74092 (and (array_inv!8802 a!407) e!236149)))

(declare-fun b!326860 () Bool)

(assert (=> b!326860 (= e!236149 (and tp_is_empty!1101 mapRes!3376))))

(declare-fun condMapEmpty!3376 () Bool)

(declare-fun mapDefault!3376 () T!66647)

(assert (=> b!326860 (= condMapEmpty!3376 (= (arr!10346 a!407) ((as const (Array (_ BitVec 32) T!66647)) mapDefault!3376)))))

(declare-fun b!326861 () Bool)

(assert (=> b!326861 (= e!236150 (and (not (= i!907 #b00000000000000000000000000000000)) (or (bvsgt #b00000000000000000000000000000000 (bvsub i!907 #b00000000000000000000000000000001)) (bvsgt (bvsub i!907 #b00000000000000000000000000000001) (size!9254 a!407)))))))

(assert (= (and start!74092 res!268343) b!326859))

(assert (= (and b!326859 res!268344) b!326861))

(assert (= (and b!326860 condMapEmpty!3376) mapIsEmpty!3376))

(assert (= (and b!326860 (not condMapEmpty!3376)) mapNonEmpty!3376))

(assert (= start!74092 b!326860))

(declare-fun m!464719 () Bool)

(assert (=> mapNonEmpty!3376 m!464719))

(declare-fun m!464721 () Bool)

(assert (=> b!326859 m!464721))

(declare-fun m!464723 () Bool)

(assert (=> start!74092 m!464723))

(check-sat (not start!74092) (not b!326859) (not mapNonEmpty!3376) tp_is_empty!1101)
(check-sat)
