; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68756 () Bool)

(assert start!68756)

(declare-fun b!310529 () Bool)

(declare-fun res!254600 () Bool)

(declare-fun e!223073 () Bool)

(assert (=> b!310529 (=> (not res!254600) (not e!223073))))

(declare-fun i!943 () (_ BitVec 32))

(declare-fun at!235 () (_ BitVec 32))

(declare-fun from!692 () (_ BitVec 32))

(assert (=> b!310529 (= res!254600 (and (bvsle from!692 i!943) (bvsle i!943 at!235)))))

(declare-fun b!310530 () Bool)

(assert (=> b!310530 (= e!223073 (not true))))

(declare-datatypes ((T!58603 0))(
  ( (T!58604 (val!508 Int)) )
))
(declare-datatypes ((array!18885 0))(
  ( (array!18886 (arr!9278 (Array (_ BitVec 32) T!58603)) (size!8195 (_ BitVec 32))) )
))
(declare-fun a1!566 () array!18885)

(declare-fun a2!566 () array!18885)

(assert (=> b!310530 (= (select (arr!9278 a1!566) at!235) (select (arr!9278 a2!566) at!235))))

(declare-fun to!659 () (_ BitVec 32))

(declare-datatypes ((Unit!21505 0))(
  ( (Unit!21506) )
))
(declare-fun lt!440469 () Unit!21505)

(declare-fun rec!110 (array!18885 array!18885 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21505)

(assert (=> b!310530 (= lt!440469 (rec!110 a1!566 a2!566 at!235 from!692 to!659 (bvadd #b00000000000000000000000000000001 i!943)))))

(declare-fun mapIsEmpty!3231 () Bool)

(declare-fun mapRes!3232 () Bool)

(assert (=> mapIsEmpty!3231 mapRes!3232))

(declare-fun b!310531 () Bool)

(declare-fun res!254601 () Bool)

(assert (=> b!310531 (=> (not res!254601) (not e!223073))))

(declare-fun arrayRangesEq!1789 (array!18885 array!18885 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!310531 (= res!254601 (arrayRangesEq!1789 a1!566 a2!566 i!943 to!659))))

(declare-fun res!254599 () Bool)

(assert (=> start!68756 (=> (not res!254599) (not e!223073))))

(assert (=> start!68756 (= res!254599 (and (bvsle #b00000000000000000000000000000000 from!692) (bvsle from!692 to!659) (bvsle (size!8195 a1!566) (size!8195 a2!566)) (bvsle to!659 (size!8195 a1!566)) (bvsle from!692 at!235) (bvslt at!235 to!659)))))

(assert (=> start!68756 e!223073))

(assert (=> start!68756 true))

(declare-fun e!223071 () Bool)

(declare-fun array_inv!7751 (array!18885) Bool)

(assert (=> start!68756 (and (array_inv!7751 a2!566) e!223071)))

(declare-fun e!223072 () Bool)

(assert (=> start!68756 (and (array_inv!7751 a1!566) e!223072)))

(declare-fun mapNonEmpty!3231 () Bool)

(declare-fun mapRes!3231 () Bool)

(declare-fun tp!3231 () Bool)

(declare-fun tp_is_empty!1017 () Bool)

(assert (=> mapNonEmpty!3231 (= mapRes!3231 (and tp!3231 tp_is_empty!1017))))

(declare-fun mapValue!3232 () T!58603)

(declare-fun mapKey!3231 () (_ BitVec 32))

(declare-fun mapRest!3231 () (Array (_ BitVec 32) T!58603))

(assert (=> mapNonEmpty!3231 (= (arr!9278 a2!566) (store mapRest!3231 mapKey!3231 mapValue!3232))))

(declare-fun b!310532 () Bool)

(assert (=> b!310532 (= e!223072 (and tp_is_empty!1017 mapRes!3232))))

(declare-fun condMapEmpty!3232 () Bool)

(declare-fun mapDefault!3231 () T!58603)

(assert (=> b!310532 (= condMapEmpty!3232 (= (arr!9278 a1!566) ((as const (Array (_ BitVec 32) T!58603)) mapDefault!3231)))))

(declare-fun b!310533 () Bool)

(assert (=> b!310533 (= e!223071 (and tp_is_empty!1017 mapRes!3231))))

(declare-fun condMapEmpty!3231 () Bool)

(declare-fun mapDefault!3232 () T!58603)

(assert (=> b!310533 (= condMapEmpty!3231 (= (arr!9278 a2!566) ((as const (Array (_ BitVec 32) T!58603)) mapDefault!3232)))))

(declare-fun b!310534 () Bool)

(declare-fun res!254602 () Bool)

(assert (=> b!310534 (=> (not res!254602) (not e!223073))))

(assert (=> b!310534 (= res!254602 (and (not (= i!943 at!235)) (bvsle from!692 (bvadd #b00000000000000000000000000000001 i!943)) (bvsle (bvadd #b00000000000000000000000000000001 i!943) at!235)))))

(declare-fun mapIsEmpty!3232 () Bool)

(assert (=> mapIsEmpty!3232 mapRes!3231))

(declare-fun b!310535 () Bool)

(declare-fun res!254597 () Bool)

(assert (=> b!310535 (=> (not res!254597) (not e!223073))))

(assert (=> b!310535 (= res!254597 (arrayRangesEq!1789 a1!566 a2!566 (bvadd #b00000000000000000000000000000001 i!943) to!659))))

(declare-fun b!310536 () Bool)

(declare-fun res!254598 () Bool)

(assert (=> b!310536 (=> (not res!254598) (not e!223073))))

(assert (=> b!310536 (= res!254598 (arrayRangesEq!1789 a1!566 a2!566 from!692 to!659))))

(declare-fun mapNonEmpty!3232 () Bool)

(declare-fun tp!3232 () Bool)

(assert (=> mapNonEmpty!3232 (= mapRes!3232 (and tp!3232 tp_is_empty!1017))))

(declare-fun mapRest!3232 () (Array (_ BitVec 32) T!58603))

(declare-fun mapValue!3231 () T!58603)

(declare-fun mapKey!3232 () (_ BitVec 32))

(assert (=> mapNonEmpty!3232 (= (arr!9278 a1!566) (store mapRest!3232 mapKey!3232 mapValue!3231))))

(assert (= (and start!68756 res!254599) b!310536))

(assert (= (and b!310536 res!254598) b!310529))

(assert (= (and b!310529 res!254600) b!310531))

(assert (= (and b!310531 res!254601) b!310534))

(assert (= (and b!310534 res!254602) b!310535))

(assert (= (and b!310535 res!254597) b!310530))

(assert (= (and b!310533 condMapEmpty!3231) mapIsEmpty!3232))

(assert (= (and b!310533 (not condMapEmpty!3231)) mapNonEmpty!3231))

(assert (= start!68756 b!310533))

(assert (= (and b!310532 condMapEmpty!3232) mapIsEmpty!3231))

(assert (= (and b!310532 (not condMapEmpty!3232)) mapNonEmpty!3232))

(assert (= start!68756 b!310532))

(declare-fun m!448307 () Bool)

(assert (=> mapNonEmpty!3232 m!448307))

(declare-fun m!448309 () Bool)

(assert (=> mapNonEmpty!3231 m!448309))

(declare-fun m!448311 () Bool)

(assert (=> b!310531 m!448311))

(declare-fun m!448313 () Bool)

(assert (=> b!310536 m!448313))

(declare-fun m!448315 () Bool)

(assert (=> b!310535 m!448315))

(declare-fun m!448317 () Bool)

(assert (=> start!68756 m!448317))

(declare-fun m!448319 () Bool)

(assert (=> start!68756 m!448319))

(declare-fun m!448321 () Bool)

(assert (=> b!310530 m!448321))

(declare-fun m!448323 () Bool)

(assert (=> b!310530 m!448323))

(declare-fun m!448325 () Bool)

(assert (=> b!310530 m!448325))

(check-sat (not b!310531) tp_is_empty!1017 (not b!310536) (not start!68756) (not b!310530) (not mapNonEmpty!3232) (not mapNonEmpty!3231) (not b!310535))
(check-sat)
