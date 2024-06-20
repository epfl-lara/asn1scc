; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68700 () Bool)

(assert start!68700)

(declare-fun mapNonEmpty!3079 () Bool)

(declare-fun mapRes!3079 () Bool)

(declare-fun tp!3079 () Bool)

(declare-fun tp_is_empty!969 () Bool)

(assert (=> mapNonEmpty!3079 (= mapRes!3079 (and tp!3079 tp_is_empty!969))))

(declare-fun mapKey!3080 () (_ BitVec 32))

(declare-datatypes ((T!58395 0))(
  ( (T!58396 (val!484 Int)) )
))
(declare-datatypes ((array!18835 0))(
  ( (array!18836 (arr!9254 (Array (_ BitVec 32) T!58395)) (size!8171 (_ BitVec 32))) )
))
(declare-fun a1!566 () array!18835)

(declare-fun mapRest!3080 () (Array (_ BitVec 32) T!58395))

(declare-fun mapValue!3080 () T!58395)

(assert (=> mapNonEmpty!3079 (= (arr!9254 a1!566) (store mapRest!3080 mapKey!3080 mapValue!3080))))

(declare-fun b!310002 () Bool)

(declare-fun res!254218 () Bool)

(declare-fun e!222838 () Bool)

(assert (=> b!310002 (=> (not res!254218) (not e!222838))))

(declare-fun to!659 () (_ BitVec 32))

(declare-fun a2!566 () array!18835)

(declare-fun from!692 () (_ BitVec 32))

(declare-fun arrayRangesEq!1774 (array!18835 array!18835 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!310002 (= res!254218 (arrayRangesEq!1774 a1!566 a2!566 from!692 to!659))))

(declare-fun mapIsEmpty!3079 () Bool)

(assert (=> mapIsEmpty!3079 mapRes!3079))

(declare-fun b!310003 () Bool)

(declare-fun at!235 () (_ BitVec 32))

(declare-fun i!943 () (_ BitVec 32))

(assert (=> b!310003 (= e!222838 (and (= i!943 at!235) (or (bvslt at!235 #b00000000000000000000000000000000) (bvsge at!235 (size!8171 a2!566)))))))

(declare-fun b!310004 () Bool)

(declare-fun e!222837 () Bool)

(declare-fun mapRes!3080 () Bool)

(assert (=> b!310004 (= e!222837 (and tp_is_empty!969 mapRes!3080))))

(declare-fun condMapEmpty!3080 () Bool)

(declare-fun mapDefault!3080 () T!58395)

(assert (=> b!310004 (= condMapEmpty!3080 (= (arr!9254 a2!566) ((as const (Array (_ BitVec 32) T!58395)) mapDefault!3080)))))

(declare-fun b!310005 () Bool)

(declare-fun res!254221 () Bool)

(assert (=> b!310005 (=> (not res!254221) (not e!222838))))

(assert (=> b!310005 (= res!254221 (and (bvsle from!692 i!943) (bvsle i!943 at!235)))))

(declare-fun res!254219 () Bool)

(assert (=> start!68700 (=> (not res!254219) (not e!222838))))

(assert (=> start!68700 (= res!254219 (and (bvsle #b00000000000000000000000000000000 from!692) (bvsle from!692 to!659) (bvsle (size!8171 a1!566) (size!8171 a2!566)) (bvsle to!659 (size!8171 a1!566)) (bvsle from!692 at!235) (bvslt at!235 to!659)))))

(assert (=> start!68700 e!222838))

(assert (=> start!68700 true))

(declare-fun array_inv!7738 (array!18835) Bool)

(assert (=> start!68700 (and (array_inv!7738 a2!566) e!222837)))

(declare-fun e!222839 () Bool)

(assert (=> start!68700 (and (array_inv!7738 a1!566) e!222839)))

(declare-fun b!310006 () Bool)

(declare-fun res!254220 () Bool)

(assert (=> b!310006 (=> (not res!254220) (not e!222838))))

(assert (=> b!310006 (= res!254220 (arrayRangesEq!1774 a1!566 a2!566 i!943 to!659))))

(declare-fun mapNonEmpty!3080 () Bool)

(declare-fun tp!3080 () Bool)

(assert (=> mapNonEmpty!3080 (= mapRes!3080 (and tp!3080 tp_is_empty!969))))

(declare-fun mapRest!3079 () (Array (_ BitVec 32) T!58395))

(declare-fun mapKey!3079 () (_ BitVec 32))

(declare-fun mapValue!3079 () T!58395)

(assert (=> mapNonEmpty!3080 (= (arr!9254 a2!566) (store mapRest!3079 mapKey!3079 mapValue!3079))))

(declare-fun mapIsEmpty!3080 () Bool)

(assert (=> mapIsEmpty!3080 mapRes!3080))

(declare-fun b!310007 () Bool)

(assert (=> b!310007 (= e!222839 (and tp_is_empty!969 mapRes!3079))))

(declare-fun condMapEmpty!3079 () Bool)

(declare-fun mapDefault!3079 () T!58395)

(assert (=> b!310007 (= condMapEmpty!3079 (= (arr!9254 a1!566) ((as const (Array (_ BitVec 32) T!58395)) mapDefault!3079)))))

(assert (= (and start!68700 res!254219) b!310002))

(assert (= (and b!310002 res!254218) b!310005))

(assert (= (and b!310005 res!254221) b!310006))

(assert (= (and b!310006 res!254220) b!310003))

(assert (= (and b!310004 condMapEmpty!3080) mapIsEmpty!3080))

(assert (= (and b!310004 (not condMapEmpty!3080)) mapNonEmpty!3080))

(assert (= start!68700 b!310004))

(assert (= (and b!310007 condMapEmpty!3079) mapIsEmpty!3079))

(assert (= (and b!310007 (not condMapEmpty!3079)) mapNonEmpty!3079))

(assert (= start!68700 b!310007))

(declare-fun m!447901 () Bool)

(assert (=> mapNonEmpty!3080 m!447901))

(declare-fun m!447903 () Bool)

(assert (=> start!68700 m!447903))

(declare-fun m!447905 () Bool)

(assert (=> start!68700 m!447905))

(declare-fun m!447907 () Bool)

(assert (=> mapNonEmpty!3079 m!447907))

(declare-fun m!447909 () Bool)

(assert (=> b!310006 m!447909))

(declare-fun m!447911 () Bool)

(assert (=> b!310002 m!447911))

(check-sat (not b!310006) (not b!310002) tp_is_empty!969 (not start!68700) (not mapNonEmpty!3079) (not mapNonEmpty!3080))
(check-sat)
