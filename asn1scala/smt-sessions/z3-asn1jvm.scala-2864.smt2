; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68716 () Bool)

(assert start!68716)

(declare-fun mapIsEmpty!3119 () Bool)

(declare-fun mapRes!3119 () Bool)

(assert (=> mapIsEmpty!3119 mapRes!3119))

(declare-fun b!310120 () Bool)

(declare-fun e!222901 () Bool)

(declare-fun tp_is_empty!981 () Bool)

(declare-fun mapRes!3120 () Bool)

(assert (=> b!310120 (= e!222901 (and tp_is_empty!981 mapRes!3120))))

(declare-fun condMapEmpty!3120 () Bool)

(declare-datatypes ((T!58447 0))(
  ( (T!58448 (val!490 Int)) )
))
(declare-datatypes ((array!18848 0))(
  ( (array!18849 (arr!9260 (Array (_ BitVec 32) T!58447)) (size!8177 (_ BitVec 32))) )
))
(declare-fun a1!566 () array!18848)

(declare-fun mapDefault!3120 () T!58447)

(assert (=> b!310120 (= condMapEmpty!3120 (= (arr!9260 a1!566) ((as const (Array (_ BitVec 32) T!58447)) mapDefault!3120)))))

(declare-fun b!310121 () Bool)

(declare-fun res!254299 () Bool)

(declare-fun e!222900 () Bool)

(assert (=> b!310121 (=> (not res!254299) (not e!222900))))

(declare-fun i!943 () (_ BitVec 32))

(declare-fun to!659 () (_ BitVec 32))

(declare-fun a2!566 () array!18848)

(declare-fun arrayRangesEq!1776 (array!18848 array!18848 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!310121 (= res!254299 (arrayRangesEq!1776 a1!566 a2!566 i!943 to!659))))

(declare-fun mapNonEmpty!3119 () Bool)

(declare-fun tp!3120 () Bool)

(assert (=> mapNonEmpty!3119 (= mapRes!3120 (and tp!3120 tp_is_empty!981))))

(declare-fun mapKey!3120 () (_ BitVec 32))

(declare-fun mapValue!3119 () T!58447)

(declare-fun mapRest!3120 () (Array (_ BitVec 32) T!58447))

(assert (=> mapNonEmpty!3119 (= (arr!9260 a1!566) (store mapRest!3120 mapKey!3120 mapValue!3119))))

(declare-fun b!310122 () Bool)

(declare-fun res!254300 () Bool)

(assert (=> b!310122 (=> (not res!254300) (not e!222900))))

(declare-fun from!692 () (_ BitVec 32))

(assert (=> b!310122 (= res!254300 (arrayRangesEq!1776 a1!566 a2!566 from!692 to!659))))

(declare-fun res!254298 () Bool)

(assert (=> start!68716 (=> (not res!254298) (not e!222900))))

(declare-fun at!235 () (_ BitVec 32))

(assert (=> start!68716 (= res!254298 (and (bvsle #b00000000000000000000000000000000 from!692) (bvsle from!692 to!659) (bvsle (size!8177 a1!566) (size!8177 a2!566)) (bvsle to!659 (size!8177 a1!566)) (bvsle from!692 at!235) (bvslt at!235 to!659)))))

(assert (=> start!68716 e!222900))

(assert (=> start!68716 true))

(declare-fun e!222899 () Bool)

(declare-fun array_inv!7742 (array!18848) Bool)

(assert (=> start!68716 (and (array_inv!7742 a2!566) e!222899)))

(assert (=> start!68716 (and (array_inv!7742 a1!566) e!222901)))

(declare-fun b!310123 () Bool)

(assert (=> b!310123 (= e!222899 (and tp_is_empty!981 mapRes!3119))))

(declare-fun condMapEmpty!3119 () Bool)

(declare-fun mapDefault!3119 () T!58447)

(assert (=> b!310123 (= condMapEmpty!3119 (= (arr!9260 a2!566) ((as const (Array (_ BitVec 32) T!58447)) mapDefault!3119)))))

(declare-fun mapIsEmpty!3120 () Bool)

(assert (=> mapIsEmpty!3120 mapRes!3120))

(declare-fun mapNonEmpty!3120 () Bool)

(declare-fun tp!3119 () Bool)

(assert (=> mapNonEmpty!3120 (= mapRes!3119 (and tp!3119 tp_is_empty!981))))

(declare-fun mapRest!3119 () (Array (_ BitVec 32) T!58447))

(declare-fun mapValue!3120 () T!58447)

(declare-fun mapKey!3119 () (_ BitVec 32))

(assert (=> mapNonEmpty!3120 (= (arr!9260 a2!566) (store mapRest!3119 mapKey!3119 mapValue!3120))))

(declare-fun b!310124 () Bool)

(assert (=> b!310124 (= e!222900 (and (not (= i!943 at!235)) (= (bvand i!943 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand i!943 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!943) #b10000000000000000000000000000000)))))))

(declare-fun b!310125 () Bool)

(declare-fun res!254301 () Bool)

(assert (=> b!310125 (=> (not res!254301) (not e!222900))))

(assert (=> b!310125 (= res!254301 (and (bvsle from!692 i!943) (bvsle i!943 at!235)))))

(assert (= (and start!68716 res!254298) b!310122))

(assert (= (and b!310122 res!254300) b!310125))

(assert (= (and b!310125 res!254301) b!310121))

(assert (= (and b!310121 res!254299) b!310124))

(assert (= (and b!310123 condMapEmpty!3119) mapIsEmpty!3119))

(assert (= (and b!310123 (not condMapEmpty!3119)) mapNonEmpty!3120))

(assert (= start!68716 b!310123))

(assert (= (and b!310120 condMapEmpty!3120) mapIsEmpty!3120))

(assert (= (and b!310120 (not condMapEmpty!3120)) mapNonEmpty!3119))

(assert (= start!68716 b!310120))

(declare-fun m!448001 () Bool)

(assert (=> b!310121 m!448001))

(declare-fun m!448003 () Bool)

(assert (=> mapNonEmpty!3120 m!448003))

(declare-fun m!448005 () Bool)

(assert (=> b!310122 m!448005))

(declare-fun m!448007 () Bool)

(assert (=> mapNonEmpty!3119 m!448007))

(declare-fun m!448009 () Bool)

(assert (=> start!68716 m!448009))

(declare-fun m!448011 () Bool)

(assert (=> start!68716 m!448011))

(check-sat (not b!310122) (not start!68716) (not mapNonEmpty!3119) (not mapNonEmpty!3120) tp_is_empty!981 (not b!310121))
(check-sat)
