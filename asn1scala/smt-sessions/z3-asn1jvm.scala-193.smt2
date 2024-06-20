; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4040 () Bool)

(assert start!4040)

(declare-fun mapNonEmpty!32 () Bool)

(declare-fun mapRes!33 () Bool)

(declare-fun tp!32 () Bool)

(declare-fun tp_is_empty!15 () Bool)

(assert (=> mapNonEmpty!32 (= mapRes!33 (and tp!32 tp_is_empty!15))))

(declare-fun mapKey!32 () (_ BitVec 32))

(declare-datatypes ((T!4061 0))(
  ( (T!4062 (val!7 Int)) )
))
(declare-fun mapRest!32 () (Array (_ BitVec 32) T!4061))

(declare-fun mapValue!33 () T!4061)

(declare-datatypes ((array!1033 0))(
  ( (array!1034 (arr!866 (Array (_ BitVec 32) T!4061)) (size!437 (_ BitVec 32))) )
))
(declare-fun src!6 () array!1033)

(assert (=> mapNonEmpty!32 (= (arr!866 src!6) (store mapRest!32 mapKey!32 mapValue!33))))

(declare-fun dst!20 () array!1033)

(declare-fun len!1 () (_ BitVec 32))

(declare-fun fromSrc!6 () (_ BitVec 32))

(assert (=> start!4040 (and (bvsle #b00000000000000000000000000000000 len!1) (bvsle len!1 (size!437 src!6)) (bvsle len!1 (size!437 dst!20)) (bvsle #b00000000000000000000000000000000 fromSrc!6) (not (= (bvand (size!437 src!6) #b10000000000000000000000000000000) (bvand len!1 #b10000000000000000000000000000000))) (not (= (bvand (size!437 src!6) #b10000000000000000000000000000000) (bvand (bvsub (size!437 src!6) len!1) #b10000000000000000000000000000000))))))

(assert (=> start!4040 true))

(declare-fun e!10886 () Bool)

(declare-fun array_inv!425 (array!1033) Bool)

(assert (=> start!4040 (and (array_inv!425 src!6) e!10886)))

(declare-fun e!10887 () Bool)

(assert (=> start!4040 (and (array_inv!425 dst!20) e!10887)))

(declare-fun mapIsEmpty!32 () Bool)

(assert (=> mapIsEmpty!32 mapRes!33))

(declare-fun b!17161 () Bool)

(declare-fun mapRes!32 () Bool)

(assert (=> b!17161 (= e!10887 (and tp_is_empty!15 mapRes!32))))

(declare-fun condMapEmpty!32 () Bool)

(declare-fun mapDefault!32 () T!4061)

(assert (=> b!17161 (= condMapEmpty!32 (= (arr!866 dst!20) ((as const (Array (_ BitVec 32) T!4061)) mapDefault!32)))))

(declare-fun mapIsEmpty!33 () Bool)

(assert (=> mapIsEmpty!33 mapRes!32))

(declare-fun b!17162 () Bool)

(assert (=> b!17162 (= e!10886 (and tp_is_empty!15 mapRes!33))))

(declare-fun condMapEmpty!33 () Bool)

(declare-fun mapDefault!33 () T!4061)

(assert (=> b!17162 (= condMapEmpty!33 (= (arr!866 src!6) ((as const (Array (_ BitVec 32) T!4061)) mapDefault!33)))))

(declare-fun mapNonEmpty!33 () Bool)

(declare-fun tp!33 () Bool)

(assert (=> mapNonEmpty!33 (= mapRes!32 (and tp!33 tp_is_empty!15))))

(declare-fun mapValue!32 () T!4061)

(declare-fun mapRest!33 () (Array (_ BitVec 32) T!4061))

(declare-fun mapKey!33 () (_ BitVec 32))

(assert (=> mapNonEmpty!33 (= (arr!866 dst!20) (store mapRest!33 mapKey!33 mapValue!32))))

(assert (= (and b!17162 condMapEmpty!33) mapIsEmpty!32))

(assert (= (and b!17162 (not condMapEmpty!33)) mapNonEmpty!32))

(assert (= start!4040 b!17162))

(assert (= (and b!17161 condMapEmpty!32) mapIsEmpty!33))

(assert (= (and b!17161 (not condMapEmpty!32)) mapNonEmpty!33))

(assert (= start!4040 b!17161))

(declare-fun m!23355 () Bool)

(assert (=> mapNonEmpty!32 m!23355))

(declare-fun m!23357 () Bool)

(assert (=> start!4040 m!23357))

(declare-fun m!23359 () Bool)

(assert (=> start!4040 m!23359))

(declare-fun m!23361 () Bool)

(assert (=> mapNonEmpty!33 m!23361))

(check-sat (not start!4040) (not mapNonEmpty!33) (not mapNonEmpty!32) tp_is_empty!15)
(check-sat)
