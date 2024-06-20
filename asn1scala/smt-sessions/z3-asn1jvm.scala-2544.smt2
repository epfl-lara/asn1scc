; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64036 () Bool)

(assert start!64036)

(declare-fun mapNonEmpty!1409 () Bool)

(declare-fun mapRes!1409 () Bool)

(declare-fun tp!1409 () Bool)

(declare-fun tp_is_empty!477 () Bool)

(assert (=> mapNonEmpty!1409 (= mapRes!1409 (and tp!1409 tp_is_empty!477))))

(declare-datatypes ((T!51543 0))(
  ( (T!51544 (val!238 Int)) )
))
(declare-fun mapValue!1409 () T!51543)

(declare-fun mapRest!1411 () (Array (_ BitVec 32) T!51543))

(declare-fun mapKey!1410 () (_ BitVec 32))

(declare-datatypes ((array!16755 0))(
  ( (array!16756 (arr!8225 (Array (_ BitVec 32) T!51543)) (size!7229 (_ BitVec 32))) )
))
(declare-fun a1!647 () array!16755)

(assert (=> mapNonEmpty!1409 (= (arr!8225 a1!647) (store mapRest!1411 mapKey!1410 mapValue!1409))))

(declare-fun b!285263 () Bool)

(declare-fun res!236117 () Bool)

(declare-fun e!203724 () Bool)

(assert (=> b!285263 (=> (not res!236117) (not e!203724))))

(declare-fun a2!647 () array!16755)

(declare-fun from!773 () (_ BitVec 32))

(declare-fun a3!68 () array!16755)

(declare-fun to!740 () (_ BitVec 32))

(declare-fun arrayRangesEq!1371 (array!16755 array!16755 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!285263 (= res!236117 (arrayRangesEq!1371 a2!647 a3!68 from!773 to!740))))

(declare-fun b!285264 () Bool)

(declare-fun e!203725 () Bool)

(declare-fun mapRes!1410 () Bool)

(assert (=> b!285264 (= e!203725 (and tp_is_empty!477 mapRes!1410))))

(declare-fun condMapEmpty!1410 () Bool)

(declare-fun mapDefault!1410 () T!51543)

(assert (=> b!285264 (= condMapEmpty!1410 (= (arr!8225 a3!68) ((as const (Array (_ BitVec 32) T!51543)) mapDefault!1410)))))

(declare-fun b!285265 () Bool)

(declare-fun res!236121 () Bool)

(assert (=> b!285265 (=> (not res!236121) (not e!203724))))

(declare-fun i!964 () (_ BitVec 32))

(assert (=> b!285265 (= res!236121 (arrayRangesEq!1371 a1!647 a3!68 from!773 i!964))))

(declare-fun b!285266 () Bool)

(declare-fun res!236115 () Bool)

(assert (=> b!285266 (=> (not res!236115) (not e!203724))))

(declare-fun mid!71 () (_ BitVec 32))

(assert (=> b!285266 (= res!236115 (arrayRangesEq!1371 a1!647 a2!647 i!964 mid!71))))

(declare-fun mapIsEmpty!1410 () Bool)

(assert (=> mapIsEmpty!1410 mapRes!1409))

(declare-fun mapNonEmpty!1410 () Bool)

(declare-fun tp!1410 () Bool)

(assert (=> mapNonEmpty!1410 (= mapRes!1410 (and tp!1410 tp_is_empty!477))))

(declare-fun mapRest!1410 () (Array (_ BitVec 32) T!51543))

(declare-fun mapKey!1409 () (_ BitVec 32))

(declare-fun mapValue!1410 () T!51543)

(assert (=> mapNonEmpty!1410 (= (arr!8225 a3!68) (store mapRest!1410 mapKey!1409 mapValue!1410))))

(declare-fun b!285267 () Bool)

(declare-fun e!203723 () Bool)

(declare-fun mapRes!1411 () Bool)

(assert (=> b!285267 (= e!203723 (and tp_is_empty!477 mapRes!1411))))

(declare-fun condMapEmpty!1411 () Bool)

(declare-fun mapDefault!1411 () T!51543)

(assert (=> b!285267 (= condMapEmpty!1411 (= (arr!8225 a2!647) ((as const (Array (_ BitVec 32) T!51543)) mapDefault!1411)))))

(declare-fun mapIsEmpty!1409 () Bool)

(assert (=> mapIsEmpty!1409 mapRes!1410))

(declare-fun res!236114 () Bool)

(assert (=> start!64036 (=> (not res!236114) (not e!203724))))

(assert (=> start!64036 (= res!236114 (and (bvsle #b00000000000000000000000000000000 from!773) (bvsle from!773 mid!71) (bvsle mid!71 to!740) (bvsle (size!7229 a1!647) (size!7229 a2!647)) (bvsle (size!7229 a2!647) (size!7229 a3!68)) (bvsle mid!71 (size!7229 a1!647)) (bvsle to!740 (size!7229 a2!647))))))

(assert (=> start!64036 e!203724))

(declare-fun array_inv!6900 (array!16755) Bool)

(assert (=> start!64036 (and (array_inv!6900 a2!647) e!203723)))

(assert (=> start!64036 true))

(declare-fun e!203722 () Bool)

(assert (=> start!64036 (and (array_inv!6900 a1!647) e!203722)))

(assert (=> start!64036 (and (array_inv!6900 a3!68) e!203725)))

(declare-fun b!285268 () Bool)

(declare-fun res!236119 () Bool)

(assert (=> b!285268 (=> (not res!236119) (not e!203724))))

(assert (=> b!285268 (= res!236119 (and (bvsle from!773 i!964) (bvsle i!964 mid!71)))))

(declare-fun mapIsEmpty!1411 () Bool)

(assert (=> mapIsEmpty!1411 mapRes!1411))

(declare-fun b!285269 () Bool)

(declare-fun res!236120 () Bool)

(assert (=> b!285269 (=> (not res!236120) (not e!203724))))

(assert (=> b!285269 (= res!236120 (not (= i!964 mid!71)))))

(declare-fun mapNonEmpty!1411 () Bool)

(declare-fun tp!1411 () Bool)

(assert (=> mapNonEmpty!1411 (= mapRes!1411 (and tp!1411 tp_is_empty!477))))

(declare-fun mapRest!1409 () (Array (_ BitVec 32) T!51543))

(declare-fun mapValue!1411 () T!51543)

(declare-fun mapKey!1411 () (_ BitVec 32))

(assert (=> mapNonEmpty!1411 (= (arr!8225 a2!647) (store mapRest!1409 mapKey!1411 mapValue!1411))))

(declare-fun b!285270 () Bool)

(assert (=> b!285270 (= e!203724 (not true))))

(assert (=> b!285270 (arrayRangesEq!1371 a1!647 a3!68 from!773 (bvadd #b00000000000000000000000000000001 i!964))))

(declare-datatypes ((Unit!19923 0))(
  ( (Unit!19924) )
))
(declare-fun lt!418566 () Unit!19923)

(declare-fun arrayRangesEqAppend!4 (array!16755 array!16755 (_ BitVec 32) (_ BitVec 32)) Unit!19923)

(assert (=> b!285270 (= lt!418566 (arrayRangesEqAppend!4 a1!647 a3!68 from!773 i!964))))

(declare-fun b!285271 () Bool)

(declare-fun res!236116 () Bool)

(assert (=> b!285271 (=> (not res!236116) (not e!203724))))

(assert (=> b!285271 (= res!236116 (arrayRangesEq!1371 a1!647 a2!647 from!773 mid!71))))

(declare-fun b!285272 () Bool)

(declare-fun res!236118 () Bool)

(assert (=> b!285272 (=> (not res!236118) (not e!203724))))

(assert (=> b!285272 (= res!236118 (arrayRangesEq!1371 a2!647 a3!68 i!964 to!740))))

(declare-fun b!285273 () Bool)

(assert (=> b!285273 (= e!203722 (and tp_is_empty!477 mapRes!1409))))

(declare-fun condMapEmpty!1409 () Bool)

(declare-fun mapDefault!1409 () T!51543)

(assert (=> b!285273 (= condMapEmpty!1409 (= (arr!8225 a1!647) ((as const (Array (_ BitVec 32) T!51543)) mapDefault!1409)))))

(assert (= (and start!64036 res!236114) b!285271))

(assert (= (and b!285271 res!236116) b!285263))

(assert (= (and b!285263 res!236117) b!285268))

(assert (= (and b!285268 res!236119) b!285266))

(assert (= (and b!285266 res!236115) b!285272))

(assert (= (and b!285272 res!236118) b!285265))

(assert (= (and b!285265 res!236121) b!285269))

(assert (= (and b!285269 res!236120) b!285270))

(assert (= (and b!285267 condMapEmpty!1411) mapIsEmpty!1411))

(assert (= (and b!285267 (not condMapEmpty!1411)) mapNonEmpty!1411))

(assert (= start!64036 b!285267))

(assert (= (and b!285273 condMapEmpty!1409) mapIsEmpty!1410))

(assert (= (and b!285273 (not condMapEmpty!1409)) mapNonEmpty!1409))

(assert (= start!64036 b!285273))

(assert (= (and b!285264 condMapEmpty!1410) mapIsEmpty!1409))

(assert (= (and b!285264 (not condMapEmpty!1410)) mapNonEmpty!1410))

(assert (= start!64036 b!285264))

(declare-fun m!418283 () Bool)

(assert (=> start!64036 m!418283))

(declare-fun m!418285 () Bool)

(assert (=> start!64036 m!418285))

(declare-fun m!418287 () Bool)

(assert (=> start!64036 m!418287))

(declare-fun m!418289 () Bool)

(assert (=> mapNonEmpty!1409 m!418289))

(declare-fun m!418291 () Bool)

(assert (=> mapNonEmpty!1410 m!418291))

(declare-fun m!418293 () Bool)

(assert (=> b!285271 m!418293))

(declare-fun m!418295 () Bool)

(assert (=> b!285265 m!418295))

(declare-fun m!418297 () Bool)

(assert (=> mapNonEmpty!1411 m!418297))

(declare-fun m!418299 () Bool)

(assert (=> b!285263 m!418299))

(declare-fun m!418301 () Bool)

(assert (=> b!285266 m!418301))

(declare-fun m!418303 () Bool)

(assert (=> b!285270 m!418303))

(declare-fun m!418305 () Bool)

(assert (=> b!285270 m!418305))

(declare-fun m!418307 () Bool)

(assert (=> b!285272 m!418307))

(check-sat (not mapNonEmpty!1410) (not b!285271) (not b!285263) (not b!285266) (not b!285272) (not b!285270) tp_is_empty!477 (not mapNonEmpty!1409) (not b!285265) (not start!64036) (not mapNonEmpty!1411))
(check-sat)
