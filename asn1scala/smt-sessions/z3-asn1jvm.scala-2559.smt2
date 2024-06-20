; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64142 () Bool)

(assert start!64142)

(declare-fun b!286875 () Bool)

(declare-fun res!237320 () Bool)

(declare-fun e!204365 () Bool)

(assert (=> b!286875 (=> (not res!237320) (not e!204365))))

(declare-datatypes ((T!51933 0))(
  ( (T!51934 (val!283 Int)) )
))
(declare-datatypes ((array!16848 0))(
  ( (array!16849 (arr!8270 (Array (_ BitVec 32) T!51933)) (size!7274 (_ BitVec 32))) )
))
(declare-fun a2!647 () array!16848)

(declare-fun mid!71 () (_ BitVec 32))

(declare-fun from!773 () (_ BitVec 32))

(declare-fun a1!647 () array!16848)

(declare-fun arrayRangesEq!1409 (array!16848 array!16848 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!286875 (= res!237320 (arrayRangesEq!1409 a1!647 a2!647 from!773 mid!71))))

(declare-fun b!286876 () Bool)

(declare-fun res!237322 () Bool)

(assert (=> b!286876 (=> (not res!237322) (not e!204365))))

(declare-fun a3!68 () array!16848)

(declare-fun to!740 () (_ BitVec 32))

(assert (=> b!286876 (= res!237322 (arrayRangesEq!1409 a2!647 a3!68 from!773 to!740))))

(declare-fun mapIsEmpty!1829 () Bool)

(declare-fun mapRes!1831 () Bool)

(assert (=> mapIsEmpty!1829 mapRes!1831))

(declare-fun res!237318 () Bool)

(assert (=> start!64142 (=> (not res!237318) (not e!204365))))

(assert (=> start!64142 (= res!237318 (and (bvsle #b00000000000000000000000000000000 from!773) (bvsle from!773 mid!71) (bvsle mid!71 to!740) (bvsle (size!7274 a1!647) (size!7274 a2!647)) (bvsle (size!7274 a2!647) (size!7274 a3!68)) (bvsle mid!71 (size!7274 a1!647)) (bvsle to!740 (size!7274 a2!647))))))

(assert (=> start!64142 e!204365))

(declare-fun e!204366 () Bool)

(declare-fun array_inv!6925 (array!16848) Bool)

(assert (=> start!64142 (and (array_inv!6925 a2!647) e!204366)))

(assert (=> start!64142 true))

(declare-fun e!204367 () Bool)

(assert (=> start!64142 (and (array_inv!6925 a1!647) e!204367)))

(declare-fun e!204368 () Bool)

(assert (=> start!64142 (and (array_inv!6925 a3!68) e!204368)))

(declare-fun b!286877 () Bool)

(assert (=> b!286877 (= e!204365 (not true))))

(declare-fun i!964 () (_ BitVec 32))

(assert (=> b!286877 (arrayRangesEq!1409 a1!647 a3!68 from!773 (bvadd #b00000000000000000000000000000001 i!964))))

(declare-datatypes ((Unit!19955 0))(
  ( (Unit!19956) )
))
(declare-fun lt!418680 () Unit!19955)

(declare-fun arrayRangesEqAppend!19 (array!16848 array!16848 (_ BitVec 32) (_ BitVec 32)) Unit!19955)

(assert (=> b!286877 (= lt!418680 (arrayRangesEqAppend!19 a1!647 a3!68 from!773 i!964))))

(declare-fun b!286878 () Bool)

(declare-fun tp_is_empty!567 () Bool)

(declare-fun mapRes!1829 () Bool)

(assert (=> b!286878 (= e!204366 (and tp_is_empty!567 mapRes!1829))))

(declare-fun condMapEmpty!1830 () Bool)

(declare-fun mapDefault!1831 () T!51933)

(assert (=> b!286878 (= condMapEmpty!1830 (= (arr!8270 a2!647) ((as const (Array (_ BitVec 32) T!51933)) mapDefault!1831)))))

(declare-fun mapIsEmpty!1830 () Bool)

(declare-fun mapRes!1830 () Bool)

(assert (=> mapIsEmpty!1830 mapRes!1830))

(declare-fun b!286879 () Bool)

(assert (=> b!286879 (= e!204367 (and tp_is_empty!567 mapRes!1830))))

(declare-fun condMapEmpty!1829 () Bool)

(declare-fun mapDefault!1829 () T!51933)

(assert (=> b!286879 (= condMapEmpty!1829 (= (arr!8270 a1!647) ((as const (Array (_ BitVec 32) T!51933)) mapDefault!1829)))))

(declare-fun b!286880 () Bool)

(declare-fun res!237317 () Bool)

(assert (=> b!286880 (=> (not res!237317) (not e!204365))))

(assert (=> b!286880 (= res!237317 (arrayRangesEq!1409 a1!647 a2!647 i!964 mid!71))))

(declare-fun mapNonEmpty!1829 () Bool)

(declare-fun tp!1831 () Bool)

(assert (=> mapNonEmpty!1829 (= mapRes!1829 (and tp!1831 tp_is_empty!567))))

(declare-fun mapValue!1829 () T!51933)

(declare-fun mapRest!1830 () (Array (_ BitVec 32) T!51933))

(declare-fun mapKey!1830 () (_ BitVec 32))

(assert (=> mapNonEmpty!1829 (= (arr!8270 a2!647) (store mapRest!1830 mapKey!1830 mapValue!1829))))

(declare-fun b!286881 () Bool)

(declare-fun res!237315 () Bool)

(assert (=> b!286881 (=> (not res!237315) (not e!204365))))

(assert (=> b!286881 (= res!237315 (arrayRangesEq!1409 a1!647 a3!68 from!773 i!964))))

(declare-fun mapNonEmpty!1830 () Bool)

(declare-fun tp!1829 () Bool)

(assert (=> mapNonEmpty!1830 (= mapRes!1830 (and tp!1829 tp_is_empty!567))))

(declare-fun mapRest!1831 () (Array (_ BitVec 32) T!51933))

(declare-fun mapKey!1831 () (_ BitVec 32))

(declare-fun mapValue!1830 () T!51933)

(assert (=> mapNonEmpty!1830 (= (arr!8270 a1!647) (store mapRest!1831 mapKey!1831 mapValue!1830))))

(declare-fun b!286882 () Bool)

(declare-fun res!237319 () Bool)

(assert (=> b!286882 (=> (not res!237319) (not e!204365))))

(assert (=> b!286882 (= res!237319 (and (bvsle from!773 i!964) (bvsle i!964 mid!71)))))

(declare-fun b!286883 () Bool)

(declare-fun res!237321 () Bool)

(assert (=> b!286883 (=> (not res!237321) (not e!204365))))

(assert (=> b!286883 (= res!237321 (not (= i!964 mid!71)))))

(declare-fun mapIsEmpty!1831 () Bool)

(assert (=> mapIsEmpty!1831 mapRes!1829))

(declare-fun mapNonEmpty!1831 () Bool)

(declare-fun tp!1830 () Bool)

(assert (=> mapNonEmpty!1831 (= mapRes!1831 (and tp!1830 tp_is_empty!567))))

(declare-fun mapRest!1829 () (Array (_ BitVec 32) T!51933))

(declare-fun mapKey!1829 () (_ BitVec 32))

(declare-fun mapValue!1831 () T!51933)

(assert (=> mapNonEmpty!1831 (= (arr!8270 a3!68) (store mapRest!1829 mapKey!1829 mapValue!1831))))

(declare-fun b!286884 () Bool)

(declare-fun res!237316 () Bool)

(assert (=> b!286884 (=> (not res!237316) (not e!204365))))

(assert (=> b!286884 (= res!237316 (arrayRangesEq!1409 a2!647 a3!68 i!964 to!740))))

(declare-fun b!286885 () Bool)

(assert (=> b!286885 (= e!204368 (and tp_is_empty!567 mapRes!1831))))

(declare-fun condMapEmpty!1831 () Bool)

(declare-fun mapDefault!1830 () T!51933)

(assert (=> b!286885 (= condMapEmpty!1831 (= (arr!8270 a3!68) ((as const (Array (_ BitVec 32) T!51933)) mapDefault!1830)))))

(assert (= (and start!64142 res!237318) b!286875))

(assert (= (and b!286875 res!237320) b!286876))

(assert (= (and b!286876 res!237322) b!286882))

(assert (= (and b!286882 res!237319) b!286880))

(assert (= (and b!286880 res!237317) b!286884))

(assert (= (and b!286884 res!237316) b!286881))

(assert (= (and b!286881 res!237315) b!286883))

(assert (= (and b!286883 res!237321) b!286877))

(assert (= (and b!286878 condMapEmpty!1830) mapIsEmpty!1831))

(assert (= (and b!286878 (not condMapEmpty!1830)) mapNonEmpty!1829))

(assert (= start!64142 b!286878))

(assert (= (and b!286879 condMapEmpty!1829) mapIsEmpty!1830))

(assert (= (and b!286879 (not condMapEmpty!1829)) mapNonEmpty!1830))

(assert (= start!64142 b!286879))

(assert (= (and b!286885 condMapEmpty!1831) mapIsEmpty!1829))

(assert (= (and b!286885 (not condMapEmpty!1831)) mapNonEmpty!1831))

(assert (= start!64142 b!286885))

(declare-fun m!419597 () Bool)

(assert (=> b!286880 m!419597))

(declare-fun m!419599 () Bool)

(assert (=> b!286876 m!419599))

(declare-fun m!419601 () Bool)

(assert (=> b!286877 m!419601))

(declare-fun m!419603 () Bool)

(assert (=> b!286877 m!419603))

(declare-fun m!419605 () Bool)

(assert (=> mapNonEmpty!1831 m!419605))

(declare-fun m!419607 () Bool)

(assert (=> b!286884 m!419607))

(declare-fun m!419609 () Bool)

(assert (=> b!286881 m!419609))

(declare-fun m!419611 () Bool)

(assert (=> mapNonEmpty!1830 m!419611))

(declare-fun m!419613 () Bool)

(assert (=> b!286875 m!419613))

(declare-fun m!419615 () Bool)

(assert (=> mapNonEmpty!1829 m!419615))

(declare-fun m!419617 () Bool)

(assert (=> start!64142 m!419617))

(declare-fun m!419619 () Bool)

(assert (=> start!64142 m!419619))

(declare-fun m!419621 () Bool)

(assert (=> start!64142 m!419621))

(check-sat (not b!286877) (not b!286880) (not b!286875) (not b!286884) (not mapNonEmpty!1831) (not mapNonEmpty!1829) (not start!64142) (not b!286876) tp_is_empty!567 (not b!286881) (not mapNonEmpty!1830))
(check-sat)
