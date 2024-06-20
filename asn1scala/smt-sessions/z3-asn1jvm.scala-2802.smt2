; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67448 () Bool)

(assert start!67448)

(declare-fun b!302883 () Bool)

(declare-datatypes ((tuple4!1124 0))(
  ( (tuple4!1125 (_1!13217 (_ BitVec 32)) (_2!13217 (_ BitVec 32)) (_3!1519 (_ BitVec 32)) (_4!562 (_ BitVec 32))) )
))
(declare-fun lt!437479 () tuple4!1124)

(declare-datatypes ((array!18403 0))(
  ( (array!18404 (arr!9074 (Array (_ BitVec 32) (_ BitVec 8))) (size!7991 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18403)

(declare-fun a2!948 () array!18403)

(declare-fun e!217842 () Bool)

(declare-fun arrayRangesEq!1620 (array!18403 array!18403 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!302883 (= e!217842 (not (arrayRangesEq!1620 a1!948 a2!948 (_1!13217 lt!437479) (_2!13217 lt!437479))))))

(declare-fun res!249287 () Bool)

(declare-fun e!217845 () Bool)

(assert (=> start!67448 (=> (not res!249287) (not e!217845))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(assert (=> start!67448 (= res!249287 (and (bvsle (size!7991 a1!948) (size!7991 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67448 e!217845))

(assert (=> start!67448 true))

(declare-fun array_inv!7603 (array!18403) Bool)

(assert (=> start!67448 (array_inv!7603 a1!948)))

(assert (=> start!67448 (array_inv!7603 a2!948)))

(declare-fun b!302884 () Bool)

(declare-fun e!217844 () Bool)

(assert (=> b!302884 (= e!217844 e!217842)))

(declare-fun res!249289 () Bool)

(assert (=> b!302884 (=> (not res!249289) (not e!217842))))

(declare-fun lt!437481 () tuple4!1124)

(assert (=> b!302884 (= res!249289 (and (bvslt (_1!13217 lt!437481) (_2!13217 lt!437481)) (bvsle #b00000000000000000000000000000000 (_1!13217 lt!437479)) (bvsle (_1!13217 lt!437479) (_2!13217 lt!437479)) (bvsle (_2!13217 lt!437479) (size!7991 a1!948)) (bvsle (_1!13217 lt!437479) (_1!13217 lt!437481)) (bvsle (_1!13217 lt!437481) (_2!13217 lt!437481)) (bvsle (_2!13217 lt!437481) (_2!13217 lt!437479))))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1124)

(assert (=> b!302884 (= lt!437481 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!302884 (= lt!437479 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!302885 () Bool)

(declare-fun res!249291 () Bool)

(assert (=> b!302885 (=> (not res!249291) (not e!217844))))

(declare-fun arrayBitRangesEq!0 (array!18403 array!18403 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!302885 (= res!249291 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!302886 () Bool)

(assert (=> b!302886 (= e!217845 e!217844)))

(declare-fun res!249288 () Bool)

(assert (=> b!302886 (=> (not res!249288) (not e!217844))))

(declare-fun lt!437480 () (_ BitVec 64))

(assert (=> b!302886 (= res!249288 (and (bvsle toBit!258 lt!437480) (bvsle fromBit!258 lt!437480)))))

(assert (=> b!302886 (= lt!437480 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7991 a1!948))))))

(declare-fun b!302887 () Bool)

(declare-fun res!249290 () Bool)

(assert (=> b!302887 (=> (not res!249290) (not e!217844))))

(assert (=> b!302887 (= res!249290 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437480) (not (= fromSlice!52 toSlice!52))))))

(assert (= (and start!67448 res!249287) b!302886))

(assert (= (and b!302886 res!249288) b!302885))

(assert (= (and b!302885 res!249291) b!302887))

(assert (= (and b!302887 res!249290) b!302884))

(assert (= (and b!302884 res!249289) b!302883))

(declare-fun m!441609 () Bool)

(assert (=> b!302883 m!441609))

(declare-fun m!441611 () Bool)

(assert (=> start!67448 m!441611))

(declare-fun m!441613 () Bool)

(assert (=> start!67448 m!441613))

(declare-fun m!441615 () Bool)

(assert (=> b!302884 m!441615))

(declare-fun m!441617 () Bool)

(assert (=> b!302884 m!441617))

(declare-fun m!441619 () Bool)

(assert (=> b!302885 m!441619))

(check-sat (not b!302883) (not start!67448) (not b!302885) (not b!302884))
(check-sat)
(get-model)

(declare-fun d!101184 () Bool)

(declare-fun res!249311 () Bool)

(declare-fun e!217866 () Bool)

(assert (=> d!101184 (=> res!249311 e!217866)))

(assert (=> d!101184 (= res!249311 (= (_1!13217 lt!437479) (_2!13217 lt!437479)))))

(assert (=> d!101184 (= (arrayRangesEq!1620 a1!948 a2!948 (_1!13217 lt!437479) (_2!13217 lt!437479)) e!217866)))

(declare-fun b!302907 () Bool)

(declare-fun e!217867 () Bool)

(assert (=> b!302907 (= e!217866 e!217867)))

(declare-fun res!249312 () Bool)

(assert (=> b!302907 (=> (not res!249312) (not e!217867))))

(assert (=> b!302907 (= res!249312 (= (select (arr!9074 a1!948) (_1!13217 lt!437479)) (select (arr!9074 a2!948) (_1!13217 lt!437479))))))

(declare-fun b!302908 () Bool)

(assert (=> b!302908 (= e!217867 (arrayRangesEq!1620 a1!948 a2!948 (bvadd (_1!13217 lt!437479) #b00000000000000000000000000000001) (_2!13217 lt!437479)))))

(assert (= (and d!101184 (not res!249311)) b!302907))

(assert (= (and b!302907 res!249312) b!302908))

(declare-fun m!441633 () Bool)

(assert (=> b!302907 m!441633))

(declare-fun m!441635 () Bool)

(assert (=> b!302907 m!441635))

(declare-fun m!441637 () Bool)

(assert (=> b!302908 m!441637))

(assert (=> b!302883 d!101184))

(declare-fun d!101186 () Bool)

(assert (=> d!101186 (= (array_inv!7603 a1!948) (bvsge (size!7991 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67448 d!101186))

(declare-fun d!101188 () Bool)

(assert (=> d!101188 (= (array_inv!7603 a2!948) (bvsge (size!7991 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67448 d!101188))

(declare-fun b!302923 () Bool)

(declare-fun e!217882 () Bool)

(declare-fun e!217885 () Bool)

(assert (=> b!302923 (= e!217882 e!217885)))

(declare-fun res!249324 () Bool)

(assert (=> b!302923 (=> (not res!249324) (not e!217885))))

(declare-fun e!217880 () Bool)

(assert (=> b!302923 (= res!249324 e!217880)))

(declare-fun res!249326 () Bool)

(assert (=> b!302923 (=> res!249326 e!217880)))

(declare-fun lt!437498 () tuple4!1124)

(assert (=> b!302923 (= res!249326 (bvsge (_1!13217 lt!437498) (_2!13217 lt!437498)))))

(declare-fun lt!437499 () (_ BitVec 32))

(assert (=> b!302923 (= lt!437499 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!437497 () (_ BitVec 32))

(assert (=> b!302923 (= lt!437497 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!302923 (= lt!437498 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!302924 () Bool)

(declare-fun e!217883 () Bool)

(assert (=> b!302924 (= e!217885 e!217883)))

(declare-fun c!14382 () Bool)

(assert (=> b!302924 (= c!14382 (= (_3!1519 lt!437498) (_4!562 lt!437498)))))

(declare-fun e!217881 () Bool)

(declare-fun b!302925 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!302925 (= e!217881 (byteRangesEq!0 (select (arr!9074 a1!948) (_4!562 lt!437498)) (select (arr!9074 a2!948) (_4!562 lt!437498)) #b00000000000000000000000000000000 lt!437499))))

(declare-fun b!302927 () Bool)

(declare-fun res!249325 () Bool)

(assert (=> b!302927 (= res!249325 (= lt!437499 #b00000000000000000000000000000000))))

(assert (=> b!302927 (=> res!249325 e!217881)))

(declare-fun e!217884 () Bool)

(assert (=> b!302927 (= e!217884 e!217881)))

(declare-fun call!5552 () Bool)

(declare-fun bm!5549 () Bool)

(assert (=> bm!5549 (= call!5552 (byteRangesEq!0 (select (arr!9074 a1!948) (_3!1519 lt!437498)) (select (arr!9074 a2!948) (_3!1519 lt!437498)) lt!437497 (ite c!14382 lt!437499 #b00000000000000000000000000001000)))))

(declare-fun b!302928 () Bool)

(assert (=> b!302928 (= e!217883 e!217884)))

(declare-fun res!249323 () Bool)

(assert (=> b!302928 (= res!249323 call!5552)))

(assert (=> b!302928 (=> (not res!249323) (not e!217884))))

(declare-fun b!302929 () Bool)

(assert (=> b!302929 (= e!217883 call!5552)))

(declare-fun d!101190 () Bool)

(declare-fun res!249327 () Bool)

(assert (=> d!101190 (=> res!249327 e!217882)))

(assert (=> d!101190 (= res!249327 (bvsge fromBit!258 toBit!258))))

(assert (=> d!101190 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!217882)))

(declare-fun b!302926 () Bool)

(assert (=> b!302926 (= e!217880 (arrayRangesEq!1620 a1!948 a2!948 (_1!13217 lt!437498) (_2!13217 lt!437498)))))

(assert (= (and d!101190 (not res!249327)) b!302923))

(assert (= (and b!302923 (not res!249326)) b!302926))

(assert (= (and b!302923 res!249324) b!302924))

(assert (= (and b!302924 c!14382) b!302929))

(assert (= (and b!302924 (not c!14382)) b!302928))

(assert (= (and b!302928 res!249323) b!302927))

(assert (= (and b!302927 (not res!249325)) b!302925))

(assert (= (or b!302929 b!302928) bm!5549))

(assert (=> b!302923 m!441617))

(declare-fun m!441639 () Bool)

(assert (=> b!302925 m!441639))

(declare-fun m!441641 () Bool)

(assert (=> b!302925 m!441641))

(assert (=> b!302925 m!441639))

(assert (=> b!302925 m!441641))

(declare-fun m!441643 () Bool)

(assert (=> b!302925 m!441643))

(declare-fun m!441645 () Bool)

(assert (=> bm!5549 m!441645))

(declare-fun m!441647 () Bool)

(assert (=> bm!5549 m!441647))

(assert (=> bm!5549 m!441645))

(assert (=> bm!5549 m!441647))

(declare-fun m!441649 () Bool)

(assert (=> bm!5549 m!441649))

(declare-fun m!441651 () Bool)

(assert (=> b!302926 m!441651))

(assert (=> b!302885 d!101190))

(declare-fun d!101194 () Bool)

(assert (=> d!101194 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1125 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!302884 d!101194))

(declare-fun d!101198 () Bool)

(assert (=> d!101198 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1125 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!302884 d!101198))

(check-sat (not b!302908) (not b!302926) (not b!302925) (not b!302923) (not bm!5549))
(check-sat)
