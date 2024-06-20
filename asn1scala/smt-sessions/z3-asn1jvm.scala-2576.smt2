; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64248 () Bool)

(assert start!64248)

(declare-fun b!287932 () Bool)

(declare-fun e!204884 () Bool)

(declare-fun tp_is_empty!669 () Bool)

(declare-fun mapRes!2164 () Bool)

(assert (=> b!287932 (= e!204884 (and tp_is_empty!669 mapRes!2164))))

(declare-fun condMapEmpty!2163 () Bool)

(declare-datatypes ((T!52375 0))(
  ( (T!52376 (val!334 Int)) )
))
(declare-datatypes ((array!16951 0))(
  ( (array!16952 (arr!8321 (Array (_ BitVec 32) T!52375)) (size!7325 (_ BitVec 32))) )
))
(declare-fun a2!596 () array!16951)

(declare-fun mapDefault!2163 () T!52375)

(assert (=> b!287932 (= condMapEmpty!2163 (= (arr!8321 a2!596) ((as const (Array (_ BitVec 32) T!52375)) mapDefault!2163)))))

(declare-fun res!238044 () Bool)

(declare-fun e!204881 () Bool)

(assert (=> start!64248 (=> (not res!238044) (not e!204881))))

(declare-fun a1!596 () array!16951)

(declare-fun to!689 () (_ BitVec 32))

(declare-fun from!722 () (_ BitVec 32))

(assert (=> start!64248 (= res!238044 (and (bvsle #b00000000000000000000000000000000 from!722) (bvsle from!722 to!689) (bvsle (size!7325 a1!596) (size!7325 a2!596)) (bvslt to!689 (size!7325 a1!596))))))

(assert (=> start!64248 e!204881))

(declare-fun e!204883 () Bool)

(declare-fun array_inv!6956 (array!16951) Bool)

(assert (=> start!64248 (and (array_inv!6956 a1!596) e!204883)))

(assert (=> start!64248 (and (array_inv!6956 a2!596) e!204884)))

(assert (=> start!64248 true))

(declare-fun mapIsEmpty!2163 () Bool)

(declare-fun mapRes!2163 () Bool)

(assert (=> mapIsEmpty!2163 mapRes!2163))

(declare-fun b!287933 () Bool)

(declare-fun e!204882 () Bool)

(assert (=> b!287933 (= e!204881 (not e!204882))))

(declare-fun res!238042 () Bool)

(assert (=> b!287933 (=> res!238042 e!204882)))

(declare-fun i!953 () (_ BitVec 32))

(assert (=> b!287933 (= res!238042 (or (bvsgt from!722 (bvsub i!953 #b00000000000000000000000000000001)) (bvsgt (bvsub i!953 #b00000000000000000000000000000001) to!689)))))

(assert (=> b!287933 (= (select (arr!8321 a1!596) (bvsub i!953 #b00000000000000000000000000000001)) (select (arr!8321 a2!596) (bvsub i!953 #b00000000000000000000000000000001)))))

(declare-datatypes ((Unit!19995 0))(
  ( (Unit!19996) )
))
(declare-fun lt!418803 () Unit!19995)

(declare-fun arrayRangesEqImpliesEq!203 (array!16951 array!16951 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19995)

(assert (=> b!287933 (= lt!418803 (arrayRangesEqImpliesEq!203 a1!596 a2!596 from!722 (bvsub i!953 #b00000000000000000000000000000001) to!689))))

(declare-fun b!287934 () Bool)

(assert (=> b!287934 (= e!204883 (and tp_is_empty!669 mapRes!2163))))

(declare-fun condMapEmpty!2164 () Bool)

(declare-fun mapDefault!2164 () T!52375)

(assert (=> b!287934 (= condMapEmpty!2164 (= (arr!8321 a1!596) ((as const (Array (_ BitVec 32) T!52375)) mapDefault!2164)))))

(declare-fun b!287935 () Bool)

(declare-fun res!238043 () Bool)

(assert (=> b!287935 (=> (not res!238043) (not e!204881))))

(assert (=> b!287935 (= res!238043 (not (= i!953 from!722)))))

(declare-fun mapNonEmpty!2163 () Bool)

(declare-fun tp!2163 () Bool)

(assert (=> mapNonEmpty!2163 (= mapRes!2164 (and tp!2163 tp_is_empty!669))))

(declare-fun mapKey!2163 () (_ BitVec 32))

(declare-fun mapRest!2163 () (Array (_ BitVec 32) T!52375))

(declare-fun mapValue!2163 () T!52375)

(assert (=> mapNonEmpty!2163 (= (arr!8321 a2!596) (store mapRest!2163 mapKey!2163 mapValue!2163))))

(declare-fun b!287936 () Bool)

(declare-fun res!238045 () Bool)

(assert (=> b!287936 (=> (not res!238045) (not e!204881))))

(declare-fun arrayRangesEq!1443 (array!16951 array!16951 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!287936 (= res!238045 (arrayRangesEq!1443 a1!596 a2!596 from!722 to!689))))

(declare-fun mapNonEmpty!2164 () Bool)

(declare-fun tp!2164 () Bool)

(assert (=> mapNonEmpty!2164 (= mapRes!2163 (and tp!2164 tp_is_empty!669))))

(declare-fun mapRest!2164 () (Array (_ BitVec 32) T!52375))

(declare-fun mapKey!2164 () (_ BitVec 32))

(declare-fun mapValue!2164 () T!52375)

(assert (=> mapNonEmpty!2164 (= (arr!8321 a1!596) (store mapRest!2164 mapKey!2164 mapValue!2164))))

(declare-fun b!287937 () Bool)

(declare-fun res!238047 () Bool)

(assert (=> b!287937 (=> (not res!238047) (not e!204881))))

(assert (=> b!287937 (= res!238047 (arrayRangesEq!1443 a1!596 a2!596 i!953 (bvadd #b00000000000000000000000000000001 to!689)))))

(declare-fun b!287938 () Bool)

(assert (=> b!287938 (= e!204882 true)))

(assert (=> b!287938 (arrayRangesEq!1443 a1!596 a2!596 from!722 (bvadd #b00000000000000000000000000000001 to!689))))

(declare-fun lt!418802 () Unit!19995)

(declare-fun rec!83 (array!16951 array!16951 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19995)

(assert (=> b!287938 (= lt!418802 (rec!83 a1!596 a2!596 from!722 to!689 (bvsub i!953 #b00000000000000000000000000000001)))))

(declare-fun mapIsEmpty!2164 () Bool)

(assert (=> mapIsEmpty!2164 mapRes!2164))

(declare-fun b!287939 () Bool)

(declare-fun res!238048 () Bool)

(assert (=> b!287939 (=> res!238048 e!204882)))

(assert (=> b!287939 (= res!238048 (not (arrayRangesEq!1443 a1!596 a2!596 (bvsub i!953 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!689))))))

(declare-fun b!287940 () Bool)

(declare-fun res!238046 () Bool)

(assert (=> b!287940 (=> (not res!238046) (not e!204881))))

(assert (=> b!287940 (= res!238046 (and (= (select (arr!8321 a1!596) to!689) (select (arr!8321 a2!596) to!689)) (bvsle from!722 i!953) (bvsle i!953 to!689)))))

(assert (= (and start!64248 res!238044) b!287936))

(assert (= (and b!287936 res!238045) b!287940))

(assert (= (and b!287940 res!238046) b!287937))

(assert (= (and b!287937 res!238047) b!287935))

(assert (= (and b!287935 res!238043) b!287933))

(assert (= (and b!287933 (not res!238042)) b!287939))

(assert (= (and b!287939 (not res!238048)) b!287938))

(assert (= (and b!287934 condMapEmpty!2164) mapIsEmpty!2163))

(assert (= (and b!287934 (not condMapEmpty!2164)) mapNonEmpty!2164))

(assert (= start!64248 b!287934))

(assert (= (and b!287932 condMapEmpty!2163) mapIsEmpty!2164))

(assert (= (and b!287932 (not condMapEmpty!2163)) mapNonEmpty!2163))

(assert (= start!64248 b!287932))

(declare-fun m!420635 () Bool)

(assert (=> mapNonEmpty!2163 m!420635))

(declare-fun m!420637 () Bool)

(assert (=> b!287940 m!420637))

(declare-fun m!420639 () Bool)

(assert (=> b!287940 m!420639))

(declare-fun m!420641 () Bool)

(assert (=> b!287933 m!420641))

(declare-fun m!420643 () Bool)

(assert (=> b!287933 m!420643))

(declare-fun m!420645 () Bool)

(assert (=> b!287933 m!420645))

(declare-fun m!420647 () Bool)

(assert (=> b!287939 m!420647))

(declare-fun m!420649 () Bool)

(assert (=> b!287937 m!420649))

(declare-fun m!420651 () Bool)

(assert (=> mapNonEmpty!2164 m!420651))

(declare-fun m!420653 () Bool)

(assert (=> start!64248 m!420653))

(declare-fun m!420655 () Bool)

(assert (=> start!64248 m!420655))

(declare-fun m!420657 () Bool)

(assert (=> b!287938 m!420657))

(declare-fun m!420659 () Bool)

(assert (=> b!287938 m!420659))

(declare-fun m!420661 () Bool)

(assert (=> b!287936 m!420661))

(check-sat tp_is_empty!669 (not b!287933) (not b!287938) (not start!64248) (not mapNonEmpty!2164) (not b!287937) (not b!287936) (not b!287939) (not mapNonEmpty!2163))
(check-sat)
