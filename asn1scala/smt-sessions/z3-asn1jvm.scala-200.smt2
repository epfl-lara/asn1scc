; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4088 () Bool)

(assert start!4088)

(declare-fun mapNonEmpty!157 () Bool)

(declare-fun mapRes!158 () Bool)

(declare-fun tp!157 () Bool)

(declare-fun tp_is_empty!57 () Bool)

(assert (=> mapNonEmpty!157 (= mapRes!158 (and tp!157 tp_is_empty!57))))

(declare-datatypes ((T!4243 0))(
  ( (T!4244 (val!28 Int)) )
))
(declare-datatypes ((array!1077 0))(
  ( (array!1078 (arr!887 (Array (_ BitVec 32) T!4243)) (size!458 (_ BitVec 32))) )
))
(declare-fun dst!10 () array!1077)

(declare-fun mapValue!157 () T!4243)

(declare-fun mapKey!158 () (_ BitVec 32))

(declare-fun mapRest!157 () (Array (_ BitVec 32) T!4243))

(assert (=> mapNonEmpty!157 (= (arr!887 dst!10) (store mapRest!157 mapKey!158 mapValue!157))))

(declare-fun mapIsEmpty!157 () Bool)

(declare-fun mapRes!157 () Bool)

(assert (=> mapIsEmpty!157 mapRes!157))

(declare-fun toSrc!1 () (_ BitVec 32))

(declare-fun src!2 () array!1077)

(declare-fun fromSrc!2 () (_ BitVec 32))

(declare-fun fromDst!2 () (_ BitVec 32))

(assert (=> start!4088 (and (bvsle #b00000000000000000000000000000000 fromSrc!2) (bvsle fromSrc!2 toSrc!1) (bvsle toSrc!1 (size!458 src!2)) (bvsle #b00000000000000000000000000000000 fromDst!2) (not (= (bvand (size!458 dst!10) #b10000000000000000000000000000000) (bvand (bvsub toSrc!1 fromSrc!2) #b10000000000000000000000000000000))) (not (= (bvand (size!458 dst!10) #b10000000000000000000000000000000) (bvand (bvsub (size!458 dst!10) (bvsub toSrc!1 fromSrc!2)) #b10000000000000000000000000000000))))))

(declare-fun e!11016 () Bool)

(declare-fun array_inv!438 (array!1077) Bool)

(assert (=> start!4088 (and (array_inv!438 dst!10) e!11016)))

(assert (=> start!4088 true))

(declare-fun e!11015 () Bool)

(assert (=> start!4088 (and (array_inv!438 src!2) e!11015)))

(declare-fun mapIsEmpty!158 () Bool)

(assert (=> mapIsEmpty!158 mapRes!158))

(declare-fun mapNonEmpty!158 () Bool)

(declare-fun tp!158 () Bool)

(assert (=> mapNonEmpty!158 (= mapRes!157 (and tp!158 tp_is_empty!57))))

(declare-fun mapKey!157 () (_ BitVec 32))

(declare-fun mapRest!158 () (Array (_ BitVec 32) T!4243))

(declare-fun mapValue!158 () T!4243)

(assert (=> mapNonEmpty!158 (= (arr!887 src!2) (store mapRest!158 mapKey!157 mapValue!158))))

(declare-fun b!17297 () Bool)

(assert (=> b!17297 (= e!11015 (and tp_is_empty!57 mapRes!157))))

(declare-fun condMapEmpty!157 () Bool)

(declare-fun mapDefault!158 () T!4243)

(assert (=> b!17297 (= condMapEmpty!157 (= (arr!887 src!2) ((as const (Array (_ BitVec 32) T!4243)) mapDefault!158)))))

(declare-fun b!17298 () Bool)

(assert (=> b!17298 (= e!11016 (and tp_is_empty!57 mapRes!158))))

(declare-fun condMapEmpty!158 () Bool)

(declare-fun mapDefault!157 () T!4243)

(assert (=> b!17298 (= condMapEmpty!158 (= (arr!887 dst!10) ((as const (Array (_ BitVec 32) T!4243)) mapDefault!157)))))

(assert (= (and b!17298 condMapEmpty!158) mapIsEmpty!158))

(assert (= (and b!17298 (not condMapEmpty!158)) mapNonEmpty!157))

(assert (= start!4088 b!17298))

(assert (= (and b!17297 condMapEmpty!157) mapIsEmpty!157))

(assert (= (and b!17297 (not condMapEmpty!157)) mapNonEmpty!158))

(assert (= start!4088 b!17297))

(declare-fun m!23531 () Bool)

(assert (=> mapNonEmpty!157 m!23531))

(declare-fun m!23533 () Bool)

(assert (=> start!4088 m!23533))

(declare-fun m!23535 () Bool)

(assert (=> start!4088 m!23535))

(declare-fun m!23537 () Bool)

(assert (=> mapNonEmpty!158 m!23537))

(check-sat (not start!4088) (not mapNonEmpty!157) (not mapNonEmpty!158) tp_is_empty!57)
(check-sat)
(get-model)

(declare-fun d!5650 () Bool)

(assert (=> d!5650 (= (array_inv!438 dst!10) (bvsge (size!458 dst!10) #b00000000000000000000000000000000))))

(assert (=> start!4088 d!5650))

(declare-fun d!5652 () Bool)

(assert (=> d!5652 (= (array_inv!438 src!2) (bvsge (size!458 src!2) #b00000000000000000000000000000000))))

(assert (=> start!4088 d!5652))

(declare-fun condMapEmpty!167 () Bool)

(declare-fun mapDefault!167 () T!4243)

(assert (=> mapNonEmpty!157 (= condMapEmpty!167 (= mapRest!157 ((as const (Array (_ BitVec 32) T!4243)) mapDefault!167)))))

(declare-fun mapRes!167 () Bool)

(assert (=> mapNonEmpty!157 (= tp!157 (and tp_is_empty!57 mapRes!167))))

(declare-fun mapIsEmpty!167 () Bool)

(assert (=> mapIsEmpty!167 mapRes!167))

(declare-fun mapNonEmpty!167 () Bool)

(declare-fun tp!167 () Bool)

(assert (=> mapNonEmpty!167 (= mapRes!167 (and tp!167 tp_is_empty!57))))

(declare-fun mapRest!167 () (Array (_ BitVec 32) T!4243))

(declare-fun mapKey!167 () (_ BitVec 32))

(declare-fun mapValue!167 () T!4243)

(assert (=> mapNonEmpty!167 (= mapRest!157 (store mapRest!167 mapKey!167 mapValue!167))))

(assert (= (and mapNonEmpty!157 condMapEmpty!167) mapIsEmpty!167))

(assert (= (and mapNonEmpty!157 (not condMapEmpty!167)) mapNonEmpty!167))

(declare-fun m!23547 () Bool)

(assert (=> mapNonEmpty!167 m!23547))

(declare-fun condMapEmpty!168 () Bool)

(declare-fun mapDefault!168 () T!4243)

(assert (=> mapNonEmpty!158 (= condMapEmpty!168 (= mapRest!158 ((as const (Array (_ BitVec 32) T!4243)) mapDefault!168)))))

(declare-fun mapRes!168 () Bool)

(assert (=> mapNonEmpty!158 (= tp!158 (and tp_is_empty!57 mapRes!168))))

(declare-fun mapIsEmpty!168 () Bool)

(assert (=> mapIsEmpty!168 mapRes!168))

(declare-fun mapNonEmpty!168 () Bool)

(declare-fun tp!168 () Bool)

(assert (=> mapNonEmpty!168 (= mapRes!168 (and tp!168 tp_is_empty!57))))

(declare-fun mapRest!168 () (Array (_ BitVec 32) T!4243))

(declare-fun mapKey!168 () (_ BitVec 32))

(declare-fun mapValue!168 () T!4243)

(assert (=> mapNonEmpty!168 (= mapRest!158 (store mapRest!168 mapKey!168 mapValue!168))))

(assert (= (and mapNonEmpty!158 condMapEmpty!168) mapIsEmpty!168))

(assert (= (and mapNonEmpty!158 (not condMapEmpty!168)) mapNonEmpty!168))

(declare-fun m!23549 () Bool)

(assert (=> mapNonEmpty!168 m!23549))

(check-sat (not mapNonEmpty!168) (not mapNonEmpty!167) tp_is_empty!57)
(check-sat)
