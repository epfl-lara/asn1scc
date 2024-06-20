; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64148 () Bool)

(assert start!64148)

(declare-fun b!286989 () Bool)

(declare-fun e!204406 () Bool)

(declare-fun e!204409 () Bool)

(assert (=> b!286989 (= e!204406 (not e!204409))))

(declare-fun res!237408 () Bool)

(assert (=> b!286989 (=> res!237408 e!204409)))

(declare-fun from!773 () (_ BitVec 32))

(declare-fun i!964 () (_ BitVec 32))

(declare-fun mid!71 () (_ BitVec 32))

(assert (=> b!286989 (= res!237408 (or (bvsgt from!773 (bvadd #b00000000000000000000000000000001 i!964)) (bvsgt (bvadd #b00000000000000000000000000000001 i!964) mid!71)))))

(declare-datatypes ((T!51959 0))(
  ( (T!51960 (val!286 Int)) )
))
(declare-datatypes ((array!16854 0))(
  ( (array!16855 (arr!8273 (Array (_ BitVec 32) T!51959)) (size!7277 (_ BitVec 32))) )
))
(declare-fun a1!647 () array!16854)

(declare-fun a3!68 () array!16854)

(declare-fun arrayRangesEq!1412 (array!16854 array!16854 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!286989 (arrayRangesEq!1412 a1!647 a3!68 from!773 (bvadd #b00000000000000000000000000000001 i!964))))

(declare-datatypes ((Unit!19957 0))(
  ( (Unit!19958) )
))
(declare-fun lt!418689 () Unit!19957)

(declare-fun arrayRangesEqAppend!20 (array!16854 array!16854 (_ BitVec 32) (_ BitVec 32)) Unit!19957)

(assert (=> b!286989 (= lt!418689 (arrayRangesEqAppend!20 a1!647 a3!68 from!773 i!964))))

(declare-fun b!286990 () Bool)

(declare-fun res!237412 () Bool)

(assert (=> b!286990 (=> (not res!237412) (not e!204406))))

(assert (=> b!286990 (= res!237412 (not (= i!964 mid!71)))))

(declare-fun res!237402 () Bool)

(assert (=> start!64148 (=> (not res!237402) (not e!204406))))

(declare-fun a2!647 () array!16854)

(declare-fun to!740 () (_ BitVec 32))

(assert (=> start!64148 (= res!237402 (and (bvsle #b00000000000000000000000000000000 from!773) (bvsle from!773 mid!71) (bvsle mid!71 to!740) (bvsle (size!7277 a1!647) (size!7277 a2!647)) (bvsle (size!7277 a2!647) (size!7277 a3!68)) (bvsle mid!71 (size!7277 a1!647)) (bvsle to!740 (size!7277 a2!647))))))

(assert (=> start!64148 e!204406))

(declare-fun e!204407 () Bool)

(declare-fun array_inv!6928 (array!16854) Bool)

(assert (=> start!64148 (and (array_inv!6928 a2!647) e!204407)))

(assert (=> start!64148 true))

(declare-fun e!204408 () Bool)

(assert (=> start!64148 (and (array_inv!6928 a1!647) e!204408)))

(declare-fun e!204410 () Bool)

(assert (=> start!64148 (and (array_inv!6928 a3!68) e!204410)))

(declare-fun mapNonEmpty!1856 () Bool)

(declare-fun mapRes!1858 () Bool)

(declare-fun tp!1856 () Bool)

(declare-fun tp_is_empty!573 () Bool)

(assert (=> mapNonEmpty!1856 (= mapRes!1858 (and tp!1856 tp_is_empty!573))))

(declare-fun mapValue!1858 () T!51959)

(declare-fun mapRest!1857 () (Array (_ BitVec 32) T!51959))

(declare-fun mapKey!1858 () (_ BitVec 32))

(assert (=> mapNonEmpty!1856 (= (arr!8273 a2!647) (store mapRest!1857 mapKey!1858 mapValue!1858))))

(declare-fun b!286991 () Bool)

(declare-fun mapRes!1857 () Bool)

(assert (=> b!286991 (= e!204408 (and tp_is_empty!573 mapRes!1857))))

(declare-fun condMapEmpty!1856 () Bool)

(declare-fun mapDefault!1858 () T!51959)

(assert (=> b!286991 (= condMapEmpty!1856 (= (arr!8273 a1!647) ((as const (Array (_ BitVec 32) T!51959)) mapDefault!1858)))))

(declare-fun b!286992 () Bool)

(declare-fun mapRes!1856 () Bool)

(assert (=> b!286992 (= e!204410 (and tp_is_empty!573 mapRes!1856))))

(declare-fun condMapEmpty!1857 () Bool)

(declare-fun mapDefault!1856 () T!51959)

(assert (=> b!286992 (= condMapEmpty!1857 (= (arr!8273 a3!68) ((as const (Array (_ BitVec 32) T!51959)) mapDefault!1856)))))

(declare-fun b!286993 () Bool)

(assert (=> b!286993 (= e!204407 (and tp_is_empty!573 mapRes!1858))))

(declare-fun condMapEmpty!1858 () Bool)

(declare-fun mapDefault!1857 () T!51959)

(assert (=> b!286993 (= condMapEmpty!1858 (= (arr!8273 a2!647) ((as const (Array (_ BitVec 32) T!51959)) mapDefault!1857)))))

(declare-fun b!286994 () Bool)

(assert (=> b!286994 (= e!204409 (bvslt (bvsub to!740 (bvadd #b00000000000000000000000000000001 i!964)) (bvsub to!740 i!964)))))

(declare-fun b!286995 () Bool)

(declare-fun res!237405 () Bool)

(assert (=> b!286995 (=> res!237405 e!204409)))

(assert (=> b!286995 (= res!237405 (not (arrayRangesEq!1412 a1!647 a2!647 (bvadd #b00000000000000000000000000000001 i!964) mid!71)))))

(declare-fun b!286996 () Bool)

(declare-fun res!237409 () Bool)

(assert (=> b!286996 (=> (not res!237409) (not e!204406))))

(assert (=> b!286996 (= res!237409 (arrayRangesEq!1412 a2!647 a3!68 from!773 to!740))))

(declare-fun b!286997 () Bool)

(declare-fun res!237403 () Bool)

(assert (=> b!286997 (=> (not res!237403) (not e!204406))))

(assert (=> b!286997 (= res!237403 (and (bvsle from!773 i!964) (bvsle i!964 mid!71)))))

(declare-fun mapIsEmpty!1856 () Bool)

(assert (=> mapIsEmpty!1856 mapRes!1856))

(declare-fun mapNonEmpty!1857 () Bool)

(declare-fun tp!1857 () Bool)

(assert (=> mapNonEmpty!1857 (= mapRes!1856 (and tp!1857 tp_is_empty!573))))

(declare-fun mapValue!1857 () T!51959)

(declare-fun mapKey!1856 () (_ BitVec 32))

(declare-fun mapRest!1856 () (Array (_ BitVec 32) T!51959))

(assert (=> mapNonEmpty!1857 (= (arr!8273 a3!68) (store mapRest!1856 mapKey!1856 mapValue!1857))))

(declare-fun mapNonEmpty!1858 () Bool)

(declare-fun tp!1858 () Bool)

(assert (=> mapNonEmpty!1858 (= mapRes!1857 (and tp!1858 tp_is_empty!573))))

(declare-fun mapValue!1856 () T!51959)

(declare-fun mapKey!1857 () (_ BitVec 32))

(declare-fun mapRest!1858 () (Array (_ BitVec 32) T!51959))

(assert (=> mapNonEmpty!1858 (= (arr!8273 a1!647) (store mapRest!1858 mapKey!1857 mapValue!1856))))

(declare-fun b!286998 () Bool)

(declare-fun res!237404 () Bool)

(assert (=> b!286998 (=> res!237404 e!204409)))

(assert (=> b!286998 (= res!237404 (not (arrayRangesEq!1412 a2!647 a3!68 (bvadd #b00000000000000000000000000000001 i!964) to!740)))))

(declare-fun mapIsEmpty!1857 () Bool)

(assert (=> mapIsEmpty!1857 mapRes!1857))

(declare-fun b!286999 () Bool)

(declare-fun res!237407 () Bool)

(assert (=> b!286999 (=> (not res!237407) (not e!204406))))

(assert (=> b!286999 (= res!237407 (arrayRangesEq!1412 a1!647 a3!68 from!773 i!964))))

(declare-fun b!287000 () Bool)

(declare-fun res!237406 () Bool)

(assert (=> b!287000 (=> (not res!237406) (not e!204406))))

(assert (=> b!287000 (= res!237406 (arrayRangesEq!1412 a1!647 a2!647 from!773 mid!71))))

(declare-fun b!287001 () Bool)

(declare-fun res!237410 () Bool)

(assert (=> b!287001 (=> (not res!237410) (not e!204406))))

(assert (=> b!287001 (= res!237410 (arrayRangesEq!1412 a1!647 a2!647 i!964 mid!71))))

(declare-fun b!287002 () Bool)

(declare-fun res!237411 () Bool)

(assert (=> b!287002 (=> (not res!237411) (not e!204406))))

(assert (=> b!287002 (= res!237411 (arrayRangesEq!1412 a2!647 a3!68 i!964 to!740))))

(declare-fun mapIsEmpty!1858 () Bool)

(assert (=> mapIsEmpty!1858 mapRes!1858))

(assert (= (and start!64148 res!237402) b!287000))

(assert (= (and b!287000 res!237406) b!286996))

(assert (= (and b!286996 res!237409) b!286997))

(assert (= (and b!286997 res!237403) b!287001))

(assert (= (and b!287001 res!237410) b!287002))

(assert (= (and b!287002 res!237411) b!286999))

(assert (= (and b!286999 res!237407) b!286990))

(assert (= (and b!286990 res!237412) b!286989))

(assert (= (and b!286989 (not res!237408)) b!286995))

(assert (= (and b!286995 (not res!237405)) b!286998))

(assert (= (and b!286998 (not res!237404)) b!286994))

(assert (= (and b!286993 condMapEmpty!1858) mapIsEmpty!1858))

(assert (= (and b!286993 (not condMapEmpty!1858)) mapNonEmpty!1856))

(assert (= start!64148 b!286993))

(assert (= (and b!286991 condMapEmpty!1856) mapIsEmpty!1857))

(assert (= (and b!286991 (not condMapEmpty!1856)) mapNonEmpty!1858))

(assert (= start!64148 b!286991))

(assert (= (and b!286992 condMapEmpty!1857) mapIsEmpty!1856))

(assert (= (and b!286992 (not condMapEmpty!1857)) mapNonEmpty!1857))

(assert (= start!64148 b!286992))

(declare-fun m!419679 () Bool)

(assert (=> mapNonEmpty!1857 m!419679))

(declare-fun m!419681 () Bool)

(assert (=> b!286998 m!419681))

(declare-fun m!419683 () Bool)

(assert (=> b!287002 m!419683))

(declare-fun m!419685 () Bool)

(assert (=> mapNonEmpty!1856 m!419685))

(declare-fun m!419687 () Bool)

(assert (=> b!287001 m!419687))

(declare-fun m!419689 () Bool)

(assert (=> b!286996 m!419689))

(declare-fun m!419691 () Bool)

(assert (=> b!286995 m!419691))

(declare-fun m!419693 () Bool)

(assert (=> b!286989 m!419693))

(declare-fun m!419695 () Bool)

(assert (=> b!286989 m!419695))

(declare-fun m!419697 () Bool)

(assert (=> b!287000 m!419697))

(declare-fun m!419699 () Bool)

(assert (=> b!286999 m!419699))

(declare-fun m!419701 () Bool)

(assert (=> start!64148 m!419701))

(declare-fun m!419703 () Bool)

(assert (=> start!64148 m!419703))

(declare-fun m!419705 () Bool)

(assert (=> start!64148 m!419705))

(declare-fun m!419707 () Bool)

(assert (=> mapNonEmpty!1858 m!419707))

(check-sat (not b!286996) (not b!287001) (not b!286998) (not mapNonEmpty!1857) (not mapNonEmpty!1858) (not b!287002) tp_is_empty!573 (not mapNonEmpty!1856) (not b!286989) (not b!286999) (not b!286995) (not start!64148) (not b!287000))
(check-sat)
