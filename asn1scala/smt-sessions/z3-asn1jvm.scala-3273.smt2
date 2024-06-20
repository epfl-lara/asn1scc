; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74126 () Bool)

(assert start!74126)

(declare-fun b!327045 () Bool)

(declare-fun e!236247 () Bool)

(declare-fun tp_is_empty!1131 () Bool)

(declare-fun mapRes!3424 () Bool)

(assert (=> b!327045 (= e!236247 (and tp_is_empty!1131 mapRes!3424))))

(declare-fun condMapEmpty!3424 () Bool)

(declare-datatypes ((T!66777 0))(
  ( (T!66778 (val!565 Int)) )
))
(declare-datatypes ((array!21354 0))(
  ( (array!21355 (arr!10361 (Array (_ BitVec 32) T!66777)) (size!9269 (_ BitVec 32))) )
))
(declare-fun a!407 () array!21354)

(declare-fun mapDefault!3424 () T!66777)

(assert (=> b!327045 (= condMapEmpty!3424 (= (arr!10361 a!407) ((as const (Array (_ BitVec 32) T!66777)) mapDefault!3424)))))

(declare-fun b!327046 () Bool)

(declare-fun res!268484 () Bool)

(declare-fun e!236248 () Bool)

(assert (=> b!327046 (=> (not res!268484) (not e!236248))))

(declare-fun i!907 () (_ BitVec 32))

(assert (=> b!327046 (= res!268484 (= i!907 #b00000000000000000000000000000000))))

(declare-fun b!327047 () Bool)

(declare-fun arrayRangesEq!1875 (array!21354 array!21354 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!327047 (= e!236248 (not (arrayRangesEq!1875 a!407 a!407 #b00000000000000000000000000000000 (size!9269 a!407))))))

(declare-fun mapIsEmpty!3424 () Bool)

(assert (=> mapIsEmpty!3424 mapRes!3424))

(declare-fun b!327048 () Bool)

(declare-fun res!268482 () Bool)

(assert (=> b!327048 (=> (not res!268482) (not e!236248))))

(assert (=> b!327048 (= res!268482 (arrayRangesEq!1875 a!407 a!407 i!907 (size!9269 a!407)))))

(declare-fun res!268483 () Bool)

(assert (=> start!74126 (=> (not res!268483) (not e!236248))))

(assert (=> start!74126 (= res!268483 (bvsle i!907 (size!9269 a!407)))))

(assert (=> start!74126 e!236248))

(assert (=> start!74126 true))

(declare-fun array_inv!8811 (array!21354) Bool)

(assert (=> start!74126 (and (array_inv!8811 a!407) e!236247)))

(declare-fun mapNonEmpty!3424 () Bool)

(declare-fun tp!3424 () Bool)

(assert (=> mapNonEmpty!3424 (= mapRes!3424 (and tp!3424 tp_is_empty!1131))))

(declare-fun mapKey!3424 () (_ BitVec 32))

(declare-fun mapValue!3424 () T!66777)

(declare-fun mapRest!3424 () (Array (_ BitVec 32) T!66777))

(assert (=> mapNonEmpty!3424 (= (arr!10361 a!407) (store mapRest!3424 mapKey!3424 mapValue!3424))))

(assert (= (and start!74126 res!268483) b!327048))

(assert (= (and b!327048 res!268482) b!327046))

(assert (= (and b!327046 res!268484) b!327047))

(assert (= (and b!327045 condMapEmpty!3424) mapIsEmpty!3424))

(assert (= (and b!327045 (not condMapEmpty!3424)) mapNonEmpty!3424))

(assert (= start!74126 b!327045))

(declare-fun m!464845 () Bool)

(assert (=> b!327047 m!464845))

(declare-fun m!464847 () Bool)

(assert (=> b!327048 m!464847))

(declare-fun m!464849 () Bool)

(assert (=> start!74126 m!464849))

(declare-fun m!464851 () Bool)

(assert (=> mapNonEmpty!3424 m!464851))

(check-sat (not b!327047) tp_is_empty!1131 (not start!74126) (not mapNonEmpty!3424) (not b!327048))
(check-sat)
