; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70852 () Bool)

(assert start!70852)

(declare-fun i!774 () (_ BitVec 32))

(declare-datatypes ((T!62521 0))(
  ( (T!62522 (val!517 Int)) )
))
(declare-datatypes ((array!20153 0))(
  ( (array!20154 (arr!9875 (Array (_ BitVec 32) T!62521)) (size!8783 (_ BitVec 32))) )
))
(declare-fun arr!330 () array!20153)

(assert (=> start!70852 (and (bvsle #b00000000000000000000000000000000 i!774) (bvsle i!774 (size!8783 arr!330)) (not (= (bvand (size!8783 arr!330) #b10000000000000000000000000000000) (bvand i!774 #b10000000000000000000000000000000))) (not (= (bvand (size!8783 arr!330) #b10000000000000000000000000000000) (bvand (bvsub (size!8783 arr!330) i!774) #b10000000000000000000000000000000))))))

(assert (=> start!70852 true))

(declare-fun e!230643 () Bool)

(declare-fun array_inv!8335 (array!20153) Bool)

(assert (=> start!70852 (and (array_inv!8335 arr!330) e!230643)))

(declare-fun b!320524 () Bool)

(declare-fun tp_is_empty!1035 () Bool)

(declare-fun mapRes!3265 () Bool)

(assert (=> b!320524 (= e!230643 (and tp_is_empty!1035 mapRes!3265))))

(declare-fun condMapEmpty!3265 () Bool)

(declare-fun mapDefault!3265 () T!62521)

(assert (=> b!320524 (= condMapEmpty!3265 (= (arr!9875 arr!330) ((as const (Array (_ BitVec 32) T!62521)) mapDefault!3265)))))

(declare-fun mapIsEmpty!3265 () Bool)

(assert (=> mapIsEmpty!3265 mapRes!3265))

(declare-fun mapNonEmpty!3265 () Bool)

(declare-fun tp!3265 () Bool)

(assert (=> mapNonEmpty!3265 (= mapRes!3265 (and tp!3265 tp_is_empty!1035))))

(declare-fun mapValue!3265 () T!62521)

(declare-fun mapRest!3265 () (Array (_ BitVec 32) T!62521))

(declare-fun mapKey!3265 () (_ BitVec 32))

(assert (=> mapNonEmpty!3265 (= (arr!9875 arr!330) (store mapRest!3265 mapKey!3265 mapValue!3265))))

(assert (= (and b!320524 condMapEmpty!3265) mapIsEmpty!3265))

(assert (= (and b!320524 (not condMapEmpty!3265)) mapNonEmpty!3265))

(assert (= start!70852 b!320524))

(declare-fun m!458849 () Bool)

(assert (=> start!70852 m!458849))

(declare-fun m!458851 () Bool)

(assert (=> mapNonEmpty!3265 m!458851))

(check-sat (not start!70852) (not mapNonEmpty!3265) tp_is_empty!1035)
(check-sat)
