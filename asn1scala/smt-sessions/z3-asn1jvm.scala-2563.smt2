; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64166 () Bool)

(assert start!64166)

(declare-fun mapNonEmpty!1923 () Bool)

(declare-fun mapRes!1924 () Bool)

(declare-fun tp!1923 () Bool)

(declare-fun tp_is_empty!591 () Bool)

(assert (=> mapNonEmpty!1923 (= mapRes!1924 (and tp!1923 tp_is_empty!591))))

(declare-datatypes ((T!52037 0))(
  ( (T!52038 (val!295 Int)) )
))
(declare-fun mapValue!1923 () T!52037)

(declare-fun mapKey!1924 () (_ BitVec 32))

(declare-datatypes ((array!16872 0))(
  ( (array!16873 (arr!8282 (Array (_ BitVec 32) T!52037)) (size!7286 (_ BitVec 32))) )
))
(declare-fun a1!580 () array!16872)

(declare-fun mapRest!1924 () (Array (_ BitVec 32) T!52037))

(assert (=> mapNonEmpty!1923 (= (arr!8282 a1!580) (store mapRest!1924 mapKey!1924 mapValue!1923))))

(declare-fun mapIsEmpty!1923 () Bool)

(assert (=> mapIsEmpty!1923 mapRes!1924))

(declare-fun b!287219 () Bool)

(declare-fun e!204505 () Bool)

(declare-fun mapRes!1923 () Bool)

(assert (=> b!287219 (= e!204505 (and tp_is_empty!591 mapRes!1923))))

(declare-fun condMapEmpty!1923 () Bool)

(declare-fun a2!580 () array!16872)

(declare-fun mapDefault!1923 () T!52037)

(assert (=> b!287219 (= condMapEmpty!1923 (= (arr!8282 a2!580) ((as const (Array (_ BitVec 32) T!52037)) mapDefault!1923)))))

(declare-fun mapNonEmpty!1924 () Bool)

(declare-fun tp!1924 () Bool)

(assert (=> mapNonEmpty!1924 (= mapRes!1923 (and tp!1924 tp_is_empty!591))))

(declare-fun mapValue!1924 () T!52037)

(declare-fun mapKey!1923 () (_ BitVec 32))

(declare-fun mapRest!1923 () (Array (_ BitVec 32) T!52037))

(assert (=> mapNonEmpty!1924 (= (arr!8282 a2!580) (store mapRest!1923 mapKey!1923 mapValue!1924))))

(declare-fun b!287220 () Bool)

(declare-fun res!237565 () Bool)

(declare-fun e!204504 () Bool)

(assert (=> b!287220 (=> (not res!237565) (not e!204504))))

(declare-fun to!673 () (_ BitVec 32))

(declare-fun from!706 () (_ BitVec 32))

(declare-fun arrayRangesEq!1418 (array!16872 array!16872 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!287220 (= res!237565 (arrayRangesEq!1418 a1!580 a2!580 from!706 to!673))))

(declare-fun res!237566 () Bool)

(assert (=> start!64166 (=> (not res!237566) (not e!204504))))

(assert (=> start!64166 (= res!237566 (and (bvsle #b00000000000000000000000000000000 from!706) (bvsle from!706 to!673) (bvsle (size!7286 a1!580) (size!7286 a2!580)) (bvslt to!673 (size!7286 a1!580))))))

(assert (=> start!64166 e!204504))

(assert (=> start!64166 true))

(declare-fun e!204506 () Bool)

(declare-fun array_inv!6933 (array!16872) Bool)

(assert (=> start!64166 (and (array_inv!6933 a1!580) e!204506)))

(assert (=> start!64166 (and (array_inv!6933 a2!580) e!204505)))

(declare-fun b!287221 () Bool)

(assert (=> b!287221 (= e!204504 (not (bvsle from!706 (bvadd #b00000000000000000000000000000001 to!673))))))

(assert (=> b!287221 (arrayRangesEq!1418 a1!580 a2!580 from!706 (bvadd #b00000000000000000000000000000001 to!673))))

(declare-datatypes ((Unit!19965 0))(
  ( (Unit!19966) )
))
(declare-fun lt!418716 () Unit!19965)

(declare-fun rec!71 (array!16872 array!16872 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19965)

(assert (=> b!287221 (= lt!418716 (rec!71 a1!580 a2!580 from!706 to!673 to!673))))

(declare-fun b!287222 () Bool)

(declare-fun res!237568 () Bool)

(assert (=> b!287222 (=> (not res!237568) (not e!204504))))

(assert (=> b!287222 (= res!237568 (arrayRangesEq!1418 a1!580 a2!580 to!673 (bvadd #b00000000000000000000000000000001 to!673)))))

(declare-fun mapIsEmpty!1924 () Bool)

(assert (=> mapIsEmpty!1924 mapRes!1923))

(declare-fun b!287223 () Bool)

(declare-fun res!237567 () Bool)

(assert (=> b!287223 (=> (not res!237567) (not e!204504))))

(assert (=> b!287223 (= res!237567 (= (select (arr!8282 a1!580) to!673) (select (arr!8282 a2!580) to!673)))))

(declare-fun b!287224 () Bool)

(assert (=> b!287224 (= e!204506 (and tp_is_empty!591 mapRes!1924))))

(declare-fun condMapEmpty!1924 () Bool)

(declare-fun mapDefault!1924 () T!52037)

(assert (=> b!287224 (= condMapEmpty!1924 (= (arr!8282 a1!580) ((as const (Array (_ BitVec 32) T!52037)) mapDefault!1924)))))

(assert (= (and start!64166 res!237566) b!287220))

(assert (= (and b!287220 res!237565) b!287223))

(assert (= (and b!287223 res!237567) b!287222))

(assert (= (and b!287222 res!237568) b!287221))

(assert (= (and b!287224 condMapEmpty!1924) mapIsEmpty!1923))

(assert (= (and b!287224 (not condMapEmpty!1924)) mapNonEmpty!1923))

(assert (= start!64166 b!287224))

(assert (= (and b!287219 condMapEmpty!1923) mapIsEmpty!1924))

(assert (= (and b!287219 (not condMapEmpty!1923)) mapNonEmpty!1924))

(assert (= start!64166 b!287219))

(declare-fun m!419885 () Bool)

(assert (=> mapNonEmpty!1923 m!419885))

(declare-fun m!419887 () Bool)

(assert (=> b!287220 m!419887))

(declare-fun m!419889 () Bool)

(assert (=> b!287222 m!419889))

(declare-fun m!419891 () Bool)

(assert (=> b!287221 m!419891))

(declare-fun m!419893 () Bool)

(assert (=> b!287221 m!419893))

(declare-fun m!419895 () Bool)

(assert (=> b!287223 m!419895))

(declare-fun m!419897 () Bool)

(assert (=> b!287223 m!419897))

(declare-fun m!419899 () Bool)

(assert (=> mapNonEmpty!1924 m!419899))

(declare-fun m!419901 () Bool)

(assert (=> start!64166 m!419901))

(declare-fun m!419903 () Bool)

(assert (=> start!64166 m!419903))

(check-sat (not mapNonEmpty!1924) tp_is_empty!591 (not b!287222) (not start!64166) (not mapNonEmpty!1923) (not b!287220) (not b!287221))
(check-sat)
