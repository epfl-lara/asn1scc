; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64030 () Bool)

(assert start!64030)

(declare-fun b!285164 () Bool)

(declare-fun res!236047 () Bool)

(declare-fun e!203686 () Bool)

(assert (=> b!285164 (=> (not res!236047) (not e!203686))))

(declare-datatypes ((T!51517 0))(
  ( (T!51518 (val!235 Int)) )
))
(declare-datatypes ((array!16749 0))(
  ( (array!16750 (arr!8222 (Array (_ BitVec 32) T!51517)) (size!7226 (_ BitVec 32))) )
))
(declare-fun a1!647 () array!16749)

(declare-fun a2!647 () array!16749)

(declare-fun i!964 () (_ BitVec 32))

(declare-fun mid!71 () (_ BitVec 32))

(declare-fun arrayRangesEq!1370 (array!16749 array!16749 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!285164 (= res!236047 (arrayRangesEq!1370 a1!647 a2!647 i!964 mid!71))))

(declare-fun b!285165 () Bool)

(declare-fun res!236042 () Bool)

(assert (=> b!285165 (=> (not res!236042) (not e!203686))))

(assert (=> b!285165 (= res!236042 (not (= i!964 mid!71)))))

(declare-fun mapIsEmpty!1382 () Bool)

(declare-fun mapRes!1383 () Bool)

(assert (=> mapIsEmpty!1382 mapRes!1383))

(declare-fun res!236043 () Bool)

(assert (=> start!64030 (=> (not res!236043) (not e!203686))))

(declare-fun from!773 () (_ BitVec 32))

(declare-fun a3!68 () array!16749)

(declare-fun to!740 () (_ BitVec 32))

(assert (=> start!64030 (= res!236043 (and (bvsle #b00000000000000000000000000000000 from!773) (bvsle from!773 mid!71) (bvsle mid!71 to!740) (bvsle (size!7226 a1!647) (size!7226 a2!647)) (bvsle (size!7226 a2!647) (size!7226 a3!68)) (bvsle mid!71 (size!7226 a1!647)) (bvsle to!740 (size!7226 a2!647))))))

(assert (=> start!64030 e!203686))

(declare-fun e!203687 () Bool)

(declare-fun array_inv!6899 (array!16749) Bool)

(assert (=> start!64030 (and (array_inv!6899 a2!647) e!203687)))

(assert (=> start!64030 true))

(declare-fun e!203689 () Bool)

(assert (=> start!64030 (and (array_inv!6899 a1!647) e!203689)))

(declare-fun e!203688 () Bool)

(assert (=> start!64030 (and (array_inv!6899 a3!68) e!203688)))

(declare-fun b!285166 () Bool)

(declare-fun tp_is_empty!471 () Bool)

(assert (=> b!285166 (= e!203689 (and tp_is_empty!471 mapRes!1383))))

(declare-fun condMapEmpty!1384 () Bool)

(declare-fun mapDefault!1383 () T!51517)

(assert (=> b!285166 (= condMapEmpty!1384 (= (arr!8222 a1!647) ((as const (Array (_ BitVec 32) T!51517)) mapDefault!1383)))))

(declare-fun b!285167 () Bool)

(declare-fun res!236046 () Bool)

(assert (=> b!285167 (=> (not res!236046) (not e!203686))))

(assert (=> b!285167 (= res!236046 (arrayRangesEq!1370 a2!647 a3!68 from!773 to!740))))

(declare-fun mapIsEmpty!1383 () Bool)

(declare-fun mapRes!1384 () Bool)

(assert (=> mapIsEmpty!1383 mapRes!1384))

(declare-fun b!285168 () Bool)

(declare-fun res!236048 () Bool)

(assert (=> b!285168 (=> (not res!236048) (not e!203686))))

(assert (=> b!285168 (= res!236048 (arrayRangesEq!1370 a2!647 a3!68 i!964 to!740))))

(declare-fun b!285169 () Bool)

(assert (=> b!285169 (= e!203686 (not true))))

(assert (=> b!285169 (arrayRangesEq!1370 a1!647 a3!68 from!773 (bvadd #b00000000000000000000000000000001 i!964))))

(declare-datatypes ((Unit!19921 0))(
  ( (Unit!19922) )
))
(declare-fun lt!418557 () Unit!19921)

(declare-fun arrayRangesEqAppend!3 (array!16749 array!16749 (_ BitVec 32) (_ BitVec 32)) Unit!19921)

(assert (=> b!285169 (= lt!418557 (arrayRangesEqAppend!3 a1!647 a3!68 from!773 i!964))))

(declare-fun b!285170 () Bool)

(declare-fun res!236044 () Bool)

(assert (=> b!285170 (=> (not res!236044) (not e!203686))))

(assert (=> b!285170 (= res!236044 (arrayRangesEq!1370 a1!647 a3!68 from!773 i!964))))

(declare-fun b!285171 () Bool)

(declare-fun res!236045 () Bool)

(assert (=> b!285171 (=> (not res!236045) (not e!203686))))

(assert (=> b!285171 (= res!236045 (and (bvsle from!773 i!964) (bvsle i!964 mid!71)))))

(declare-fun b!285172 () Bool)

(declare-fun mapRes!1382 () Bool)

(assert (=> b!285172 (= e!203687 (and tp_is_empty!471 mapRes!1382))))

(declare-fun condMapEmpty!1383 () Bool)

(declare-fun mapDefault!1384 () T!51517)

(assert (=> b!285172 (= condMapEmpty!1383 (= (arr!8222 a2!647) ((as const (Array (_ BitVec 32) T!51517)) mapDefault!1384)))))

(declare-fun mapNonEmpty!1382 () Bool)

(declare-fun tp!1383 () Bool)

(assert (=> mapNonEmpty!1382 (= mapRes!1384 (and tp!1383 tp_is_empty!471))))

(declare-fun mapValue!1383 () T!51517)

(declare-fun mapKey!1384 () (_ BitVec 32))

(declare-fun mapRest!1382 () (Array (_ BitVec 32) T!51517))

(assert (=> mapNonEmpty!1382 (= (arr!8222 a3!68) (store mapRest!1382 mapKey!1384 mapValue!1383))))

(declare-fun b!285173 () Bool)

(declare-fun res!236049 () Bool)

(assert (=> b!285173 (=> (not res!236049) (not e!203686))))

(assert (=> b!285173 (= res!236049 (arrayRangesEq!1370 a1!647 a2!647 from!773 mid!71))))

(declare-fun mapNonEmpty!1383 () Bool)

(declare-fun tp!1384 () Bool)

(assert (=> mapNonEmpty!1383 (= mapRes!1383 (and tp!1384 tp_is_empty!471))))

(declare-fun mapRest!1383 () (Array (_ BitVec 32) T!51517))

(declare-fun mapValue!1384 () T!51517)

(declare-fun mapKey!1382 () (_ BitVec 32))

(assert (=> mapNonEmpty!1383 (= (arr!8222 a1!647) (store mapRest!1383 mapKey!1382 mapValue!1384))))

(declare-fun b!285174 () Bool)

(assert (=> b!285174 (= e!203688 (and tp_is_empty!471 mapRes!1384))))

(declare-fun condMapEmpty!1382 () Bool)

(declare-fun mapDefault!1382 () T!51517)

(assert (=> b!285174 (= condMapEmpty!1382 (= (arr!8222 a3!68) ((as const (Array (_ BitVec 32) T!51517)) mapDefault!1382)))))

(declare-fun mapNonEmpty!1384 () Bool)

(declare-fun tp!1382 () Bool)

(assert (=> mapNonEmpty!1384 (= mapRes!1382 (and tp!1382 tp_is_empty!471))))

(declare-fun mapKey!1383 () (_ BitVec 32))

(declare-fun mapRest!1384 () (Array (_ BitVec 32) T!51517))

(declare-fun mapValue!1382 () T!51517)

(assert (=> mapNonEmpty!1384 (= (arr!8222 a2!647) (store mapRest!1384 mapKey!1383 mapValue!1382))))

(declare-fun mapIsEmpty!1384 () Bool)

(assert (=> mapIsEmpty!1384 mapRes!1382))

(assert (= (and start!64030 res!236043) b!285173))

(assert (= (and b!285173 res!236049) b!285167))

(assert (= (and b!285167 res!236046) b!285171))

(assert (= (and b!285171 res!236045) b!285164))

(assert (= (and b!285164 res!236047) b!285168))

(assert (= (and b!285168 res!236048) b!285170))

(assert (= (and b!285170 res!236044) b!285165))

(assert (= (and b!285165 res!236042) b!285169))

(assert (= (and b!285172 condMapEmpty!1383) mapIsEmpty!1384))

(assert (= (and b!285172 (not condMapEmpty!1383)) mapNonEmpty!1384))

(assert (= start!64030 b!285172))

(assert (= (and b!285166 condMapEmpty!1384) mapIsEmpty!1382))

(assert (= (and b!285166 (not condMapEmpty!1384)) mapNonEmpty!1383))

(assert (= start!64030 b!285166))

(assert (= (and b!285174 condMapEmpty!1382) mapIsEmpty!1383))

(assert (= (and b!285174 (not condMapEmpty!1382)) mapNonEmpty!1382))

(assert (= start!64030 b!285174))

(declare-fun m!418205 () Bool)

(assert (=> start!64030 m!418205))

(declare-fun m!418207 () Bool)

(assert (=> start!64030 m!418207))

(declare-fun m!418209 () Bool)

(assert (=> start!64030 m!418209))

(declare-fun m!418211 () Bool)

(assert (=> b!285170 m!418211))

(declare-fun m!418213 () Bool)

(assert (=> mapNonEmpty!1384 m!418213))

(declare-fun m!418215 () Bool)

(assert (=> b!285164 m!418215))

(declare-fun m!418217 () Bool)

(assert (=> b!285173 m!418217))

(declare-fun m!418219 () Bool)

(assert (=> b!285167 m!418219))

(declare-fun m!418221 () Bool)

(assert (=> b!285169 m!418221))

(declare-fun m!418223 () Bool)

(assert (=> b!285169 m!418223))

(declare-fun m!418225 () Bool)

(assert (=> b!285168 m!418225))

(declare-fun m!418227 () Bool)

(assert (=> mapNonEmpty!1383 m!418227))

(declare-fun m!418229 () Bool)

(assert (=> mapNonEmpty!1382 m!418229))

(check-sat (not b!285168) (not mapNonEmpty!1383) tp_is_empty!471 (not b!285167) (not b!285164) (not mapNonEmpty!1384) (not b!285169) (not b!285173) (not mapNonEmpty!1382) (not b!285170) (not start!64030))
(check-sat)
