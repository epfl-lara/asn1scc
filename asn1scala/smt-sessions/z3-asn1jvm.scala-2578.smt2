; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64260 () Bool)

(assert start!64260)

(declare-datatypes ((T!52427 0))(
  ( (T!52428 (val!340 Int)) )
))
(declare-datatypes ((array!16963 0))(
  ( (array!16964 (arr!8327 (Array (_ BitVec 32) T!52427)) (size!7331 (_ BitVec 32))) )
))
(declare-fun a2!596 () array!16963)

(declare-fun from!722 () (_ BitVec 32))

(declare-fun e!204950 () Bool)

(declare-fun i!953 () (_ BitVec 32))

(declare-fun to!689 () (_ BitVec 32))

(declare-fun a1!596 () array!16963)

(declare-fun b!288069 () Bool)

(assert (=> b!288069 (= e!204950 (and (= (select (arr!8327 a1!596) to!689) (select (arr!8327 a2!596) to!689)) (bvsle from!722 i!953) (bvsle i!953 to!689) (= (bvand to!689 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand to!689 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 to!689) #b10000000000000000000000000000000)))))))

(declare-fun res!238143 () Bool)

(assert (=> start!64260 (=> (not res!238143) (not e!204950))))

(assert (=> start!64260 (= res!238143 (and (bvsle #b00000000000000000000000000000000 from!722) (bvsle from!722 to!689) (bvsle (size!7331 a1!596) (size!7331 a2!596)) (bvslt to!689 (size!7331 a1!596))))))

(assert (=> start!64260 e!204950))

(declare-fun e!204948 () Bool)

(declare-fun array_inv!6959 (array!16963) Bool)

(assert (=> start!64260 (and (array_inv!6959 a1!596) e!204948)))

(declare-fun e!204949 () Bool)

(assert (=> start!64260 (and (array_inv!6959 a2!596) e!204949)))

(assert (=> start!64260 true))

(declare-fun mapIsEmpty!2199 () Bool)

(declare-fun mapRes!2200 () Bool)

(assert (=> mapIsEmpty!2199 mapRes!2200))

(declare-fun mapIsEmpty!2200 () Bool)

(declare-fun mapRes!2199 () Bool)

(assert (=> mapIsEmpty!2200 mapRes!2199))

(declare-fun mapNonEmpty!2199 () Bool)

(declare-fun tp!2200 () Bool)

(declare-fun tp_is_empty!681 () Bool)

(assert (=> mapNonEmpty!2199 (= mapRes!2199 (and tp!2200 tp_is_empty!681))))

(declare-fun mapRest!2199 () (Array (_ BitVec 32) T!52427))

(declare-fun mapKey!2199 () (_ BitVec 32))

(declare-fun mapValue!2200 () T!52427)

(assert (=> mapNonEmpty!2199 (= (arr!8327 a1!596) (store mapRest!2199 mapKey!2199 mapValue!2200))))

(declare-fun b!288070 () Bool)

(assert (=> b!288070 (= e!204948 (and tp_is_empty!681 mapRes!2199))))

(declare-fun condMapEmpty!2200 () Bool)

(declare-fun mapDefault!2199 () T!52427)

(assert (=> b!288070 (= condMapEmpty!2200 (= (arr!8327 a1!596) ((as const (Array (_ BitVec 32) T!52427)) mapDefault!2199)))))

(declare-fun b!288071 () Bool)

(declare-fun res!238144 () Bool)

(assert (=> b!288071 (=> (not res!238144) (not e!204950))))

(declare-fun arrayRangesEq!1445 (array!16963 array!16963 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!288071 (= res!238144 (arrayRangesEq!1445 a1!596 a2!596 from!722 to!689))))

(declare-fun mapNonEmpty!2200 () Bool)

(declare-fun tp!2199 () Bool)

(assert (=> mapNonEmpty!2200 (= mapRes!2200 (and tp!2199 tp_is_empty!681))))

(declare-fun mapKey!2200 () (_ BitVec 32))

(declare-fun mapValue!2199 () T!52427)

(declare-fun mapRest!2200 () (Array (_ BitVec 32) T!52427))

(assert (=> mapNonEmpty!2200 (= (arr!8327 a2!596) (store mapRest!2200 mapKey!2200 mapValue!2199))))

(declare-fun b!288072 () Bool)

(assert (=> b!288072 (= e!204949 (and tp_is_empty!681 mapRes!2200))))

(declare-fun condMapEmpty!2199 () Bool)

(declare-fun mapDefault!2200 () T!52427)

(assert (=> b!288072 (= condMapEmpty!2199 (= (arr!8327 a2!596) ((as const (Array (_ BitVec 32) T!52427)) mapDefault!2200)))))

(assert (= (and start!64260 res!238143) b!288071))

(assert (= (and b!288071 res!238144) b!288069))

(assert (= (and b!288070 condMapEmpty!2200) mapIsEmpty!2200))

(assert (= (and b!288070 (not condMapEmpty!2200)) mapNonEmpty!2199))

(assert (= start!64260 b!288070))

(assert (= (and b!288072 condMapEmpty!2199) mapIsEmpty!2199))

(assert (= (and b!288072 (not condMapEmpty!2199)) mapNonEmpty!2200))

(assert (= start!64260 b!288072))

(declare-fun m!420789 () Bool)

(assert (=> mapNonEmpty!2199 m!420789))

(declare-fun m!420791 () Bool)

(assert (=> b!288069 m!420791))

(declare-fun m!420793 () Bool)

(assert (=> b!288069 m!420793))

(declare-fun m!420795 () Bool)

(assert (=> start!64260 m!420795))

(declare-fun m!420797 () Bool)

(assert (=> start!64260 m!420797))

(declare-fun m!420799 () Bool)

(assert (=> mapNonEmpty!2200 m!420799))

(declare-fun m!420801 () Bool)

(assert (=> b!288071 m!420801))

(check-sat (not b!288071) (not start!64260) (not mapNonEmpty!2200) tp_is_empty!681 (not mapNonEmpty!2199))
(check-sat)
