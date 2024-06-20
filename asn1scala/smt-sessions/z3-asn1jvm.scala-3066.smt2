; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70858 () Bool)

(assert start!70858)

(declare-fun i!774 () (_ BitVec 32))

(declare-datatypes ((T!62547 0))(
  ( (T!62548 (val!520 Int)) )
))
(declare-datatypes ((array!20159 0))(
  ( (array!20160 (arr!9878 (Array (_ BitVec 32) T!62547)) (size!8786 (_ BitVec 32))) )
))
(declare-fun arr!330 () array!20159)

(assert (=> start!70858 (and (bvsle #b00000000000000000000000000000000 i!774) (bvsle i!774 (size!8786 arr!330)) (not (= i!774 (size!8786 arr!330))) (bvsge i!774 (size!8786 arr!330)))))

(assert (=> start!70858 true))

(declare-fun e!230652 () Bool)

(declare-fun array_inv!8338 (array!20159) Bool)

(assert (=> start!70858 (and (array_inv!8338 arr!330) e!230652)))

(declare-fun b!320533 () Bool)

(declare-fun tp_is_empty!1041 () Bool)

(declare-fun mapRes!3274 () Bool)

(assert (=> b!320533 (= e!230652 (and tp_is_empty!1041 mapRes!3274))))

(declare-fun condMapEmpty!3274 () Bool)

(declare-fun mapDefault!3274 () T!62547)

(assert (=> b!320533 (= condMapEmpty!3274 (= (arr!9878 arr!330) ((as const (Array (_ BitVec 32) T!62547)) mapDefault!3274)))))

(declare-fun mapIsEmpty!3274 () Bool)

(assert (=> mapIsEmpty!3274 mapRes!3274))

(declare-fun mapNonEmpty!3274 () Bool)

(declare-fun tp!3274 () Bool)

(assert (=> mapNonEmpty!3274 (= mapRes!3274 (and tp!3274 tp_is_empty!1041))))

(declare-fun mapRest!3274 () (Array (_ BitVec 32) T!62547))

(declare-fun mapValue!3274 () T!62547)

(declare-fun mapKey!3274 () (_ BitVec 32))

(assert (=> mapNonEmpty!3274 (= (arr!9878 arr!330) (store mapRest!3274 mapKey!3274 mapValue!3274))))

(assert (= (and b!320533 condMapEmpty!3274) mapIsEmpty!3274))

(assert (= (and b!320533 (not condMapEmpty!3274)) mapNonEmpty!3274))

(assert (= start!70858 b!320533))

(declare-fun m!458861 () Bool)

(assert (=> start!70858 m!458861))

(declare-fun m!458863 () Bool)

(assert (=> mapNonEmpty!3274 m!458863))

(check-sat (not start!70858) (not mapNonEmpty!3274) tp_is_empty!1041)
(check-sat)
