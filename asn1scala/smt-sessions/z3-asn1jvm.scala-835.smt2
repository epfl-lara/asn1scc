; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24566 () Bool)

(assert start!24566)

(declare-fun mapNonEmpty!424 () Bool)

(declare-fun mapRes!424 () Bool)

(declare-fun tp!425 () Bool)

(declare-fun tp_is_empty!141 () Bool)

(assert (=> mapNonEmpty!424 (= mapRes!424 (and tp!425 tp_is_empty!141))))

(declare-datatypes ((T!17027 0))(
  ( (T!17028 (val!70 Int)) )
))
(declare-datatypes ((array!5532 0))(
  ( (array!5533 (arr!3097 (Array (_ BitVec 32) T!17027)) (size!2504 (_ BitVec 32))) )
))
(declare-fun a1!447 () array!5532)

(declare-fun mapKey!424 () (_ BitVec 32))

(declare-fun mapValue!425 () T!17027)

(declare-fun mapRest!425 () (Array (_ BitVec 32) T!17027))

(assert (=> mapNonEmpty!424 (= (arr!3097 a1!447) (store mapRest!425 mapKey!424 mapValue!425))))

(declare-fun b!124680 () Bool)

(declare-fun e!81815 () Bool)

(assert (=> b!124680 (= e!81815 (and tp_is_empty!141 mapRes!424))))

(declare-fun condMapEmpty!425 () Bool)

(declare-fun mapDefault!424 () T!17027)

(assert (=> b!124680 (= condMapEmpty!425 (= (arr!3097 a1!447) ((as const (Array (_ BitVec 32) T!17027)) mapDefault!424)))))

(declare-fun mapIsEmpty!424 () Bool)

(declare-fun mapRes!425 () Bool)

(assert (=> mapIsEmpty!424 mapRes!425))

(declare-fun b!124681 () Bool)

(declare-fun e!81814 () Bool)

(assert (=> b!124681 (= e!81814 (and tp_is_empty!141 mapRes!425))))

(declare-fun condMapEmpty!424 () Bool)

(declare-fun a2!447 () array!5532)

(declare-fun mapDefault!425 () T!17027)

(assert (=> b!124681 (= condMapEmpty!424 (= (arr!3097 a2!447) ((as const (Array (_ BitVec 32) T!17027)) mapDefault!425)))))

(declare-fun fromA2!7 () (_ BitVec 32))

(declare-fun toA1!7 () (_ BitVec 32))

(declare-fun fromA1!7 () (_ BitVec 32))

(assert (=> start!24566 (and (bvsle #b00000000000000000000000000000000 fromA1!7) (bvsle fromA1!7 toA1!7) (bvsle toA1!7 (size!2504 a1!447)) (bvsle #b00000000000000000000000000000000 fromA2!7) (bvsle fromA2!7 (bvsub (size!2504 a2!447) (bvsub toA1!7 fromA1!7))) (not (= fromA1!7 toA1!7)) (bvsge fromA2!7 (size!2504 a2!447)))))

(declare-fun array_inv!2300 (array!5532) Bool)

(assert (=> start!24566 (and (array_inv!2300 a2!447) e!81814)))

(assert (=> start!24566 true))

(assert (=> start!24566 (and (array_inv!2300 a1!447) e!81815)))

(declare-fun mapIsEmpty!425 () Bool)

(assert (=> mapIsEmpty!425 mapRes!424))

(declare-fun mapNonEmpty!425 () Bool)

(declare-fun tp!424 () Bool)

(assert (=> mapNonEmpty!425 (= mapRes!425 (and tp!424 tp_is_empty!141))))

(declare-fun mapValue!424 () T!17027)

(declare-fun mapRest!424 () (Array (_ BitVec 32) T!17027))

(declare-fun mapKey!425 () (_ BitVec 32))

(assert (=> mapNonEmpty!425 (= (arr!3097 a2!447) (store mapRest!424 mapKey!425 mapValue!424))))

(assert (= (and b!124681 condMapEmpty!424) mapIsEmpty!424))

(assert (= (and b!124681 (not condMapEmpty!424)) mapNonEmpty!425))

(assert (= start!24566 b!124681))

(assert (= (and b!124680 condMapEmpty!425) mapIsEmpty!425))

(assert (= (and b!124680 (not condMapEmpty!425)) mapNonEmpty!424))

(assert (= start!24566 b!124680))

(declare-fun m!189957 () Bool)

(assert (=> mapNonEmpty!424 m!189957))

(declare-fun m!189959 () Bool)

(assert (=> start!24566 m!189959))

(declare-fun m!189961 () Bool)

(assert (=> start!24566 m!189961))

(declare-fun m!189963 () Bool)

(assert (=> mapNonEmpty!425 m!189963))

(check-sat (not start!24566) (not mapNonEmpty!425) (not mapNonEmpty!424) tp_is_empty!141)
(check-sat)
(get-model)

(declare-fun d!40590 () Bool)

(assert (=> d!40590 (= (array_inv!2300 a2!447) (bvsge (size!2504 a2!447) #b00000000000000000000000000000000))))

(assert (=> start!24566 d!40590))

(declare-fun d!40592 () Bool)

(assert (=> d!40592 (= (array_inv!2300 a1!447) (bvsge (size!2504 a1!447) #b00000000000000000000000000000000))))

(assert (=> start!24566 d!40592))

(declare-fun condMapEmpty!434 () Bool)

(declare-fun mapDefault!434 () T!17027)

(assert (=> mapNonEmpty!425 (= condMapEmpty!434 (= mapRest!424 ((as const (Array (_ BitVec 32) T!17027)) mapDefault!434)))))

(declare-fun mapRes!434 () Bool)

(assert (=> mapNonEmpty!425 (= tp!424 (and tp_is_empty!141 mapRes!434))))

(declare-fun mapIsEmpty!434 () Bool)

(assert (=> mapIsEmpty!434 mapRes!434))

(declare-fun mapNonEmpty!434 () Bool)

(declare-fun tp!434 () Bool)

(assert (=> mapNonEmpty!434 (= mapRes!434 (and tp!434 tp_is_empty!141))))

(declare-fun mapKey!434 () (_ BitVec 32))

(declare-fun mapRest!434 () (Array (_ BitVec 32) T!17027))

(declare-fun mapValue!434 () T!17027)

(assert (=> mapNonEmpty!434 (= mapRest!424 (store mapRest!434 mapKey!434 mapValue!434))))

(assert (= (and mapNonEmpty!425 condMapEmpty!434) mapIsEmpty!434))

(assert (= (and mapNonEmpty!425 (not condMapEmpty!434)) mapNonEmpty!434))

(declare-fun m!189973 () Bool)

(assert (=> mapNonEmpty!434 m!189973))

(declare-fun condMapEmpty!435 () Bool)

(declare-fun mapDefault!435 () T!17027)

(assert (=> mapNonEmpty!424 (= condMapEmpty!435 (= mapRest!425 ((as const (Array (_ BitVec 32) T!17027)) mapDefault!435)))))

(declare-fun mapRes!435 () Bool)

(assert (=> mapNonEmpty!424 (= tp!425 (and tp_is_empty!141 mapRes!435))))

(declare-fun mapIsEmpty!435 () Bool)

(assert (=> mapIsEmpty!435 mapRes!435))

(declare-fun mapNonEmpty!435 () Bool)

(declare-fun tp!435 () Bool)

(assert (=> mapNonEmpty!435 (= mapRes!435 (and tp!435 tp_is_empty!141))))

(declare-fun mapKey!435 () (_ BitVec 32))

(declare-fun mapRest!435 () (Array (_ BitVec 32) T!17027))

(declare-fun mapValue!435 () T!17027)

(assert (=> mapNonEmpty!435 (= mapRest!425 (store mapRest!435 mapKey!435 mapValue!435))))

(assert (= (and mapNonEmpty!424 condMapEmpty!435) mapIsEmpty!435))

(assert (= (and mapNonEmpty!424 (not condMapEmpty!435)) mapNonEmpty!435))

(declare-fun m!189975 () Bool)

(assert (=> mapNonEmpty!435 m!189975))

(check-sat (not mapNonEmpty!434) (not mapNonEmpty!435) tp_is_empty!141)
(check-sat)
