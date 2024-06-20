; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67662 () Bool)

(assert start!67662)

(declare-fun b!303693 () Bool)

(declare-fun res!249899 () Bool)

(declare-fun e!218543 () Bool)

(assert (=> b!303693 (=> (not res!249899) (not e!218543))))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18455 0))(
  ( (array!18456 (arr!9091 (Array (_ BitVec 32) (_ BitVec 8))) (size!8008 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18455)

(declare-fun a2!948 () array!18455)

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!18455 array!18455 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!303693 (= res!249899 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun res!249900 () Bool)

(declare-fun e!218545 () Bool)

(assert (=> start!67662 (=> (not res!249900) (not e!218545))))

(assert (=> start!67662 (= res!249900 (and (bvsle (size!8008 a1!948) (size!8008 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67662 e!218545))

(assert (=> start!67662 true))

(declare-fun array_inv!7620 (array!18455) Bool)

(assert (=> start!67662 (array_inv!7620 a1!948)))

(assert (=> start!67662 (array_inv!7620 a2!948)))

(declare-fun b!303694 () Bool)

(declare-fun res!249897 () Bool)

(assert (=> b!303694 (=> (not res!249897) (not e!218543))))

(declare-fun lt!437937 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!303694 (= res!249897 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437937) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!303695 () Bool)

(assert (=> b!303695 (= e!218545 e!218543)))

(declare-fun res!249896 () Bool)

(assert (=> b!303695 (=> (not res!249896) (not e!218543))))

(assert (=> b!303695 (= res!249896 (and (bvsle toBit!258 lt!437937) (bvsle fromBit!258 lt!437937)))))

(assert (=> b!303695 (= lt!437937 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8008 a1!948))))))

(declare-fun b!303696 () Bool)

(declare-datatypes ((Unit!21205 0))(
  ( (Unit!21206) )
))
(declare-fun e!218542 () Unit!21205)

(declare-fun Unit!21207 () Unit!21205)

(assert (=> b!303696 (= e!218542 Unit!21207)))

(declare-fun b!303697 () Bool)

(declare-fun res!249898 () Bool)

(declare-fun e!218541 () Bool)

(assert (=> b!303697 (=> (not res!249898) (not e!218541))))

(declare-datatypes ((tuple4!1158 0))(
  ( (tuple4!1159 (_1!13234 (_ BitVec 32)) (_2!13234 (_ BitVec 32)) (_3!1536 (_ BitVec 32)) (_4!579 (_ BitVec 32))) )
))
(declare-fun lt!437936 () tuple4!1158)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!303697 (= res!249898 (byteRangesEq!0 (select (arr!9091 a1!948) (_3!1536 lt!437936)) (select (arr!9091 a2!948) (_3!1536 lt!437936)) ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111))))

(declare-fun b!303698 () Bool)

(assert (=> b!303698 (= e!218543 e!218541)))

(declare-fun res!249895 () Bool)

(assert (=> b!303698 (=> (not res!249895) (not e!218541))))

(assert (=> b!303698 (= res!249895 (not (= (_3!1536 lt!437936) (_4!579 lt!437936))))))

(declare-fun lt!437934 () Unit!21205)

(assert (=> b!303698 (= lt!437934 e!218542)))

(declare-fun c!14481 () Bool)

(declare-fun lt!437935 () tuple4!1158)

(assert (=> b!303698 (= c!14481 (bvslt (_1!13234 lt!437935) (_2!13234 lt!437935)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1158)

(assert (=> b!303698 (= lt!437935 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!303698 (= lt!437936 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!303699 () Bool)

(assert (=> b!303699 (= e!218541 (and (not (= ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000)) (or (bvslt (_4!579 lt!437936) #b00000000000000000000000000000000) (bvsge (_4!579 lt!437936) (size!8008 a2!948)))))))

(declare-fun b!303700 () Bool)

(declare-fun lt!437933 () Unit!21205)

(assert (=> b!303700 (= e!218542 lt!437933)))

(declare-fun arrayRangesEqSlicedLemma!232 (array!18455 array!18455 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21205)

(assert (=> b!303700 (= lt!437933 (arrayRangesEqSlicedLemma!232 a1!948 a2!948 (_1!13234 lt!437936) (_2!13234 lt!437936) (_1!13234 lt!437935) (_2!13234 lt!437935)))))

(declare-fun arrayRangesEq!1637 (array!18455 array!18455 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!303700 (arrayRangesEq!1637 a1!948 a2!948 (_1!13234 lt!437935) (_2!13234 lt!437935))))

(assert (= (and start!67662 res!249900) b!303695))

(assert (= (and b!303695 res!249896) b!303693))

(assert (= (and b!303693 res!249899) b!303694))

(assert (= (and b!303694 res!249897) b!303698))

(assert (= (and b!303698 c!14481) b!303700))

(assert (= (and b!303698 (not c!14481)) b!303696))

(assert (= (and b!303698 res!249895) b!303697))

(assert (= (and b!303697 res!249898) b!303699))

(declare-fun m!442263 () Bool)

(assert (=> start!67662 m!442263))

(declare-fun m!442265 () Bool)

(assert (=> start!67662 m!442265))

(declare-fun m!442267 () Bool)

(assert (=> b!303700 m!442267))

(declare-fun m!442269 () Bool)

(assert (=> b!303700 m!442269))

(declare-fun m!442271 () Bool)

(assert (=> b!303693 m!442271))

(declare-fun m!442273 () Bool)

(assert (=> b!303698 m!442273))

(declare-fun m!442275 () Bool)

(assert (=> b!303698 m!442275))

(declare-fun m!442277 () Bool)

(assert (=> b!303697 m!442277))

(declare-fun m!442279 () Bool)

(assert (=> b!303697 m!442279))

(assert (=> b!303697 m!442277))

(assert (=> b!303697 m!442279))

(declare-fun m!442281 () Bool)

(assert (=> b!303697 m!442281))

(push 1)

(assert (not start!67662))

(assert (not b!303700))

(assert (not b!303697))

(assert (not b!303693))

(assert (not b!303698))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!101462 () Bool)

(assert (=> d!101462 (arrayRangesEq!1637 a1!948 a2!948 (_1!13234 lt!437935) (_2!13234 lt!437935))))

(declare-fun lt!437975 () Unit!21205)

(declare-fun choose!564 (array!18455 array!18455 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21205)

(assert (=> d!101462 (= lt!437975 (choose!564 a1!948 a2!948 (_1!13234 lt!437936) (_2!13234 lt!437936) (_1!13234 lt!437935) (_2!13234 lt!437935)))))

(assert (=> d!101462 (and (bvsle #b00000000000000000000000000000000 (_1!13234 lt!437936)) (bvsle (_1!13234 lt!437936) (_2!13234 lt!437936)))))

(assert (=> d!101462 (= (arrayRangesEqSlicedLemma!232 a1!948 a2!948 (_1!13234 lt!437936) (_2!13234 lt!437936) (_1!13234 lt!437935) (_2!13234 lt!437935)) lt!437975)))

(declare-fun bs!26155 () Bool)

(assert (= bs!26155 d!101462))

(assert (=> bs!26155 m!442269))

(declare-fun m!442331 () Bool)

(assert (=> bs!26155 m!442331))

(assert (=> b!303700 d!101462))

(declare-fun d!101464 () Bool)

(declare-fun res!249957 () Bool)

(declare-fun e!218604 () Bool)

(assert (=> d!101464 (=> res!249957 e!218604)))

(assert (=> d!101464 (= res!249957 (= (_1!13234 lt!437935) (_2!13234 lt!437935)))))

(assert (=> d!101464 (= (arrayRangesEq!1637 a1!948 a2!948 (_1!13234 lt!437935) (_2!13234 lt!437935)) e!218604)))

(declare-fun b!303773 () Bool)

(declare-fun e!218605 () Bool)

(assert (=> b!303773 (= e!218604 e!218605)))

(declare-fun res!249958 () Bool)

(assert (=> b!303773 (=> (not res!249958) (not e!218605))))

(assert (=> b!303773 (= res!249958 (= (select (arr!9091 a1!948) (_1!13234 lt!437935)) (select (arr!9091 a2!948) (_1!13234 lt!437935))))))

(declare-fun b!303774 () Bool)

(assert (=> b!303774 (= e!218605 (arrayRangesEq!1637 a1!948 a2!948 (bvadd (_1!13234 lt!437935) #b00000000000000000000000000000001) (_2!13234 lt!437935)))))

(assert (= (and d!101464 (not res!249957)) b!303773))

(assert (= (and b!303773 res!249958) b!303774))

(declare-fun m!442333 () Bool)

(assert (=> b!303773 m!442333))

(declare-fun m!442335 () Bool)

(assert (=> b!303773 m!442335))

(declare-fun m!442337 () Bool)

(assert (=> b!303774 m!442337))

(assert (=> b!303700 d!101464))

(declare-fun d!101466 () Bool)

(assert (=> d!101466 (= (array_inv!7620 a1!948) (bvsge (size!8008 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67662 d!101466))

(declare-fun d!101468 () Bool)

(assert (=> d!101468 (= (array_inv!7620 a2!948) (bvsge (size!8008 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67662 d!101468))

(declare-fun d!101470 () Bool)

(assert (=> d!101470 (= (byteRangesEq!0 (select (arr!9091 a1!948) (_3!1536 lt!437936)) (select (arr!9091 a2!948) (_3!1536 lt!437936)) ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111) (or (= ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9091 a1!948) (_3!1536 lt!437936))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9091 a2!948) (_3!1536 lt!437936))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26156 () Bool)

(assert (= bs!26156 d!101470))

(declare-fun m!442353 () Bool)

(assert (=> bs!26156 m!442353))

(declare-fun m!442355 () Bool)

(assert (=> bs!26156 m!442355))

(assert (=> b!303697 d!101470))

(declare-fun d!101474 () Bool)

(assert (=> d!101474 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1159 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!303698 d!101474))

(declare-fun d!101482 () Bool)

(assert (=> d!101482 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1159 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!303698 d!101482))

(declare-fun d!101484 () Bool)

(declare-fun res!249982 () Bool)

(declare-fun e!218630 () Bool)

(assert (=> d!101484 (=> res!249982 e!218630)))

(assert (=> d!101484 (= res!249982 (bvsge fromBit!258 toBit!258))))

(assert (=> d!101484 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!218630)))

(declare-fun call!5609 () Bool)

(declare-fun lt!437993 () (_ BitVec 32))

(declare-fun lt!437994 () tuple4!1158)

(declare-fun lt!437992 () (_ BitVec 32))

(declare-fun bm!5606 () Bool)

(declare-fun c!14493 () Bool)

(assert (=> bm!5606 (= call!5609 (byteRangesEq!0 (select (arr!9091 a1!948) (_3!1536 lt!437994)) (select (arr!9091 a2!948) (_3!1536 lt!437994)) lt!437992 (ite c!14493 lt!437993 #b00000000000000000000000000001000)))))

(declare-fun b!303800 () Bool)

(declare-fun e!218629 () Bool)

(assert (=> b!303800 (= e!218629 (arrayRangesEq!1637 a1!948 a2!948 (_1!13234 lt!437994) (_2!13234 lt!437994)))))

(declare-fun b!303801 () Bool)

(declare-fun e!218628 () Bool)

(declare-fun e!218633 () Bool)

(assert (=> b!303801 (= e!218628 e!218633)))

(declare-fun res!249979 () Bool)

(assert (=> b!303801 (= res!249979 call!5609)))

(assert (=> b!303801 (=> (not res!249979) (not e!218633))))

(declare-fun b!303802 () Bool)

(assert (=> b!303802 (= e!218628 call!5609)))

(declare-fun b!303803 () Bool)

(declare-fun e!218632 () Bool)

(assert (=> b!303803 (= e!218632 e!218628)))

(assert (=> b!303803 (= c!14493 (= (_3!1536 lt!437994) (_4!579 lt!437994)))))

(declare-fun b!303804 () Bool)

(declare-fun res!249980 () Bool)

(assert (=> b!303804 (= res!249980 (= lt!437993 #b00000000000000000000000000000000))))

(declare-fun e!218631 () Bool)

(assert (=> b!303804 (=> res!249980 e!218631)))

(assert (=> b!303804 (= e!218633 e!218631)))

(declare-fun b!303805 () Bool)

(assert (=> b!303805 (= e!218631 (byteRangesEq!0 (select (arr!9091 a1!948) (_4!579 lt!437994)) (select (arr!9091 a2!948) (_4!579 lt!437994)) #b00000000000000000000000000000000 lt!437993))))

(declare-fun b!303806 () Bool)

(assert (=> b!303806 (= e!218630 e!218632)))

(declare-fun res!249978 () Bool)

(assert (=> b!303806 (=> (not res!249978) (not e!218632))))

(assert (=> b!303806 (= res!249978 e!218629)))

(declare-fun res!249981 () Bool)

(assert (=> b!303806 (=> res!249981 e!218629)))

(assert (=> b!303806 (= res!249981 (bvsge (_1!13234 lt!437994) (_2!13234 lt!437994)))))

(assert (=> b!303806 (= lt!437993 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!303806 (= lt!437992 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!303806 (= lt!437994 (arrayBitIndices!0 fromBit!258 toBit!258))))

(assert (= (and d!101484 (not res!249982)) b!303806))

(assert (= (and b!303806 (not res!249981)) b!303800))

(assert (= (and b!303806 res!249978) b!303803))

(assert (= (and b!303803 c!14493) b!303802))

(assert (= (and b!303803 (not c!14493)) b!303801))

(assert (= (and b!303801 res!249979) b!303804))

(assert (= (and b!303804 (not res!249980)) b!303805))

(assert (= (or b!303802 b!303801) bm!5606))

(declare-fun m!442367 () Bool)

(assert (=> bm!5606 m!442367))

(declare-fun m!442369 () Bool)

(assert (=> bm!5606 m!442369))

(assert (=> bm!5606 m!442367))

(assert (=> bm!5606 m!442369))

(declare-fun m!442371 () Bool)

(assert (=> bm!5606 m!442371))

(declare-fun m!442373 () Bool)

(assert (=> b!303800 m!442373))

(declare-fun m!442375 () Bool)

(assert (=> b!303805 m!442375))

(declare-fun m!442377 () Bool)

(assert (=> b!303805 m!442377))

(assert (=> b!303805 m!442375))

(assert (=> b!303805 m!442377))

(declare-fun m!442381 () Bool)

(assert (=> b!303805 m!442381))

(assert (=> b!303806 m!442275))

(assert (=> b!303693 d!101484))

(push 1)

(assert (not b!303806))

(assert (not d!101462))

(assert (not b!303805))

(assert (not b!303774))

(assert (not b!303800))

(assert (not bm!5606))

(check-sat)

(pop 1)

(push 1)

(check-sat)

