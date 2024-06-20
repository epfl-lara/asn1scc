; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68722 () Bool)

(assert start!68722)

(declare-fun mapNonEmpty!3137 () Bool)

(declare-fun mapRes!3137 () Bool)

(declare-fun tp!3137 () Bool)

(declare-fun tp_is_empty!987 () Bool)

(assert (=> mapNonEmpty!3137 (= mapRes!3137 (and tp!3137 tp_is_empty!987))))

(declare-datatypes ((T!58473 0))(
  ( (T!58474 (val!493 Int)) )
))
(declare-fun mapRest!3137 () (Array (_ BitVec 32) T!58473))

(declare-fun mapValue!3138 () T!58473)

(declare-fun mapKey!3138 () (_ BitVec 32))

(declare-datatypes ((array!18854 0))(
  ( (array!18855 (arr!9263 (Array (_ BitVec 32) T!58473)) (size!8180 (_ BitVec 32))) )
))
(declare-fun a2!566 () array!18854)

(assert (=> mapNonEmpty!3137 (= (arr!9263 a2!566) (store mapRest!3137 mapKey!3138 mapValue!3138))))

(declare-fun b!310174 () Bool)

(declare-fun res!254337 () Bool)

(declare-fun e!222927 () Bool)

(assert (=> b!310174 (=> (not res!254337) (not e!222927))))

(declare-fun i!943 () (_ BitVec 32))

(declare-fun a1!566 () array!18854)

(declare-fun to!659 () (_ BitVec 32))

(declare-fun arrayRangesEq!1778 (array!18854 array!18854 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!310174 (= res!254337 (arrayRangesEq!1778 a1!566 a2!566 i!943 to!659))))

(declare-fun res!254336 () Bool)

(assert (=> start!68722 (=> (not res!254336) (not e!222927))))

(declare-fun at!235 () (_ BitVec 32))

(declare-fun from!692 () (_ BitVec 32))

(assert (=> start!68722 (= res!254336 (and (bvsle #b00000000000000000000000000000000 from!692) (bvsle from!692 to!659) (bvsle (size!8180 a1!566) (size!8180 a2!566)) (bvsle to!659 (size!8180 a1!566)) (bvsle from!692 at!235) (bvslt at!235 to!659)))))

(assert (=> start!68722 e!222927))

(assert (=> start!68722 true))

(declare-fun e!222928 () Bool)

(declare-fun array_inv!7745 (array!18854) Bool)

(assert (=> start!68722 (and (array_inv!7745 a2!566) e!222928)))

(declare-fun e!222926 () Bool)

(assert (=> start!68722 (and (array_inv!7745 a1!566) e!222926)))

(declare-fun b!310175 () Bool)

(assert (=> b!310175 (= e!222928 (and tp_is_empty!987 mapRes!3137))))

(declare-fun condMapEmpty!3137 () Bool)

(declare-fun mapDefault!3137 () T!58473)

(assert (=> b!310175 (= condMapEmpty!3137 (= (arr!9263 a2!566) ((as const (Array (_ BitVec 32) T!58473)) mapDefault!3137)))))

(declare-fun mapIsEmpty!3137 () Bool)

(declare-fun mapRes!3138 () Bool)

(assert (=> mapIsEmpty!3137 mapRes!3138))

(declare-fun b!310176 () Bool)

(declare-fun res!254334 () Bool)

(assert (=> b!310176 (=> (not res!254334) (not e!222927))))

(assert (=> b!310176 (= res!254334 (and (bvsle from!692 i!943) (bvsle i!943 at!235)))))

(declare-fun b!310177 () Bool)

(declare-fun res!254335 () Bool)

(assert (=> b!310177 (=> (not res!254335) (not e!222927))))

(assert (=> b!310177 (= res!254335 (arrayRangesEq!1778 a1!566 a2!566 from!692 to!659))))

(declare-fun mapNonEmpty!3138 () Bool)

(declare-fun tp!3138 () Bool)

(assert (=> mapNonEmpty!3138 (= mapRes!3138 (and tp!3138 tp_is_empty!987))))

(declare-fun mapRest!3138 () (Array (_ BitVec 32) T!58473))

(declare-fun mapValue!3137 () T!58473)

(declare-fun mapKey!3137 () (_ BitVec 32))

(assert (=> mapNonEmpty!3138 (= (arr!9263 a1!566) (store mapRest!3138 mapKey!3137 mapValue!3137))))

(declare-fun b!310178 () Bool)

(assert (=> b!310178 (= e!222927 (and (not (= i!943 at!235)) (or (bvsgt from!692 (bvadd #b00000000000000000000000000000001 i!943)) (bvsgt (bvadd #b00000000000000000000000000000001 i!943) at!235))))))

(declare-fun b!310179 () Bool)

(assert (=> b!310179 (= e!222926 (and tp_is_empty!987 mapRes!3138))))

(declare-fun condMapEmpty!3138 () Bool)

(declare-fun mapDefault!3138 () T!58473)

(assert (=> b!310179 (= condMapEmpty!3138 (= (arr!9263 a1!566) ((as const (Array (_ BitVec 32) T!58473)) mapDefault!3138)))))

(declare-fun mapIsEmpty!3138 () Bool)

(assert (=> mapIsEmpty!3138 mapRes!3137))

(assert (= (and start!68722 res!254336) b!310177))

(assert (= (and b!310177 res!254335) b!310176))

(assert (= (and b!310176 res!254334) b!310174))

(assert (= (and b!310174 res!254337) b!310178))

(assert (= (and b!310175 condMapEmpty!3137) mapIsEmpty!3138))

(assert (= (and b!310175 (not condMapEmpty!3137)) mapNonEmpty!3137))

(assert (= start!68722 b!310175))

(assert (= (and b!310179 condMapEmpty!3138) mapIsEmpty!3137))

(assert (= (and b!310179 (not condMapEmpty!3138)) mapNonEmpty!3138))

(assert (= start!68722 b!310179))

(declare-fun m!448037 () Bool)

(assert (=> mapNonEmpty!3138 m!448037))

(declare-fun m!448039 () Bool)

(assert (=> mapNonEmpty!3137 m!448039))

(declare-fun m!448041 () Bool)

(assert (=> b!310177 m!448041))

(declare-fun m!448043 () Bool)

(assert (=> start!68722 m!448043))

(declare-fun m!448045 () Bool)

(assert (=> start!68722 m!448045))

(declare-fun m!448047 () Bool)

(assert (=> b!310174 m!448047))

(check-sat tp_is_empty!987 (not b!310177) (not mapNonEmpty!3137) (not b!310174) (not mapNonEmpty!3138) (not start!68722))
(check-sat)
