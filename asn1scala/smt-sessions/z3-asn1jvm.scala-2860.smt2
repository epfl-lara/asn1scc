; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68688 () Bool)

(assert start!68688)

(declare-fun mapIsEmpty!3043 () Bool)

(declare-fun mapRes!3044 () Bool)

(assert (=> mapIsEmpty!3043 mapRes!3044))

(declare-fun mapIsEmpty!3044 () Bool)

(declare-fun mapRes!3043 () Bool)

(assert (=> mapIsEmpty!3044 mapRes!3043))

(declare-fun b!309894 () Bool)

(declare-fun e!222784 () Bool)

(declare-fun tp_is_empty!957 () Bool)

(assert (=> b!309894 (= e!222784 (and tp_is_empty!957 mapRes!3043))))

(declare-fun condMapEmpty!3044 () Bool)

(declare-datatypes ((T!58343 0))(
  ( (T!58344 (val!478 Int)) )
))
(declare-datatypes ((array!18823 0))(
  ( (array!18824 (arr!9248 (Array (_ BitVec 32) T!58343)) (size!8165 (_ BitVec 32))) )
))
(declare-fun a2!566 () array!18823)

(declare-fun mapDefault!3043 () T!58343)

(assert (=> b!309894 (= condMapEmpty!3044 (= (arr!9248 a2!566) ((as const (Array (_ BitVec 32) T!58343)) mapDefault!3043)))))

(declare-fun mapNonEmpty!3043 () Bool)

(declare-fun tp!3044 () Bool)

(assert (=> mapNonEmpty!3043 (= mapRes!3043 (and tp!3044 tp_is_empty!957))))

(declare-fun mapValue!3043 () T!58343)

(declare-fun mapRest!3043 () (Array (_ BitVec 32) T!58343))

(declare-fun mapKey!3043 () (_ BitVec 32))

(assert (=> mapNonEmpty!3043 (= (arr!9248 a2!566) (store mapRest!3043 mapKey!3043 mapValue!3043))))

(declare-fun b!309895 () Bool)

(declare-fun e!222783 () Bool)

(declare-fun to!659 () (_ BitVec 32))

(declare-fun i!943 () (_ BitVec 32))

(assert (=> b!309895 (= e!222783 (bvslt (bvsub to!659 i!943) #b00000000000000000000000000000000))))

(declare-fun b!309896 () Bool)

(declare-fun res!254146 () Bool)

(assert (=> b!309896 (=> (not res!254146) (not e!222783))))

(declare-fun a1!566 () array!18823)

(declare-fun arrayRangesEq!1769 (array!18823 array!18823 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!309896 (= res!254146 (arrayRangesEq!1769 a1!566 a2!566 i!943 to!659))))

(declare-fun b!309897 () Bool)

(declare-fun res!254148 () Bool)

(assert (=> b!309897 (=> (not res!254148) (not e!222783))))

(declare-fun at!235 () (_ BitVec 32))

(declare-fun from!692 () (_ BitVec 32))

(assert (=> b!309897 (= res!254148 (and (bvsle from!692 i!943) (bvsle i!943 at!235)))))

(declare-fun res!254147 () Bool)

(assert (=> start!68688 (=> (not res!254147) (not e!222783))))

(assert (=> start!68688 (= res!254147 (and (bvsle #b00000000000000000000000000000000 from!692) (bvsle from!692 to!659) (bvsle (size!8165 a1!566) (size!8165 a2!566)) (bvsle to!659 (size!8165 a1!566)) (bvsle from!692 at!235) (bvslt at!235 to!659)))))

(assert (=> start!68688 e!222783))

(assert (=> start!68688 true))

(declare-fun array_inv!7734 (array!18823) Bool)

(assert (=> start!68688 (and (array_inv!7734 a2!566) e!222784)))

(declare-fun e!222785 () Bool)

(assert (=> start!68688 (and (array_inv!7734 a1!566) e!222785)))

(declare-fun mapNonEmpty!3044 () Bool)

(declare-fun tp!3043 () Bool)

(assert (=> mapNonEmpty!3044 (= mapRes!3044 (and tp!3043 tp_is_empty!957))))

(declare-fun mapValue!3044 () T!58343)

(declare-fun mapKey!3044 () (_ BitVec 32))

(declare-fun mapRest!3044 () (Array (_ BitVec 32) T!58343))

(assert (=> mapNonEmpty!3044 (= (arr!9248 a1!566) (store mapRest!3044 mapKey!3044 mapValue!3044))))

(declare-fun b!309898 () Bool)

(declare-fun res!254149 () Bool)

(assert (=> b!309898 (=> (not res!254149) (not e!222783))))

(assert (=> b!309898 (= res!254149 (arrayRangesEq!1769 a1!566 a2!566 from!692 to!659))))

(declare-fun b!309899 () Bool)

(assert (=> b!309899 (= e!222785 (and tp_is_empty!957 mapRes!3044))))

(declare-fun condMapEmpty!3043 () Bool)

(declare-fun mapDefault!3044 () T!58343)

(assert (=> b!309899 (= condMapEmpty!3043 (= (arr!9248 a1!566) ((as const (Array (_ BitVec 32) T!58343)) mapDefault!3044)))))

(assert (= (and start!68688 res!254147) b!309898))

(assert (= (and b!309898 res!254149) b!309897))

(assert (= (and b!309897 res!254148) b!309896))

(assert (= (and b!309896 res!254146) b!309895))

(assert (= (and b!309894 condMapEmpty!3044) mapIsEmpty!3044))

(assert (= (and b!309894 (not condMapEmpty!3044)) mapNonEmpty!3043))

(assert (= start!68688 b!309894))

(assert (= (and b!309899 condMapEmpty!3043) mapIsEmpty!3043))

(assert (= (and b!309899 (not condMapEmpty!3043)) mapNonEmpty!3044))

(assert (= start!68688 b!309899))

(declare-fun m!447829 () Bool)

(assert (=> mapNonEmpty!3043 m!447829))

(declare-fun m!447831 () Bool)

(assert (=> b!309896 m!447831))

(declare-fun m!447833 () Bool)

(assert (=> b!309898 m!447833))

(declare-fun m!447835 () Bool)

(assert (=> mapNonEmpty!3044 m!447835))

(declare-fun m!447837 () Bool)

(assert (=> start!68688 m!447837))

(declare-fun m!447839 () Bool)

(assert (=> start!68688 m!447839))

(check-sat tp_is_empty!957 (not b!309896) (not b!309898) (not mapNonEmpty!3044) (not start!68688) (not mapNonEmpty!3043))
(check-sat)
