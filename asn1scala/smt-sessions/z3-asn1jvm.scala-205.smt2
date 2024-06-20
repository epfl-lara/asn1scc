; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4122 () Bool)

(assert start!4122)

(declare-fun mapNonEmpty!255 () Bool)

(declare-fun mapRes!256 () Bool)

(declare-fun tp!255 () Bool)

(declare-fun tp_is_empty!87 () Bool)

(assert (=> mapNonEmpty!255 (= mapRes!256 (and tp!255 tp_is_empty!87))))

(declare-fun mapKey!256 () (_ BitVec 32))

(declare-datatypes ((T!4373 0))(
  ( (T!4374 (val!43 Int)) )
))
(declare-fun mapValue!256 () T!4373)

(declare-fun mapRest!256 () (Array (_ BitVec 32) T!4373))

(declare-datatypes ((array!1109 0))(
  ( (array!1110 (arr!902 (Array (_ BitVec 32) T!4373)) (size!473 (_ BitVec 32))) )
))
(declare-fun src!2 () array!1109)

(assert (=> mapNonEmpty!255 (= (arr!902 src!2) (store mapRest!256 mapKey!256 mapValue!256))))

(declare-fun dst!10 () array!1109)

(declare-fun toSrc!1 () (_ BitVec 32))

(declare-fun fromSrc!2 () (_ BitVec 32))

(declare-fun fromDst!2 () (_ BitVec 32))

(assert (=> start!4122 (and (bvsle #b00000000000000000000000000000000 fromSrc!2) (bvsle fromSrc!2 toSrc!1) (bvsle toSrc!1 (size!473 src!2)) (bvsle #b00000000000000000000000000000000 fromDst!2) (bvsle fromDst!2 (bvsub (size!473 dst!10) (bvsub toSrc!1 fromSrc!2))) (bvslt fromSrc!2 toSrc!1) (= (bvand fromDst!2 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand fromDst!2 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 fromDst!2) #b10000000000000000000000000000000))))))

(declare-fun e!11106 () Bool)

(declare-fun array_inv!445 (array!1109) Bool)

(assert (=> start!4122 (and (array_inv!445 dst!10) e!11106)))

(assert (=> start!4122 true))

(declare-fun e!11105 () Bool)

(assert (=> start!4122 (and (array_inv!445 src!2) e!11105)))

(declare-fun b!17391 () Bool)

(assert (=> b!17391 (= e!11105 (and tp_is_empty!87 mapRes!256))))

(declare-fun condMapEmpty!256 () Bool)

(declare-fun mapDefault!256 () T!4373)

(assert (=> b!17391 (= condMapEmpty!256 (= (arr!902 src!2) ((as const (Array (_ BitVec 32) T!4373)) mapDefault!256)))))

(declare-fun mapNonEmpty!256 () Bool)

(declare-fun mapRes!255 () Bool)

(declare-fun tp!256 () Bool)

(assert (=> mapNonEmpty!256 (= mapRes!255 (and tp!256 tp_is_empty!87))))

(declare-fun mapKey!255 () (_ BitVec 32))

(declare-fun mapRest!255 () (Array (_ BitVec 32) T!4373))

(declare-fun mapValue!255 () T!4373)

(assert (=> mapNonEmpty!256 (= (arr!902 dst!10) (store mapRest!255 mapKey!255 mapValue!255))))

(declare-fun mapIsEmpty!255 () Bool)

(assert (=> mapIsEmpty!255 mapRes!255))

(declare-fun b!17392 () Bool)

(assert (=> b!17392 (= e!11106 (and tp_is_empty!87 mapRes!255))))

(declare-fun condMapEmpty!255 () Bool)

(declare-fun mapDefault!255 () T!4373)

(assert (=> b!17392 (= condMapEmpty!255 (= (arr!902 dst!10) ((as const (Array (_ BitVec 32) T!4373)) mapDefault!255)))))

(declare-fun mapIsEmpty!256 () Bool)

(assert (=> mapIsEmpty!256 mapRes!256))

(assert (= (and b!17392 condMapEmpty!255) mapIsEmpty!255))

(assert (= (and b!17392 (not condMapEmpty!255)) mapNonEmpty!256))

(assert (= start!4122 b!17392))

(assert (= (and b!17391 condMapEmpty!256) mapIsEmpty!256))

(assert (= (and b!17391 (not condMapEmpty!256)) mapNonEmpty!255))

(assert (= start!4122 b!17391))

(declare-fun m!23659 () Bool)

(assert (=> mapNonEmpty!255 m!23659))

(declare-fun m!23661 () Bool)

(assert (=> start!4122 m!23661))

(declare-fun m!23663 () Bool)

(assert (=> start!4122 m!23663))

(declare-fun m!23665 () Bool)

(assert (=> mapNonEmpty!256 m!23665))

(check-sat (not start!4122) (not mapNonEmpty!256) (not mapNonEmpty!255) tp_is_empty!87)
(check-sat)
(get-model)

(declare-fun d!5668 () Bool)

(assert (=> d!5668 (= (array_inv!445 dst!10) (bvsge (size!473 dst!10) #b00000000000000000000000000000000))))

(assert (=> start!4122 d!5668))

(declare-fun d!5670 () Bool)

(assert (=> d!5670 (= (array_inv!445 src!2) (bvsge (size!473 src!2) #b00000000000000000000000000000000))))

(assert (=> start!4122 d!5670))

(declare-fun condMapEmpty!265 () Bool)

(declare-fun mapDefault!265 () T!4373)

(assert (=> mapNonEmpty!256 (= condMapEmpty!265 (= mapRest!255 ((as const (Array (_ BitVec 32) T!4373)) mapDefault!265)))))

(declare-fun mapRes!265 () Bool)

(assert (=> mapNonEmpty!256 (= tp!256 (and tp_is_empty!87 mapRes!265))))

(declare-fun mapIsEmpty!265 () Bool)

(assert (=> mapIsEmpty!265 mapRes!265))

(declare-fun mapNonEmpty!265 () Bool)

(declare-fun tp!265 () Bool)

(assert (=> mapNonEmpty!265 (= mapRes!265 (and tp!265 tp_is_empty!87))))

(declare-fun mapKey!265 () (_ BitVec 32))

(declare-fun mapValue!265 () T!4373)

(declare-fun mapRest!265 () (Array (_ BitVec 32) T!4373))

(assert (=> mapNonEmpty!265 (= mapRest!255 (store mapRest!265 mapKey!265 mapValue!265))))

(assert (= (and mapNonEmpty!256 condMapEmpty!265) mapIsEmpty!265))

(assert (= (and mapNonEmpty!256 (not condMapEmpty!265)) mapNonEmpty!265))

(declare-fun m!23675 () Bool)

(assert (=> mapNonEmpty!265 m!23675))

(declare-fun condMapEmpty!266 () Bool)

(declare-fun mapDefault!266 () T!4373)

(assert (=> mapNonEmpty!255 (= condMapEmpty!266 (= mapRest!256 ((as const (Array (_ BitVec 32) T!4373)) mapDefault!266)))))

(declare-fun mapRes!266 () Bool)

(assert (=> mapNonEmpty!255 (= tp!255 (and tp_is_empty!87 mapRes!266))))

(declare-fun mapIsEmpty!266 () Bool)

(assert (=> mapIsEmpty!266 mapRes!266))

(declare-fun mapNonEmpty!266 () Bool)

(declare-fun tp!266 () Bool)

(assert (=> mapNonEmpty!266 (= mapRes!266 (and tp!266 tp_is_empty!87))))

(declare-fun mapRest!266 () (Array (_ BitVec 32) T!4373))

(declare-fun mapValue!266 () T!4373)

(declare-fun mapKey!266 () (_ BitVec 32))

(assert (=> mapNonEmpty!266 (= mapRest!256 (store mapRest!266 mapKey!266 mapValue!266))))

(assert (= (and mapNonEmpty!255 condMapEmpty!266) mapIsEmpty!266))

(assert (= (and mapNonEmpty!255 (not condMapEmpty!266)) mapNonEmpty!266))

(declare-fun m!23677 () Bool)

(assert (=> mapNonEmpty!266 m!23677))

(check-sat (not mapNonEmpty!265) (not mapNonEmpty!266) tp_is_empty!87)
(check-sat)
