; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63138 () Bool)

(assert start!63138)

(declare-fun mapNonEmpty!748 () Bool)

(declare-fun mapRes!748 () Bool)

(declare-fun tp!749 () Bool)

(declare-fun tp_is_empty!303 () Bool)

(assert (=> mapNonEmpty!748 (= mapRes!748 (and tp!749 tp_is_empty!303))))

(declare-datatypes ((T!50129 0))(
  ( (T!50130 (val!151 Int)) )
))
(declare-fun mapRest!749 () (Array (_ BitVec 32) T!50129))

(declare-fun mapValue!749 () T!50129)

(declare-datatypes ((array!16336 0))(
  ( (array!16337 (arr!8048 (Array (_ BitVec 32) T!50129)) (size!7052 (_ BitVec 32))) )
))
(declare-fun a2!463 () array!16336)

(declare-fun mapKey!749 () (_ BitVec 32))

(assert (=> mapNonEmpty!748 (= (arr!8048 a2!463) (store mapRest!749 mapKey!749 mapValue!749))))

(declare-fun b!282605 () Bool)

(declare-fun res!234390 () Bool)

(declare-fun e!201929 () Bool)

(assert (=> b!282605 (=> (not res!234390) (not e!201929))))

(declare-fun to!556 () (_ BitVec 32))

(declare-fun from!589 () (_ BitVec 32))

(declare-fun a1!463 () array!16336)

(declare-fun arrayRangesEq!1313 (array!16336 array!16336 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!282605 (= res!234390 (arrayRangesEq!1313 a1!463 a2!463 from!589 to!556))))

(declare-fun b!282606 () Bool)

(declare-fun e!201927 () Bool)

(declare-fun mapRes!749 () Bool)

(assert (=> b!282606 (= e!201927 (and tp_is_empty!303 mapRes!749))))

(declare-fun condMapEmpty!749 () Bool)

(declare-fun mapDefault!749 () T!50129)

(assert (=> b!282606 (= condMapEmpty!749 (= (arr!8048 a1!463) ((as const (Array (_ BitVec 32) T!50129)) mapDefault!749)))))

(declare-fun res!234391 () Bool)

(assert (=> start!63138 (=> (not res!234391) (not e!201929))))

(assert (=> start!63138 (= res!234391 (and (bvsle #b00000000000000000000000000000000 from!589) (bvsle from!589 to!556) (bvsle to!556 (size!7052 a1!463)) (= (size!7052 a1!463) (size!7052 a2!463))))))

(assert (=> start!63138 e!201929))

(assert (=> start!63138 true))

(declare-fun array_inv!6767 (array!16336) Bool)

(assert (=> start!63138 (and (array_inv!6767 a1!463) e!201927)))

(declare-fun e!201928 () Bool)

(assert (=> start!63138 (and (array_inv!6767 a2!463) e!201928)))

(declare-fun mapIsEmpty!748 () Bool)

(assert (=> mapIsEmpty!748 mapRes!749))

(declare-fun mapNonEmpty!749 () Bool)

(declare-fun tp!748 () Bool)

(assert (=> mapNonEmpty!749 (= mapRes!749 (and tp!748 tp_is_empty!303))))

(declare-fun mapRest!748 () (Array (_ BitVec 32) T!50129))

(declare-fun mapValue!748 () T!50129)

(declare-fun mapKey!748 () (_ BitVec 32))

(assert (=> mapNonEmpty!749 (= (arr!8048 a1!463) (store mapRest!748 mapKey!748 mapValue!748))))

(declare-fun b!282607 () Bool)

(assert (=> b!282607 (= e!201929 (not (arrayRangesEq!1313 a2!463 a1!463 from!589 to!556)))))

(declare-datatypes ((Unit!19817 0))(
  ( (Unit!19818) )
))
(declare-fun lt!417807 () Unit!19817)

(declare-fun rec!51 (array!16336 array!16336 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19817)

(assert (=> b!282607 (= lt!417807 (rec!51 a1!463 a2!463 from!589 to!556 to!556))))

(declare-fun mapIsEmpty!749 () Bool)

(assert (=> mapIsEmpty!749 mapRes!748))

(declare-fun b!282608 () Bool)

(assert (=> b!282608 (= e!201928 (and tp_is_empty!303 mapRes!748))))

(declare-fun condMapEmpty!748 () Bool)

(declare-fun mapDefault!748 () T!50129)

(assert (=> b!282608 (= condMapEmpty!748 (= (arr!8048 a2!463) ((as const (Array (_ BitVec 32) T!50129)) mapDefault!748)))))

(assert (= (and start!63138 res!234391) b!282605))

(assert (= (and b!282605 res!234390) b!282607))

(assert (= (and b!282606 condMapEmpty!749) mapIsEmpty!748))

(assert (= (and b!282606 (not condMapEmpty!749)) mapNonEmpty!749))

(assert (= start!63138 b!282606))

(assert (= (and b!282608 condMapEmpty!748) mapIsEmpty!749))

(assert (= (and b!282608 (not condMapEmpty!748)) mapNonEmpty!748))

(assert (= start!63138 b!282608))

(declare-fun m!415743 () Bool)

(assert (=> mapNonEmpty!748 m!415743))

(declare-fun m!415745 () Bool)

(assert (=> start!63138 m!415745))

(declare-fun m!415747 () Bool)

(assert (=> start!63138 m!415747))

(declare-fun m!415749 () Bool)

(assert (=> b!282607 m!415749))

(declare-fun m!415751 () Bool)

(assert (=> b!282607 m!415751))

(declare-fun m!415753 () Bool)

(assert (=> b!282605 m!415753))

(declare-fun m!415755 () Bool)

(assert (=> mapNonEmpty!749 m!415755))

(check-sat (not start!63138) (not b!282607) (not mapNonEmpty!748) tp_is_empty!303 (not mapNonEmpty!749) (not b!282605))
(check-sat)
(get-model)

(declare-fun d!97194 () Bool)

(declare-fun res!234402 () Bool)

(declare-fun e!201943 () Bool)

(assert (=> d!97194 (=> res!234402 e!201943)))

(assert (=> d!97194 (= res!234402 (= from!589 to!556))))

(assert (=> d!97194 (= (arrayRangesEq!1313 a2!463 a1!463 from!589 to!556) e!201943)))

(declare-fun b!282625 () Bool)

(declare-fun e!201944 () Bool)

(assert (=> b!282625 (= e!201943 e!201944)))

(declare-fun res!234403 () Bool)

(assert (=> b!282625 (=> (not res!234403) (not e!201944))))

(assert (=> b!282625 (= res!234403 (= (select (arr!8048 a2!463) from!589) (select (arr!8048 a1!463) from!589)))))

(declare-fun b!282626 () Bool)

(assert (=> b!282626 (= e!201944 (arrayRangesEq!1313 a2!463 a1!463 (bvadd from!589 #b00000000000000000000000000000001) to!556))))

(assert (= (and d!97194 (not res!234402)) b!282625))

(assert (= (and b!282625 res!234403) b!282626))

(declare-fun m!415771 () Bool)

(assert (=> b!282625 m!415771))

(declare-fun m!415773 () Bool)

(assert (=> b!282625 m!415773))

(declare-fun m!415775 () Bool)

(assert (=> b!282626 m!415775))

(assert (=> b!282607 d!97194))

(declare-fun d!97196 () Bool)

(assert (=> d!97196 (arrayRangesEq!1313 a2!463 a1!463 from!589 to!556)))

(declare-fun lt!417820 () Unit!19817)

(declare-fun e!201947 () Unit!19817)

(assert (=> d!97196 (= lt!417820 e!201947)))

(declare-fun c!13239 () Bool)

(assert (=> d!97196 (= c!13239 (= to!556 from!589))))

(assert (=> d!97196 (and (bvsle from!589 to!556) (bvsle to!556 to!556))))

(assert (=> d!97196 (= (rec!51 a1!463 a2!463 from!589 to!556 to!556) lt!417820)))

(declare-fun b!282631 () Bool)

(declare-fun Unit!19819 () Unit!19817)

(assert (=> b!282631 (= e!201947 Unit!19819)))

(declare-fun b!282632 () Bool)

(assert (=> b!282632 (= e!201947 (rec!51 a1!463 a2!463 from!589 to!556 (bvsub to!556 #b00000000000000000000000000000001)))))

(declare-fun lt!417821 () (_ BitVec 32))

(assert (=> b!282632 (= lt!417821 (bvsub to!556 #b00000000000000000000000000000001))))

(declare-fun lt!417819 () Unit!19817)

(declare-fun arrayRangesEqImpliesEq!184 (array!16336 array!16336 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19817)

(assert (=> b!282632 (= lt!417819 (arrayRangesEqImpliesEq!184 a1!463 a2!463 from!589 lt!417821 to!556))))

(assert (=> b!282632 (= (select (arr!8048 a1!463) lt!417821) (select (arr!8048 a2!463) lt!417821))))

(declare-fun lt!417822 () Unit!19817)

(assert (=> b!282632 (= lt!417822 lt!417819)))

(assert (= (and d!97196 c!13239) b!282631))

(assert (= (and d!97196 (not c!13239)) b!282632))

(assert (=> d!97196 m!415749))

(declare-fun m!415777 () Bool)

(assert (=> b!282632 m!415777))

(declare-fun m!415779 () Bool)

(assert (=> b!282632 m!415779))

(declare-fun m!415781 () Bool)

(assert (=> b!282632 m!415781))

(declare-fun m!415783 () Bool)

(assert (=> b!282632 m!415783))

(assert (=> b!282607 d!97196))

(declare-fun d!97198 () Bool)

(declare-fun res!234404 () Bool)

(declare-fun e!201948 () Bool)

(assert (=> d!97198 (=> res!234404 e!201948)))

(assert (=> d!97198 (= res!234404 (= from!589 to!556))))

(assert (=> d!97198 (= (arrayRangesEq!1313 a1!463 a2!463 from!589 to!556) e!201948)))

(declare-fun b!282633 () Bool)

(declare-fun e!201949 () Bool)

(assert (=> b!282633 (= e!201948 e!201949)))

(declare-fun res!234405 () Bool)

(assert (=> b!282633 (=> (not res!234405) (not e!201949))))

(assert (=> b!282633 (= res!234405 (= (select (arr!8048 a1!463) from!589) (select (arr!8048 a2!463) from!589)))))

(declare-fun b!282634 () Bool)

(assert (=> b!282634 (= e!201949 (arrayRangesEq!1313 a1!463 a2!463 (bvadd from!589 #b00000000000000000000000000000001) to!556))))

(assert (= (and d!97198 (not res!234404)) b!282633))

(assert (= (and b!282633 res!234405) b!282634))

(assert (=> b!282633 m!415773))

(assert (=> b!282633 m!415771))

(declare-fun m!415785 () Bool)

(assert (=> b!282634 m!415785))

(assert (=> b!282605 d!97198))

(declare-fun d!97200 () Bool)

(assert (=> d!97200 (= (array_inv!6767 a1!463) (bvsge (size!7052 a1!463) #b00000000000000000000000000000000))))

(assert (=> start!63138 d!97200))

(declare-fun d!97202 () Bool)

(assert (=> d!97202 (= (array_inv!6767 a2!463) (bvsge (size!7052 a2!463) #b00000000000000000000000000000000))))

(assert (=> start!63138 d!97202))

(declare-fun condMapEmpty!758 () Bool)

(declare-fun mapDefault!758 () T!50129)

(assert (=> mapNonEmpty!748 (= condMapEmpty!758 (= mapRest!749 ((as const (Array (_ BitVec 32) T!50129)) mapDefault!758)))))

(declare-fun mapRes!758 () Bool)

(assert (=> mapNonEmpty!748 (= tp!749 (and tp_is_empty!303 mapRes!758))))

(declare-fun mapIsEmpty!758 () Bool)

(assert (=> mapIsEmpty!758 mapRes!758))

(declare-fun mapNonEmpty!758 () Bool)

(declare-fun tp!758 () Bool)

(assert (=> mapNonEmpty!758 (= mapRes!758 (and tp!758 tp_is_empty!303))))

(declare-fun mapValue!758 () T!50129)

(declare-fun mapKey!758 () (_ BitVec 32))

(declare-fun mapRest!758 () (Array (_ BitVec 32) T!50129))

(assert (=> mapNonEmpty!758 (= mapRest!749 (store mapRest!758 mapKey!758 mapValue!758))))

(assert (= (and mapNonEmpty!748 condMapEmpty!758) mapIsEmpty!758))

(assert (= (and mapNonEmpty!748 (not condMapEmpty!758)) mapNonEmpty!758))

(declare-fun m!415787 () Bool)

(assert (=> mapNonEmpty!758 m!415787))

(declare-fun condMapEmpty!759 () Bool)

(declare-fun mapDefault!759 () T!50129)

(assert (=> mapNonEmpty!749 (= condMapEmpty!759 (= mapRest!748 ((as const (Array (_ BitVec 32) T!50129)) mapDefault!759)))))

(declare-fun mapRes!759 () Bool)

(assert (=> mapNonEmpty!749 (= tp!748 (and tp_is_empty!303 mapRes!759))))

(declare-fun mapIsEmpty!759 () Bool)

(assert (=> mapIsEmpty!759 mapRes!759))

(declare-fun mapNonEmpty!759 () Bool)

(declare-fun tp!759 () Bool)

(assert (=> mapNonEmpty!759 (= mapRes!759 (and tp!759 tp_is_empty!303))))

(declare-fun mapRest!759 () (Array (_ BitVec 32) T!50129))

(declare-fun mapValue!759 () T!50129)

(declare-fun mapKey!759 () (_ BitVec 32))

(assert (=> mapNonEmpty!759 (= mapRest!748 (store mapRest!759 mapKey!759 mapValue!759))))

(assert (= (and mapNonEmpty!749 condMapEmpty!759) mapIsEmpty!759))

(assert (= (and mapNonEmpty!749 (not condMapEmpty!759)) mapNonEmpty!759))

(declare-fun m!415789 () Bool)

(assert (=> mapNonEmpty!759 m!415789))

(check-sat (not d!97196) (not b!282632) (not mapNonEmpty!759) (not mapNonEmpty!758) tp_is_empty!303 (not b!282626) (not b!282634))
(check-sat)
