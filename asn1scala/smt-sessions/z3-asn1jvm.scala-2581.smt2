; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64278 () Bool)

(assert start!64278)

(declare-fun mapNonEmpty!2253 () Bool)

(declare-fun mapRes!2253 () Bool)

(declare-fun tp!2253 () Bool)

(declare-fun tp_is_empty!699 () Bool)

(assert (=> mapNonEmpty!2253 (= mapRes!2253 (and tp!2253 tp_is_empty!699))))

(declare-datatypes ((T!52505 0))(
  ( (T!52506 (val!349 Int)) )
))
(declare-fun mapValue!2254 () T!52505)

(declare-fun mapKey!2253 () (_ BitVec 32))

(declare-datatypes ((array!16981 0))(
  ( (array!16982 (arr!8336 (Array (_ BitVec 32) T!52505)) (size!7340 (_ BitVec 32))) )
))
(declare-fun a2!596 () array!16981)

(declare-fun mapRest!2254 () (Array (_ BitVec 32) T!52505))

(assert (=> mapNonEmpty!2253 (= (arr!8336 a2!596) (store mapRest!2254 mapKey!2253 mapValue!2254))))

(declare-fun mapNonEmpty!2254 () Bool)

(declare-fun mapRes!2254 () Bool)

(declare-fun tp!2254 () Bool)

(assert (=> mapNonEmpty!2254 (= mapRes!2254 (and tp!2254 tp_is_empty!699))))

(declare-fun a1!596 () array!16981)

(declare-fun mapRest!2253 () (Array (_ BitVec 32) T!52505))

(declare-fun mapValue!2253 () T!52505)

(declare-fun mapKey!2254 () (_ BitVec 32))

(assert (=> mapNonEmpty!2254 (= (arr!8336 a1!596) (store mapRest!2253 mapKey!2254 mapValue!2253))))

(declare-fun b!288228 () Bool)

(declare-fun e!205030 () Bool)

(assert (=> b!288228 (= e!205030 (and tp_is_empty!699 mapRes!2253))))

(declare-fun condMapEmpty!2254 () Bool)

(declare-fun mapDefault!2253 () T!52505)

(assert (=> b!288228 (= condMapEmpty!2254 (= (arr!8336 a2!596) ((as const (Array (_ BitVec 32) T!52505)) mapDefault!2253)))))

(declare-fun b!288229 () Bool)

(declare-fun res!238251 () Bool)

(declare-fun e!205031 () Bool)

(assert (=> b!288229 (=> (not res!238251) (not e!205031))))

(declare-fun i!953 () (_ BitVec 32))

(declare-fun from!722 () (_ BitVec 32))

(assert (=> b!288229 (= res!238251 (= i!953 from!722))))

(declare-fun res!238252 () Bool)

(assert (=> start!64278 (=> (not res!238252) (not e!205031))))

(declare-fun to!689 () (_ BitVec 32))

(assert (=> start!64278 (= res!238252 (and (bvsle #b00000000000000000000000000000000 from!722) (bvsle from!722 to!689) (bvsle (size!7340 a1!596) (size!7340 a2!596)) (bvslt to!689 (size!7340 a1!596))))))

(assert (=> start!64278 e!205031))

(declare-fun e!205029 () Bool)

(declare-fun array_inv!6963 (array!16981) Bool)

(assert (=> start!64278 (and (array_inv!6963 a1!596) e!205029)))

(assert (=> start!64278 (and (array_inv!6963 a2!596) e!205030)))

(assert (=> start!64278 true))

(declare-fun b!288230 () Bool)

(declare-fun res!238249 () Bool)

(assert (=> b!288230 (=> (not res!238249) (not e!205031))))

(declare-fun arrayRangesEq!1449 (array!16981 array!16981 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!288230 (= res!238249 (arrayRangesEq!1449 a1!596 a2!596 i!953 (bvadd #b00000000000000000000000000000001 to!689)))))

(declare-fun mapIsEmpty!2253 () Bool)

(assert (=> mapIsEmpty!2253 mapRes!2253))

(declare-fun mapIsEmpty!2254 () Bool)

(assert (=> mapIsEmpty!2254 mapRes!2254))

(declare-fun b!288231 () Bool)

(assert (=> b!288231 (= e!205029 (and tp_is_empty!699 mapRes!2254))))

(declare-fun condMapEmpty!2253 () Bool)

(declare-fun mapDefault!2254 () T!52505)

(assert (=> b!288231 (= condMapEmpty!2253 (= (arr!8336 a1!596) ((as const (Array (_ BitVec 32) T!52505)) mapDefault!2254)))))

(declare-fun b!288232 () Bool)

(declare-fun res!238248 () Bool)

(assert (=> b!288232 (=> (not res!238248) (not e!205031))))

(assert (=> b!288232 (= res!238248 (arrayRangesEq!1449 a1!596 a2!596 from!722 to!689))))

(declare-fun b!288233 () Bool)

(assert (=> b!288233 (= e!205031 (not (arrayRangesEq!1449 a1!596 a2!596 from!722 (bvadd #b00000000000000000000000000000001 to!689))))))

(declare-fun b!288234 () Bool)

(declare-fun res!238250 () Bool)

(assert (=> b!288234 (=> (not res!238250) (not e!205031))))

(assert (=> b!288234 (= res!238250 (and (= (select (arr!8336 a1!596) to!689) (select (arr!8336 a2!596) to!689)) (bvsle i!953 to!689)))))

(assert (= (and start!64278 res!238252) b!288232))

(assert (= (and b!288232 res!238248) b!288234))

(assert (= (and b!288234 res!238250) b!288230))

(assert (= (and b!288230 res!238249) b!288229))

(assert (= (and b!288229 res!238251) b!288233))

(assert (= (and b!288231 condMapEmpty!2253) mapIsEmpty!2254))

(assert (= (and b!288231 (not condMapEmpty!2253)) mapNonEmpty!2254))

(assert (= start!64278 b!288231))

(assert (= (and b!288228 condMapEmpty!2254) mapIsEmpty!2253))

(assert (= (and b!288228 (not condMapEmpty!2254)) mapNonEmpty!2253))

(assert (= start!64278 b!288228))

(declare-fun m!420931 () Bool)

(assert (=> b!288233 m!420931))

(declare-fun m!420933 () Bool)

(assert (=> mapNonEmpty!2254 m!420933))

(declare-fun m!420935 () Bool)

(assert (=> b!288234 m!420935))

(declare-fun m!420937 () Bool)

(assert (=> b!288234 m!420937))

(declare-fun m!420939 () Bool)

(assert (=> mapNonEmpty!2253 m!420939))

(declare-fun m!420941 () Bool)

(assert (=> b!288230 m!420941))

(declare-fun m!420943 () Bool)

(assert (=> b!288232 m!420943))

(declare-fun m!420945 () Bool)

(assert (=> start!64278 m!420945))

(declare-fun m!420947 () Bool)

(assert (=> start!64278 m!420947))

(check-sat tp_is_empty!699 (not b!288233) (not mapNonEmpty!2254) (not mapNonEmpty!2253) (not b!288232) (not start!64278) (not b!288230))
(check-sat)
