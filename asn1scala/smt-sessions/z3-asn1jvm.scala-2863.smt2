; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68706 () Bool)

(assert start!68706)

(declare-fun i!943 () (_ BitVec 32))

(declare-fun at!235 () (_ BitVec 32))

(declare-datatypes ((T!58421 0))(
  ( (T!58422 (val!487 Int)) )
))
(declare-datatypes ((array!18841 0))(
  ( (array!18842 (arr!9257 (Array (_ BitVec 32) T!58421)) (size!8174 (_ BitVec 32))) )
))
(declare-fun a1!566 () array!18841)

(declare-fun b!310056 () Bool)

(declare-fun e!222865 () Bool)

(declare-fun a2!566 () array!18841)

(assert (=> b!310056 (= e!222865 (and (= i!943 at!235) (not (= (select (arr!9257 a1!566) at!235) (select (arr!9257 a2!566) at!235)))))))

(declare-fun res!254256 () Bool)

(assert (=> start!68706 (=> (not res!254256) (not e!222865))))

(declare-fun from!692 () (_ BitVec 32))

(declare-fun to!659 () (_ BitVec 32))

(assert (=> start!68706 (= res!254256 (and (bvsle #b00000000000000000000000000000000 from!692) (bvsle from!692 to!659) (bvsle (size!8174 a1!566) (size!8174 a2!566)) (bvsle to!659 (size!8174 a1!566)) (bvsle from!692 at!235) (bvslt at!235 to!659)))))

(assert (=> start!68706 e!222865))

(assert (=> start!68706 true))

(declare-fun e!222864 () Bool)

(declare-fun array_inv!7741 (array!18841) Bool)

(assert (=> start!68706 (and (array_inv!7741 a2!566) e!222864)))

(declare-fun e!222866 () Bool)

(assert (=> start!68706 (and (array_inv!7741 a1!566) e!222866)))

(declare-fun mapNonEmpty!3097 () Bool)

(declare-fun mapRes!3098 () Bool)

(declare-fun tp!3098 () Bool)

(declare-fun tp_is_empty!975 () Bool)

(assert (=> mapNonEmpty!3097 (= mapRes!3098 (and tp!3098 tp_is_empty!975))))

(declare-fun mapRest!3098 () (Array (_ BitVec 32) T!58421))

(declare-fun mapKey!3098 () (_ BitVec 32))

(declare-fun mapValue!3098 () T!58421)

(assert (=> mapNonEmpty!3097 (= (arr!9257 a2!566) (store mapRest!3098 mapKey!3098 mapValue!3098))))

(declare-fun mapIsEmpty!3097 () Bool)

(assert (=> mapIsEmpty!3097 mapRes!3098))

(declare-fun mapNonEmpty!3098 () Bool)

(declare-fun mapRes!3097 () Bool)

(declare-fun tp!3097 () Bool)

(assert (=> mapNonEmpty!3098 (= mapRes!3097 (and tp!3097 tp_is_empty!975))))

(declare-fun mapKey!3097 () (_ BitVec 32))

(declare-fun mapRest!3097 () (Array (_ BitVec 32) T!58421))

(declare-fun mapValue!3097 () T!58421)

(assert (=> mapNonEmpty!3098 (= (arr!9257 a1!566) (store mapRest!3097 mapKey!3097 mapValue!3097))))

(declare-fun b!310057 () Bool)

(declare-fun res!254254 () Bool)

(assert (=> b!310057 (=> (not res!254254) (not e!222865))))

(assert (=> b!310057 (= res!254254 (and (bvsle from!692 i!943) (bvsle i!943 at!235)))))

(declare-fun mapIsEmpty!3098 () Bool)

(assert (=> mapIsEmpty!3098 mapRes!3097))

(declare-fun b!310058 () Bool)

(declare-fun res!254257 () Bool)

(assert (=> b!310058 (=> (not res!254257) (not e!222865))))

(declare-fun arrayRangesEq!1775 (array!18841 array!18841 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!310058 (= res!254257 (arrayRangesEq!1775 a1!566 a2!566 from!692 to!659))))

(declare-fun b!310059 () Bool)

(declare-fun res!254255 () Bool)

(assert (=> b!310059 (=> (not res!254255) (not e!222865))))

(assert (=> b!310059 (= res!254255 (arrayRangesEq!1775 a1!566 a2!566 i!943 to!659))))

(declare-fun b!310060 () Bool)

(assert (=> b!310060 (= e!222866 (and tp_is_empty!975 mapRes!3097))))

(declare-fun condMapEmpty!3098 () Bool)

(declare-fun mapDefault!3097 () T!58421)

(assert (=> b!310060 (= condMapEmpty!3098 (= (arr!9257 a1!566) ((as const (Array (_ BitVec 32) T!58421)) mapDefault!3097)))))

(declare-fun b!310061 () Bool)

(assert (=> b!310061 (= e!222864 (and tp_is_empty!975 mapRes!3098))))

(declare-fun condMapEmpty!3097 () Bool)

(declare-fun mapDefault!3098 () T!58421)

(assert (=> b!310061 (= condMapEmpty!3097 (= (arr!9257 a2!566) ((as const (Array (_ BitVec 32) T!58421)) mapDefault!3098)))))

(assert (= (and start!68706 res!254256) b!310058))

(assert (= (and b!310058 res!254257) b!310057))

(assert (= (and b!310057 res!254254) b!310059))

(assert (= (and b!310059 res!254255) b!310056))

(assert (= (and b!310061 condMapEmpty!3097) mapIsEmpty!3097))

(assert (= (and b!310061 (not condMapEmpty!3097)) mapNonEmpty!3097))

(assert (= start!68706 b!310061))

(assert (= (and b!310060 condMapEmpty!3098) mapIsEmpty!3098))

(assert (= (and b!310060 (not condMapEmpty!3098)) mapNonEmpty!3098))

(assert (= start!68706 b!310060))

(declare-fun m!447941 () Bool)

(assert (=> b!310059 m!447941))

(declare-fun m!447943 () Bool)

(assert (=> mapNonEmpty!3098 m!447943))

(declare-fun m!447945 () Bool)

(assert (=> b!310058 m!447945))

(declare-fun m!447947 () Bool)

(assert (=> mapNonEmpty!3097 m!447947))

(declare-fun m!447949 () Bool)

(assert (=> start!68706 m!447949))

(declare-fun m!447951 () Bool)

(assert (=> start!68706 m!447951))

(declare-fun m!447953 () Bool)

(assert (=> b!310056 m!447953))

(declare-fun m!447955 () Bool)

(assert (=> b!310056 m!447955))

(check-sat (not b!310059) (not b!310058) (not mapNonEmpty!3098) (not start!68706) (not mapNonEmpty!3097) tp_is_empty!975)
(check-sat)
(get-model)

(declare-fun d!102742 () Bool)

(assert (=> d!102742 (= (array_inv!7741 a2!566) (bvsge (size!8174 a2!566) #b00000000000000000000000000000000))))

(assert (=> start!68706 d!102742))

(declare-fun d!102744 () Bool)

(assert (=> d!102744 (= (array_inv!7741 a1!566) (bvsge (size!8174 a1!566) #b00000000000000000000000000000000))))

(assert (=> start!68706 d!102744))

(declare-fun d!102746 () Bool)

(declare-fun res!254274 () Bool)

(declare-fun e!222880 () Bool)

(assert (=> d!102746 (=> res!254274 e!222880)))

(assert (=> d!102746 (= res!254274 (= from!692 to!659))))

(assert (=> d!102746 (= (arrayRangesEq!1775 a1!566 a2!566 from!692 to!659) e!222880)))

(declare-fun b!310084 () Bool)

(declare-fun e!222881 () Bool)

(assert (=> b!310084 (= e!222880 e!222881)))

(declare-fun res!254275 () Bool)

(assert (=> b!310084 (=> (not res!254275) (not e!222881))))

(assert (=> b!310084 (= res!254275 (= (select (arr!9257 a1!566) from!692) (select (arr!9257 a2!566) from!692)))))

(declare-fun b!310085 () Bool)

(assert (=> b!310085 (= e!222881 (arrayRangesEq!1775 a1!566 a2!566 (bvadd from!692 #b00000000000000000000000000000001) to!659))))

(assert (= (and d!102746 (not res!254274)) b!310084))

(assert (= (and b!310084 res!254275) b!310085))

(declare-fun m!447973 () Bool)

(assert (=> b!310084 m!447973))

(declare-fun m!447975 () Bool)

(assert (=> b!310084 m!447975))

(declare-fun m!447977 () Bool)

(assert (=> b!310085 m!447977))

(assert (=> b!310058 d!102746))

(declare-fun d!102748 () Bool)

(declare-fun res!254276 () Bool)

(declare-fun e!222882 () Bool)

(assert (=> d!102748 (=> res!254276 e!222882)))

(assert (=> d!102748 (= res!254276 (= i!943 to!659))))

(assert (=> d!102748 (= (arrayRangesEq!1775 a1!566 a2!566 i!943 to!659) e!222882)))

(declare-fun b!310086 () Bool)

(declare-fun e!222883 () Bool)

(assert (=> b!310086 (= e!222882 e!222883)))

(declare-fun res!254277 () Bool)

(assert (=> b!310086 (=> (not res!254277) (not e!222883))))

(assert (=> b!310086 (= res!254277 (= (select (arr!9257 a1!566) i!943) (select (arr!9257 a2!566) i!943)))))

(declare-fun b!310087 () Bool)

(assert (=> b!310087 (= e!222883 (arrayRangesEq!1775 a1!566 a2!566 (bvadd i!943 #b00000000000000000000000000000001) to!659))))

(assert (= (and d!102748 (not res!254276)) b!310086))

(assert (= (and b!310086 res!254277) b!310087))

(declare-fun m!447979 () Bool)

(assert (=> b!310086 m!447979))

(declare-fun m!447981 () Bool)

(assert (=> b!310086 m!447981))

(declare-fun m!447983 () Bool)

(assert (=> b!310087 m!447983))

(assert (=> b!310059 d!102748))

(declare-fun condMapEmpty!3107 () Bool)

(declare-fun mapDefault!3107 () T!58421)

(assert (=> mapNonEmpty!3097 (= condMapEmpty!3107 (= mapRest!3098 ((as const (Array (_ BitVec 32) T!58421)) mapDefault!3107)))))

(declare-fun mapRes!3107 () Bool)

(assert (=> mapNonEmpty!3097 (= tp!3098 (and tp_is_empty!975 mapRes!3107))))

(declare-fun mapIsEmpty!3107 () Bool)

(assert (=> mapIsEmpty!3107 mapRes!3107))

(declare-fun mapNonEmpty!3107 () Bool)

(declare-fun tp!3107 () Bool)

(assert (=> mapNonEmpty!3107 (= mapRes!3107 (and tp!3107 tp_is_empty!975))))

(declare-fun mapRest!3107 () (Array (_ BitVec 32) T!58421))

(declare-fun mapKey!3107 () (_ BitVec 32))

(declare-fun mapValue!3107 () T!58421)

(assert (=> mapNonEmpty!3107 (= mapRest!3098 (store mapRest!3107 mapKey!3107 mapValue!3107))))

(assert (= (and mapNonEmpty!3097 condMapEmpty!3107) mapIsEmpty!3107))

(assert (= (and mapNonEmpty!3097 (not condMapEmpty!3107)) mapNonEmpty!3107))

(declare-fun m!447985 () Bool)

(assert (=> mapNonEmpty!3107 m!447985))

(declare-fun condMapEmpty!3108 () Bool)

(declare-fun mapDefault!3108 () T!58421)

(assert (=> mapNonEmpty!3098 (= condMapEmpty!3108 (= mapRest!3097 ((as const (Array (_ BitVec 32) T!58421)) mapDefault!3108)))))

(declare-fun mapRes!3108 () Bool)

(assert (=> mapNonEmpty!3098 (= tp!3097 (and tp_is_empty!975 mapRes!3108))))

(declare-fun mapIsEmpty!3108 () Bool)

(assert (=> mapIsEmpty!3108 mapRes!3108))

(declare-fun mapNonEmpty!3108 () Bool)

(declare-fun tp!3108 () Bool)

(assert (=> mapNonEmpty!3108 (= mapRes!3108 (and tp!3108 tp_is_empty!975))))

(declare-fun mapValue!3108 () T!58421)

(declare-fun mapKey!3108 () (_ BitVec 32))

(declare-fun mapRest!3108 () (Array (_ BitVec 32) T!58421))

(assert (=> mapNonEmpty!3108 (= mapRest!3097 (store mapRest!3108 mapKey!3108 mapValue!3108))))

(assert (= (and mapNonEmpty!3098 condMapEmpty!3108) mapIsEmpty!3108))

(assert (= (and mapNonEmpty!3098 (not condMapEmpty!3108)) mapNonEmpty!3108))

(declare-fun m!447987 () Bool)

(assert (=> mapNonEmpty!3108 m!447987))

(check-sat tp_is_empty!975 (not mapNonEmpty!3107) (not b!310085) (not b!310087) (not mapNonEmpty!3108))
(check-sat)
