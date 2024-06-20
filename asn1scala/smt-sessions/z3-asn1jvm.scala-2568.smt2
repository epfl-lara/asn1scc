; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64196 () Bool)

(assert start!64196)

(declare-fun mapNonEmpty!2013 () Bool)

(declare-fun mapRes!2013 () Bool)

(declare-fun tp!2014 () Bool)

(declare-fun tp_is_empty!621 () Bool)

(assert (=> mapNonEmpty!2013 (= mapRes!2013 (and tp!2014 tp_is_empty!621))))

(declare-datatypes ((T!52167 0))(
  ( (T!52168 (val!310 Int)) )
))
(declare-fun mapValue!2014 () T!52167)

(declare-fun mapRest!2014 () (Array (_ BitVec 32) T!52167))

(declare-datatypes ((array!16902 0))(
  ( (array!16903 (arr!8297 (Array (_ BitVec 32) T!52167)) (size!7301 (_ BitVec 32))) )
))
(declare-fun a1!580 () array!16902)

(declare-fun mapKey!2013 () (_ BitVec 32))

(assert (=> mapNonEmpty!2013 (= (arr!8297 a1!580) (store mapRest!2014 mapKey!2013 mapValue!2014))))

(declare-fun mapNonEmpty!2014 () Bool)

(declare-fun mapRes!2014 () Bool)

(declare-fun tp!2013 () Bool)

(assert (=> mapNonEmpty!2014 (= mapRes!2014 (and tp!2013 tp_is_empty!621))))

(declare-fun mapKey!2014 () (_ BitVec 32))

(declare-fun a2!580 () array!16902)

(declare-fun mapRest!2013 () (Array (_ BitVec 32) T!52167))

(declare-fun mapValue!2013 () T!52167)

(assert (=> mapNonEmpty!2014 (= (arr!8297 a2!580) (store mapRest!2013 mapKey!2014 mapValue!2013))))

(declare-fun b!287448 () Bool)

(declare-fun res!237704 () Bool)

(declare-fun e!204639 () Bool)

(assert (=> b!287448 (=> (not res!237704) (not e!204639))))

(declare-fun from!706 () (_ BitVec 32))

(declare-fun to!673 () (_ BitVec 32))

(declare-fun arrayRangesEq!1425 (array!16902 array!16902 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!287448 (= res!237704 (arrayRangesEq!1425 a1!580 a2!580 from!706 to!673))))

(declare-fun mapIsEmpty!2013 () Bool)

(assert (=> mapIsEmpty!2013 mapRes!2014))

(declare-fun b!287449 () Bool)

(declare-fun e!204641 () Bool)

(assert (=> b!287449 (= e!204641 (and tp_is_empty!621 mapRes!2014))))

(declare-fun condMapEmpty!2014 () Bool)

(declare-fun mapDefault!2014 () T!52167)

(assert (=> b!287449 (= condMapEmpty!2014 (= (arr!8297 a2!580) ((as const (Array (_ BitVec 32) T!52167)) mapDefault!2014)))))

(declare-fun res!237705 () Bool)

(assert (=> start!64196 (=> (not res!237705) (not e!204639))))

(assert (=> start!64196 (= res!237705 (and (bvsle #b00000000000000000000000000000000 from!706) (bvsle from!706 to!673) (bvsle (size!7301 a1!580) (size!7301 a2!580)) (bvslt to!673 (size!7301 a1!580))))))

(assert (=> start!64196 e!204639))

(assert (=> start!64196 true))

(declare-fun e!204640 () Bool)

(declare-fun array_inv!6941 (array!16902) Bool)

(assert (=> start!64196 (and (array_inv!6941 a1!580) e!204640)))

(assert (=> start!64196 (and (array_inv!6941 a2!580) e!204641)))

(declare-fun mapIsEmpty!2014 () Bool)

(assert (=> mapIsEmpty!2014 mapRes!2013))

(declare-fun b!287450 () Bool)

(assert (=> b!287450 (= e!204640 (and tp_is_empty!621 mapRes!2013))))

(declare-fun condMapEmpty!2013 () Bool)

(declare-fun mapDefault!2013 () T!52167)

(assert (=> b!287450 (= condMapEmpty!2013 (= (arr!8297 a1!580) ((as const (Array (_ BitVec 32) T!52167)) mapDefault!2013)))))

(declare-fun b!287451 () Bool)

(declare-fun res!237706 () Bool)

(assert (=> b!287451 (=> (not res!237706) (not e!204639))))

(assert (=> b!287451 (= res!237706 (= (select (arr!8297 a1!580) to!673) (select (arr!8297 a2!580) to!673)))))

(declare-fun b!287452 () Bool)

(assert (=> b!287452 (= e!204639 (not (arrayRangesEq!1425 a1!580 a2!580 to!673 (bvadd #b00000000000000000000000000000001 to!673))))))

(assert (= (and start!64196 res!237705) b!287448))

(assert (= (and b!287448 res!237704) b!287451))

(assert (= (and b!287451 res!237706) b!287452))

(assert (= (and b!287450 condMapEmpty!2013) mapIsEmpty!2014))

(assert (= (and b!287450 (not condMapEmpty!2013)) mapNonEmpty!2013))

(assert (= start!64196 b!287450))

(assert (= (and b!287449 condMapEmpty!2014) mapIsEmpty!2013))

(assert (= (and b!287449 (not condMapEmpty!2014)) mapNonEmpty!2014))

(assert (= start!64196 b!287449))

(declare-fun m!420121 () Bool)

(assert (=> b!287452 m!420121))

(declare-fun m!420123 () Bool)

(assert (=> mapNonEmpty!2014 m!420123))

(declare-fun m!420125 () Bool)

(assert (=> mapNonEmpty!2013 m!420125))

(declare-fun m!420127 () Bool)

(assert (=> b!287448 m!420127))

(declare-fun m!420129 () Bool)

(assert (=> b!287451 m!420129))

(declare-fun m!420131 () Bool)

(assert (=> b!287451 m!420131))

(declare-fun m!420133 () Bool)

(assert (=> start!64196 m!420133))

(declare-fun m!420135 () Bool)

(assert (=> start!64196 m!420135))

(check-sat (not mapNonEmpty!2013) (not b!287448) (not mapNonEmpty!2014) (not b!287452) (not start!64196) tp_is_empty!621)
(check-sat)
(get-model)

(declare-fun d!98060 () Bool)

(declare-fun res!237720 () Bool)

(declare-fun e!204655 () Bool)

(assert (=> d!98060 (=> res!237720 e!204655)))

(assert (=> d!98060 (= res!237720 (= from!706 to!673))))

(assert (=> d!98060 (= (arrayRangesEq!1425 a1!580 a2!580 from!706 to!673) e!204655)))

(declare-fun b!287472 () Bool)

(declare-fun e!204656 () Bool)

(assert (=> b!287472 (= e!204655 e!204656)))

(declare-fun res!237721 () Bool)

(assert (=> b!287472 (=> (not res!237721) (not e!204656))))

(assert (=> b!287472 (= res!237721 (= (select (arr!8297 a1!580) from!706) (select (arr!8297 a2!580) from!706)))))

(declare-fun b!287473 () Bool)

(assert (=> b!287473 (= e!204656 (arrayRangesEq!1425 a1!580 a2!580 (bvadd from!706 #b00000000000000000000000000000001) to!673))))

(assert (= (and d!98060 (not res!237720)) b!287472))

(assert (= (and b!287472 res!237721) b!287473))

(declare-fun m!420153 () Bool)

(assert (=> b!287472 m!420153))

(declare-fun m!420155 () Bool)

(assert (=> b!287472 m!420155))

(declare-fun m!420157 () Bool)

(assert (=> b!287473 m!420157))

(assert (=> b!287448 d!98060))

(declare-fun d!98062 () Bool)

(declare-fun res!237722 () Bool)

(declare-fun e!204657 () Bool)

(assert (=> d!98062 (=> res!237722 e!204657)))

(assert (=> d!98062 (= res!237722 (= to!673 (bvadd #b00000000000000000000000000000001 to!673)))))

(assert (=> d!98062 (= (arrayRangesEq!1425 a1!580 a2!580 to!673 (bvadd #b00000000000000000000000000000001 to!673)) e!204657)))

(declare-fun b!287474 () Bool)

(declare-fun e!204658 () Bool)

(assert (=> b!287474 (= e!204657 e!204658)))

(declare-fun res!237723 () Bool)

(assert (=> b!287474 (=> (not res!237723) (not e!204658))))

(assert (=> b!287474 (= res!237723 (= (select (arr!8297 a1!580) to!673) (select (arr!8297 a2!580) to!673)))))

(declare-fun b!287475 () Bool)

(assert (=> b!287475 (= e!204658 (arrayRangesEq!1425 a1!580 a2!580 (bvadd to!673 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!673)))))

(assert (= (and d!98062 (not res!237722)) b!287474))

(assert (= (and b!287474 res!237723) b!287475))

(assert (=> b!287474 m!420129))

(assert (=> b!287474 m!420131))

(declare-fun m!420159 () Bool)

(assert (=> b!287475 m!420159))

(assert (=> b!287452 d!98062))

(declare-fun d!98064 () Bool)

(assert (=> d!98064 (= (array_inv!6941 a1!580) (bvsge (size!7301 a1!580) #b00000000000000000000000000000000))))

(assert (=> start!64196 d!98064))

(declare-fun d!98066 () Bool)

(assert (=> d!98066 (= (array_inv!6941 a2!580) (bvsge (size!7301 a2!580) #b00000000000000000000000000000000))))

(assert (=> start!64196 d!98066))

(declare-fun condMapEmpty!2023 () Bool)

(declare-fun mapDefault!2023 () T!52167)

(assert (=> mapNonEmpty!2014 (= condMapEmpty!2023 (= mapRest!2013 ((as const (Array (_ BitVec 32) T!52167)) mapDefault!2023)))))

(declare-fun mapRes!2023 () Bool)

(assert (=> mapNonEmpty!2014 (= tp!2013 (and tp_is_empty!621 mapRes!2023))))

(declare-fun mapIsEmpty!2023 () Bool)

(assert (=> mapIsEmpty!2023 mapRes!2023))

(declare-fun mapNonEmpty!2023 () Bool)

(declare-fun tp!2023 () Bool)

(assert (=> mapNonEmpty!2023 (= mapRes!2023 (and tp!2023 tp_is_empty!621))))

(declare-fun mapValue!2023 () T!52167)

(declare-fun mapRest!2023 () (Array (_ BitVec 32) T!52167))

(declare-fun mapKey!2023 () (_ BitVec 32))

(assert (=> mapNonEmpty!2023 (= mapRest!2013 (store mapRest!2023 mapKey!2023 mapValue!2023))))

(assert (= (and mapNonEmpty!2014 condMapEmpty!2023) mapIsEmpty!2023))

(assert (= (and mapNonEmpty!2014 (not condMapEmpty!2023)) mapNonEmpty!2023))

(declare-fun m!420161 () Bool)

(assert (=> mapNonEmpty!2023 m!420161))

(declare-fun condMapEmpty!2024 () Bool)

(declare-fun mapDefault!2024 () T!52167)

(assert (=> mapNonEmpty!2013 (= condMapEmpty!2024 (= mapRest!2014 ((as const (Array (_ BitVec 32) T!52167)) mapDefault!2024)))))

(declare-fun mapRes!2024 () Bool)

(assert (=> mapNonEmpty!2013 (= tp!2014 (and tp_is_empty!621 mapRes!2024))))

(declare-fun mapIsEmpty!2024 () Bool)

(assert (=> mapIsEmpty!2024 mapRes!2024))

(declare-fun mapNonEmpty!2024 () Bool)

(declare-fun tp!2024 () Bool)

(assert (=> mapNonEmpty!2024 (= mapRes!2024 (and tp!2024 tp_is_empty!621))))

(declare-fun mapRest!2024 () (Array (_ BitVec 32) T!52167))

(declare-fun mapKey!2024 () (_ BitVec 32))

(declare-fun mapValue!2024 () T!52167)

(assert (=> mapNonEmpty!2024 (= mapRest!2014 (store mapRest!2024 mapKey!2024 mapValue!2024))))

(assert (= (and mapNonEmpty!2013 condMapEmpty!2024) mapIsEmpty!2024))

(assert (= (and mapNonEmpty!2013 (not condMapEmpty!2024)) mapNonEmpty!2024))

(declare-fun m!420163 () Bool)

(assert (=> mapNonEmpty!2024 m!420163))

(check-sat (not mapNonEmpty!2023) (not b!287475) (not mapNonEmpty!2024) (not b!287473) tp_is_empty!621)
(check-sat)
(get-model)

(declare-fun d!98068 () Bool)

(declare-fun res!237724 () Bool)

(declare-fun e!204659 () Bool)

(assert (=> d!98068 (=> res!237724 e!204659)))

(assert (=> d!98068 (= res!237724 (= (bvadd to!673 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!673)))))

(assert (=> d!98068 (= (arrayRangesEq!1425 a1!580 a2!580 (bvadd to!673 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!673)) e!204659)))

(declare-fun b!287478 () Bool)

(declare-fun e!204660 () Bool)

(assert (=> b!287478 (= e!204659 e!204660)))

(declare-fun res!237725 () Bool)

(assert (=> b!287478 (=> (not res!237725) (not e!204660))))

(assert (=> b!287478 (= res!237725 (= (select (arr!8297 a1!580) (bvadd to!673 #b00000000000000000000000000000001)) (select (arr!8297 a2!580) (bvadd to!673 #b00000000000000000000000000000001))))))

(declare-fun b!287479 () Bool)

(assert (=> b!287479 (= e!204660 (arrayRangesEq!1425 a1!580 a2!580 (bvadd to!673 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!673)))))

(assert (= (and d!98068 (not res!237724)) b!287478))

(assert (= (and b!287478 res!237725) b!287479))

(declare-fun m!420165 () Bool)

(assert (=> b!287478 m!420165))

(declare-fun m!420167 () Bool)

(assert (=> b!287478 m!420167))

(declare-fun m!420169 () Bool)

(assert (=> b!287479 m!420169))

(assert (=> b!287475 d!98068))

(declare-fun d!98070 () Bool)

(declare-fun res!237726 () Bool)

(declare-fun e!204661 () Bool)

(assert (=> d!98070 (=> res!237726 e!204661)))

(assert (=> d!98070 (= res!237726 (= (bvadd from!706 #b00000000000000000000000000000001) to!673))))

(assert (=> d!98070 (= (arrayRangesEq!1425 a1!580 a2!580 (bvadd from!706 #b00000000000000000000000000000001) to!673) e!204661)))

(declare-fun b!287480 () Bool)

(declare-fun e!204662 () Bool)

(assert (=> b!287480 (= e!204661 e!204662)))

(declare-fun res!237727 () Bool)

(assert (=> b!287480 (=> (not res!237727) (not e!204662))))

(assert (=> b!287480 (= res!237727 (= (select (arr!8297 a1!580) (bvadd from!706 #b00000000000000000000000000000001)) (select (arr!8297 a2!580) (bvadd from!706 #b00000000000000000000000000000001))))))

(declare-fun b!287481 () Bool)

(assert (=> b!287481 (= e!204662 (arrayRangesEq!1425 a1!580 a2!580 (bvadd from!706 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!673))))

(assert (= (and d!98070 (not res!237726)) b!287480))

(assert (= (and b!287480 res!237727) b!287481))

(declare-fun m!420171 () Bool)

(assert (=> b!287480 m!420171))

(declare-fun m!420173 () Bool)

(assert (=> b!287480 m!420173))

(declare-fun m!420175 () Bool)

(assert (=> b!287481 m!420175))

(assert (=> b!287473 d!98070))

(declare-fun condMapEmpty!2025 () Bool)

(declare-fun mapDefault!2025 () T!52167)

(assert (=> mapNonEmpty!2024 (= condMapEmpty!2025 (= mapRest!2024 ((as const (Array (_ BitVec 32) T!52167)) mapDefault!2025)))))

(declare-fun mapRes!2025 () Bool)

(assert (=> mapNonEmpty!2024 (= tp!2024 (and tp_is_empty!621 mapRes!2025))))

(declare-fun mapIsEmpty!2025 () Bool)

(assert (=> mapIsEmpty!2025 mapRes!2025))

(declare-fun mapNonEmpty!2025 () Bool)

(declare-fun tp!2025 () Bool)

(assert (=> mapNonEmpty!2025 (= mapRes!2025 (and tp!2025 tp_is_empty!621))))

(declare-fun mapValue!2025 () T!52167)

(declare-fun mapRest!2025 () (Array (_ BitVec 32) T!52167))

(declare-fun mapKey!2025 () (_ BitVec 32))

(assert (=> mapNonEmpty!2025 (= mapRest!2024 (store mapRest!2025 mapKey!2025 mapValue!2025))))

(assert (= (and mapNonEmpty!2024 condMapEmpty!2025) mapIsEmpty!2025))

(assert (= (and mapNonEmpty!2024 (not condMapEmpty!2025)) mapNonEmpty!2025))

(declare-fun m!420177 () Bool)

(assert (=> mapNonEmpty!2025 m!420177))

(declare-fun condMapEmpty!2026 () Bool)

(declare-fun mapDefault!2026 () T!52167)

(assert (=> mapNonEmpty!2023 (= condMapEmpty!2026 (= mapRest!2023 ((as const (Array (_ BitVec 32) T!52167)) mapDefault!2026)))))

(declare-fun mapRes!2026 () Bool)

(assert (=> mapNonEmpty!2023 (= tp!2023 (and tp_is_empty!621 mapRes!2026))))

(declare-fun mapIsEmpty!2026 () Bool)

(assert (=> mapIsEmpty!2026 mapRes!2026))

(declare-fun mapNonEmpty!2026 () Bool)

(declare-fun tp!2026 () Bool)

(assert (=> mapNonEmpty!2026 (= mapRes!2026 (and tp!2026 tp_is_empty!621))))

(declare-fun mapRest!2026 () (Array (_ BitVec 32) T!52167))

(declare-fun mapKey!2026 () (_ BitVec 32))

(declare-fun mapValue!2026 () T!52167)

(assert (=> mapNonEmpty!2026 (= mapRest!2023 (store mapRest!2026 mapKey!2026 mapValue!2026))))

(assert (= (and mapNonEmpty!2023 condMapEmpty!2026) mapIsEmpty!2026))

(assert (= (and mapNonEmpty!2023 (not condMapEmpty!2026)) mapNonEmpty!2026))

(declare-fun m!420179 () Bool)

(assert (=> mapNonEmpty!2026 m!420179))

(check-sat (not mapNonEmpty!2025) (not mapNonEmpty!2026) tp_is_empty!621 (not b!287481) (not b!287479))
(check-sat)
