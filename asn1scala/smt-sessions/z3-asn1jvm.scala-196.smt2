; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4058 () Bool)

(assert start!4058)

(declare-fun res!15419 () Bool)

(declare-fun e!10947 () Bool)

(assert (=> start!4058 (=> (not res!15419) (not e!10947))))

(declare-datatypes ((T!4139 0))(
  ( (T!4140 (val!16 Int)) )
))
(declare-datatypes ((array!1051 0))(
  ( (array!1052 (arr!875 (Array (_ BitVec 32) T!4139)) (size!446 (_ BitVec 32))) )
))
(declare-fun dst!20 () array!1051)

(declare-fun len!1 () (_ BitVec 32))

(declare-fun fromDst!6 () (_ BitVec 32))

(declare-fun fromSrc!6 () (_ BitVec 32))

(declare-fun src!6 () array!1051)

(assert (=> start!4058 (= res!15419 (and (bvsle #b00000000000000000000000000000000 len!1) (bvsle len!1 (size!446 src!6)) (bvsle len!1 (size!446 dst!20)) (bvsle #b00000000000000000000000000000000 fromSrc!6) (bvsle fromSrc!6 (bvsub (size!446 src!6) len!1)) (bvsle #b00000000000000000000000000000000 fromDst!6) (bvsle fromDst!6 (bvsub (size!446 dst!20) len!1))))))

(assert (=> start!4058 e!10947))

(declare-fun e!10945 () Bool)

(declare-fun array_inv!429 (array!1051) Bool)

(assert (=> start!4058 (and (array_inv!429 dst!20) e!10945)))

(assert (=> start!4058 true))

(declare-fun e!10946 () Bool)

(assert (=> start!4058 (and (array_inv!429 src!6) e!10946)))

(declare-fun b!17220 () Bool)

(declare-datatypes ((Unit!1562 0))(
  ( (Unit!1563) )
))
(declare-datatypes ((tuple2!2040 0))(
  ( (tuple2!2041 (_1!1081 Unit!1562) (_2!1081 array!1051)) )
))
(declare-fun arrayCopyOffset!1 (array!1051 array!1051 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) tuple2!2040)

(assert (=> b!17220 (= e!10947 (not (= (size!446 dst!20) (size!446 (_2!1081 (arrayCopyOffset!1 src!6 dst!20 fromSrc!6 (bvadd fromSrc!6 len!1) fromDst!6))))))))

(declare-fun mapIsEmpty!86 () Bool)

(declare-fun mapRes!86 () Bool)

(assert (=> mapIsEmpty!86 mapRes!86))

(declare-fun b!17221 () Bool)

(declare-fun tp_is_empty!33 () Bool)

(assert (=> b!17221 (= e!10945 (and tp_is_empty!33 mapRes!86))))

(declare-fun condMapEmpty!87 () Bool)

(declare-fun mapDefault!86 () T!4139)

(assert (=> b!17221 (= condMapEmpty!87 (= (arr!875 dst!20) ((as const (Array (_ BitVec 32) T!4139)) mapDefault!86)))))

(declare-fun mapNonEmpty!86 () Bool)

(declare-fun mapRes!87 () Bool)

(declare-fun tp!86 () Bool)

(assert (=> mapNonEmpty!86 (= mapRes!87 (and tp!86 tp_is_empty!33))))

(declare-fun mapKey!87 () (_ BitVec 32))

(declare-fun mapRest!86 () (Array (_ BitVec 32) T!4139))

(declare-fun mapValue!86 () T!4139)

(assert (=> mapNonEmpty!86 (= (arr!875 src!6) (store mapRest!86 mapKey!87 mapValue!86))))

(declare-fun mapIsEmpty!87 () Bool)

(assert (=> mapIsEmpty!87 mapRes!87))

(declare-fun mapNonEmpty!87 () Bool)

(declare-fun tp!87 () Bool)

(assert (=> mapNonEmpty!87 (= mapRes!86 (and tp!87 tp_is_empty!33))))

(declare-fun mapKey!86 () (_ BitVec 32))

(declare-fun mapValue!87 () T!4139)

(declare-fun mapRest!87 () (Array (_ BitVec 32) T!4139))

(assert (=> mapNonEmpty!87 (= (arr!875 dst!20) (store mapRest!87 mapKey!86 mapValue!87))))

(declare-fun b!17222 () Bool)

(assert (=> b!17222 (= e!10946 (and tp_is_empty!33 mapRes!87))))

(declare-fun condMapEmpty!86 () Bool)

(declare-fun mapDefault!87 () T!4139)

(assert (=> b!17222 (= condMapEmpty!86 (= (arr!875 src!6) ((as const (Array (_ BitVec 32) T!4139)) mapDefault!87)))))

(assert (= (and start!4058 res!15419) b!17220))

(assert (= (and b!17221 condMapEmpty!87) mapIsEmpty!86))

(assert (= (and b!17221 (not condMapEmpty!87)) mapNonEmpty!87))

(assert (= start!4058 b!17221))

(assert (= (and b!17222 condMapEmpty!86) mapIsEmpty!87))

(assert (= (and b!17222 (not condMapEmpty!86)) mapNonEmpty!86))

(assert (= start!4058 b!17222))

(declare-fun m!23429 () Bool)

(assert (=> start!4058 m!23429))

(declare-fun m!23431 () Bool)

(assert (=> start!4058 m!23431))

(declare-fun m!23433 () Bool)

(assert (=> b!17220 m!23433))

(declare-fun m!23435 () Bool)

(assert (=> mapNonEmpty!86 m!23435))

(declare-fun m!23437 () Bool)

(assert (=> mapNonEmpty!87 m!23437))

(check-sat (not mapNonEmpty!87) (not mapNonEmpty!86) (not b!17220) (not start!4058) tp_is_empty!33)
(check-sat)
(get-model)

(declare-fun d!5632 () Bool)

(declare-fun lt!25269 () tuple2!2040)

(assert (=> d!5632 (= (size!446 dst!20) (size!446 (_2!1081 lt!25269)))))

(declare-fun e!10959 () tuple2!2040)

(assert (=> d!5632 (= lt!25269 e!10959)))

(declare-fun c!1312 () Bool)

(assert (=> d!5632 (= c!1312 (bvslt fromSrc!6 (bvadd fromSrc!6 len!1)))))

(assert (=> d!5632 (and (bvsle #b00000000000000000000000000000000 fromSrc!6) (bvsle fromSrc!6 (bvadd fromSrc!6 len!1)))))

(assert (=> d!5632 (= (arrayCopyOffset!1 src!6 dst!20 fromSrc!6 (bvadd fromSrc!6 len!1) fromDst!6) lt!25269)))

(declare-fun b!17236 () Bool)

(declare-fun lt!25270 () tuple2!2040)

(assert (=> b!17236 (= e!10959 (tuple2!2041 (_1!1081 lt!25270) (_2!1081 lt!25270)))))

(assert (=> b!17236 (= lt!25270 (arrayCopyOffset!1 src!6 (array!1052 (store (arr!875 dst!20) fromDst!6 (select (arr!875 src!6) fromSrc!6)) (size!446 dst!20)) (bvadd fromSrc!6 #b00000000000000000000000000000001) (bvadd fromSrc!6 len!1) (bvadd fromDst!6 #b00000000000000000000000000000001)))))

(declare-fun b!17237 () Bool)

(declare-fun Unit!1564 () Unit!1562)

(assert (=> b!17237 (= e!10959 (tuple2!2041 Unit!1564 dst!20))))

(assert (= (and d!5632 c!1312) b!17236))

(assert (= (and d!5632 (not c!1312)) b!17237))

(declare-fun m!23449 () Bool)

(assert (=> b!17236 m!23449))

(declare-fun m!23451 () Bool)

(assert (=> b!17236 m!23451))

(declare-fun m!23453 () Bool)

(assert (=> b!17236 m!23453))

(assert (=> b!17220 d!5632))

(declare-fun d!5634 () Bool)

(assert (=> d!5634 (= (array_inv!429 dst!20) (bvsge (size!446 dst!20) #b00000000000000000000000000000000))))

(assert (=> start!4058 d!5634))

(declare-fun d!5636 () Bool)

(assert (=> d!5636 (= (array_inv!429 src!6) (bvsge (size!446 src!6) #b00000000000000000000000000000000))))

(assert (=> start!4058 d!5636))

(declare-fun condMapEmpty!96 () Bool)

(declare-fun mapDefault!96 () T!4139)

(assert (=> mapNonEmpty!87 (= condMapEmpty!96 (= mapRest!87 ((as const (Array (_ BitVec 32) T!4139)) mapDefault!96)))))

(declare-fun mapRes!96 () Bool)

(assert (=> mapNonEmpty!87 (= tp!87 (and tp_is_empty!33 mapRes!96))))

(declare-fun mapIsEmpty!96 () Bool)

(assert (=> mapIsEmpty!96 mapRes!96))

(declare-fun mapNonEmpty!96 () Bool)

(declare-fun tp!96 () Bool)

(assert (=> mapNonEmpty!96 (= mapRes!96 (and tp!96 tp_is_empty!33))))

(declare-fun mapKey!96 () (_ BitVec 32))

(declare-fun mapValue!96 () T!4139)

(declare-fun mapRest!96 () (Array (_ BitVec 32) T!4139))

(assert (=> mapNonEmpty!96 (= mapRest!87 (store mapRest!96 mapKey!96 mapValue!96))))

(assert (= (and mapNonEmpty!87 condMapEmpty!96) mapIsEmpty!96))

(assert (= (and mapNonEmpty!87 (not condMapEmpty!96)) mapNonEmpty!96))

(declare-fun m!23455 () Bool)

(assert (=> mapNonEmpty!96 m!23455))

(declare-fun condMapEmpty!97 () Bool)

(declare-fun mapDefault!97 () T!4139)

(assert (=> mapNonEmpty!86 (= condMapEmpty!97 (= mapRest!86 ((as const (Array (_ BitVec 32) T!4139)) mapDefault!97)))))

(declare-fun mapRes!97 () Bool)

(assert (=> mapNonEmpty!86 (= tp!86 (and tp_is_empty!33 mapRes!97))))

(declare-fun mapIsEmpty!97 () Bool)

(assert (=> mapIsEmpty!97 mapRes!97))

(declare-fun mapNonEmpty!97 () Bool)

(declare-fun tp!97 () Bool)

(assert (=> mapNonEmpty!97 (= mapRes!97 (and tp!97 tp_is_empty!33))))

(declare-fun mapRest!97 () (Array (_ BitVec 32) T!4139))

(declare-fun mapKey!97 () (_ BitVec 32))

(declare-fun mapValue!97 () T!4139)

(assert (=> mapNonEmpty!97 (= mapRest!86 (store mapRest!97 mapKey!97 mapValue!97))))

(assert (= (and mapNonEmpty!86 condMapEmpty!97) mapIsEmpty!97))

(assert (= (and mapNonEmpty!86 (not condMapEmpty!97)) mapNonEmpty!97))

(declare-fun m!23457 () Bool)

(assert (=> mapNonEmpty!97 m!23457))

(check-sat (not b!17236) (not mapNonEmpty!96) (not mapNonEmpty!97) tp_is_empty!33)
(check-sat)
