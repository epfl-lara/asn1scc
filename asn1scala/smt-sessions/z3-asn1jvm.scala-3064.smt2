; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70846 () Bool)

(assert start!70846)

(declare-fun i!774 () (_ BitVec 32))

(declare-datatypes ((T!62495 0))(
  ( (T!62496 (val!514 Int)) )
))
(declare-datatypes ((array!20147 0))(
  ( (array!20148 (arr!9872 (Array (_ BitVec 32) T!62495)) (size!8780 (_ BitVec 32))) )
))
(declare-fun arr!330 () array!20147)

(declare-fun elem!10 () T!62495)

(assert (=> start!70846 (and (bvsle #b00000000000000000000000000000000 i!774) (bvsle i!774 (size!8780 arr!330)) (not (= i!774 (size!8780 arr!330))) (not (= (select (arr!9872 arr!330) i!774) elem!10)) (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!774)) (bvsgt (bvadd #b00000000000000000000000000000001 i!774) (size!8780 arr!330))))))

(assert (=> start!70846 true))

(declare-fun e!230634 () Bool)

(declare-fun array_inv!8332 (array!20147) Bool)

(assert (=> start!70846 (and (array_inv!8332 arr!330) e!230634)))

(declare-fun tp_is_empty!1029 () Bool)

(assert (=> start!70846 tp_is_empty!1029))

(declare-fun b!320515 () Bool)

(declare-fun mapRes!3256 () Bool)

(assert (=> b!320515 (= e!230634 (and tp_is_empty!1029 mapRes!3256))))

(declare-fun condMapEmpty!3256 () Bool)

(declare-fun mapDefault!3256 () T!62495)

(assert (=> b!320515 (= condMapEmpty!3256 (= (arr!9872 arr!330) ((as const (Array (_ BitVec 32) T!62495)) mapDefault!3256)))))

(declare-fun mapIsEmpty!3256 () Bool)

(assert (=> mapIsEmpty!3256 mapRes!3256))

(declare-fun mapNonEmpty!3256 () Bool)

(declare-fun tp!3256 () Bool)

(assert (=> mapNonEmpty!3256 (= mapRes!3256 (and tp!3256 tp_is_empty!1029))))

(declare-fun mapValue!3256 () T!62495)

(declare-fun mapKey!3256 () (_ BitVec 32))

(declare-fun mapRest!3256 () (Array (_ BitVec 32) T!62495))

(assert (=> mapNonEmpty!3256 (= (arr!9872 arr!330) (store mapRest!3256 mapKey!3256 mapValue!3256))))

(assert (= (and b!320515 condMapEmpty!3256) mapIsEmpty!3256))

(assert (= (and b!320515 (not condMapEmpty!3256)) mapNonEmpty!3256))

(assert (= start!70846 b!320515))

(declare-fun m!458833 () Bool)

(assert (=> start!70846 m!458833))

(declare-fun m!458835 () Bool)

(assert (=> start!70846 m!458835))

(declare-fun m!458837 () Bool)

(assert (=> mapNonEmpty!3256 m!458837))

(check-sat (not start!70846) (not mapNonEmpty!3256) tp_is_empty!1029)
(check-sat)
