; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64172 () Bool)

(assert start!64172)

(declare-fun b!287273 () Bool)

(declare-fun e!204533 () Bool)

(declare-fun tp_is_empty!597 () Bool)

(declare-fun mapRes!1941 () Bool)

(assert (=> b!287273 (= e!204533 (and tp_is_empty!597 mapRes!1941))))

(declare-fun condMapEmpty!1941 () Bool)

(declare-datatypes ((T!52063 0))(
  ( (T!52064 (val!298 Int)) )
))
(declare-datatypes ((array!16878 0))(
  ( (array!16879 (arr!8285 (Array (_ BitVec 32) T!52063)) (size!7289 (_ BitVec 32))) )
))
(declare-fun a2!580 () array!16878)

(declare-fun mapDefault!1941 () T!52063)

(assert (=> b!287273 (= condMapEmpty!1941 (= (arr!8285 a2!580) ((as const (Array (_ BitVec 32) T!52063)) mapDefault!1941)))))

(declare-fun b!287274 () Bool)

(declare-fun res!237602 () Bool)

(declare-fun e!204532 () Bool)

(assert (=> b!287274 (=> (not res!237602) (not e!204532))))

(declare-fun to!673 () (_ BitVec 32))

(declare-fun from!706 () (_ BitVec 32))

(declare-fun a1!580 () array!16878)

(declare-fun arrayRangesEq!1421 (array!16878 array!16878 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!287274 (= res!237602 (arrayRangesEq!1421 a1!580 a2!580 from!706 to!673))))

(declare-fun res!237603 () Bool)

(assert (=> start!64172 (=> (not res!237603) (not e!204532))))

(assert (=> start!64172 (= res!237603 (and (bvsle #b00000000000000000000000000000000 from!706) (bvsle from!706 to!673) (bvsle (size!7289 a1!580) (size!7289 a2!580)) (bvslt to!673 (size!7289 a1!580))))))

(assert (=> start!64172 e!204532))

(assert (=> start!64172 true))

(declare-fun e!204531 () Bool)

(declare-fun array_inv!6935 (array!16878) Bool)

(assert (=> start!64172 (and (array_inv!6935 a1!580) e!204531)))

(assert (=> start!64172 (and (array_inv!6935 a2!580) e!204533)))

(declare-fun mapIsEmpty!1941 () Bool)

(assert (=> mapIsEmpty!1941 mapRes!1941))

(declare-fun b!287275 () Bool)

(assert (=> b!287275 (= e!204532 (not true))))

(assert (=> b!287275 (arrayRangesEq!1421 a1!580 a2!580 from!706 (bvadd #b00000000000000000000000000000001 to!673))))

(declare-datatypes ((Unit!19969 0))(
  ( (Unit!19970) )
))
(declare-fun lt!418725 () Unit!19969)

(declare-fun rec!73 (array!16878 array!16878 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19969)

(assert (=> b!287275 (= lt!418725 (rec!73 a1!580 a2!580 from!706 to!673 to!673))))

(declare-fun b!287276 () Bool)

(declare-fun res!237601 () Bool)

(assert (=> b!287276 (=> (not res!237601) (not e!204532))))

(assert (=> b!287276 (= res!237601 (arrayRangesEq!1421 a1!580 a2!580 to!673 (bvadd #b00000000000000000000000000000001 to!673)))))

(declare-fun b!287277 () Bool)

(declare-fun res!237604 () Bool)

(assert (=> b!287277 (=> (not res!237604) (not e!204532))))

(assert (=> b!287277 (= res!237604 (= (select (arr!8285 a1!580) to!673) (select (arr!8285 a2!580) to!673)))))

(declare-fun b!287278 () Bool)

(declare-fun mapRes!1942 () Bool)

(assert (=> b!287278 (= e!204531 (and tp_is_empty!597 mapRes!1942))))

(declare-fun condMapEmpty!1942 () Bool)

(declare-fun mapDefault!1942 () T!52063)

(assert (=> b!287278 (= condMapEmpty!1942 (= (arr!8285 a1!580) ((as const (Array (_ BitVec 32) T!52063)) mapDefault!1942)))))

(declare-fun mapNonEmpty!1941 () Bool)

(declare-fun tp!1941 () Bool)

(assert (=> mapNonEmpty!1941 (= mapRes!1942 (and tp!1941 tp_is_empty!597))))

(declare-fun mapRest!1941 () (Array (_ BitVec 32) T!52063))

(declare-fun mapKey!1942 () (_ BitVec 32))

(declare-fun mapValue!1942 () T!52063)

(assert (=> mapNonEmpty!1941 (= (arr!8285 a1!580) (store mapRest!1941 mapKey!1942 mapValue!1942))))

(declare-fun mapIsEmpty!1942 () Bool)

(assert (=> mapIsEmpty!1942 mapRes!1942))

(declare-fun mapNonEmpty!1942 () Bool)

(declare-fun tp!1942 () Bool)

(assert (=> mapNonEmpty!1942 (= mapRes!1941 (and tp!1942 tp_is_empty!597))))

(declare-fun mapKey!1941 () (_ BitVec 32))

(declare-fun mapValue!1941 () T!52063)

(declare-fun mapRest!1942 () (Array (_ BitVec 32) T!52063))

(assert (=> mapNonEmpty!1942 (= (arr!8285 a2!580) (store mapRest!1942 mapKey!1941 mapValue!1941))))

(assert (= (and start!64172 res!237603) b!287274))

(assert (= (and b!287274 res!237602) b!287277))

(assert (= (and b!287277 res!237604) b!287276))

(assert (= (and b!287276 res!237601) b!287275))

(assert (= (and b!287278 condMapEmpty!1942) mapIsEmpty!1942))

(assert (= (and b!287278 (not condMapEmpty!1942)) mapNonEmpty!1941))

(assert (= start!64172 b!287278))

(assert (= (and b!287273 condMapEmpty!1941) mapIsEmpty!1941))

(assert (= (and b!287273 (not condMapEmpty!1941)) mapNonEmpty!1942))

(assert (= start!64172 b!287273))

(declare-fun m!419945 () Bool)

(assert (=> start!64172 m!419945))

(declare-fun m!419947 () Bool)

(assert (=> start!64172 m!419947))

(declare-fun m!419949 () Bool)

(assert (=> b!287277 m!419949))

(declare-fun m!419951 () Bool)

(assert (=> b!287277 m!419951))

(declare-fun m!419953 () Bool)

(assert (=> mapNonEmpty!1941 m!419953))

(declare-fun m!419955 () Bool)

(assert (=> b!287275 m!419955))

(declare-fun m!419957 () Bool)

(assert (=> b!287275 m!419957))

(declare-fun m!419959 () Bool)

(assert (=> b!287274 m!419959))

(declare-fun m!419961 () Bool)

(assert (=> b!287276 m!419961))

(declare-fun m!419963 () Bool)

(assert (=> mapNonEmpty!1942 m!419963))

(check-sat (not b!287276) (not start!64172) (not mapNonEmpty!1942) (not b!287275) tp_is_empty!597 (not b!287274) (not mapNonEmpty!1941))
(check-sat)
