; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74180 () Bool)

(assert start!74180)

(declare-fun b!327249 () Bool)

(declare-fun e!236402 () Bool)

(declare-fun tp_is_empty!1179 () Bool)

(declare-fun mapRes!3541 () Bool)

(assert (=> b!327249 (= e!236402 (and tp_is_empty!1179 mapRes!3541))))

(declare-fun condMapEmpty!3541 () Bool)

(declare-datatypes ((T!66985 0))(
  ( (T!66986 (val!589 Int)) )
))
(declare-datatypes ((array!21403 0))(
  ( (array!21404 (arr!10385 (Array (_ BitVec 32) T!66985)) (size!9293 (_ BitVec 32))) )
))
(declare-fun a1!451 () array!21403)

(declare-fun mapDefault!3541 () T!66985)

(assert (=> b!327249 (= condMapEmpty!3541 (= (arr!10385 a1!451) ((as const (Array (_ BitVec 32) T!66985)) mapDefault!3541)))))

(declare-fun mapIsEmpty!3540 () Bool)

(declare-fun mapRes!3540 () Bool)

(assert (=> mapIsEmpty!3540 mapRes!3540))

(declare-fun mapNonEmpty!3540 () Bool)

(declare-fun tp!3541 () Bool)

(assert (=> mapNonEmpty!3540 (= mapRes!3541 (and tp!3541 tp_is_empty!1179))))

(declare-fun mapValue!3540 () T!66985)

(declare-fun mapRest!3541 () (Array (_ BitVec 32) T!66985))

(declare-fun mapKey!3541 () (_ BitVec 32))

(assert (=> mapNonEmpty!3540 (= (arr!10385 a1!451) (store mapRest!3541 mapKey!3541 mapValue!3540))))

(declare-fun b!327250 () Bool)

(declare-fun e!236403 () Bool)

(assert (=> b!327250 (= e!236403 (and tp_is_empty!1179 mapRes!3540))))

(declare-fun condMapEmpty!3540 () Bool)

(declare-fun a2!451 () array!21403)

(declare-fun mapDefault!3540 () T!66985)

(assert (=> b!327250 (= condMapEmpty!3540 (= (arr!10385 a2!451) ((as const (Array (_ BitVec 32) T!66985)) mapDefault!3540)))))

(declare-fun mapIsEmpty!3541 () Bool)

(assert (=> mapIsEmpty!3541 mapRes!3541))

(declare-fun to!544 () (_ BitVec 32))

(declare-fun from!577 () (_ BitVec 32))

(assert (=> start!74180 (and (bvsle #b00000000000000000000000000000000 from!577) (bvsle from!577 to!544) (bvsle (size!9293 a1!451) (size!9293 a2!451)) (bvsle to!544 (size!9293 a1!451)) (not (= from!577 to!544)) (= (select (arr!10385 a1!451) from!577) (select (arr!10385 a2!451) from!577)) (= (bvand from!577 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand from!577 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!577) #b10000000000000000000000000000000))))))

(assert (=> start!74180 true))

(declare-fun array_inv!8826 (array!21403) Bool)

(assert (=> start!74180 (and (array_inv!8826 a1!451) e!236402)))

(assert (=> start!74180 (and (array_inv!8826 a2!451) e!236403)))

(declare-fun mapNonEmpty!3541 () Bool)

(declare-fun tp!3540 () Bool)

(assert (=> mapNonEmpty!3541 (= mapRes!3540 (and tp!3540 tp_is_empty!1179))))

(declare-fun mapRest!3540 () (Array (_ BitVec 32) T!66985))

(declare-fun mapValue!3541 () T!66985)

(declare-fun mapKey!3540 () (_ BitVec 32))

(assert (=> mapNonEmpty!3541 (= (arr!10385 a2!451) (store mapRest!3540 mapKey!3540 mapValue!3541))))

(assert (= (and b!327249 condMapEmpty!3541) mapIsEmpty!3541))

(assert (= (and b!327249 (not condMapEmpty!3541)) mapNonEmpty!3540))

(assert (= start!74180 b!327249))

(assert (= (and b!327250 condMapEmpty!3540) mapIsEmpty!3540))

(assert (= (and b!327250 (not condMapEmpty!3540)) mapNonEmpty!3541))

(assert (= start!74180 b!327250))

(declare-fun m!465059 () Bool)

(assert (=> mapNonEmpty!3540 m!465059))

(declare-fun m!465061 () Bool)

(assert (=> start!74180 m!465061))

(declare-fun m!465063 () Bool)

(assert (=> start!74180 m!465063))

(declare-fun m!465065 () Bool)

(assert (=> start!74180 m!465065))

(declare-fun m!465067 () Bool)

(assert (=> start!74180 m!465067))

(declare-fun m!465069 () Bool)

(assert (=> mapNonEmpty!3541 m!465069))

(check-sat (not start!74180) (not mapNonEmpty!3540) (not mapNonEmpty!3541) tp_is_empty!1179)
(check-sat)
