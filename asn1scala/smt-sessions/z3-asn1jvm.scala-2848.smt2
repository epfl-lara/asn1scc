; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68604 () Bool)

(assert start!68604)

(declare-fun b!309010 () Bool)

(declare-fun res!253482 () Bool)

(declare-fun e!222321 () Bool)

(assert (=> b!309010 (=> (not res!253482) (not e!222321))))

(declare-fun fromSlice!46 () (_ BitVec 32))

(declare-fun to!617 () (_ BitVec 32))

(declare-fun i!932 () (_ BitVec 32))

(assert (=> b!309010 (= res!253482 (and (bvsle fromSlice!46 i!932) (bvsle i!932 to!617)))))

(declare-fun b!309011 () Bool)

(declare-fun e!222322 () Bool)

(declare-fun tp_is_empty!885 () Bool)

(declare-fun mapRes!2819 () Bool)

(assert (=> b!309011 (= e!222322 (and tp_is_empty!885 mapRes!2819))))

(declare-fun condMapEmpty!2819 () Bool)

(declare-datatypes ((T!58031 0))(
  ( (T!58032 (val!442 Int)) )
))
(declare-datatypes ((array!18749 0))(
  ( (array!18750 (arr!9212 (Array (_ BitVec 32) T!58031)) (size!8129 (_ BitVec 32))) )
))
(declare-fun a2!524 () array!18749)

(declare-fun mapDefault!2819 () T!58031)

(assert (=> b!309011 (= condMapEmpty!2819 (= (arr!9212 a2!524) ((as const (Array (_ BitVec 32) T!58031)) mapDefault!2819)))))

(declare-fun b!309012 () Bool)

(declare-fun res!253487 () Bool)

(assert (=> b!309012 (=> (not res!253487) (not e!222321))))

(declare-fun e!222324 () Bool)

(assert (=> b!309012 (= res!253487 e!222324)))

(declare-fun res!253486 () Bool)

(assert (=> b!309012 (=> res!253486 e!222324)))

(declare-fun toSlice!46 () (_ BitVec 32))

(assert (=> b!309012 (= res!253486 (bvsgt i!932 toSlice!46))))

(declare-fun mapIsEmpty!2819 () Bool)

(assert (=> mapIsEmpty!2819 mapRes!2819))

(declare-fun a1!524 () array!18749)

(declare-fun b!309013 () Bool)

(declare-fun arrayRangesEq!1743 (array!18749 array!18749 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!309013 (= e!222324 (arrayRangesEq!1743 a1!524 a2!524 i!932 toSlice!46))))

(declare-fun b!309014 () Bool)

(declare-fun e!222323 () Bool)

(declare-fun mapRes!2820 () Bool)

(assert (=> b!309014 (= e!222323 (and tp_is_empty!885 mapRes!2820))))

(declare-fun condMapEmpty!2820 () Bool)

(declare-fun mapDefault!2820 () T!58031)

(assert (=> b!309014 (= condMapEmpty!2820 (= (arr!9212 a1!524) ((as const (Array (_ BitVec 32) T!58031)) mapDefault!2820)))))

(declare-fun from!650 () (_ BitVec 32))

(declare-fun b!309015 () Bool)

(assert (=> b!309015 (= e!222321 (and (not (= i!932 fromSlice!46)) (bvsgt from!650 (bvsub i!932 #b00000000000000000000000000000001))))))

(declare-fun res!253485 () Bool)

(assert (=> start!68604 (=> (not res!253485) (not e!222321))))

(assert (=> start!68604 (= res!253485 (and (bvsle #b00000000000000000000000000000000 from!650) (bvsle from!650 to!617) (bvsle (size!8129 a1!524) (size!8129 a2!524)) (bvsle to!617 (size!8129 a1!524)) (bvsle from!650 fromSlice!46) (bvsle fromSlice!46 toSlice!46) (bvsle toSlice!46 to!617)))))

(assert (=> start!68604 e!222321))

(assert (=> start!68604 true))

(declare-fun array_inv!7714 (array!18749) Bool)

(assert (=> start!68604 (and (array_inv!7714 a2!524) e!222322)))

(assert (=> start!68604 (and (array_inv!7714 a1!524) e!222323)))

(declare-fun mapNonEmpty!2819 () Bool)

(declare-fun tp!2819 () Bool)

(assert (=> mapNonEmpty!2819 (= mapRes!2820 (and tp!2819 tp_is_empty!885))))

(declare-fun mapRest!2819 () (Array (_ BitVec 32) T!58031))

(declare-fun mapValue!2820 () T!58031)

(declare-fun mapKey!2820 () (_ BitVec 32))

(assert (=> mapNonEmpty!2819 (= (arr!9212 a1!524) (store mapRest!2819 mapKey!2820 mapValue!2820))))

(declare-fun mapIsEmpty!2820 () Bool)

(assert (=> mapIsEmpty!2820 mapRes!2820))

(declare-fun b!309016 () Bool)

(declare-fun res!253483 () Bool)

(assert (=> b!309016 (=> (not res!253483) (not e!222321))))

(assert (=> b!309016 (= res!253483 (arrayRangesEq!1743 a1!524 a2!524 i!932 to!617))))

(declare-fun b!309017 () Bool)

(declare-fun res!253484 () Bool)

(assert (=> b!309017 (=> (not res!253484) (not e!222321))))

(assert (=> b!309017 (= res!253484 (arrayRangesEq!1743 a1!524 a2!524 from!650 to!617))))

(declare-fun mapNonEmpty!2820 () Bool)

(declare-fun tp!2820 () Bool)

(assert (=> mapNonEmpty!2820 (= mapRes!2819 (and tp!2820 tp_is_empty!885))))

(declare-fun mapValue!2819 () T!58031)

(declare-fun mapRest!2820 () (Array (_ BitVec 32) T!58031))

(declare-fun mapKey!2819 () (_ BitVec 32))

(assert (=> mapNonEmpty!2820 (= (arr!9212 a2!524) (store mapRest!2820 mapKey!2819 mapValue!2819))))

(assert (= (and start!68604 res!253485) b!309017))

(assert (= (and b!309017 res!253484) b!309010))

(assert (= (and b!309010 res!253482) b!309016))

(assert (= (and b!309016 res!253483) b!309012))

(assert (= (and b!309012 (not res!253486)) b!309013))

(assert (= (and b!309012 res!253487) b!309015))

(assert (= (and b!309011 condMapEmpty!2819) mapIsEmpty!2819))

(assert (= (and b!309011 (not condMapEmpty!2819)) mapNonEmpty!2820))

(assert (= start!68604 b!309011))

(assert (= (and b!309014 condMapEmpty!2820) mapIsEmpty!2820))

(assert (= (and b!309014 (not condMapEmpty!2820)) mapNonEmpty!2819))

(assert (= start!68604 b!309014))

(declare-fun m!447119 () Bool)

(assert (=> b!309013 m!447119))

(declare-fun m!447121 () Bool)

(assert (=> b!309017 m!447121))

(declare-fun m!447123 () Bool)

(assert (=> start!68604 m!447123))

(declare-fun m!447125 () Bool)

(assert (=> start!68604 m!447125))

(declare-fun m!447127 () Bool)

(assert (=> b!309016 m!447127))

(declare-fun m!447129 () Bool)

(assert (=> mapNonEmpty!2820 m!447129))

(declare-fun m!447131 () Bool)

(assert (=> mapNonEmpty!2819 m!447131))

(check-sat (not b!309013) (not b!309017) (not start!68604) (not mapNonEmpty!2820) (not b!309016) (not mapNonEmpty!2819) tp_is_empty!885)
(check-sat)
