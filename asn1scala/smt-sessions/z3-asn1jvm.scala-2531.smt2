; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63954 () Bool)

(assert start!63954)

(declare-fun mapIsEmpty!1053 () Bool)

(declare-fun mapRes!1053 () Bool)

(assert (=> mapIsEmpty!1053 mapRes!1053))

(declare-fun mapIsEmpty!1054 () Bool)

(declare-fun mapRes!1054 () Bool)

(assert (=> mapIsEmpty!1054 mapRes!1054))

(declare-fun mapNonEmpty!1054 () Bool)

(declare-fun mapRes!1055 () Bool)

(declare-fun tp!1054 () Bool)

(declare-fun tp_is_empty!399 () Bool)

(assert (=> mapNonEmpty!1054 (= mapRes!1055 (and tp!1054 tp_is_empty!399))))

(declare-datatypes ((T!51205 0))(
  ( (T!51206 (val!199 Int)) )
))
(declare-fun mapValue!1054 () T!51205)

(declare-datatypes ((array!16676 0))(
  ( (array!16677 (arr!8186 (Array (_ BitVec 32) T!51205)) (size!7190 (_ BitVec 32))) )
))
(declare-fun a1!623 () array!16676)

(declare-fun mapRest!1055 () (Array (_ BitVec 32) T!51205))

(declare-fun mapKey!1053 () (_ BitVec 32))

(assert (=> mapNonEmpty!1054 (= (arr!8186 a1!623) (store mapRest!1055 mapKey!1053 mapValue!1054))))

(declare-fun mapIsEmpty!1055 () Bool)

(assert (=> mapIsEmpty!1055 mapRes!1055))

(declare-fun b!284294 () Bool)

(declare-fun e!203246 () Bool)

(assert (=> b!284294 (= e!203246 (and tp_is_empty!399 mapRes!1053))))

(declare-fun condMapEmpty!1054 () Bool)

(declare-fun a2!623 () array!16676)

(declare-fun mapDefault!1054 () T!51205)

(assert (=> b!284294 (= condMapEmpty!1054 (= (arr!8186 a2!623) ((as const (Array (_ BitVec 32) T!51205)) mapDefault!1054)))))

(declare-fun mapNonEmpty!1055 () Bool)

(declare-fun tp!1055 () Bool)

(assert (=> mapNonEmpty!1055 (= mapRes!1053 (and tp!1055 tp_is_empty!399))))

(declare-fun mapKey!1054 () (_ BitVec 32))

(declare-fun mapRest!1053 () (Array (_ BitVec 32) T!51205))

(declare-fun mapValue!1055 () T!51205)

(assert (=> mapNonEmpty!1055 (= (arr!8186 a2!623) (store mapRest!1053 mapKey!1054 mapValue!1055))))

(declare-fun b!284295 () Bool)

(declare-fun e!203244 () Bool)

(assert (=> b!284295 (= e!203244 (and tp_is_empty!399 mapRes!1054))))

(declare-fun condMapEmpty!1053 () Bool)

(declare-fun a3!63 () array!16676)

(declare-fun mapDefault!1055 () T!51205)

(assert (=> b!284295 (= condMapEmpty!1053 (= (arr!8186 a3!63) ((as const (Array (_ BitVec 32) T!51205)) mapDefault!1055)))))

(declare-fun b!284296 () Bool)

(declare-fun res!235499 () Bool)

(declare-fun e!203245 () Bool)

(assert (=> b!284296 (=> (not res!235499) (not e!203245))))

(declare-fun mid!66 () (_ BitVec 32))

(declare-fun from!749 () (_ BitVec 32))

(declare-fun arrayRangesEq!1345 (array!16676 array!16676 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!284296 (= res!235499 (arrayRangesEq!1345 a1!623 a2!623 from!749 mid!66))))

(declare-fun mapNonEmpty!1053 () Bool)

(declare-fun tp!1053 () Bool)

(assert (=> mapNonEmpty!1053 (= mapRes!1054 (and tp!1053 tp_is_empty!399))))

(declare-fun mapKey!1055 () (_ BitVec 32))

(declare-fun mapValue!1053 () T!51205)

(declare-fun mapRest!1054 () (Array (_ BitVec 32) T!51205))

(assert (=> mapNonEmpty!1053 (= (arr!8186 a3!63) (store mapRest!1054 mapKey!1055 mapValue!1053))))

(declare-fun res!235498 () Bool)

(assert (=> start!63954 (=> (not res!235498) (not e!203245))))

(declare-fun to!716 () (_ BitVec 32))

(assert (=> start!63954 (= res!235498 (and (bvsle #b00000000000000000000000000000000 from!749) (bvsle from!749 mid!66) (bvsle mid!66 to!716) (bvsle (size!7190 a1!623) (size!7190 a2!623)) (bvsle (size!7190 a2!623) (size!7190 a3!63)) (bvsle mid!66 (size!7190 a1!623)) (bvsle to!716 (size!7190 a2!623))))))

(assert (=> start!63954 e!203245))

(declare-fun array_inv!6882 (array!16676) Bool)

(assert (=> start!63954 (and (array_inv!6882 a2!623) e!203246)))

(declare-fun e!203247 () Bool)

(assert (=> start!63954 (and (array_inv!6882 a1!623) e!203247)))

(assert (=> start!63954 true))

(assert (=> start!63954 (and (array_inv!6882 a3!63) e!203244)))

(declare-fun b!284297 () Bool)

(assert (=> b!284297 (= e!203247 (and tp_is_empty!399 mapRes!1055))))

(declare-fun condMapEmpty!1055 () Bool)

(declare-fun mapDefault!1053 () T!51205)

(assert (=> b!284297 (= condMapEmpty!1055 (= (arr!8186 a1!623) ((as const (Array (_ BitVec 32) T!51205)) mapDefault!1053)))))

(declare-fun b!284298 () Bool)

(assert (=> b!284298 (= e!203245 (bvsgt from!749 to!716))))

(assert (= (and start!63954 res!235498) b!284296))

(assert (= (and b!284296 res!235499) b!284298))

(assert (= (and b!284294 condMapEmpty!1054) mapIsEmpty!1053))

(assert (= (and b!284294 (not condMapEmpty!1054)) mapNonEmpty!1055))

(assert (= start!63954 b!284294))

(assert (= (and b!284297 condMapEmpty!1055) mapIsEmpty!1055))

(assert (= (and b!284297 (not condMapEmpty!1055)) mapNonEmpty!1054))

(assert (= start!63954 b!284297))

(assert (= (and b!284295 condMapEmpty!1053) mapIsEmpty!1054))

(assert (= (and b!284295 (not condMapEmpty!1053)) mapNonEmpty!1053))

(assert (= start!63954 b!284295))

(declare-fun m!417449 () Bool)

(assert (=> mapNonEmpty!1054 m!417449))

(declare-fun m!417451 () Bool)

(assert (=> mapNonEmpty!1055 m!417451))

(declare-fun m!417453 () Bool)

(assert (=> b!284296 m!417453))

(declare-fun m!417455 () Bool)

(assert (=> mapNonEmpty!1053 m!417455))

(declare-fun m!417457 () Bool)

(assert (=> start!63954 m!417457))

(declare-fun m!417459 () Bool)

(assert (=> start!63954 m!417459))

(declare-fun m!417461 () Bool)

(assert (=> start!63954 m!417461))

(check-sat (not b!284296) (not mapNonEmpty!1053) (not mapNonEmpty!1055) tp_is_empty!399 (not start!63954) (not mapNonEmpty!1054))
(check-sat)
