; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73906 () Bool)

(assert start!73906)

(declare-fun b!326690 () Bool)

(declare-fun res!268262 () Bool)

(declare-fun e!236011 () Bool)

(assert (=> b!326690 (=> (not res!268262) (not e!236011))))

(declare-datatypes ((tuple4!1412 0))(
  ( (tuple4!1413 (_1!13547 (_ BitVec 32)) (_2!13547 (_ BitVec 32)) (_3!1663 (_ BitVec 32)) (_4!706 (_ BitVec 32))) )
))
(declare-fun lt!448619 () tuple4!1412)

(assert (=> b!326690 (= res!268262 (not (= (_3!1663 lt!448619) (_4!706 lt!448619))))))

(declare-fun toBit!81 () (_ BitVec 64))

(declare-datatypes ((array!21269 0))(
  ( (array!21270 (arr!10322 (Array (_ BitVec 32) (_ BitVec 8))) (size!9230 (_ BitVec 32))) )
))
(declare-fun a2!688 () array!21269)

(declare-fun b!326691 () Bool)

(assert (=> b!326691 (= e!236011 (and (not (= ((_ extract 31 0) (bvsrem toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000)) (or (bvslt (_4!706 lt!448619) #b00000000000000000000000000000000) (bvsge (_4!706 lt!448619) (size!9230 a2!688)))))))

(declare-fun res!268265 () Bool)

(declare-fun e!236009 () Bool)

(assert (=> start!73906 (=> (not res!268265) (not e!236009))))

(declare-fun a1!688 () array!21269)

(declare-fun fromBit!81 () (_ BitVec 64))

(assert (=> start!73906 (= res!268265 (and (bvsle (size!9230 a1!688) (size!9230 a2!688)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!81) (bvsle fromBit!81 toBit!81) (bvsle toBit!81 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9230 a1!688)))) (bvslt fromBit!81 toBit!81)))))

(assert (=> start!73906 e!236009))

(declare-fun array_inv!8782 (array!21269) Bool)

(assert (=> start!73906 (array_inv!8782 a1!688)))

(assert (=> start!73906 (array_inv!8782 a2!688)))

(assert (=> start!73906 true))

(declare-fun b!326692 () Bool)

(assert (=> b!326692 (= e!236009 e!236011)))

(declare-fun res!268266 () Bool)

(assert (=> b!326692 (=> (not res!268266) (not e!236011))))

(declare-fun e!236008 () Bool)

(assert (=> b!326692 (= res!268266 e!236008)))

(declare-fun res!268263 () Bool)

(assert (=> b!326692 (=> res!268263 e!236008)))

(assert (=> b!326692 (= res!268263 (bvsge (_1!13547 lt!448619) (_2!13547 lt!448619)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1412)

(assert (=> b!326692 (= lt!448619 (arrayBitIndices!0 fromBit!81 toBit!81))))

(declare-fun b!326693 () Bool)

(declare-fun res!268264 () Bool)

(assert (=> b!326693 (=> (not res!268264) (not e!236011))))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!326693 (= res!268264 (byteRangesEq!0 (select (arr!10322 a1!688) (_3!1663 lt!448619)) (select (arr!10322 a2!688) (_3!1663 lt!448619)) ((_ extract 31 0) (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(declare-fun b!326694 () Bool)

(declare-fun arrayRangesEq!1854 (array!21269 array!21269 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!326694 (= e!236008 (arrayRangesEq!1854 a1!688 a2!688 (_1!13547 lt!448619) (_2!13547 lt!448619)))))

(assert (= (and start!73906 res!268265) b!326692))

(assert (= (and b!326692 (not res!268263)) b!326694))

(assert (= (and b!326692 res!268266) b!326690))

(assert (= (and b!326690 res!268262) b!326693))

(assert (= (and b!326693 res!268264) b!326691))

(declare-fun m!464517 () Bool)

(assert (=> start!73906 m!464517))

(declare-fun m!464519 () Bool)

(assert (=> start!73906 m!464519))

(declare-fun m!464521 () Bool)

(assert (=> b!326692 m!464521))

(declare-fun m!464523 () Bool)

(assert (=> b!326693 m!464523))

(declare-fun m!464525 () Bool)

(assert (=> b!326693 m!464525))

(assert (=> b!326693 m!464523))

(assert (=> b!326693 m!464525))

(declare-fun m!464527 () Bool)

(assert (=> b!326693 m!464527))

(declare-fun m!464529 () Bool)

(assert (=> b!326694 m!464529))

(check-sat (not b!326694) (not start!73906) (not b!326693) (not b!326692))
(check-sat)
(get-model)

(declare-fun d!107756 () Bool)

(declare-fun res!268286 () Bool)

(declare-fun e!236032 () Bool)

(assert (=> d!107756 (=> res!268286 e!236032)))

(assert (=> d!107756 (= res!268286 (= (_1!13547 lt!448619) (_2!13547 lt!448619)))))

(assert (=> d!107756 (= (arrayRangesEq!1854 a1!688 a2!688 (_1!13547 lt!448619) (_2!13547 lt!448619)) e!236032)))

(declare-fun b!326714 () Bool)

(declare-fun e!236033 () Bool)

(assert (=> b!326714 (= e!236032 e!236033)))

(declare-fun res!268287 () Bool)

(assert (=> b!326714 (=> (not res!268287) (not e!236033))))

(assert (=> b!326714 (= res!268287 (= (select (arr!10322 a1!688) (_1!13547 lt!448619)) (select (arr!10322 a2!688) (_1!13547 lt!448619))))))

(declare-fun b!326715 () Bool)

(assert (=> b!326715 (= e!236033 (arrayRangesEq!1854 a1!688 a2!688 (bvadd (_1!13547 lt!448619) #b00000000000000000000000000000001) (_2!13547 lt!448619)))))

(assert (= (and d!107756 (not res!268286)) b!326714))

(assert (= (and b!326714 res!268287) b!326715))

(declare-fun m!464545 () Bool)

(assert (=> b!326714 m!464545))

(declare-fun m!464547 () Bool)

(assert (=> b!326714 m!464547))

(declare-fun m!464549 () Bool)

(assert (=> b!326715 m!464549))

(assert (=> b!326694 d!107756))

(declare-fun d!107758 () Bool)

(assert (=> d!107758 (= (array_inv!8782 a1!688) (bvsge (size!9230 a1!688) #b00000000000000000000000000000000))))

(assert (=> start!73906 d!107758))

(declare-fun d!107760 () Bool)

(assert (=> d!107760 (= (array_inv!8782 a2!688) (bvsge (size!9230 a2!688) #b00000000000000000000000000000000))))

(assert (=> start!73906 d!107760))

(declare-fun d!107762 () Bool)

(assert (=> d!107762 (= (byteRangesEq!0 (select (arr!10322 a1!688) (_3!1663 lt!448619)) (select (arr!10322 a2!688) (_3!1663 lt!448619)) ((_ extract 31 0) (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000) (or (= ((_ extract 31 0) (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!10322 a1!688) (_3!1663 lt!448619))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!10322 a2!688) (_3!1663 lt!448619))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111))))))

(declare-fun bs!28438 () Bool)

(assert (= bs!28438 d!107762))

(declare-fun m!464551 () Bool)

(assert (=> bs!28438 m!464551))

(declare-fun m!464553 () Bool)

(assert (=> bs!28438 m!464553))

(assert (=> b!326693 d!107762))

(declare-fun d!107764 () Bool)

(assert (=> d!107764 (= (arrayBitIndices!0 fromBit!81 toBit!81) (tuple4!1413 ((_ extract 31 0) (bvadd (bvsdiv fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!326692 d!107764))

(check-sat (not b!326715))
(check-sat)
