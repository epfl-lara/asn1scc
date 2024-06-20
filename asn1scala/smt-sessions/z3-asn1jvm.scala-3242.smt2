; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73884 () Bool)

(assert start!73884)

(declare-datatypes ((array!21261 0))(
  ( (array!21262 (arr!10319 (Array (_ BitVec 32) (_ BitVec 8))) (size!9227 (_ BitVec 32))) )
))
(declare-fun a1!688 () array!21261)

(declare-fun e!235952 () Bool)

(declare-fun toBit!81 () (_ BitVec 64))

(declare-datatypes ((tuple4!1406 0))(
  ( (tuple4!1407 (_1!13544 (_ BitVec 32)) (_2!13544 (_ BitVec 32)) (_3!1660 (_ BitVec 32)) (_4!703 (_ BitVec 32))) )
))
(declare-fun lt!448610 () tuple4!1406)

(declare-fun b!326633 () Bool)

(assert (=> b!326633 (= e!235952 (and (not (= ((_ extract 31 0) (bvsrem toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000)) (or (bvslt (_4!703 lt!448610) #b00000000000000000000000000000000) (bvsge (_4!703 lt!448610) (size!9227 a1!688)))))))

(declare-fun e!235955 () Bool)

(declare-fun b!326634 () Bool)

(declare-fun a2!688 () array!21261)

(declare-fun arrayRangesEq!1851 (array!21261 array!21261 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!326634 (= e!235955 (arrayRangesEq!1851 a1!688 a2!688 (_1!13544 lt!448610) (_2!13544 lt!448610)))))

(declare-fun res!268206 () Bool)

(declare-fun e!235951 () Bool)

(assert (=> start!73884 (=> (not res!268206) (not e!235951))))

(declare-fun fromBit!81 () (_ BitVec 64))

(assert (=> start!73884 (= res!268206 (and (bvsle (size!9227 a1!688) (size!9227 a2!688)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!81) (bvsle fromBit!81 toBit!81) (bvsle toBit!81 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9227 a1!688)))) (bvslt fromBit!81 toBit!81)))))

(assert (=> start!73884 e!235951))

(declare-fun array_inv!8779 (array!21261) Bool)

(assert (=> start!73884 (array_inv!8779 a1!688)))

(assert (=> start!73884 (array_inv!8779 a2!688)))

(assert (=> start!73884 true))

(declare-fun b!326635 () Bool)

(assert (=> b!326635 (= e!235951 e!235952)))

(declare-fun res!268207 () Bool)

(assert (=> b!326635 (=> (not res!268207) (not e!235952))))

(assert (=> b!326635 (= res!268207 e!235955)))

(declare-fun res!268205 () Bool)

(assert (=> b!326635 (=> res!268205 e!235955)))

(assert (=> b!326635 (= res!268205 (bvsge (_1!13544 lt!448610) (_2!13544 lt!448610)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1406)

(assert (=> b!326635 (= lt!448610 (arrayBitIndices!0 fromBit!81 toBit!81))))

(declare-fun b!326636 () Bool)

(declare-fun res!268209 () Bool)

(assert (=> b!326636 (=> (not res!268209) (not e!235952))))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!326636 (= res!268209 (byteRangesEq!0 (select (arr!10319 a1!688) (_3!1660 lt!448610)) (select (arr!10319 a2!688) (_3!1660 lt!448610)) ((_ extract 31 0) (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(declare-fun b!326637 () Bool)

(declare-fun res!268208 () Bool)

(assert (=> b!326637 (=> (not res!268208) (not e!235952))))

(assert (=> b!326637 (= res!268208 (not (= (_3!1660 lt!448610) (_4!703 lt!448610))))))

(assert (= (and start!73884 res!268206) b!326635))

(assert (= (and b!326635 (not res!268205)) b!326634))

(assert (= (and b!326635 res!268207) b!326637))

(assert (= (and b!326637 res!268208) b!326636))

(assert (= (and b!326636 res!268209) b!326633))

(declare-fun m!464455 () Bool)

(assert (=> b!326634 m!464455))

(declare-fun m!464457 () Bool)

(assert (=> start!73884 m!464457))

(declare-fun m!464459 () Bool)

(assert (=> start!73884 m!464459))

(declare-fun m!464461 () Bool)

(assert (=> b!326635 m!464461))

(declare-fun m!464463 () Bool)

(assert (=> b!326636 m!464463))

(declare-fun m!464465 () Bool)

(assert (=> b!326636 m!464465))

(assert (=> b!326636 m!464463))

(assert (=> b!326636 m!464465))

(declare-fun m!464467 () Bool)

(assert (=> b!326636 m!464467))

(check-sat (not b!326636) (not start!73884) (not b!326634) (not b!326635))
(check-sat)
(get-model)

(declare-fun d!107734 () Bool)

(assert (=> d!107734 (= (byteRangesEq!0 (select (arr!10319 a1!688) (_3!1660 lt!448610)) (select (arr!10319 a2!688) (_3!1660 lt!448610)) ((_ extract 31 0) (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000) (or (= ((_ extract 31 0) (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!10319 a1!688) (_3!1660 lt!448610))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!10319 a2!688) (_3!1660 lt!448610))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111))))))

(declare-fun bs!28433 () Bool)

(assert (= bs!28433 d!107734))

(declare-fun m!464483 () Bool)

(assert (=> bs!28433 m!464483))

(declare-fun m!464485 () Bool)

(assert (=> bs!28433 m!464485))

(assert (=> b!326636 d!107734))

(declare-fun d!107736 () Bool)

(assert (=> d!107736 (= (array_inv!8779 a1!688) (bvsge (size!9227 a1!688) #b00000000000000000000000000000000))))

(assert (=> start!73884 d!107736))

(declare-fun d!107738 () Bool)

(assert (=> d!107738 (= (array_inv!8779 a2!688) (bvsge (size!9227 a2!688) #b00000000000000000000000000000000))))

(assert (=> start!73884 d!107738))

(declare-fun d!107740 () Bool)

(declare-fun res!268229 () Bool)

(declare-fun e!235975 () Bool)

(assert (=> d!107740 (=> res!268229 e!235975)))

(assert (=> d!107740 (= res!268229 (= (_1!13544 lt!448610) (_2!13544 lt!448610)))))

(assert (=> d!107740 (= (arrayRangesEq!1851 a1!688 a2!688 (_1!13544 lt!448610) (_2!13544 lt!448610)) e!235975)))

(declare-fun b!326657 () Bool)

(declare-fun e!235976 () Bool)

(assert (=> b!326657 (= e!235975 e!235976)))

(declare-fun res!268230 () Bool)

(assert (=> b!326657 (=> (not res!268230) (not e!235976))))

(assert (=> b!326657 (= res!268230 (= (select (arr!10319 a1!688) (_1!13544 lt!448610)) (select (arr!10319 a2!688) (_1!13544 lt!448610))))))

(declare-fun b!326658 () Bool)

(assert (=> b!326658 (= e!235976 (arrayRangesEq!1851 a1!688 a2!688 (bvadd (_1!13544 lt!448610) #b00000000000000000000000000000001) (_2!13544 lt!448610)))))

(assert (= (and d!107740 (not res!268229)) b!326657))

(assert (= (and b!326657 res!268230) b!326658))

(declare-fun m!464487 () Bool)

(assert (=> b!326657 m!464487))

(declare-fun m!464489 () Bool)

(assert (=> b!326657 m!464489))

(declare-fun m!464491 () Bool)

(assert (=> b!326658 m!464491))

(assert (=> b!326634 d!107740))

(declare-fun d!107742 () Bool)

(assert (=> d!107742 (= (arrayBitIndices!0 fromBit!81 toBit!81) (tuple4!1407 ((_ extract 31 0) (bvadd (bvsdiv fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!326635 d!107742))

(check-sat (not b!326658))
(check-sat)
