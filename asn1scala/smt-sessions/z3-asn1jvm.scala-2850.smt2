; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68616 () Bool)

(assert start!68616)

(declare-fun b!309168 () Bool)

(declare-fun res!253608 () Bool)

(declare-fun e!222395 () Bool)

(assert (=> b!309168 (=> (not res!253608) (not e!222395))))

(declare-fun e!222394 () Bool)

(assert (=> b!309168 (= res!253608 e!222394)))

(declare-fun res!253606 () Bool)

(assert (=> b!309168 (=> res!253606 e!222394)))

(declare-fun i!932 () (_ BitVec 32))

(declare-fun toSlice!46 () (_ BitVec 32))

(assert (=> b!309168 (= res!253606 (bvsgt i!932 toSlice!46))))

(declare-fun mapNonEmpty!2855 () Bool)

(declare-fun mapRes!2856 () Bool)

(declare-fun tp!2856 () Bool)

(declare-fun tp_is_empty!897 () Bool)

(assert (=> mapNonEmpty!2855 (= mapRes!2856 (and tp!2856 tp_is_empty!897))))

(declare-datatypes ((T!58083 0))(
  ( (T!58084 (val!448 Int)) )
))
(declare-datatypes ((array!18761 0))(
  ( (array!18762 (arr!9218 (Array (_ BitVec 32) T!58083)) (size!8135 (_ BitVec 32))) )
))
(declare-fun a2!524 () array!18761)

(declare-fun mapRest!2855 () (Array (_ BitVec 32) T!58083))

(declare-fun mapKey!2856 () (_ BitVec 32))

(declare-fun mapValue!2855 () T!58083)

(assert (=> mapNonEmpty!2855 (= (arr!9218 a2!524) (store mapRest!2855 mapKey!2856 mapValue!2855))))

(declare-fun mapNonEmpty!2856 () Bool)

(declare-fun mapRes!2855 () Bool)

(declare-fun tp!2855 () Bool)

(assert (=> mapNonEmpty!2856 (= mapRes!2855 (and tp!2855 tp_is_empty!897))))

(declare-fun mapValue!2856 () T!58083)

(declare-fun mapKey!2855 () (_ BitVec 32))

(declare-fun a1!524 () array!18761)

(declare-fun mapRest!2856 () (Array (_ BitVec 32) T!58083))

(assert (=> mapNonEmpty!2856 (= (arr!9218 a1!524) (store mapRest!2856 mapKey!2855 mapValue!2856))))

(declare-fun b!309169 () Bool)

(declare-fun res!253604 () Bool)

(assert (=> b!309169 (=> (not res!253604) (not e!222395))))

(declare-fun fromSlice!46 () (_ BitVec 32))

(assert (=> b!309169 (= res!253604 (not (= i!932 fromSlice!46)))))

(declare-fun b!309170 () Bool)

(declare-fun res!253609 () Bool)

(assert (=> b!309170 (=> (not res!253609) (not e!222395))))

(declare-fun from!650 () (_ BitVec 32))

(declare-fun to!617 () (_ BitVec 32))

(declare-fun arrayRangesEq!1748 (array!18761 array!18761 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!309170 (= res!253609 (arrayRangesEq!1748 a1!524 a2!524 from!650 to!617))))

(declare-fun b!309171 () Bool)

(declare-fun e!222396 () Bool)

(assert (=> b!309171 (= e!222396 (and tp_is_empty!897 mapRes!2856))))

(declare-fun condMapEmpty!2855 () Bool)

(declare-fun mapDefault!2856 () T!58083)

(assert (=> b!309171 (= condMapEmpty!2855 (= (arr!9218 a2!524) ((as const (Array (_ BitVec 32) T!58083)) mapDefault!2856)))))

(declare-fun b!309172 () Bool)

(declare-fun res!253607 () Bool)

(assert (=> b!309172 (=> (not res!253607) (not e!222395))))

(assert (=> b!309172 (= res!253607 (arrayRangesEq!1748 a1!524 a2!524 i!932 to!617))))

(declare-fun res!253610 () Bool)

(assert (=> start!68616 (=> (not res!253610) (not e!222395))))

(assert (=> start!68616 (= res!253610 (and (bvsle #b00000000000000000000000000000000 from!650) (bvsle from!650 to!617) (bvsle (size!8135 a1!524) (size!8135 a2!524)) (bvsle to!617 (size!8135 a1!524)) (bvsle from!650 fromSlice!46) (bvsle fromSlice!46 toSlice!46) (bvsle toSlice!46 to!617)))))

(assert (=> start!68616 e!222395))

(assert (=> start!68616 true))

(declare-fun array_inv!7717 (array!18761) Bool)

(assert (=> start!68616 (and (array_inv!7717 a2!524) e!222396)))

(declare-fun e!222393 () Bool)

(assert (=> start!68616 (and (array_inv!7717 a1!524) e!222393)))

(declare-fun b!309173 () Bool)

(assert (=> b!309173 (= e!222394 (arrayRangesEq!1748 a1!524 a2!524 i!932 toSlice!46))))

(declare-fun b!309174 () Bool)

(declare-fun res!253605 () Bool)

(assert (=> b!309174 (=> (not res!253605) (not e!222395))))

(assert (=> b!309174 (= res!253605 (and (bvsle fromSlice!46 i!932) (bvsle i!932 to!617)))))

(declare-fun mapIsEmpty!2855 () Bool)

(assert (=> mapIsEmpty!2855 mapRes!2856))

(declare-fun mapIsEmpty!2856 () Bool)

(assert (=> mapIsEmpty!2856 mapRes!2855))

(declare-fun b!309175 () Bool)

(assert (=> b!309175 (= e!222395 (not (and (bvsle fromSlice!46 (bvsub i!932 #b00000000000000000000000000000001)) (bvsle (bvsub i!932 #b00000000000000000000000000000001) to!617))))))

(assert (=> b!309175 (= (select (arr!9218 a1!524) (bvsub i!932 #b00000000000000000000000000000001)) (select (arr!9218 a2!524) (bvsub i!932 #b00000000000000000000000000000001)))))

(declare-datatypes ((Unit!21479 0))(
  ( (Unit!21480) )
))
(declare-fun lt!440364 () Unit!21479)

(declare-fun arrayRangesEqImpliesEq!310 (array!18761 array!18761 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21479)

(assert (=> b!309175 (= lt!440364 (arrayRangesEqImpliesEq!310 a1!524 a2!524 from!650 (bvsub i!932 #b00000000000000000000000000000001) to!617))))

(declare-fun b!309176 () Bool)

(assert (=> b!309176 (= e!222393 (and tp_is_empty!897 mapRes!2855))))

(declare-fun condMapEmpty!2856 () Bool)

(declare-fun mapDefault!2855 () T!58083)

(assert (=> b!309176 (= condMapEmpty!2856 (= (arr!9218 a1!524) ((as const (Array (_ BitVec 32) T!58083)) mapDefault!2855)))))

(assert (= (and start!68616 res!253610) b!309170))

(assert (= (and b!309170 res!253609) b!309174))

(assert (= (and b!309174 res!253605) b!309172))

(assert (= (and b!309172 res!253607) b!309168))

(assert (= (and b!309168 (not res!253606)) b!309173))

(assert (= (and b!309168 res!253608) b!309169))

(assert (= (and b!309169 res!253604) b!309175))

(assert (= (and b!309171 condMapEmpty!2855) mapIsEmpty!2855))

(assert (= (and b!309171 (not condMapEmpty!2855)) mapNonEmpty!2855))

(assert (= start!68616 b!309171))

(assert (= (and b!309176 condMapEmpty!2856) mapIsEmpty!2856))

(assert (= (and b!309176 (not condMapEmpty!2856)) mapNonEmpty!2856))

(assert (= start!68616 b!309176))

(declare-fun m!447227 () Bool)

(assert (=> mapNonEmpty!2856 m!447227))

(declare-fun m!447229 () Bool)

(assert (=> b!309175 m!447229))

(declare-fun m!447231 () Bool)

(assert (=> b!309175 m!447231))

(declare-fun m!447233 () Bool)

(assert (=> b!309175 m!447233))

(declare-fun m!447235 () Bool)

(assert (=> b!309173 m!447235))

(declare-fun m!447237 () Bool)

(assert (=> mapNonEmpty!2855 m!447237))

(declare-fun m!447239 () Bool)

(assert (=> b!309172 m!447239))

(declare-fun m!447241 () Bool)

(assert (=> b!309170 m!447241))

(declare-fun m!447243 () Bool)

(assert (=> start!68616 m!447243))

(declare-fun m!447245 () Bool)

(assert (=> start!68616 m!447245))

(check-sat (not b!309172) (not mapNonEmpty!2856) (not b!309175) (not b!309170) tp_is_empty!897 (not b!309173) (not start!68616) (not mapNonEmpty!2855))
(check-sat)
