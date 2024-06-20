; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57136 () Bool)

(assert start!57136)

(declare-fun at!218 () (_ BitVec 32))

(declare-datatypes ((T!45353 0))(
  ( (T!45354 (val!103 Int)) )
))
(declare-datatypes ((array!14550 0))(
  ( (array!14551 (arr!7337 (Array (_ BitVec 32) T!45353)) (size!6350 (_ BitVec 32))) )
))
(declare-fun a!416 () array!14550)

(declare-fun i!922 () (_ BitVec 32))

(assert (=> start!57136 (and (bvsle #b00000000000000000000000000000000 at!218) (bvslt at!218 (size!6350 a!416)) (bvsle #b00000000000000000000000000000000 i!922) (bvsle i!922 at!218) (bvsgt at!218 (size!6350 a!416)))))

(assert (=> start!57136 true))

(declare-fun e!182392 () Bool)

(declare-fun array_inv!6083 (array!14550) Bool)

(assert (=> start!57136 (and (array_inv!6083 a!416) e!182392)))

(declare-fun b!261982 () Bool)

(declare-fun tp_is_empty!207 () Bool)

(declare-fun mapRes!556 () Bool)

(assert (=> b!261982 (= e!182392 (and tp_is_empty!207 mapRes!556))))

(declare-fun condMapEmpty!556 () Bool)

(declare-fun mapDefault!556 () T!45353)

(assert (=> b!261982 (= condMapEmpty!556 (= (arr!7337 a!416) ((as const (Array (_ BitVec 32) T!45353)) mapDefault!556)))))

(declare-fun mapIsEmpty!556 () Bool)

(assert (=> mapIsEmpty!556 mapRes!556))

(declare-fun mapNonEmpty!556 () Bool)

(declare-fun tp!556 () Bool)

(assert (=> mapNonEmpty!556 (= mapRes!556 (and tp!556 tp_is_empty!207))))

(declare-fun mapKey!556 () (_ BitVec 32))

(declare-fun mapRest!556 () (Array (_ BitVec 32) T!45353))

(declare-fun mapValue!556 () T!45353)

(assert (=> mapNonEmpty!556 (= (arr!7337 a!416) (store mapRest!556 mapKey!556 mapValue!556))))

(assert (= (and b!261982 condMapEmpty!556) mapIsEmpty!556))

(assert (= (and b!261982 (not condMapEmpty!556)) mapNonEmpty!556))

(assert (= start!57136 b!261982))

(declare-fun m!392071 () Bool)

(assert (=> start!57136 m!392071))

(declare-fun m!392073 () Bool)

(assert (=> mapNonEmpty!556 m!392073))

(check-sat (not start!57136) (not mapNonEmpty!556) tp_is_empty!207)
(check-sat)
