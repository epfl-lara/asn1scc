; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68728 () Bool)

(assert start!68728)

(declare-fun b!310233 () Bool)

(declare-fun res!254379 () Bool)

(declare-fun e!222953 () Bool)

(assert (=> b!310233 (=> (not res!254379) (not e!222953))))

(declare-fun to!659 () (_ BitVec 32))

(declare-datatypes ((T!58499 0))(
  ( (T!58500 (val!496 Int)) )
))
(declare-datatypes ((array!18860 0))(
  ( (array!18861 (arr!9266 (Array (_ BitVec 32) T!58499)) (size!8183 (_ BitVec 32))) )
))
(declare-fun a2!566 () array!18860)

(declare-fun a1!566 () array!18860)

(declare-fun from!692 () (_ BitVec 32))

(declare-fun arrayRangesEq!1780 (array!18860 array!18860 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!310233 (= res!254379 (arrayRangesEq!1780 a1!566 a2!566 from!692 to!659))))

(declare-fun mapIsEmpty!3155 () Bool)

(declare-fun mapRes!3156 () Bool)

(assert (=> mapIsEmpty!3155 mapRes!3156))

(declare-fun res!254376 () Bool)

(assert (=> start!68728 (=> (not res!254376) (not e!222953))))

(declare-fun at!235 () (_ BitVec 32))

(assert (=> start!68728 (= res!254376 (and (bvsle #b00000000000000000000000000000000 from!692) (bvsle from!692 to!659) (bvsle (size!8183 a1!566) (size!8183 a2!566)) (bvsle to!659 (size!8183 a1!566)) (bvsle from!692 at!235) (bvslt at!235 to!659)))))

(assert (=> start!68728 e!222953))

(assert (=> start!68728 true))

(declare-fun e!222955 () Bool)

(declare-fun array_inv!7746 (array!18860) Bool)

(assert (=> start!68728 (and (array_inv!7746 a2!566) e!222955)))

(declare-fun e!222954 () Bool)

(assert (=> start!68728 (and (array_inv!7746 a1!566) e!222954)))

(declare-fun mapNonEmpty!3155 () Bool)

(declare-fun mapRes!3155 () Bool)

(declare-fun tp!3155 () Bool)

(declare-fun tp_is_empty!993 () Bool)

(assert (=> mapNonEmpty!3155 (= mapRes!3155 (and tp!3155 tp_is_empty!993))))

(declare-fun mapKey!3156 () (_ BitVec 32))

(declare-fun mapValue!3155 () T!58499)

(declare-fun mapRest!3156 () (Array (_ BitVec 32) T!58499))

(assert (=> mapNonEmpty!3155 (= (arr!9266 a2!566) (store mapRest!3156 mapKey!3156 mapValue!3155))))

(declare-fun mapNonEmpty!3156 () Bool)

(declare-fun tp!3156 () Bool)

(assert (=> mapNonEmpty!3156 (= mapRes!3156 (and tp!3156 tp_is_empty!993))))

(declare-fun mapValue!3156 () T!58499)

(declare-fun mapRest!3155 () (Array (_ BitVec 32) T!58499))

(declare-fun mapKey!3155 () (_ BitVec 32))

(assert (=> mapNonEmpty!3156 (= (arr!9266 a1!566) (store mapRest!3155 mapKey!3155 mapValue!3156))))

(declare-fun i!943 () (_ BitVec 32))

(declare-fun b!310234 () Bool)

(assert (=> b!310234 (= e!222953 (not (arrayRangesEq!1780 a1!566 a2!566 (bvadd #b00000000000000000000000000000001 i!943) to!659)))))

(declare-fun mapIsEmpty!3156 () Bool)

(assert (=> mapIsEmpty!3156 mapRes!3155))

(declare-fun b!310235 () Bool)

(declare-fun res!254378 () Bool)

(assert (=> b!310235 (=> (not res!254378) (not e!222953))))

(assert (=> b!310235 (= res!254378 (and (bvsle from!692 i!943) (bvsle i!943 at!235)))))

(declare-fun b!310236 () Bool)

(assert (=> b!310236 (= e!222955 (and tp_is_empty!993 mapRes!3155))))

(declare-fun condMapEmpty!3155 () Bool)

(declare-fun mapDefault!3156 () T!58499)

(assert (=> b!310236 (= condMapEmpty!3155 (= (arr!9266 a2!566) ((as const (Array (_ BitVec 32) T!58499)) mapDefault!3156)))))

(declare-fun b!310237 () Bool)

(declare-fun res!254377 () Bool)

(assert (=> b!310237 (=> (not res!254377) (not e!222953))))

(assert (=> b!310237 (= res!254377 (and (not (= i!943 at!235)) (bvsle from!692 (bvadd #b00000000000000000000000000000001 i!943)) (bvsle (bvadd #b00000000000000000000000000000001 i!943) at!235)))))

(declare-fun b!310238 () Bool)

(declare-fun res!254375 () Bool)

(assert (=> b!310238 (=> (not res!254375) (not e!222953))))

(assert (=> b!310238 (= res!254375 (arrayRangesEq!1780 a1!566 a2!566 i!943 to!659))))

(declare-fun b!310239 () Bool)

(assert (=> b!310239 (= e!222954 (and tp_is_empty!993 mapRes!3156))))

(declare-fun condMapEmpty!3156 () Bool)

(declare-fun mapDefault!3155 () T!58499)

(assert (=> b!310239 (= condMapEmpty!3156 (= (arr!9266 a1!566) ((as const (Array (_ BitVec 32) T!58499)) mapDefault!3155)))))

(assert (= (and start!68728 res!254376) b!310233))

(assert (= (and b!310233 res!254379) b!310235))

(assert (= (and b!310235 res!254378) b!310238))

(assert (= (and b!310238 res!254375) b!310237))

(assert (= (and b!310237 res!254377) b!310234))

(assert (= (and b!310236 condMapEmpty!3155) mapIsEmpty!3156))

(assert (= (and b!310236 (not condMapEmpty!3155)) mapNonEmpty!3155))

(assert (= start!68728 b!310236))

(assert (= (and b!310239 condMapEmpty!3156) mapIsEmpty!3155))

(assert (= (and b!310239 (not condMapEmpty!3156)) mapNonEmpty!3156))

(assert (= start!68728 b!310239))

(declare-fun m!448075 () Bool)

(assert (=> mapNonEmpty!3156 m!448075))

(declare-fun m!448077 () Bool)

(assert (=> mapNonEmpty!3155 m!448077))

(declare-fun m!448079 () Bool)

(assert (=> start!68728 m!448079))

(declare-fun m!448081 () Bool)

(assert (=> start!68728 m!448081))

(declare-fun m!448083 () Bool)

(assert (=> b!310233 m!448083))

(declare-fun m!448085 () Bool)

(assert (=> b!310234 m!448085))

(declare-fun m!448087 () Bool)

(assert (=> b!310238 m!448087))

(check-sat tp_is_empty!993 (not mapNonEmpty!3156) (not b!310234) (not b!310238) (not mapNonEmpty!3155) (not b!310233) (not start!68728))
(check-sat)
(get-model)

(declare-fun d!102756 () Bool)

(declare-fun res!254399 () Bool)

(declare-fun e!222969 () Bool)

(assert (=> d!102756 (=> res!254399 e!222969)))

(assert (=> d!102756 (= res!254399 (= from!692 to!659))))

(assert (=> d!102756 (= (arrayRangesEq!1780 a1!566 a2!566 from!692 to!659) e!222969)))

(declare-fun b!310265 () Bool)

(declare-fun e!222970 () Bool)

(assert (=> b!310265 (= e!222969 e!222970)))

(declare-fun res!254400 () Bool)

(assert (=> b!310265 (=> (not res!254400) (not e!222970))))

(assert (=> b!310265 (= res!254400 (= (select (arr!9266 a1!566) from!692) (select (arr!9266 a2!566) from!692)))))

(declare-fun b!310266 () Bool)

(assert (=> b!310266 (= e!222970 (arrayRangesEq!1780 a1!566 a2!566 (bvadd from!692 #b00000000000000000000000000000001) to!659))))

(assert (= (and d!102756 (not res!254399)) b!310265))

(assert (= (and b!310265 res!254400) b!310266))

(declare-fun m!448103 () Bool)

(assert (=> b!310265 m!448103))

(declare-fun m!448105 () Bool)

(assert (=> b!310265 m!448105))

(declare-fun m!448107 () Bool)

(assert (=> b!310266 m!448107))

(assert (=> b!310233 d!102756))

(declare-fun d!102758 () Bool)

(assert (=> d!102758 (= (array_inv!7746 a2!566) (bvsge (size!8183 a2!566) #b00000000000000000000000000000000))))

(assert (=> start!68728 d!102758))

(declare-fun d!102760 () Bool)

(assert (=> d!102760 (= (array_inv!7746 a1!566) (bvsge (size!8183 a1!566) #b00000000000000000000000000000000))))

(assert (=> start!68728 d!102760))

(declare-fun d!102762 () Bool)

(declare-fun res!254401 () Bool)

(declare-fun e!222971 () Bool)

(assert (=> d!102762 (=> res!254401 e!222971)))

(assert (=> d!102762 (= res!254401 (= (bvadd #b00000000000000000000000000000001 i!943) to!659))))

(assert (=> d!102762 (= (arrayRangesEq!1780 a1!566 a2!566 (bvadd #b00000000000000000000000000000001 i!943) to!659) e!222971)))

(declare-fun b!310267 () Bool)

(declare-fun e!222972 () Bool)

(assert (=> b!310267 (= e!222971 e!222972)))

(declare-fun res!254402 () Bool)

(assert (=> b!310267 (=> (not res!254402) (not e!222972))))

(assert (=> b!310267 (= res!254402 (= (select (arr!9266 a1!566) (bvadd #b00000000000000000000000000000001 i!943)) (select (arr!9266 a2!566) (bvadd #b00000000000000000000000000000001 i!943))))))

(declare-fun b!310268 () Bool)

(assert (=> b!310268 (= e!222972 (arrayRangesEq!1780 a1!566 a2!566 (bvadd #b00000000000000000000000000000001 i!943 #b00000000000000000000000000000001) to!659))))

(assert (= (and d!102762 (not res!254401)) b!310267))

(assert (= (and b!310267 res!254402) b!310268))

(declare-fun m!448109 () Bool)

(assert (=> b!310267 m!448109))

(declare-fun m!448111 () Bool)

(assert (=> b!310267 m!448111))

(declare-fun m!448113 () Bool)

(assert (=> b!310268 m!448113))

(assert (=> b!310234 d!102762))

(declare-fun d!102764 () Bool)

(declare-fun res!254403 () Bool)

(declare-fun e!222973 () Bool)

(assert (=> d!102764 (=> res!254403 e!222973)))

(assert (=> d!102764 (= res!254403 (= i!943 to!659))))

(assert (=> d!102764 (= (arrayRangesEq!1780 a1!566 a2!566 i!943 to!659) e!222973)))

(declare-fun b!310269 () Bool)

(declare-fun e!222974 () Bool)

(assert (=> b!310269 (= e!222973 e!222974)))

(declare-fun res!254404 () Bool)

(assert (=> b!310269 (=> (not res!254404) (not e!222974))))

(assert (=> b!310269 (= res!254404 (= (select (arr!9266 a1!566) i!943) (select (arr!9266 a2!566) i!943)))))

(declare-fun b!310270 () Bool)

(assert (=> b!310270 (= e!222974 (arrayRangesEq!1780 a1!566 a2!566 (bvadd i!943 #b00000000000000000000000000000001) to!659))))

(assert (= (and d!102764 (not res!254403)) b!310269))

(assert (= (and b!310269 res!254404) b!310270))

(declare-fun m!448115 () Bool)

(assert (=> b!310269 m!448115))

(declare-fun m!448117 () Bool)

(assert (=> b!310269 m!448117))

(declare-fun m!448119 () Bool)

(assert (=> b!310270 m!448119))

(assert (=> b!310238 d!102764))

(declare-fun condMapEmpty!3165 () Bool)

(declare-fun mapDefault!3165 () T!58499)

(assert (=> mapNonEmpty!3156 (= condMapEmpty!3165 (= mapRest!3155 ((as const (Array (_ BitVec 32) T!58499)) mapDefault!3165)))))

(declare-fun mapRes!3165 () Bool)

(assert (=> mapNonEmpty!3156 (= tp!3156 (and tp_is_empty!993 mapRes!3165))))

(declare-fun mapIsEmpty!3165 () Bool)

(assert (=> mapIsEmpty!3165 mapRes!3165))

(declare-fun mapNonEmpty!3165 () Bool)

(declare-fun tp!3165 () Bool)

(assert (=> mapNonEmpty!3165 (= mapRes!3165 (and tp!3165 tp_is_empty!993))))

(declare-fun mapRest!3165 () (Array (_ BitVec 32) T!58499))

(declare-fun mapKey!3165 () (_ BitVec 32))

(declare-fun mapValue!3165 () T!58499)

(assert (=> mapNonEmpty!3165 (= mapRest!3155 (store mapRest!3165 mapKey!3165 mapValue!3165))))

(assert (= (and mapNonEmpty!3156 condMapEmpty!3165) mapIsEmpty!3165))

(assert (= (and mapNonEmpty!3156 (not condMapEmpty!3165)) mapNonEmpty!3165))

(declare-fun m!448121 () Bool)

(assert (=> mapNonEmpty!3165 m!448121))

(declare-fun condMapEmpty!3166 () Bool)

(declare-fun mapDefault!3166 () T!58499)

(assert (=> mapNonEmpty!3155 (= condMapEmpty!3166 (= mapRest!3156 ((as const (Array (_ BitVec 32) T!58499)) mapDefault!3166)))))

(declare-fun mapRes!3166 () Bool)

(assert (=> mapNonEmpty!3155 (= tp!3155 (and tp_is_empty!993 mapRes!3166))))

(declare-fun mapIsEmpty!3166 () Bool)

(assert (=> mapIsEmpty!3166 mapRes!3166))

(declare-fun mapNonEmpty!3166 () Bool)

(declare-fun tp!3166 () Bool)

(assert (=> mapNonEmpty!3166 (= mapRes!3166 (and tp!3166 tp_is_empty!993))))

(declare-fun mapValue!3166 () T!58499)

(declare-fun mapRest!3166 () (Array (_ BitVec 32) T!58499))

(declare-fun mapKey!3166 () (_ BitVec 32))

(assert (=> mapNonEmpty!3166 (= mapRest!3156 (store mapRest!3166 mapKey!3166 mapValue!3166))))

(assert (= (and mapNonEmpty!3155 condMapEmpty!3166) mapIsEmpty!3166))

(assert (= (and mapNonEmpty!3155 (not condMapEmpty!3166)) mapNonEmpty!3166))

(declare-fun m!448123 () Bool)

(assert (=> mapNonEmpty!3166 m!448123))

(check-sat (not mapNonEmpty!3166) tp_is_empty!993 (not mapNonEmpty!3165) (not b!310270) (not b!310268) (not b!310266))
(check-sat)
