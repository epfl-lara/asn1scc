; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70870 () Bool)

(assert start!70870)

(declare-fun i!774 () (_ BitVec 32))

(declare-datatypes ((T!62599 0))(
  ( (T!62600 (val!526 Int)) )
))
(declare-datatypes ((array!20171 0))(
  ( (array!20172 (arr!9884 (Array (_ BitVec 32) T!62599)) (size!8792 (_ BitVec 32))) )
))
(declare-fun arr!330 () array!20171)

(declare-fun elem!10 () T!62599)

(assert (=> start!70870 (and (bvsle #b00000000000000000000000000000000 i!774) (bvsle i!774 (size!8792 arr!330)) (not (= i!774 (size!8792 arr!330))) (not (= (select (arr!9884 arr!330) i!774) elem!10)) (bvsge (bvsub (size!8792 arr!330) (bvadd #b00000000000000000000000000000001 i!774)) (bvsub (size!8792 arr!330) i!774)))))

(assert (=> start!70870 true))

(declare-fun e!230670 () Bool)

(declare-fun array_inv!8344 (array!20171) Bool)

(assert (=> start!70870 (and (array_inv!8344 arr!330) e!230670)))

(declare-fun tp_is_empty!1053 () Bool)

(assert (=> start!70870 tp_is_empty!1053))

(declare-fun b!320551 () Bool)

(declare-fun mapRes!3292 () Bool)

(assert (=> b!320551 (= e!230670 (and tp_is_empty!1053 mapRes!3292))))

(declare-fun condMapEmpty!3292 () Bool)

(declare-fun mapDefault!3292 () T!62599)

(assert (=> b!320551 (= condMapEmpty!3292 (= (arr!9884 arr!330) ((as const (Array (_ BitVec 32) T!62599)) mapDefault!3292)))))

(declare-fun mapIsEmpty!3292 () Bool)

(assert (=> mapIsEmpty!3292 mapRes!3292))

(declare-fun mapNonEmpty!3292 () Bool)

(declare-fun tp!3292 () Bool)

(assert (=> mapNonEmpty!3292 (= mapRes!3292 (and tp!3292 tp_is_empty!1053))))

(declare-fun mapRest!3292 () (Array (_ BitVec 32) T!62599))

(declare-fun mapKey!3292 () (_ BitVec 32))

(declare-fun mapValue!3292 () T!62599)

(assert (=> mapNonEmpty!3292 (= (arr!9884 arr!330) (store mapRest!3292 mapKey!3292 mapValue!3292))))

(assert (= (and b!320551 condMapEmpty!3292) mapIsEmpty!3292))

(assert (= (and b!320551 (not condMapEmpty!3292)) mapNonEmpty!3292))

(assert (= start!70870 b!320551))

(declare-fun m!458893 () Bool)

(assert (=> start!70870 m!458893))

(declare-fun m!458895 () Bool)

(assert (=> start!70870 m!458895))

(declare-fun m!458897 () Bool)

(assert (=> mapNonEmpty!3292 m!458897))

(check-sat (not start!70870) (not mapNonEmpty!3292) tp_is_empty!1053)
(check-sat)
