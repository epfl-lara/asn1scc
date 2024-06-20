; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73904 () Bool)

(assert start!73904)

(declare-fun b!326675 () Bool)

(declare-fun e!235997 () Bool)

(declare-fun e!235995 () Bool)

(assert (=> b!326675 (= e!235997 e!235995)))

(declare-fun res!268251 () Bool)

(assert (=> b!326675 (=> (not res!268251) (not e!235995))))

(declare-fun e!235993 () Bool)

(assert (=> b!326675 (= res!268251 e!235993)))

(declare-fun res!268248 () Bool)

(assert (=> b!326675 (=> res!268248 e!235993)))

(declare-datatypes ((tuple4!1410 0))(
  ( (tuple4!1411 (_1!13546 (_ BitVec 32)) (_2!13546 (_ BitVec 32)) (_3!1662 (_ BitVec 32)) (_4!705 (_ BitVec 32))) )
))
(declare-fun lt!448616 () tuple4!1410)

(assert (=> b!326675 (= res!268248 (bvsge (_1!13546 lt!448616) (_2!13546 lt!448616)))))

(declare-fun fromBit!81 () (_ BitVec 64))

(declare-fun toBit!81 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1410)

(assert (=> b!326675 (= lt!448616 (arrayBitIndices!0 fromBit!81 toBit!81))))

(declare-fun b!326676 () Bool)

(declare-fun res!268250 () Bool)

(assert (=> b!326676 (=> (not res!268250) (not e!235995))))

(declare-datatypes ((array!21267 0))(
  ( (array!21268 (arr!10321 (Array (_ BitVec 32) (_ BitVec 8))) (size!9229 (_ BitVec 32))) )
))
(declare-fun a1!688 () array!21267)

(declare-fun a2!688 () array!21267)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!326676 (= res!268250 (byteRangesEq!0 (select (arr!10321 a1!688) (_3!1662 lt!448616)) (select (arr!10321 a2!688) (_3!1662 lt!448616)) ((_ extract 31 0) (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(declare-fun res!268249 () Bool)

(assert (=> start!73904 (=> (not res!268249) (not e!235997))))

(assert (=> start!73904 (= res!268249 (and (bvsle (size!9229 a1!688) (size!9229 a2!688)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!81) (bvsle fromBit!81 toBit!81) (bvsle toBit!81 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9229 a1!688)))) (bvslt fromBit!81 toBit!81)))))

(assert (=> start!73904 e!235997))

(declare-fun array_inv!8781 (array!21267) Bool)

(assert (=> start!73904 (array_inv!8781 a1!688)))

(assert (=> start!73904 (array_inv!8781 a2!688)))

(assert (=> start!73904 true))

(declare-fun b!326677 () Bool)

(assert (=> b!326677 (= e!235995 (and (not (= ((_ extract 31 0) (bvsrem toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000)) (or (bvslt (_4!705 lt!448616) #b00000000000000000000000000000000) (bvsge (_4!705 lt!448616) (size!9229 a2!688)))))))

(declare-fun b!326678 () Bool)

(declare-fun res!268247 () Bool)

(assert (=> b!326678 (=> (not res!268247) (not e!235995))))

(assert (=> b!326678 (= res!268247 (not (= (_3!1662 lt!448616) (_4!705 lt!448616))))))

(declare-fun b!326679 () Bool)

(declare-fun arrayRangesEq!1853 (array!21267 array!21267 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!326679 (= e!235993 (arrayRangesEq!1853 a1!688 a2!688 (_1!13546 lt!448616) (_2!13546 lt!448616)))))

(assert (= (and start!73904 res!268249) b!326675))

(assert (= (and b!326675 (not res!268248)) b!326679))

(assert (= (and b!326675 res!268251) b!326678))

(assert (= (and b!326678 res!268247) b!326676))

(assert (= (and b!326676 res!268250) b!326677))

(declare-fun m!464503 () Bool)

(assert (=> b!326675 m!464503))

(declare-fun m!464505 () Bool)

(assert (=> b!326676 m!464505))

(declare-fun m!464507 () Bool)

(assert (=> b!326676 m!464507))

(assert (=> b!326676 m!464505))

(assert (=> b!326676 m!464507))

(declare-fun m!464509 () Bool)

(assert (=> b!326676 m!464509))

(declare-fun m!464511 () Bool)

(assert (=> start!73904 m!464511))

(declare-fun m!464513 () Bool)

(assert (=> start!73904 m!464513))

(declare-fun m!464515 () Bool)

(assert (=> b!326679 m!464515))

(push 1)

(assert (not b!326675))

(assert (not b!326679))

(assert (not start!73904))

(assert (not b!326676))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107766 () Bool)

(assert (=> d!107766 (= (arrayBitIndices!0 fromBit!81 toBit!81) (tuple4!1411 ((_ extract 31 0) (bvadd (bvsdiv fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!326675 d!107766))

(declare-fun d!107768 () Bool)

(declare-fun res!268292 () Bool)

(declare-fun e!236038 () Bool)

(assert (=> d!107768 (=> res!268292 e!236038)))

(assert (=> d!107768 (= res!268292 (= (_1!13546 lt!448616) (_2!13546 lt!448616)))))

(assert (=> d!107768 (= (arrayRangesEq!1853 a1!688 a2!688 (_1!13546 lt!448616) (_2!13546 lt!448616)) e!236038)))

(declare-fun b!326720 () Bool)

(declare-fun e!236039 () Bool)

(assert (=> b!326720 (= e!236038 e!236039)))

(declare-fun res!268293 () Bool)

(assert (=> b!326720 (=> (not res!268293) (not e!236039))))

(assert (=> b!326720 (= res!268293 (= (select (arr!10321 a1!688) (_1!13546 lt!448616)) (select (arr!10321 a2!688) (_1!13546 lt!448616))))))

(declare-fun b!326721 () Bool)

(assert (=> b!326721 (= e!236039 (arrayRangesEq!1853 a1!688 a2!688 (bvadd (_1!13546 lt!448616) #b00000000000000000000000000000001) (_2!13546 lt!448616)))))

(assert (= (and d!107768 (not res!268292)) b!326720))

(assert (= (and b!326720 res!268293) b!326721))

(declare-fun m!464555 () Bool)

(assert (=> b!326720 m!464555))

(declare-fun m!464557 () Bool)

(assert (=> b!326720 m!464557))

(declare-fun m!464559 () Bool)

(assert (=> b!326721 m!464559))

(assert (=> b!326679 d!107768))

(declare-fun d!107770 () Bool)

(assert (=> d!107770 (= (array_inv!8781 a1!688) (bvsge (size!9229 a1!688) #b00000000000000000000000000000000))))

(assert (=> start!73904 d!107770))

(declare-fun d!107772 () Bool)

(assert (=> d!107772 (= (array_inv!8781 a2!688) (bvsge (size!9229 a2!688) #b00000000000000000000000000000000))))

(assert (=> start!73904 d!107772))

(declare-fun d!107774 () Bool)

(assert (=> d!107774 (= (byteRangesEq!0 (select (arr!10321 a1!688) (_3!1662 lt!448616)) (select (arr!10321 a2!688) (_3!1662 lt!448616)) ((_ extract 31 0) (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000) (or (= ((_ extract 31 0) (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!10321 a1!688) (_3!1662 lt!448616))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!10321 a2!688) (_3!1662 lt!448616))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111))))))

(declare-fun bs!28439 () Bool)

(assert (= bs!28439 d!107774))

(declare-fun m!464561 () Bool)

(assert (=> bs!28439 m!464561))

(declare-fun m!464563 () Bool)

(assert (=> bs!28439 m!464563))

(assert (=> b!326676 d!107774))

(push 1)

