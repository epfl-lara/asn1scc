; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63174 () Bool)

(assert start!63174)

(declare-fun b!282866 () Bool)

(declare-fun res!234556 () Bool)

(declare-fun e!202081 () Bool)

(assert (=> b!282866 (=> (not res!234556) (not e!202081))))

(declare-datatypes ((T!50259 0))(
  ( (T!50260 (val!166 Int)) )
))
(declare-datatypes ((array!16367 0))(
  ( (array!16368 (arr!8063 (Array (_ BitVec 32) T!50259)) (size!7067 (_ BitVec 32))) )
))
(declare-fun a1!471 () array!16367)

(declare-fun to!564 () (_ BitVec 32))

(declare-fun i!913 () (_ BitVec 32))

(declare-fun a2!471 () array!16367)

(declare-fun arrayRangesEq!1325 (array!16367 array!16367 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!282866 (= res!234556 (arrayRangesEq!1325 a2!471 a1!471 i!913 to!564))))

(declare-fun b!282867 () Bool)

(declare-fun e!202078 () Bool)

(assert (=> b!282867 (= e!202081 (not e!202078))))

(declare-fun res!234557 () Bool)

(assert (=> b!282867 (=> res!234557 e!202078)))

(declare-fun from!597 () (_ BitVec 32))

(assert (=> b!282867 (= res!234557 (or (bvsgt from!597 (bvsub i!913 #b00000000000000000000000000000001)) (bvsgt (bvsub i!913 #b00000000000000000000000000000001) to!564)))))

(assert (=> b!282867 (= (select (arr!8063 a1!471) (bvsub i!913 #b00000000000000000000000000000001)) (select (arr!8063 a2!471) (bvsub i!913 #b00000000000000000000000000000001)))))

(declare-datatypes ((Unit!19824 0))(
  ( (Unit!19825) )
))
(declare-fun lt!417837 () Unit!19824)

(declare-fun arrayRangesEqImpliesEq!187 (array!16367 array!16367 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19824)

(assert (=> b!282867 (= lt!417837 (arrayRangesEqImpliesEq!187 a1!471 a2!471 from!597 (bvsub i!913 #b00000000000000000000000000000001) to!564))))

(declare-fun b!282868 () Bool)

(declare-fun res!234553 () Bool)

(assert (=> b!282868 (=> (not res!234553) (not e!202081))))

(assert (=> b!282868 (= res!234553 (not (= i!913 from!597)))))

(declare-fun b!282869 () Bool)

(assert (=> b!282869 (= e!202078 (arrayRangesEq!1325 a2!471 a1!471 (bvsub i!913 #b00000000000000000000000000000001) to!564))))

(declare-fun res!234554 () Bool)

(assert (=> start!63174 (=> (not res!234554) (not e!202081))))

(assert (=> start!63174 (= res!234554 (and (bvsle #b00000000000000000000000000000000 from!597) (bvsle from!597 to!564) (bvsle to!564 (size!7067 a1!471)) (= (size!7067 a1!471) (size!7067 a2!471))))))

(assert (=> start!63174 e!202081))

(declare-fun e!202080 () Bool)

(declare-fun array_inv!6777 (array!16367) Bool)

(assert (=> start!63174 (and (array_inv!6777 a1!471) e!202080)))

(assert (=> start!63174 true))

(declare-fun e!202079 () Bool)

(assert (=> start!63174 (and (array_inv!6777 a2!471) e!202079)))

(declare-fun mapNonEmpty!842 () Bool)

(declare-fun mapRes!842 () Bool)

(declare-fun tp!842 () Bool)

(declare-fun tp_is_empty!333 () Bool)

(assert (=> mapNonEmpty!842 (= mapRes!842 (and tp!842 tp_is_empty!333))))

(declare-fun mapKey!843 () (_ BitVec 32))

(declare-fun mapValue!843 () T!50259)

(declare-fun mapRest!842 () (Array (_ BitVec 32) T!50259))

(assert (=> mapNonEmpty!842 (= (arr!8063 a1!471) (store mapRest!842 mapKey!843 mapValue!843))))

(declare-fun b!282870 () Bool)

(assert (=> b!282870 (= e!202080 (and tp_is_empty!333 mapRes!842))))

(declare-fun condMapEmpty!843 () Bool)

(declare-fun mapDefault!842 () T!50259)

(assert (=> b!282870 (= condMapEmpty!843 (= (arr!8063 a1!471) ((as const (Array (_ BitVec 32) T!50259)) mapDefault!842)))))

(declare-fun mapIsEmpty!842 () Bool)

(assert (=> mapIsEmpty!842 mapRes!842))

(declare-fun mapNonEmpty!843 () Bool)

(declare-fun mapRes!843 () Bool)

(declare-fun tp!843 () Bool)

(assert (=> mapNonEmpty!843 (= mapRes!843 (and tp!843 tp_is_empty!333))))

(declare-fun mapRest!843 () (Array (_ BitVec 32) T!50259))

(declare-fun mapValue!842 () T!50259)

(declare-fun mapKey!842 () (_ BitVec 32))

(assert (=> mapNonEmpty!843 (= (arr!8063 a2!471) (store mapRest!843 mapKey!842 mapValue!842))))

(declare-fun b!282871 () Bool)

(declare-fun res!234555 () Bool)

(assert (=> b!282871 (=> (not res!234555) (not e!202081))))

(assert (=> b!282871 (= res!234555 (and (bvsle from!597 i!913) (bvsle i!913 to!564)))))

(declare-fun b!282872 () Bool)

(assert (=> b!282872 (= e!202079 (and tp_is_empty!333 mapRes!843))))

(declare-fun condMapEmpty!842 () Bool)

(declare-fun mapDefault!843 () T!50259)

(assert (=> b!282872 (= condMapEmpty!842 (= (arr!8063 a2!471) ((as const (Array (_ BitVec 32) T!50259)) mapDefault!843)))))

(declare-fun mapIsEmpty!843 () Bool)

(assert (=> mapIsEmpty!843 mapRes!843))

(declare-fun b!282873 () Bool)

(declare-fun res!234558 () Bool)

(assert (=> b!282873 (=> (not res!234558) (not e!202081))))

(assert (=> b!282873 (= res!234558 (arrayRangesEq!1325 a1!471 a2!471 from!597 to!564))))

(assert (= (and start!63174 res!234554) b!282873))

(assert (= (and b!282873 res!234558) b!282871))

(assert (= (and b!282871 res!234555) b!282866))

(assert (= (and b!282866 res!234556) b!282868))

(assert (= (and b!282868 res!234553) b!282867))

(assert (= (and b!282867 (not res!234557)) b!282869))

(assert (= (and b!282870 condMapEmpty!843) mapIsEmpty!842))

(assert (= (and b!282870 (not condMapEmpty!843)) mapNonEmpty!842))

(assert (= start!63174 b!282870))

(assert (= (and b!282872 condMapEmpty!842) mapIsEmpty!843))

(assert (= (and b!282872 (not condMapEmpty!842)) mapNonEmpty!843))

(assert (= start!63174 b!282872))

(declare-fun m!415961 () Bool)

(assert (=> b!282869 m!415961))

(declare-fun m!415963 () Bool)

(assert (=> mapNonEmpty!843 m!415963))

(declare-fun m!415965 () Bool)

(assert (=> b!282873 m!415965))

(declare-fun m!415967 () Bool)

(assert (=> b!282866 m!415967))

(declare-fun m!415969 () Bool)

(assert (=> start!63174 m!415969))

(declare-fun m!415971 () Bool)

(assert (=> start!63174 m!415971))

(declare-fun m!415973 () Bool)

(assert (=> b!282867 m!415973))

(declare-fun m!415975 () Bool)

(assert (=> b!282867 m!415975))

(declare-fun m!415977 () Bool)

(assert (=> b!282867 m!415977))

(declare-fun m!415979 () Bool)

(assert (=> mapNonEmpty!842 m!415979))

(check-sat (not mapNonEmpty!842) (not b!282869) tp_is_empty!333 (not start!63174) (not b!282867) (not mapNonEmpty!843) (not b!282866) (not b!282873))
(check-sat)
(get-model)

(declare-fun d!97214 () Bool)

(assert (=> d!97214 (= (array_inv!6777 a1!471) (bvsge (size!7067 a1!471) #b00000000000000000000000000000000))))

(assert (=> start!63174 d!97214))

(declare-fun d!97216 () Bool)

(assert (=> d!97216 (= (array_inv!6777 a2!471) (bvsge (size!7067 a2!471) #b00000000000000000000000000000000))))

(assert (=> start!63174 d!97216))

(declare-fun d!97218 () Bool)

(assert (=> d!97218 (and (bvsge (bvsub i!913 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub i!913 #b00000000000000000000000000000001) (size!7067 a1!471)) (bvslt (bvsub i!913 #b00000000000000000000000000000001) (size!7067 a2!471)) (= (select (arr!8063 a1!471) (bvsub i!913 #b00000000000000000000000000000001)) (select (arr!8063 a2!471) (bvsub i!913 #b00000000000000000000000000000001))))))

(declare-fun lt!417843 () Unit!19824)

(declare-fun choose!513 (array!16367 array!16367 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19824)

(assert (=> d!97218 (= lt!417843 (choose!513 a1!471 a2!471 from!597 (bvsub i!913 #b00000000000000000000000000000001) to!564))))

(assert (=> d!97218 (and (bvsle #b00000000000000000000000000000000 from!597) (bvsle from!597 to!564))))

(assert (=> d!97218 (= (arrayRangesEqImpliesEq!187 a1!471 a2!471 from!597 (bvsub i!913 #b00000000000000000000000000000001) to!564) lt!417843)))

(declare-fun bs!24500 () Bool)

(assert (= bs!24500 d!97218))

(assert (=> bs!24500 m!415973))

(assert (=> bs!24500 m!415975))

(declare-fun m!416001 () Bool)

(assert (=> bs!24500 m!416001))

(assert (=> b!282867 d!97218))

(declare-fun d!97220 () Bool)

(declare-fun res!234581 () Bool)

(declare-fun e!202098 () Bool)

(assert (=> d!97220 (=> res!234581 e!202098)))

(assert (=> d!97220 (= res!234581 (= i!913 to!564))))

(assert (=> d!97220 (= (arrayRangesEq!1325 a2!471 a1!471 i!913 to!564) e!202098)))

(declare-fun b!282902 () Bool)

(declare-fun e!202099 () Bool)

(assert (=> b!282902 (= e!202098 e!202099)))

(declare-fun res!234582 () Bool)

(assert (=> b!282902 (=> (not res!234582) (not e!202099))))

(assert (=> b!282902 (= res!234582 (= (select (arr!8063 a2!471) i!913) (select (arr!8063 a1!471) i!913)))))

(declare-fun b!282903 () Bool)

(assert (=> b!282903 (= e!202099 (arrayRangesEq!1325 a2!471 a1!471 (bvadd i!913 #b00000000000000000000000000000001) to!564))))

(assert (= (and d!97220 (not res!234581)) b!282902))

(assert (= (and b!282902 res!234582) b!282903))

(declare-fun m!416003 () Bool)

(assert (=> b!282902 m!416003))

(declare-fun m!416005 () Bool)

(assert (=> b!282902 m!416005))

(declare-fun m!416007 () Bool)

(assert (=> b!282903 m!416007))

(assert (=> b!282866 d!97220))

(declare-fun d!97222 () Bool)

(declare-fun res!234583 () Bool)

(declare-fun e!202100 () Bool)

(assert (=> d!97222 (=> res!234583 e!202100)))

(assert (=> d!97222 (= res!234583 (= from!597 to!564))))

(assert (=> d!97222 (= (arrayRangesEq!1325 a1!471 a2!471 from!597 to!564) e!202100)))

(declare-fun b!282904 () Bool)

(declare-fun e!202101 () Bool)

(assert (=> b!282904 (= e!202100 e!202101)))

(declare-fun res!234584 () Bool)

(assert (=> b!282904 (=> (not res!234584) (not e!202101))))

(assert (=> b!282904 (= res!234584 (= (select (arr!8063 a1!471) from!597) (select (arr!8063 a2!471) from!597)))))

(declare-fun b!282905 () Bool)

(assert (=> b!282905 (= e!202101 (arrayRangesEq!1325 a1!471 a2!471 (bvadd from!597 #b00000000000000000000000000000001) to!564))))

(assert (= (and d!97222 (not res!234583)) b!282904))

(assert (= (and b!282904 res!234584) b!282905))

(declare-fun m!416009 () Bool)

(assert (=> b!282904 m!416009))

(declare-fun m!416011 () Bool)

(assert (=> b!282904 m!416011))

(declare-fun m!416013 () Bool)

(assert (=> b!282905 m!416013))

(assert (=> b!282873 d!97222))

(declare-fun d!97224 () Bool)

(declare-fun res!234585 () Bool)

(declare-fun e!202102 () Bool)

(assert (=> d!97224 (=> res!234585 e!202102)))

(assert (=> d!97224 (= res!234585 (= (bvsub i!913 #b00000000000000000000000000000001) to!564))))

(assert (=> d!97224 (= (arrayRangesEq!1325 a2!471 a1!471 (bvsub i!913 #b00000000000000000000000000000001) to!564) e!202102)))

(declare-fun b!282906 () Bool)

(declare-fun e!202103 () Bool)

(assert (=> b!282906 (= e!202102 e!202103)))

(declare-fun res!234586 () Bool)

(assert (=> b!282906 (=> (not res!234586) (not e!202103))))

(assert (=> b!282906 (= res!234586 (= (select (arr!8063 a2!471) (bvsub i!913 #b00000000000000000000000000000001)) (select (arr!8063 a1!471) (bvsub i!913 #b00000000000000000000000000000001))))))

(declare-fun b!282907 () Bool)

(assert (=> b!282907 (= e!202103 (arrayRangesEq!1325 a2!471 a1!471 (bvadd (bvsub i!913 #b00000000000000000000000000000001) #b00000000000000000000000000000001) to!564))))

(assert (= (and d!97224 (not res!234585)) b!282906))

(assert (= (and b!282906 res!234586) b!282907))

(assert (=> b!282906 m!415975))

(assert (=> b!282906 m!415973))

(declare-fun m!416015 () Bool)

(assert (=> b!282907 m!416015))

(assert (=> b!282869 d!97224))

(declare-fun condMapEmpty!852 () Bool)

(declare-fun mapDefault!852 () T!50259)

(assert (=> mapNonEmpty!842 (= condMapEmpty!852 (= mapRest!842 ((as const (Array (_ BitVec 32) T!50259)) mapDefault!852)))))

(declare-fun mapRes!852 () Bool)

(assert (=> mapNonEmpty!842 (= tp!842 (and tp_is_empty!333 mapRes!852))))

(declare-fun mapIsEmpty!852 () Bool)

(assert (=> mapIsEmpty!852 mapRes!852))

(declare-fun mapNonEmpty!852 () Bool)

(declare-fun tp!852 () Bool)

(assert (=> mapNonEmpty!852 (= mapRes!852 (and tp!852 tp_is_empty!333))))

(declare-fun mapKey!852 () (_ BitVec 32))

(declare-fun mapValue!852 () T!50259)

(declare-fun mapRest!852 () (Array (_ BitVec 32) T!50259))

(assert (=> mapNonEmpty!852 (= mapRest!842 (store mapRest!852 mapKey!852 mapValue!852))))

(assert (= (and mapNonEmpty!842 condMapEmpty!852) mapIsEmpty!852))

(assert (= (and mapNonEmpty!842 (not condMapEmpty!852)) mapNonEmpty!852))

(declare-fun m!416017 () Bool)

(assert (=> mapNonEmpty!852 m!416017))

(declare-fun condMapEmpty!853 () Bool)

(declare-fun mapDefault!853 () T!50259)

(assert (=> mapNonEmpty!843 (= condMapEmpty!853 (= mapRest!843 ((as const (Array (_ BitVec 32) T!50259)) mapDefault!853)))))

(declare-fun mapRes!853 () Bool)

(assert (=> mapNonEmpty!843 (= tp!843 (and tp_is_empty!333 mapRes!853))))

(declare-fun mapIsEmpty!853 () Bool)

(assert (=> mapIsEmpty!853 mapRes!853))

(declare-fun mapNonEmpty!853 () Bool)

(declare-fun tp!853 () Bool)

(assert (=> mapNonEmpty!853 (= mapRes!853 (and tp!853 tp_is_empty!333))))

(declare-fun mapRest!853 () (Array (_ BitVec 32) T!50259))

(declare-fun mapValue!853 () T!50259)

(declare-fun mapKey!853 () (_ BitVec 32))

(assert (=> mapNonEmpty!853 (= mapRest!843 (store mapRest!853 mapKey!853 mapValue!853))))

(assert (= (and mapNonEmpty!843 condMapEmpty!853) mapIsEmpty!853))

(assert (= (and mapNonEmpty!843 (not condMapEmpty!853)) mapNonEmpty!853))

(declare-fun m!416019 () Bool)

(assert (=> mapNonEmpty!853 m!416019))

(check-sat (not mapNonEmpty!853) tp_is_empty!333 (not b!282905) (not d!97218) (not b!282903) (not b!282907) (not mapNonEmpty!852))
(check-sat)
