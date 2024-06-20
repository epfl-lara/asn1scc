; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64206 () Bool)

(assert start!64206)

(declare-fun res!237749 () Bool)

(declare-fun e!204680 () Bool)

(assert (=> start!64206 (=> (not res!237749) (not e!204680))))

(declare-fun to!673 () (_ BitVec 32))

(declare-fun from!706 () (_ BitVec 32))

(declare-datatypes ((T!52193 0))(
  ( (T!52194 (val!313 Int)) )
))
(declare-datatypes ((array!16909 0))(
  ( (array!16910 (arr!8300 (Array (_ BitVec 32) T!52193)) (size!7304 (_ BitVec 32))) )
))
(declare-fun a2!580 () array!16909)

(declare-fun a1!580 () array!16909)

(assert (=> start!64206 (= res!237749 (and (bvsle #b00000000000000000000000000000000 from!706) (bvsle from!706 to!673) (bvsle (size!7304 a1!580) (size!7304 a2!580)) (bvslt to!673 (size!7304 a1!580))))))

(assert (=> start!64206 e!204680))

(assert (=> start!64206 true))

(declare-fun e!204678 () Bool)

(declare-fun array_inv!6942 (array!16909) Bool)

(assert (=> start!64206 (and (array_inv!6942 a1!580) e!204678)))

(declare-fun e!204679 () Bool)

(assert (=> start!64206 (and (array_inv!6942 a2!580) e!204679)))

(declare-fun mapNonEmpty!2037 () Bool)

(declare-fun mapRes!2038 () Bool)

(declare-fun tp!2038 () Bool)

(declare-fun tp_is_empty!627 () Bool)

(assert (=> mapNonEmpty!2037 (= mapRes!2038 (and tp!2038 tp_is_empty!627))))

(declare-fun mapKey!2037 () (_ BitVec 32))

(declare-fun mapValue!2037 () T!52193)

(declare-fun mapRest!2038 () (Array (_ BitVec 32) T!52193))

(assert (=> mapNonEmpty!2037 (= (arr!8300 a1!580) (store mapRest!2038 mapKey!2037 mapValue!2037))))

(declare-fun b!287512 () Bool)

(declare-fun res!237750 () Bool)

(assert (=> b!287512 (=> (not res!237750) (not e!204680))))

(declare-fun arrayRangesEq!1427 (array!16909 array!16909 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!287512 (= res!237750 (arrayRangesEq!1427 a1!580 a2!580 to!673 (bvadd #b00000000000000000000000000000001 to!673)))))

(declare-fun mapIsEmpty!2037 () Bool)

(declare-fun mapRes!2037 () Bool)

(assert (=> mapIsEmpty!2037 mapRes!2037))

(declare-fun mapNonEmpty!2038 () Bool)

(declare-fun tp!2037 () Bool)

(assert (=> mapNonEmpty!2038 (= mapRes!2037 (and tp!2037 tp_is_empty!627))))

(declare-fun mapRest!2037 () (Array (_ BitVec 32) T!52193))

(declare-fun mapKey!2038 () (_ BitVec 32))

(declare-fun mapValue!2038 () T!52193)

(assert (=> mapNonEmpty!2038 (= (arr!8300 a2!580) (store mapRest!2037 mapKey!2038 mapValue!2038))))

(declare-fun b!287513 () Bool)

(assert (=> b!287513 (= e!204680 (not (or (not (= (bvand to!673 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (= (bvand to!673 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 to!673) #b10000000000000000000000000000000)))))))

(assert (=> b!287513 (arrayRangesEq!1427 a1!580 a2!580 from!706 (bvadd #b00000000000000000000000000000001 to!673))))

(declare-datatypes ((Unit!19973 0))(
  ( (Unit!19974) )
))
(declare-fun lt!418743 () Unit!19973)

(declare-fun rec!75 (array!16909 array!16909 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19973)

(assert (=> b!287513 (= lt!418743 (rec!75 a1!580 a2!580 from!706 to!673 to!673))))

(declare-fun b!287514 () Bool)

(declare-fun res!237748 () Bool)

(assert (=> b!287514 (=> (not res!237748) (not e!204680))))

(assert (=> b!287514 (= res!237748 (= (select (arr!8300 a1!580) to!673) (select (arr!8300 a2!580) to!673)))))

(declare-fun mapIsEmpty!2038 () Bool)

(assert (=> mapIsEmpty!2038 mapRes!2038))

(declare-fun b!287515 () Bool)

(assert (=> b!287515 (= e!204679 (and tp_is_empty!627 mapRes!2037))))

(declare-fun condMapEmpty!2038 () Bool)

(declare-fun mapDefault!2038 () T!52193)

(assert (=> b!287515 (= condMapEmpty!2038 (= (arr!8300 a2!580) ((as const (Array (_ BitVec 32) T!52193)) mapDefault!2038)))))

(declare-fun b!287516 () Bool)

(declare-fun res!237751 () Bool)

(assert (=> b!287516 (=> (not res!237751) (not e!204680))))

(assert (=> b!287516 (= res!237751 (arrayRangesEq!1427 a1!580 a2!580 from!706 to!673))))

(declare-fun b!287517 () Bool)

(assert (=> b!287517 (= e!204678 (and tp_is_empty!627 mapRes!2038))))

(declare-fun condMapEmpty!2037 () Bool)

(declare-fun mapDefault!2037 () T!52193)

(assert (=> b!287517 (= condMapEmpty!2037 (= (arr!8300 a1!580) ((as const (Array (_ BitVec 32) T!52193)) mapDefault!2037)))))

(assert (= (and start!64206 res!237749) b!287516))

(assert (= (and b!287516 res!237751) b!287514))

(assert (= (and b!287514 res!237748) b!287512))

(assert (= (and b!287512 res!237750) b!287513))

(assert (= (and b!287517 condMapEmpty!2037) mapIsEmpty!2038))

(assert (= (and b!287517 (not condMapEmpty!2037)) mapNonEmpty!2037))

(assert (= start!64206 b!287517))

(assert (= (and b!287515 condMapEmpty!2038) mapIsEmpty!2037))

(assert (= (and b!287515 (not condMapEmpty!2038)) mapNonEmpty!2038))

(assert (= start!64206 b!287515))

(declare-fun m!420201 () Bool)

(assert (=> b!287516 m!420201))

(declare-fun m!420203 () Bool)

(assert (=> mapNonEmpty!2037 m!420203))

(declare-fun m!420205 () Bool)

(assert (=> b!287513 m!420205))

(declare-fun m!420207 () Bool)

(assert (=> b!287513 m!420207))

(declare-fun m!420209 () Bool)

(assert (=> start!64206 m!420209))

(declare-fun m!420211 () Bool)

(assert (=> start!64206 m!420211))

(declare-fun m!420213 () Bool)

(assert (=> b!287512 m!420213))

(declare-fun m!420215 () Bool)

(assert (=> b!287514 m!420215))

(declare-fun m!420217 () Bool)

(assert (=> b!287514 m!420217))

(declare-fun m!420219 () Bool)

(assert (=> mapNonEmpty!2038 m!420219))

(check-sat (not start!64206) (not b!287516) (not mapNonEmpty!2037) tp_is_empty!627 (not b!287513) (not mapNonEmpty!2038) (not b!287512))
(check-sat)
