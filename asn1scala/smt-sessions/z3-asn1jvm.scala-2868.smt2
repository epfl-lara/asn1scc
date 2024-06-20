; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68744 () Bool)

(assert start!68744)

(declare-fun b!310385 () Bool)

(declare-fun res!254492 () Bool)

(declare-fun e!223017 () Bool)

(assert (=> b!310385 (=> (not res!254492) (not e!223017))))

(declare-fun to!659 () (_ BitVec 32))

(declare-datatypes ((T!58551 0))(
  ( (T!58552 (val!502 Int)) )
))
(declare-datatypes ((array!18873 0))(
  ( (array!18874 (arr!9272 (Array (_ BitVec 32) T!58551)) (size!8189 (_ BitVec 32))) )
))
(declare-fun a2!566 () array!18873)

(declare-fun a1!566 () array!18873)

(declare-fun from!692 () (_ BitVec 32))

(declare-fun arrayRangesEq!1785 (array!18873 array!18873 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!310385 (= res!254492 (arrayRangesEq!1785 a1!566 a2!566 from!692 to!659))))

(declare-fun mapIsEmpty!3195 () Bool)

(declare-fun mapRes!3195 () Bool)

(assert (=> mapIsEmpty!3195 mapRes!3195))

(declare-fun b!310386 () Bool)

(declare-fun res!254491 () Bool)

(assert (=> b!310386 (=> (not res!254491) (not e!223017))))

(declare-fun i!943 () (_ BitVec 32))

(declare-fun at!235 () (_ BitVec 32))

(assert (=> b!310386 (= res!254491 (and (not (= i!943 at!235)) (bvsle from!692 (bvadd #b00000000000000000000000000000001 i!943)) (bvsle (bvadd #b00000000000000000000000000000001 i!943) at!235)))))

(declare-fun b!310387 () Bool)

(declare-fun e!223018 () Bool)

(declare-fun tp_is_empty!1005 () Bool)

(assert (=> b!310387 (= e!223018 (and tp_is_empty!1005 mapRes!3195))))

(declare-fun condMapEmpty!3196 () Bool)

(declare-fun mapDefault!3195 () T!58551)

(assert (=> b!310387 (= condMapEmpty!3196 (= (arr!9272 a1!566) ((as const (Array (_ BitVec 32) T!58551)) mapDefault!3195)))))

(declare-fun mapNonEmpty!3195 () Bool)

(declare-fun tp!3196 () Bool)

(assert (=> mapNonEmpty!3195 (= mapRes!3195 (and tp!3196 tp_is_empty!1005))))

(declare-fun mapKey!3196 () (_ BitVec 32))

(declare-fun mapRest!3195 () (Array (_ BitVec 32) T!58551))

(declare-fun mapValue!3195 () T!58551)

(assert (=> mapNonEmpty!3195 (= (arr!9272 a1!566) (store mapRest!3195 mapKey!3196 mapValue!3195))))

(declare-fun b!310388 () Bool)

(assert (=> b!310388 (= e!223017 (not (and (bvsge at!235 #b00000000000000000000000000000000) (bvslt at!235 (size!8189 a1!566)))))))

(assert (=> b!310388 (= (select (arr!9272 a1!566) at!235) (select (arr!9272 a2!566) at!235))))

(declare-datatypes ((Unit!21499 0))(
  ( (Unit!21500) )
))
(declare-fun lt!440451 () Unit!21499)

(declare-fun rec!107 (array!18873 array!18873 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21499)

(assert (=> b!310388 (= lt!440451 (rec!107 a1!566 a2!566 at!235 from!692 to!659 (bvadd #b00000000000000000000000000000001 i!943)))))

(declare-fun b!310389 () Bool)

(declare-fun res!254493 () Bool)

(assert (=> b!310389 (=> (not res!254493) (not e!223017))))

(assert (=> b!310389 (= res!254493 (arrayRangesEq!1785 a1!566 a2!566 i!943 to!659))))

(declare-fun mapNonEmpty!3196 () Bool)

(declare-fun mapRes!3196 () Bool)

(declare-fun tp!3195 () Bool)

(assert (=> mapNonEmpty!3196 (= mapRes!3196 (and tp!3195 tp_is_empty!1005))))

(declare-fun mapRest!3196 () (Array (_ BitVec 32) T!58551))

(declare-fun mapKey!3195 () (_ BitVec 32))

(declare-fun mapValue!3196 () T!58551)

(assert (=> mapNonEmpty!3196 (= (arr!9272 a2!566) (store mapRest!3196 mapKey!3195 mapValue!3196))))

(declare-fun mapIsEmpty!3196 () Bool)

(assert (=> mapIsEmpty!3196 mapRes!3196))

(declare-fun res!254490 () Bool)

(assert (=> start!68744 (=> (not res!254490) (not e!223017))))

(assert (=> start!68744 (= res!254490 (and (bvsle #b00000000000000000000000000000000 from!692) (bvsle from!692 to!659) (bvsle (size!8189 a1!566) (size!8189 a2!566)) (bvsle to!659 (size!8189 a1!566)) (bvsle from!692 at!235) (bvslt at!235 to!659)))))

(assert (=> start!68744 e!223017))

(assert (=> start!68744 true))

(declare-fun e!223019 () Bool)

(declare-fun array_inv!7749 (array!18873) Bool)

(assert (=> start!68744 (and (array_inv!7749 a2!566) e!223019)))

(assert (=> start!68744 (and (array_inv!7749 a1!566) e!223018)))

(declare-fun b!310390 () Bool)

(declare-fun res!254494 () Bool)

(assert (=> b!310390 (=> (not res!254494) (not e!223017))))

(assert (=> b!310390 (= res!254494 (arrayRangesEq!1785 a1!566 a2!566 (bvadd #b00000000000000000000000000000001 i!943) to!659))))

(declare-fun b!310391 () Bool)

(declare-fun res!254489 () Bool)

(assert (=> b!310391 (=> (not res!254489) (not e!223017))))

(assert (=> b!310391 (= res!254489 (and (bvsle from!692 i!943) (bvsle i!943 at!235)))))

(declare-fun b!310392 () Bool)

(assert (=> b!310392 (= e!223019 (and tp_is_empty!1005 mapRes!3196))))

(declare-fun condMapEmpty!3195 () Bool)

(declare-fun mapDefault!3196 () T!58551)

(assert (=> b!310392 (= condMapEmpty!3195 (= (arr!9272 a2!566) ((as const (Array (_ BitVec 32) T!58551)) mapDefault!3196)))))

(assert (= (and start!68744 res!254490) b!310385))

(assert (= (and b!310385 res!254492) b!310391))

(assert (= (and b!310391 res!254489) b!310389))

(assert (= (and b!310389 res!254493) b!310386))

(assert (= (and b!310386 res!254491) b!310390))

(assert (= (and b!310390 res!254494) b!310388))

(assert (= (and b!310392 condMapEmpty!3195) mapIsEmpty!3196))

(assert (= (and b!310392 (not condMapEmpty!3195)) mapNonEmpty!3196))

(assert (= start!68744 b!310392))

(assert (= (and b!310387 condMapEmpty!3196) mapIsEmpty!3195))

(assert (= (and b!310387 (not condMapEmpty!3196)) mapNonEmpty!3195))

(assert (= start!68744 b!310387))

(declare-fun m!448187 () Bool)

(assert (=> b!310390 m!448187))

(declare-fun m!448189 () Bool)

(assert (=> b!310389 m!448189))

(declare-fun m!448191 () Bool)

(assert (=> mapNonEmpty!3195 m!448191))

(declare-fun m!448193 () Bool)

(assert (=> b!310385 m!448193))

(declare-fun m!448195 () Bool)

(assert (=> b!310388 m!448195))

(declare-fun m!448197 () Bool)

(assert (=> b!310388 m!448197))

(declare-fun m!448199 () Bool)

(assert (=> b!310388 m!448199))

(declare-fun m!448201 () Bool)

(assert (=> start!68744 m!448201))

(declare-fun m!448203 () Bool)

(assert (=> start!68744 m!448203))

(declare-fun m!448205 () Bool)

(assert (=> mapNonEmpty!3196 m!448205))

(check-sat (not mapNonEmpty!3195) (not start!68744) (not b!310388) (not b!310385) tp_is_empty!1005 (not b!310390) (not b!310389) (not mapNonEmpty!3196))
(check-sat)
