; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24546 () Bool)

(assert start!24546)

(declare-fun mapNonEmpty!366 () Bool)

(declare-fun mapRes!367 () Bool)

(declare-fun tp!366 () Bool)

(declare-fun tp_is_empty!123 () Bool)

(assert (=> mapNonEmpty!366 (= mapRes!367 (and tp!366 tp_is_empty!123))))

(declare-datatypes ((T!16949 0))(
  ( (T!16950 (val!61 Int)) )
))
(declare-datatypes ((array!5513 0))(
  ( (array!5514 (arr!3088 (Array (_ BitVec 32) T!16949)) (size!2495 (_ BitVec 32))) )
))
(declare-fun a1!447 () array!5513)

(declare-fun mapKey!367 () (_ BitVec 32))

(declare-fun mapRest!366 () (Array (_ BitVec 32) T!16949))

(declare-fun mapValue!367 () T!16949)

(assert (=> mapNonEmpty!366 (= (arr!3088 a1!447) (store mapRest!366 mapKey!367 mapValue!367))))

(declare-fun mapNonEmpty!367 () Bool)

(declare-fun mapRes!366 () Bool)

(declare-fun tp!367 () Bool)

(assert (=> mapNonEmpty!367 (= mapRes!366 (and tp!367 tp_is_empty!123))))

(declare-fun mapKey!366 () (_ BitVec 32))

(declare-fun a2!447 () array!5513)

(declare-fun mapRest!367 () (Array (_ BitVec 32) T!16949))

(declare-fun mapValue!366 () T!16949)

(assert (=> mapNonEmpty!367 (= (arr!3088 a2!447) (store mapRest!367 mapKey!366 mapValue!366))))

(declare-fun b!124624 () Bool)

(declare-fun e!81761 () Bool)

(assert (=> b!124624 (= e!81761 (and tp_is_empty!123 mapRes!366))))

(declare-fun condMapEmpty!366 () Bool)

(declare-fun mapDefault!366 () T!16949)

(assert (=> b!124624 (= condMapEmpty!366 (= (arr!3088 a2!447) ((as const (Array (_ BitVec 32) T!16949)) mapDefault!366)))))

(declare-fun mapIsEmpty!367 () Bool)

(assert (=> mapIsEmpty!367 mapRes!366))

(declare-fun b!124625 () Bool)

(declare-fun e!81760 () Bool)

(assert (=> b!124625 (= e!81760 (and tp_is_empty!123 mapRes!367))))

(declare-fun condMapEmpty!367 () Bool)

(declare-fun mapDefault!367 () T!16949)

(assert (=> b!124625 (= condMapEmpty!367 (= (arr!3088 a1!447) ((as const (Array (_ BitVec 32) T!16949)) mapDefault!367)))))

(declare-fun mapIsEmpty!366 () Bool)

(assert (=> mapIsEmpty!366 mapRes!367))

(declare-fun toA1!7 () (_ BitVec 32))

(declare-fun fromA1!7 () (_ BitVec 32))

(declare-fun fromA2!7 () (_ BitVec 32))

(assert (=> start!24546 (and (bvsle #b00000000000000000000000000000000 fromA1!7) (bvsle fromA1!7 toA1!7) (bvsle toA1!7 (size!2495 a1!447)) (bvsle #b00000000000000000000000000000000 fromA2!7) (not (= (bvand (size!2495 a2!447) #b10000000000000000000000000000000) (bvand (bvsub toA1!7 fromA1!7) #b10000000000000000000000000000000))) (not (= (bvand (size!2495 a2!447) #b10000000000000000000000000000000) (bvand (bvsub (size!2495 a2!447) (bvsub toA1!7 fromA1!7)) #b10000000000000000000000000000000))))))

(declare-fun array_inv!2295 (array!5513) Bool)

(assert (=> start!24546 (and (array_inv!2295 a2!447) e!81761)))

(assert (=> start!24546 true))

(assert (=> start!24546 (and (array_inv!2295 a1!447) e!81760)))

(assert (= (and b!124624 condMapEmpty!366) mapIsEmpty!367))

(assert (= (and b!124624 (not condMapEmpty!366)) mapNonEmpty!367))

(assert (= start!24546 b!124624))

(assert (= (and b!124625 condMapEmpty!367) mapIsEmpty!366))

(assert (= (and b!124625 (not condMapEmpty!367)) mapNonEmpty!366))

(assert (= start!24546 b!124625))

(declare-fun m!189881 () Bool)

(assert (=> mapNonEmpty!366 m!189881))

(declare-fun m!189883 () Bool)

(assert (=> mapNonEmpty!367 m!189883))

(declare-fun m!189885 () Bool)

(assert (=> start!24546 m!189885))

(declare-fun m!189887 () Bool)

(assert (=> start!24546 m!189887))

(check-sat (not start!24546) (not mapNonEmpty!366) (not mapNonEmpty!367) tp_is_empty!123)
(check-sat)
(get-model)

(declare-fun d!40580 () Bool)

(assert (=> d!40580 (= (array_inv!2295 a2!447) (bvsge (size!2495 a2!447) #b00000000000000000000000000000000))))

(assert (=> start!24546 d!40580))

(declare-fun d!40582 () Bool)

(assert (=> d!40582 (= (array_inv!2295 a1!447) (bvsge (size!2495 a1!447) #b00000000000000000000000000000000))))

(assert (=> start!24546 d!40582))

(declare-fun condMapEmpty!376 () Bool)

(declare-fun mapDefault!376 () T!16949)

(assert (=> mapNonEmpty!366 (= condMapEmpty!376 (= mapRest!366 ((as const (Array (_ BitVec 32) T!16949)) mapDefault!376)))))

(declare-fun mapRes!376 () Bool)

(assert (=> mapNonEmpty!366 (= tp!366 (and tp_is_empty!123 mapRes!376))))

(declare-fun mapIsEmpty!376 () Bool)

(assert (=> mapIsEmpty!376 mapRes!376))

(declare-fun mapNonEmpty!376 () Bool)

(declare-fun tp!376 () Bool)

(assert (=> mapNonEmpty!376 (= mapRes!376 (and tp!376 tp_is_empty!123))))

(declare-fun mapKey!376 () (_ BitVec 32))

(declare-fun mapRest!376 () (Array (_ BitVec 32) T!16949))

(declare-fun mapValue!376 () T!16949)

(assert (=> mapNonEmpty!376 (= mapRest!366 (store mapRest!376 mapKey!376 mapValue!376))))

(assert (= (and mapNonEmpty!366 condMapEmpty!376) mapIsEmpty!376))

(assert (= (and mapNonEmpty!366 (not condMapEmpty!376)) mapNonEmpty!376))

(declare-fun m!189897 () Bool)

(assert (=> mapNonEmpty!376 m!189897))

(declare-fun condMapEmpty!377 () Bool)

(declare-fun mapDefault!377 () T!16949)

(assert (=> mapNonEmpty!367 (= condMapEmpty!377 (= mapRest!367 ((as const (Array (_ BitVec 32) T!16949)) mapDefault!377)))))

(declare-fun mapRes!377 () Bool)

(assert (=> mapNonEmpty!367 (= tp!367 (and tp_is_empty!123 mapRes!377))))

(declare-fun mapIsEmpty!377 () Bool)

(assert (=> mapIsEmpty!377 mapRes!377))

(declare-fun mapNonEmpty!377 () Bool)

(declare-fun tp!377 () Bool)

(assert (=> mapNonEmpty!377 (= mapRes!377 (and tp!377 tp_is_empty!123))))

(declare-fun mapValue!377 () T!16949)

(declare-fun mapRest!377 () (Array (_ BitVec 32) T!16949))

(declare-fun mapKey!377 () (_ BitVec 32))

(assert (=> mapNonEmpty!377 (= mapRest!367 (store mapRest!377 mapKey!377 mapValue!377))))

(assert (= (and mapNonEmpty!367 condMapEmpty!377) mapIsEmpty!377))

(assert (= (and mapNonEmpty!367 (not condMapEmpty!377)) mapNonEmpty!377))

(declare-fun m!189899 () Bool)

(assert (=> mapNonEmpty!377 m!189899))

(check-sat (not mapNonEmpty!377) (not mapNonEmpty!376) tp_is_empty!123)
(check-sat)
