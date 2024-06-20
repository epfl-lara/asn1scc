; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70864 () Bool)

(assert start!70864)

(declare-fun i!774 () (_ BitVec 32))

(declare-datatypes ((T!62573 0))(
  ( (T!62574 (val!523 Int)) )
))
(declare-datatypes ((array!20165 0))(
  ( (array!20166 (arr!9881 (Array (_ BitVec 32) T!62573)) (size!8789 (_ BitVec 32))) )
))
(declare-fun arr!330 () array!20165)

(declare-fun elem!10 () T!62573)

(assert (=> start!70864 (and (bvsle #b00000000000000000000000000000000 i!774) (bvsle i!774 (size!8789 arr!330)) (not (= i!774 (size!8789 arr!330))) (not (= (select (arr!9881 arr!330) i!774) elem!10)) (= (bvand i!774 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand i!774 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!774) #b10000000000000000000000000000000))))))

(assert (=> start!70864 true))

(declare-fun e!230661 () Bool)

(declare-fun array_inv!8341 (array!20165) Bool)

(assert (=> start!70864 (and (array_inv!8341 arr!330) e!230661)))

(declare-fun tp_is_empty!1047 () Bool)

(assert (=> start!70864 tp_is_empty!1047))

(declare-fun b!320542 () Bool)

(declare-fun mapRes!3283 () Bool)

(assert (=> b!320542 (= e!230661 (and tp_is_empty!1047 mapRes!3283))))

(declare-fun condMapEmpty!3283 () Bool)

(declare-fun mapDefault!3283 () T!62573)

(assert (=> b!320542 (= condMapEmpty!3283 (= (arr!9881 arr!330) ((as const (Array (_ BitVec 32) T!62573)) mapDefault!3283)))))

(declare-fun mapIsEmpty!3283 () Bool)

(assert (=> mapIsEmpty!3283 mapRes!3283))

(declare-fun mapNonEmpty!3283 () Bool)

(declare-fun tp!3283 () Bool)

(assert (=> mapNonEmpty!3283 (= mapRes!3283 (and tp!3283 tp_is_empty!1047))))

(declare-fun mapKey!3283 () (_ BitVec 32))

(declare-fun mapRest!3283 () (Array (_ BitVec 32) T!62573))

(declare-fun mapValue!3283 () T!62573)

(assert (=> mapNonEmpty!3283 (= (arr!9881 arr!330) (store mapRest!3283 mapKey!3283 mapValue!3283))))

(assert (= (and b!320542 condMapEmpty!3283) mapIsEmpty!3283))

(assert (= (and b!320542 (not condMapEmpty!3283)) mapNonEmpty!3283))

(assert (= start!70864 b!320542))

(declare-fun m!458875 () Bool)

(assert (=> start!70864 m!458875))

(declare-fun m!458877 () Bool)

(assert (=> start!70864 m!458877))

(declare-fun m!458879 () Bool)

(assert (=> mapNonEmpty!3283 m!458879))

(check-sat (not start!70864) (not mapNonEmpty!3283) tp_is_empty!1047)
(check-sat)
