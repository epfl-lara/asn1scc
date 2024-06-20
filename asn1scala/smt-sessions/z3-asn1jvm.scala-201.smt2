; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4096 () Bool)

(assert start!4096)

(declare-fun mapNonEmpty!179 () Bool)

(declare-fun mapRes!180 () Bool)

(declare-fun tp!179 () Bool)

(declare-fun tp_is_empty!63 () Bool)

(assert (=> mapNonEmpty!179 (= mapRes!180 (and tp!179 tp_is_empty!63))))

(declare-datatypes ((T!4269 0))(
  ( (T!4270 (val!31 Int)) )
))
(declare-fun mapValue!179 () T!4269)

(declare-fun mapKey!179 () (_ BitVec 32))

(declare-fun mapRest!179 () (Array (_ BitVec 32) T!4269))

(declare-datatypes ((array!1084 0))(
  ( (array!1085 (arr!890 (Array (_ BitVec 32) T!4269)) (size!461 (_ BitVec 32))) )
))
(declare-fun dst!10 () array!1084)

(assert (=> mapNonEmpty!179 (= (arr!890 dst!10) (store mapRest!179 mapKey!179 mapValue!179))))

(declare-fun mapIsEmpty!179 () Bool)

(declare-fun mapRes!179 () Bool)

(assert (=> mapIsEmpty!179 mapRes!179))

(declare-fun toSrc!1 () (_ BitVec 32))

(declare-fun src!2 () array!1084)

(declare-fun fromSrc!2 () (_ BitVec 32))

(declare-fun fromDst!2 () (_ BitVec 32))

(assert (=> start!4096 (and (bvsle #b00000000000000000000000000000000 fromSrc!2) (bvsle fromSrc!2 toSrc!1) (bvsle toSrc!1 (size!461 src!2)) (bvsle #b00000000000000000000000000000000 fromDst!2) (bvsle fromDst!2 (bvsub (size!461 dst!10) (bvsub toSrc!1 fromSrc!2))) (not (= (bvand toSrc!1 #b10000000000000000000000000000000) (bvand fromSrc!2 #b10000000000000000000000000000000))) (not (= (bvand toSrc!1 #b10000000000000000000000000000000) (bvand (bvsub toSrc!1 fromSrc!2) #b10000000000000000000000000000000))))))

(declare-fun e!11034 () Bool)

(declare-fun array_inv!439 (array!1084) Bool)

(assert (=> start!4096 (and (array_inv!439 dst!10) e!11034)))

(assert (=> start!4096 true))

(declare-fun e!11033 () Bool)

(assert (=> start!4096 (and (array_inv!439 src!2) e!11033)))

(declare-fun b!17317 () Bool)

(assert (=> b!17317 (= e!11034 (and tp_is_empty!63 mapRes!180))))

(declare-fun condMapEmpty!179 () Bool)

(declare-fun mapDefault!180 () T!4269)

(assert (=> b!17317 (= condMapEmpty!179 (= (arr!890 dst!10) ((as const (Array (_ BitVec 32) T!4269)) mapDefault!180)))))

(declare-fun mapNonEmpty!180 () Bool)

(declare-fun tp!180 () Bool)

(assert (=> mapNonEmpty!180 (= mapRes!179 (and tp!180 tp_is_empty!63))))

(declare-fun mapRest!180 () (Array (_ BitVec 32) T!4269))

(declare-fun mapValue!180 () T!4269)

(declare-fun mapKey!180 () (_ BitVec 32))

(assert (=> mapNonEmpty!180 (= (arr!890 src!2) (store mapRest!180 mapKey!180 mapValue!180))))

(declare-fun b!17318 () Bool)

(assert (=> b!17318 (= e!11033 (and tp_is_empty!63 mapRes!179))))

(declare-fun condMapEmpty!180 () Bool)

(declare-fun mapDefault!179 () T!4269)

(assert (=> b!17318 (= condMapEmpty!180 (= (arr!890 src!2) ((as const (Array (_ BitVec 32) T!4269)) mapDefault!179)))))

(declare-fun mapIsEmpty!180 () Bool)

(assert (=> mapIsEmpty!180 mapRes!180))

(assert (= (and b!17317 condMapEmpty!179) mapIsEmpty!180))

(assert (= (and b!17317 (not condMapEmpty!179)) mapNonEmpty!179))

(assert (= start!4096 b!17317))

(assert (= (and b!17318 condMapEmpty!180) mapIsEmpty!179))

(assert (= (and b!17318 (not condMapEmpty!180)) mapNonEmpty!180))

(assert (= start!4096 b!17318))

(declare-fun m!23559 () Bool)

(assert (=> mapNonEmpty!179 m!23559))

(declare-fun m!23561 () Bool)

(assert (=> start!4096 m!23561))

(declare-fun m!23563 () Bool)

(assert (=> start!4096 m!23563))

(declare-fun m!23565 () Bool)

(assert (=> mapNonEmpty!180 m!23565))

(check-sat (not start!4096) (not mapNonEmpty!179) (not mapNonEmpty!180) tp_is_empty!63)
(check-sat)
