; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68738 () Bool)

(assert start!68738)

(declare-fun mapIsEmpty!3177 () Bool)

(declare-fun mapRes!3178 () Bool)

(assert (=> mapIsEmpty!3177 mapRes!3178))

(declare-fun b!310313 () Bool)

(declare-fun e!222992 () Bool)

(declare-fun tp_is_empty!999 () Bool)

(declare-fun mapRes!3177 () Bool)

(assert (=> b!310313 (= e!222992 (and tp_is_empty!999 mapRes!3177))))

(declare-fun condMapEmpty!3177 () Bool)

(declare-datatypes ((T!58525 0))(
  ( (T!58526 (val!499 Int)) )
))
(declare-datatypes ((array!18867 0))(
  ( (array!18868 (arr!9269 (Array (_ BitVec 32) T!58525)) (size!8186 (_ BitVec 32))) )
))
(declare-fun a1!566 () array!18867)

(declare-fun mapDefault!3178 () T!58525)

(assert (=> b!310313 (= condMapEmpty!3177 (= (arr!9269 a1!566) ((as const (Array (_ BitVec 32) T!58525)) mapDefault!3178)))))

(declare-fun mapNonEmpty!3177 () Bool)

(declare-fun tp!3178 () Bool)

(assert (=> mapNonEmpty!3177 (= mapRes!3178 (and tp!3178 tp_is_empty!999))))

(declare-fun mapKey!3177 () (_ BitVec 32))

(declare-fun mapValue!3178 () T!58525)

(declare-fun mapRest!3178 () (Array (_ BitVec 32) T!58525))

(declare-fun a2!566 () array!18867)

(assert (=> mapNonEmpty!3177 (= (arr!9269 a2!566) (store mapRest!3178 mapKey!3177 mapValue!3178))))

(declare-fun mapIsEmpty!3178 () Bool)

(assert (=> mapIsEmpty!3178 mapRes!3177))

(declare-fun mapNonEmpty!3178 () Bool)

(declare-fun tp!3177 () Bool)

(assert (=> mapNonEmpty!3178 (= mapRes!3177 (and tp!3177 tp_is_empty!999))))

(declare-fun mapRest!3177 () (Array (_ BitVec 32) T!58525))

(declare-fun mapValue!3177 () T!58525)

(declare-fun mapKey!3178 () (_ BitVec 32))

(assert (=> mapNonEmpty!3178 (= (arr!9269 a1!566) (store mapRest!3177 mapKey!3178 mapValue!3177))))

(declare-fun b!310315 () Bool)

(declare-fun res!254440 () Bool)

(declare-fun e!222990 () Bool)

(assert (=> b!310315 (=> (not res!254440) (not e!222990))))

(declare-fun to!659 () (_ BitVec 32))

(declare-fun from!692 () (_ BitVec 32))

(declare-fun arrayRangesEq!1782 (array!18867 array!18867 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!310315 (= res!254440 (arrayRangesEq!1782 a1!566 a2!566 from!692 to!659))))

(declare-fun b!310316 () Bool)

(declare-fun e!222991 () Bool)

(assert (=> b!310316 (= e!222991 (and tp_is_empty!999 mapRes!3178))))

(declare-fun condMapEmpty!3178 () Bool)

(declare-fun mapDefault!3177 () T!58525)

(assert (=> b!310316 (= condMapEmpty!3178 (= (arr!9269 a2!566) ((as const (Array (_ BitVec 32) T!58525)) mapDefault!3177)))))

(declare-fun b!310317 () Bool)

(declare-fun i!943 () (_ BitVec 32))

(assert (=> b!310317 (= e!222990 (bvsge (bvsub to!659 (bvadd #b00000000000000000000000000000001 i!943)) (bvsub to!659 i!943)))))

(declare-fun b!310318 () Bool)

(declare-fun res!254437 () Bool)

(assert (=> b!310318 (=> (not res!254437) (not e!222990))))

(assert (=> b!310318 (= res!254437 (arrayRangesEq!1782 a1!566 a2!566 i!943 to!659))))

(declare-fun b!310314 () Bool)

(declare-fun res!254438 () Bool)

(assert (=> b!310314 (=> (not res!254438) (not e!222990))))

(assert (=> b!310314 (= res!254438 (arrayRangesEq!1782 a1!566 a2!566 (bvadd #b00000000000000000000000000000001 i!943) to!659))))

(declare-fun res!254436 () Bool)

(assert (=> start!68738 (=> (not res!254436) (not e!222990))))

(declare-fun at!235 () (_ BitVec 32))

(assert (=> start!68738 (= res!254436 (and (bvsle #b00000000000000000000000000000000 from!692) (bvsle from!692 to!659) (bvsle (size!8186 a1!566) (size!8186 a2!566)) (bvsle to!659 (size!8186 a1!566)) (bvsle from!692 at!235) (bvslt at!235 to!659)))))

(assert (=> start!68738 e!222990))

(assert (=> start!68738 true))

(declare-fun array_inv!7748 (array!18867) Bool)

(assert (=> start!68738 (and (array_inv!7748 a2!566) e!222991)))

(assert (=> start!68738 (and (array_inv!7748 a1!566) e!222992)))

(declare-fun b!310319 () Bool)

(declare-fun res!254439 () Bool)

(assert (=> b!310319 (=> (not res!254439) (not e!222990))))

(assert (=> b!310319 (= res!254439 (and (not (= i!943 at!235)) (bvsle from!692 (bvadd #b00000000000000000000000000000001 i!943)) (bvsle (bvadd #b00000000000000000000000000000001 i!943) at!235)))))

(declare-fun b!310320 () Bool)

(declare-fun res!254435 () Bool)

(assert (=> b!310320 (=> (not res!254435) (not e!222990))))

(assert (=> b!310320 (= res!254435 (and (bvsle from!692 i!943) (bvsle i!943 at!235)))))

(assert (= (and start!68738 res!254436) b!310315))

(assert (= (and b!310315 res!254440) b!310320))

(assert (= (and b!310320 res!254435) b!310318))

(assert (= (and b!310318 res!254437) b!310319))

(assert (= (and b!310319 res!254439) b!310314))

(assert (= (and b!310314 res!254438) b!310317))

(assert (= (and b!310316 condMapEmpty!3178) mapIsEmpty!3177))

(assert (= (and b!310316 (not condMapEmpty!3178)) mapNonEmpty!3177))

(assert (= start!68738 b!310316))

(assert (= (and b!310313 condMapEmpty!3177) mapIsEmpty!3178))

(assert (= (and b!310313 (not condMapEmpty!3177)) mapNonEmpty!3178))

(assert (= start!68738 b!310313))

(declare-fun m!448139 () Bool)

(assert (=> mapNonEmpty!3178 m!448139))

(declare-fun m!448141 () Bool)

(assert (=> b!310315 m!448141))

(declare-fun m!448143 () Bool)

(assert (=> start!68738 m!448143))

(declare-fun m!448145 () Bool)

(assert (=> start!68738 m!448145))

(declare-fun m!448147 () Bool)

(assert (=> mapNonEmpty!3177 m!448147))

(declare-fun m!448149 () Bool)

(assert (=> b!310314 m!448149))

(declare-fun m!448151 () Bool)

(assert (=> b!310318 m!448151))

(check-sat (not mapNonEmpty!3178) (not mapNonEmpty!3177) (not b!310315) (not start!68738) (not b!310318) tp_is_empty!999 (not b!310314))
(check-sat)
