; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68694 () Bool)

(assert start!68694)

(declare-fun b!309948 () Bool)

(declare-fun e!222810 () Bool)

(declare-fun tp_is_empty!963 () Bool)

(declare-fun mapRes!3061 () Bool)

(assert (=> b!309948 (= e!222810 (and tp_is_empty!963 mapRes!3061))))

(declare-fun condMapEmpty!3061 () Bool)

(declare-datatypes ((T!58369 0))(
  ( (T!58370 (val!481 Int)) )
))
(declare-datatypes ((array!18829 0))(
  ( (array!18830 (arr!9251 (Array (_ BitVec 32) T!58369)) (size!8168 (_ BitVec 32))) )
))
(declare-fun a1!566 () array!18829)

(declare-fun mapDefault!3061 () T!58369)

(assert (=> b!309948 (= condMapEmpty!3061 (= (arr!9251 a1!566) ((as const (Array (_ BitVec 32) T!58369)) mapDefault!3061)))))

(declare-fun at!235 () (_ BitVec 32))

(declare-fun e!222811 () Bool)

(declare-fun i!943 () (_ BitVec 32))

(declare-fun b!309949 () Bool)

(assert (=> b!309949 (= e!222811 (and (= i!943 at!235) (or (bvslt at!235 #b00000000000000000000000000000000) (bvsge at!235 (size!8168 a1!566)))))))

(declare-fun mapIsEmpty!3061 () Bool)

(declare-fun mapRes!3062 () Bool)

(assert (=> mapIsEmpty!3061 mapRes!3062))

(declare-fun b!309950 () Bool)

(declare-fun e!222812 () Bool)

(assert (=> b!309950 (= e!222812 (and tp_is_empty!963 mapRes!3062))))

(declare-fun condMapEmpty!3062 () Bool)

(declare-fun a2!566 () array!18829)

(declare-fun mapDefault!3062 () T!58369)

(assert (=> b!309950 (= condMapEmpty!3062 (= (arr!9251 a2!566) ((as const (Array (_ BitVec 32) T!58369)) mapDefault!3062)))))

(declare-fun b!309951 () Bool)

(declare-fun res!254182 () Bool)

(assert (=> b!309951 (=> (not res!254182) (not e!222811))))

(declare-fun to!659 () (_ BitVec 32))

(declare-fun arrayRangesEq!1771 (array!18829 array!18829 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!309951 (= res!254182 (arrayRangesEq!1771 a1!566 a2!566 i!943 to!659))))

(declare-fun mapNonEmpty!3061 () Bool)

(declare-fun tp!3061 () Bool)

(assert (=> mapNonEmpty!3061 (= mapRes!3062 (and tp!3061 tp_is_empty!963))))

(declare-fun mapValue!3062 () T!58369)

(declare-fun mapRest!3061 () (Array (_ BitVec 32) T!58369))

(declare-fun mapKey!3062 () (_ BitVec 32))

(assert (=> mapNonEmpty!3061 (= (arr!9251 a2!566) (store mapRest!3061 mapKey!3062 mapValue!3062))))

(declare-fun res!254185 () Bool)

(assert (=> start!68694 (=> (not res!254185) (not e!222811))))

(declare-fun from!692 () (_ BitVec 32))

(assert (=> start!68694 (= res!254185 (and (bvsle #b00000000000000000000000000000000 from!692) (bvsle from!692 to!659) (bvsle (size!8168 a1!566) (size!8168 a2!566)) (bvsle to!659 (size!8168 a1!566)) (bvsle from!692 at!235) (bvslt at!235 to!659)))))

(assert (=> start!68694 e!222811))

(assert (=> start!68694 true))

(declare-fun array_inv!7736 (array!18829) Bool)

(assert (=> start!68694 (and (array_inv!7736 a2!566) e!222812)))

(assert (=> start!68694 (and (array_inv!7736 a1!566) e!222810)))

(declare-fun mapNonEmpty!3062 () Bool)

(declare-fun tp!3062 () Bool)

(assert (=> mapNonEmpty!3062 (= mapRes!3061 (and tp!3062 tp_is_empty!963))))

(declare-fun mapRest!3062 () (Array (_ BitVec 32) T!58369))

(declare-fun mapKey!3061 () (_ BitVec 32))

(declare-fun mapValue!3061 () T!58369)

(assert (=> mapNonEmpty!3062 (= (arr!9251 a1!566) (store mapRest!3062 mapKey!3061 mapValue!3061))))

(declare-fun b!309952 () Bool)

(declare-fun res!254184 () Bool)

(assert (=> b!309952 (=> (not res!254184) (not e!222811))))

(assert (=> b!309952 (= res!254184 (and (bvsle from!692 i!943) (bvsle i!943 at!235)))))

(declare-fun mapIsEmpty!3062 () Bool)

(assert (=> mapIsEmpty!3062 mapRes!3061))

(declare-fun b!309953 () Bool)

(declare-fun res!254183 () Bool)

(assert (=> b!309953 (=> (not res!254183) (not e!222811))))

(assert (=> b!309953 (= res!254183 (arrayRangesEq!1771 a1!566 a2!566 from!692 to!659))))

(assert (= (and start!68694 res!254185) b!309953))

(assert (= (and b!309953 res!254183) b!309952))

(assert (= (and b!309952 res!254184) b!309951))

(assert (= (and b!309951 res!254182) b!309949))

(assert (= (and b!309950 condMapEmpty!3062) mapIsEmpty!3061))

(assert (= (and b!309950 (not condMapEmpty!3062)) mapNonEmpty!3061))

(assert (= start!68694 b!309950))

(assert (= (and b!309948 condMapEmpty!3061) mapIsEmpty!3062))

(assert (= (and b!309948 (not condMapEmpty!3061)) mapNonEmpty!3062))

(assert (= start!68694 b!309948))

(declare-fun m!447865 () Bool)

(assert (=> start!68694 m!447865))

(declare-fun m!447867 () Bool)

(assert (=> start!68694 m!447867))

(declare-fun m!447869 () Bool)

(assert (=> b!309951 m!447869))

(declare-fun m!447871 () Bool)

(assert (=> mapNonEmpty!3061 m!447871))

(declare-fun m!447873 () Bool)

(assert (=> b!309953 m!447873))

(declare-fun m!447875 () Bool)

(assert (=> mapNonEmpty!3062 m!447875))

(check-sat (not mapNonEmpty!3061) tp_is_empty!963 (not start!68694) (not mapNonEmpty!3062) (not b!309953) (not b!309951))
(check-sat)
