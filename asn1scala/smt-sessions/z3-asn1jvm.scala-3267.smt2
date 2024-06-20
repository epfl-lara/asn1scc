; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74086 () Bool)

(assert start!74086)

(declare-fun mapNonEmpty!3367 () Bool)

(declare-fun mapRes!3367 () Bool)

(declare-fun tp!3367 () Bool)

(declare-fun tp_is_empty!1095 () Bool)

(assert (=> mapNonEmpty!3367 (= mapRes!3367 (and tp!3367 tp_is_empty!1095))))

(declare-datatypes ((T!66621 0))(
  ( (T!66622 (val!547 Int)) )
))
(declare-fun mapValue!3367 () T!66621)

(declare-fun mapKey!3367 () (_ BitVec 32))

(declare-datatypes ((array!21317 0))(
  ( (array!21318 (arr!10343 (Array (_ BitVec 32) T!66621)) (size!9251 (_ BitVec 32))) )
))
(declare-fun a!407 () array!21317)

(declare-fun mapRest!3367 () (Array (_ BitVec 32) T!66621))

(assert (=> mapNonEmpty!3367 (= (arr!10343 a!407) (store mapRest!3367 mapKey!3367 mapValue!3367))))

(declare-fun b!326832 () Bool)

(declare-fun e!236131 () Bool)

(declare-fun i!907 () (_ BitVec 32))

(assert (=> b!326832 (= e!236131 (and (= i!907 #b00000000000000000000000000000000) (bvsgt #b00000000000000000000000000000000 (size!9251 a!407))))))

(declare-fun res!268326 () Bool)

(assert (=> start!74086 (=> (not res!268326) (not e!236131))))

(assert (=> start!74086 (= res!268326 (bvsle i!907 (size!9251 a!407)))))

(assert (=> start!74086 e!236131))

(assert (=> start!74086 true))

(declare-fun e!236132 () Bool)

(declare-fun array_inv!8801 (array!21317) Bool)

(assert (=> start!74086 (and (array_inv!8801 a!407) e!236132)))

(declare-fun b!326833 () Bool)

(declare-fun res!268325 () Bool)

(assert (=> b!326833 (=> (not res!268325) (not e!236131))))

(declare-fun arrayRangesEq!1863 (array!21317 array!21317 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!326833 (= res!268325 (arrayRangesEq!1863 a!407 a!407 i!907 (size!9251 a!407)))))

(declare-fun mapIsEmpty!3367 () Bool)

(assert (=> mapIsEmpty!3367 mapRes!3367))

(declare-fun b!326834 () Bool)

(assert (=> b!326834 (= e!236132 (and tp_is_empty!1095 mapRes!3367))))

(declare-fun condMapEmpty!3367 () Bool)

(declare-fun mapDefault!3367 () T!66621)

(assert (=> b!326834 (= condMapEmpty!3367 (= (arr!10343 a!407) ((as const (Array (_ BitVec 32) T!66621)) mapDefault!3367)))))

(assert (= (and start!74086 res!268326) b!326833))

(assert (= (and b!326833 res!268325) b!326832))

(assert (= (and b!326834 condMapEmpty!3367) mapIsEmpty!3367))

(assert (= (and b!326834 (not condMapEmpty!3367)) mapNonEmpty!3367))

(assert (= start!74086 b!326834))

(declare-fun m!464701 () Bool)

(assert (=> mapNonEmpty!3367 m!464701))

(declare-fun m!464703 () Bool)

(assert (=> start!74086 m!464703))

(declare-fun m!464705 () Bool)

(assert (=> b!326833 m!464705))

(check-sat (not start!74086) (not b!326833) (not mapNonEmpty!3367) tp_is_empty!1095)
(check-sat)
