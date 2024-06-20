; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64314 () Bool)

(assert start!64314)

(declare-fun mapIsEmpty!2361 () Bool)

(declare-fun mapRes!2361 () Bool)

(assert (=> mapIsEmpty!2361 mapRes!2361))

(declare-fun b!288584 () Bool)

(declare-fun e!205199 () Bool)

(declare-fun tp_is_empty!735 () Bool)

(declare-fun mapRes!2362 () Bool)

(assert (=> b!288584 (= e!205199 (and tp_is_empty!735 mapRes!2362))))

(declare-fun condMapEmpty!2361 () Bool)

(declare-datatypes ((T!52661 0))(
  ( (T!52662 (val!367 Int)) )
))
(declare-datatypes ((array!17017 0))(
  ( (array!17018 (arr!8354 (Array (_ BitVec 32) T!52661)) (size!7358 (_ BitVec 32))) )
))
(declare-fun a1!596 () array!17017)

(declare-fun mapDefault!2362 () T!52661)

(assert (=> b!288584 (= condMapEmpty!2361 (= (arr!8354 a1!596) ((as const (Array (_ BitVec 32) T!52661)) mapDefault!2362)))))

(declare-fun mapIsEmpty!2362 () Bool)

(assert (=> mapIsEmpty!2362 mapRes!2362))

(declare-fun b!288585 () Bool)

(declare-fun res!238500 () Bool)

(declare-fun e!205198 () Bool)

(assert (=> b!288585 (=> (not res!238500) (not e!205198))))

(declare-fun a2!596 () array!17017)

(declare-fun from!722 () (_ BitVec 32))

(declare-fun i!953 () (_ BitVec 32))

(declare-fun to!689 () (_ BitVec 32))

(assert (=> b!288585 (= res!238500 (and (= (select (arr!8354 a1!596) to!689) (select (arr!8354 a2!596) to!689)) (bvsle from!722 i!953) (bvsle i!953 to!689)))))

(declare-fun mapNonEmpty!2361 () Bool)

(declare-fun tp!2361 () Bool)

(assert (=> mapNonEmpty!2361 (= mapRes!2361 (and tp!2361 tp_is_empty!735))))

(declare-fun mapRest!2361 () (Array (_ BitVec 32) T!52661))

(declare-fun mapValue!2362 () T!52661)

(declare-fun mapKey!2361 () (_ BitVec 32))

(assert (=> mapNonEmpty!2361 (= (arr!8354 a2!596) (store mapRest!2361 mapKey!2361 mapValue!2362))))

(declare-fun b!288587 () Bool)

(declare-fun res!238496 () Bool)

(assert (=> b!288587 (=> (not res!238496) (not e!205198))))

(declare-fun arrayRangesEq!1464 (array!17017 array!17017 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!288587 (= res!238496 (arrayRangesEq!1464 a1!596 a2!596 i!953 (bvadd #b00000000000000000000000000000001 to!689)))))

(declare-fun b!288588 () Bool)

(declare-fun e!205196 () Bool)

(assert (=> b!288588 (= e!205198 (not e!205196))))

(declare-fun res!238501 () Bool)

(assert (=> b!288588 (=> res!238501 e!205196)))

(assert (=> b!288588 (= res!238501 (or (bvsgt from!722 (bvsub i!953 #b00000000000000000000000000000001)) (bvsgt (bvsub i!953 #b00000000000000000000000000000001) to!689)))))

(assert (=> b!288588 (= (select (arr!8354 a1!596) (bvsub i!953 #b00000000000000000000000000000001)) (select (arr!8354 a2!596) (bvsub i!953 #b00000000000000000000000000000001)))))

(declare-datatypes ((Unit!20005 0))(
  ( (Unit!20006) )
))
(declare-fun lt!418851 () Unit!20005)

(declare-fun arrayRangesEqImpliesEq!208 (array!17017 array!17017 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20005)

(assert (=> b!288588 (= lt!418851 (arrayRangesEqImpliesEq!208 a1!596 a2!596 from!722 (bvsub i!953 #b00000000000000000000000000000001) to!689))))

(declare-fun b!288589 () Bool)

(assert (=> b!288589 (= e!205196 (arrayRangesEq!1464 a1!596 a2!596 (bvsub i!953 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!689)))))

(declare-fun b!288590 () Bool)

(declare-fun res!238498 () Bool)

(assert (=> b!288590 (=> (not res!238498) (not e!205198))))

(assert (=> b!288590 (= res!238498 (not (= i!953 from!722)))))

(declare-fun mapNonEmpty!2362 () Bool)

(declare-fun tp!2362 () Bool)

(assert (=> mapNonEmpty!2362 (= mapRes!2362 (and tp!2362 tp_is_empty!735))))

(declare-fun mapValue!2361 () T!52661)

(declare-fun mapKey!2362 () (_ BitVec 32))

(declare-fun mapRest!2362 () (Array (_ BitVec 32) T!52661))

(assert (=> mapNonEmpty!2362 (= (arr!8354 a1!596) (store mapRest!2362 mapKey!2362 mapValue!2361))))

(declare-fun b!288591 () Bool)

(declare-fun res!238499 () Bool)

(assert (=> b!288591 (=> (not res!238499) (not e!205198))))

(assert (=> b!288591 (= res!238499 (arrayRangesEq!1464 a1!596 a2!596 from!722 to!689))))

(declare-fun res!238497 () Bool)

(assert (=> start!64314 (=> (not res!238497) (not e!205198))))

(assert (=> start!64314 (= res!238497 (and (bvsle #b00000000000000000000000000000000 from!722) (bvsle from!722 to!689) (bvsle (size!7358 a1!596) (size!7358 a2!596)) (bvslt to!689 (size!7358 a1!596))))))

(assert (=> start!64314 e!205198))

(declare-fun array_inv!6974 (array!17017) Bool)

(assert (=> start!64314 (and (array_inv!6974 a1!596) e!205199)))

(declare-fun e!205197 () Bool)

(assert (=> start!64314 (and (array_inv!6974 a2!596) e!205197)))

(assert (=> start!64314 true))

(declare-fun b!288586 () Bool)

(assert (=> b!288586 (= e!205197 (and tp_is_empty!735 mapRes!2361))))

(declare-fun condMapEmpty!2362 () Bool)

(declare-fun mapDefault!2361 () T!52661)

(assert (=> b!288586 (= condMapEmpty!2362 (= (arr!8354 a2!596) ((as const (Array (_ BitVec 32) T!52661)) mapDefault!2361)))))

(assert (= (and start!64314 res!238497) b!288591))

(assert (= (and b!288591 res!238499) b!288585))

(assert (= (and b!288585 res!238500) b!288587))

(assert (= (and b!288587 res!238496) b!288590))

(assert (= (and b!288590 res!238498) b!288588))

(assert (= (and b!288588 (not res!238501)) b!288589))

(assert (= (and b!288584 condMapEmpty!2361) mapIsEmpty!2362))

(assert (= (and b!288584 (not condMapEmpty!2361)) mapNonEmpty!2362))

(assert (= start!64314 b!288584))

(assert (= (and b!288586 condMapEmpty!2362) mapIsEmpty!2361))

(assert (= (and b!288586 (not condMapEmpty!2362)) mapNonEmpty!2361))

(assert (= start!64314 b!288586))

(declare-fun m!421267 () Bool)

(assert (=> mapNonEmpty!2362 m!421267))

(declare-fun m!421269 () Bool)

(assert (=> b!288588 m!421269))

(declare-fun m!421271 () Bool)

(assert (=> b!288588 m!421271))

(declare-fun m!421273 () Bool)

(assert (=> b!288588 m!421273))

(declare-fun m!421275 () Bool)

(assert (=> b!288589 m!421275))

(declare-fun m!421277 () Bool)

(assert (=> mapNonEmpty!2361 m!421277))

(declare-fun m!421279 () Bool)

(assert (=> b!288587 m!421279))

(declare-fun m!421281 () Bool)

(assert (=> b!288585 m!421281))

(declare-fun m!421283 () Bool)

(assert (=> b!288585 m!421283))

(declare-fun m!421285 () Bool)

(assert (=> start!64314 m!421285))

(declare-fun m!421287 () Bool)

(assert (=> start!64314 m!421287))

(declare-fun m!421289 () Bool)

(assert (=> b!288591 m!421289))

(check-sat (not b!288591) (not b!288587) (not b!288589) (not mapNonEmpty!2361) (not start!64314) tp_is_empty!735 (not b!288588) (not mapNonEmpty!2362))
(check-sat)
(get-model)

(declare-fun d!98110 () Bool)

(assert (=> d!98110 (= (array_inv!6974 a1!596) (bvsge (size!7358 a1!596) #b00000000000000000000000000000000))))

(assert (=> start!64314 d!98110))

(declare-fun d!98112 () Bool)

(assert (=> d!98112 (= (array_inv!6974 a2!596) (bvsge (size!7358 a2!596) #b00000000000000000000000000000000))))

(assert (=> start!64314 d!98112))

(declare-fun d!98114 () Bool)

(declare-fun res!238524 () Bool)

(declare-fun e!205216 () Bool)

(assert (=> d!98114 (=> res!238524 e!205216)))

(assert (=> d!98114 (= res!238524 (= from!722 to!689))))

(assert (=> d!98114 (= (arrayRangesEq!1464 a1!596 a2!596 from!722 to!689) e!205216)))

(declare-fun b!288620 () Bool)

(declare-fun e!205217 () Bool)

(assert (=> b!288620 (= e!205216 e!205217)))

(declare-fun res!238525 () Bool)

(assert (=> b!288620 (=> (not res!238525) (not e!205217))))

(assert (=> b!288620 (= res!238525 (= (select (arr!8354 a1!596) from!722) (select (arr!8354 a2!596) from!722)))))

(declare-fun b!288621 () Bool)

(assert (=> b!288621 (= e!205217 (arrayRangesEq!1464 a1!596 a2!596 (bvadd from!722 #b00000000000000000000000000000001) to!689))))

(assert (= (and d!98114 (not res!238524)) b!288620))

(assert (= (and b!288620 res!238525) b!288621))

(declare-fun m!421315 () Bool)

(assert (=> b!288620 m!421315))

(declare-fun m!421317 () Bool)

(assert (=> b!288620 m!421317))

(declare-fun m!421319 () Bool)

(assert (=> b!288621 m!421319))

(assert (=> b!288591 d!98114))

(declare-fun d!98116 () Bool)

(declare-fun res!238526 () Bool)

(declare-fun e!205218 () Bool)

(assert (=> d!98116 (=> res!238526 e!205218)))

(assert (=> d!98116 (= res!238526 (= i!953 (bvadd #b00000000000000000000000000000001 to!689)))))

(assert (=> d!98116 (= (arrayRangesEq!1464 a1!596 a2!596 i!953 (bvadd #b00000000000000000000000000000001 to!689)) e!205218)))

(declare-fun b!288622 () Bool)

(declare-fun e!205219 () Bool)

(assert (=> b!288622 (= e!205218 e!205219)))

(declare-fun res!238527 () Bool)

(assert (=> b!288622 (=> (not res!238527) (not e!205219))))

(assert (=> b!288622 (= res!238527 (= (select (arr!8354 a1!596) i!953) (select (arr!8354 a2!596) i!953)))))

(declare-fun b!288623 () Bool)

(assert (=> b!288623 (= e!205219 (arrayRangesEq!1464 a1!596 a2!596 (bvadd i!953 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!689)))))

(assert (= (and d!98116 (not res!238526)) b!288622))

(assert (= (and b!288622 res!238527) b!288623))

(declare-fun m!421321 () Bool)

(assert (=> b!288622 m!421321))

(declare-fun m!421323 () Bool)

(assert (=> b!288622 m!421323))

(declare-fun m!421325 () Bool)

(assert (=> b!288623 m!421325))

(assert (=> b!288587 d!98116))

(declare-fun d!98118 () Bool)

(assert (=> d!98118 (and (bvsge (bvsub i!953 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub i!953 #b00000000000000000000000000000001) (size!7358 a1!596)) (bvslt (bvsub i!953 #b00000000000000000000000000000001) (size!7358 a2!596)) (= (select (arr!8354 a1!596) (bvsub i!953 #b00000000000000000000000000000001)) (select (arr!8354 a2!596) (bvsub i!953 #b00000000000000000000000000000001))))))

(declare-fun lt!418857 () Unit!20005)

(declare-fun choose!517 (array!17017 array!17017 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20005)

(assert (=> d!98118 (= lt!418857 (choose!517 a1!596 a2!596 from!722 (bvsub i!953 #b00000000000000000000000000000001) to!689))))

(assert (=> d!98118 (and (bvsle #b00000000000000000000000000000000 from!722) (bvsle from!722 to!689))))

(assert (=> d!98118 (= (arrayRangesEqImpliesEq!208 a1!596 a2!596 from!722 (bvsub i!953 #b00000000000000000000000000000001) to!689) lt!418857)))

(declare-fun bs!24921 () Bool)

(assert (= bs!24921 d!98118))

(assert (=> bs!24921 m!421269))

(assert (=> bs!24921 m!421271))

(declare-fun m!421327 () Bool)

(assert (=> bs!24921 m!421327))

(assert (=> b!288588 d!98118))

(declare-fun d!98120 () Bool)

(declare-fun res!238528 () Bool)

(declare-fun e!205220 () Bool)

(assert (=> d!98120 (=> res!238528 e!205220)))

(assert (=> d!98120 (= res!238528 (= (bvsub i!953 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!689)))))

(assert (=> d!98120 (= (arrayRangesEq!1464 a1!596 a2!596 (bvsub i!953 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!689)) e!205220)))

(declare-fun b!288624 () Bool)

(declare-fun e!205221 () Bool)

(assert (=> b!288624 (= e!205220 e!205221)))

(declare-fun res!238529 () Bool)

(assert (=> b!288624 (=> (not res!238529) (not e!205221))))

(assert (=> b!288624 (= res!238529 (= (select (arr!8354 a1!596) (bvsub i!953 #b00000000000000000000000000000001)) (select (arr!8354 a2!596) (bvsub i!953 #b00000000000000000000000000000001))))))

(declare-fun b!288625 () Bool)

(assert (=> b!288625 (= e!205221 (arrayRangesEq!1464 a1!596 a2!596 (bvadd (bvsub i!953 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!689)))))

(assert (= (and d!98120 (not res!238528)) b!288624))

(assert (= (and b!288624 res!238529) b!288625))

(assert (=> b!288624 m!421269))

(assert (=> b!288624 m!421271))

(declare-fun m!421329 () Bool)

(assert (=> b!288625 m!421329))

(assert (=> b!288589 d!98120))

(declare-fun condMapEmpty!2371 () Bool)

(declare-fun mapDefault!2371 () T!52661)

(assert (=> mapNonEmpty!2361 (= condMapEmpty!2371 (= mapRest!2361 ((as const (Array (_ BitVec 32) T!52661)) mapDefault!2371)))))

(declare-fun mapRes!2371 () Bool)

(assert (=> mapNonEmpty!2361 (= tp!2361 (and tp_is_empty!735 mapRes!2371))))

(declare-fun mapIsEmpty!2371 () Bool)

(assert (=> mapIsEmpty!2371 mapRes!2371))

(declare-fun mapNonEmpty!2371 () Bool)

(declare-fun tp!2371 () Bool)

(assert (=> mapNonEmpty!2371 (= mapRes!2371 (and tp!2371 tp_is_empty!735))))

(declare-fun mapKey!2371 () (_ BitVec 32))

(declare-fun mapValue!2371 () T!52661)

(declare-fun mapRest!2371 () (Array (_ BitVec 32) T!52661))

(assert (=> mapNonEmpty!2371 (= mapRest!2361 (store mapRest!2371 mapKey!2371 mapValue!2371))))

(assert (= (and mapNonEmpty!2361 condMapEmpty!2371) mapIsEmpty!2371))

(assert (= (and mapNonEmpty!2361 (not condMapEmpty!2371)) mapNonEmpty!2371))

(declare-fun m!421331 () Bool)

(assert (=> mapNonEmpty!2371 m!421331))

(declare-fun condMapEmpty!2372 () Bool)

(declare-fun mapDefault!2372 () T!52661)

(assert (=> mapNonEmpty!2362 (= condMapEmpty!2372 (= mapRest!2362 ((as const (Array (_ BitVec 32) T!52661)) mapDefault!2372)))))

(declare-fun mapRes!2372 () Bool)

(assert (=> mapNonEmpty!2362 (= tp!2362 (and tp_is_empty!735 mapRes!2372))))

(declare-fun mapIsEmpty!2372 () Bool)

(assert (=> mapIsEmpty!2372 mapRes!2372))

(declare-fun mapNonEmpty!2372 () Bool)

(declare-fun tp!2372 () Bool)

(assert (=> mapNonEmpty!2372 (= mapRes!2372 (and tp!2372 tp_is_empty!735))))

(declare-fun mapRest!2372 () (Array (_ BitVec 32) T!52661))

(declare-fun mapValue!2372 () T!52661)

(declare-fun mapKey!2372 () (_ BitVec 32))

(assert (=> mapNonEmpty!2372 (= mapRest!2362 (store mapRest!2372 mapKey!2372 mapValue!2372))))

(assert (= (and mapNonEmpty!2362 condMapEmpty!2372) mapIsEmpty!2372))

(assert (= (and mapNonEmpty!2362 (not condMapEmpty!2372)) mapNonEmpty!2372))

(declare-fun m!421333 () Bool)

(assert (=> mapNonEmpty!2372 m!421333))

(check-sat (not b!288625) (not mapNonEmpty!2371) tp_is_empty!735 (not b!288623) (not d!98118) (not b!288621) (not mapNonEmpty!2372))
(check-sat)
