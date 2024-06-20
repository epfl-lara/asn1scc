; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68124 () Bool)

(assert start!68124)

(declare-fun b!305789 () Bool)

(declare-fun e!220268 () Bool)

(declare-fun e!220269 () Bool)

(assert (=> b!305789 (= e!220268 e!220269)))

(declare-fun res!251283 () Bool)

(assert (=> b!305789 (=> (not res!251283) (not e!220269))))

(declare-fun e!220264 () Bool)

(assert (=> b!305789 (= res!251283 e!220264)))

(declare-fun c!14841 () Bool)

(declare-datatypes ((tuple4!1230 0))(
  ( (tuple4!1231 (_1!13270 (_ BitVec 32)) (_2!13270 (_ BitVec 32)) (_3!1572 (_ BitVec 32)) (_4!615 (_ BitVec 32))) )
))
(declare-fun lt!439201 () tuple4!1230)

(assert (=> b!305789 (= c!14841 (= (_3!1572 lt!439201) (_4!615 lt!439201)))))

(declare-datatypes ((Unit!21334 0))(
  ( (Unit!21335) )
))
(declare-fun lt!439205 () Unit!21334)

(declare-fun e!220266 () Unit!21334)

(assert (=> b!305789 (= lt!439205 e!220266)))

(declare-fun c!14838 () Bool)

(declare-fun lt!439202 () tuple4!1230)

(assert (=> b!305789 (= c!14838 (bvslt (_1!13270 lt!439202) (_2!13270 lt!439202)))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1230)

(assert (=> b!305789 (= lt!439202 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(declare-fun lt!439208 () (_ BitVec 32))

(declare-fun toBit!258 () (_ BitVec 64))

(assert (=> b!305789 (= lt!439208 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!439209 () (_ BitVec 32))

(declare-fun fromBit!258 () (_ BitVec 64))

(assert (=> b!305789 (= lt!439209 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!305789 (= lt!439201 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun res!251282 () Bool)

(declare-fun e!220265 () Bool)

(assert (=> start!68124 (=> (not res!251282) (not e!220265))))

(declare-datatypes ((array!18557 0))(
  ( (array!18558 (arr!9127 (Array (_ BitVec 32) (_ BitVec 8))) (size!8044 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18557)

(declare-fun a2!948 () array!18557)

(assert (=> start!68124 (= res!251282 (and (bvsle (size!8044 a1!948) (size!8044 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!68124 e!220265))

(assert (=> start!68124 true))

(declare-fun array_inv!7656 (array!18557) Bool)

(assert (=> start!68124 (array_inv!7656 a1!948)))

(assert (=> start!68124 (array_inv!7656 a2!948)))

(declare-fun b!305790 () Bool)

(assert (=> b!305790 (= e!220265 e!220268)))

(declare-fun res!251277 () Bool)

(assert (=> b!305790 (=> (not res!251277) (not e!220268))))

(declare-fun lt!439206 () (_ BitVec 64))

(assert (=> b!305790 (= res!251277 (and (bvsle toBit!258 lt!439206) (bvsle fromBit!258 lt!439206)))))

(assert (=> b!305790 (= lt!439206 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8044 a1!948))))))

(declare-fun b!305791 () Bool)

(declare-fun call!5786 () Bool)

(assert (=> b!305791 (= e!220264 call!5786)))

(declare-fun b!305792 () Bool)

(declare-fun Unit!21336 () Unit!21334)

(assert (=> b!305792 (= e!220266 Unit!21336)))

(declare-fun bm!5783 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5783 (= call!5786 (byteRangesEq!0 (ite c!14841 (select (arr!9127 a1!948) (_3!1572 lt!439201)) (select (arr!9127 a1!948) (_4!615 lt!439201))) (ite c!14841 (select (arr!9127 a2!948) (_3!1572 lt!439201)) (select (arr!9127 a2!948) (_4!615 lt!439201))) (ite c!14841 lt!439209 #b00000000000000000000000000000000) lt!439208))))

(declare-fun b!305793 () Bool)

(declare-fun e!220263 () Unit!21334)

(declare-fun lt!439207 () Unit!21334)

(assert (=> b!305793 (= e!220263 lt!439207)))

(declare-fun arrayRangesEqImpliesEq!277 (array!18557 array!18557 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21334)

(assert (=> b!305793 (= lt!439207 (arrayRangesEqImpliesEq!277 a1!948 a2!948 (_1!13270 lt!439201) (_3!1572 lt!439202) (_2!13270 lt!439201)))))

(assert (=> b!305793 (= (select (arr!9127 a1!948) (_3!1572 lt!439202)) (select (arr!9127 a2!948) (_3!1572 lt!439202)))))

(declare-fun b!305794 () Bool)

(declare-fun e!220270 () Unit!21334)

(declare-fun lt!439200 () Unit!21334)

(assert (=> b!305794 (= e!220270 lt!439200)))

(assert (=> b!305794 (= lt!439200 (arrayRangesEqImpliesEq!277 a1!948 a2!948 (_1!13270 lt!439201) (_4!615 lt!439202) (_2!13270 lt!439201)))))

(assert (=> b!305794 (= (select (arr!9127 a1!948) (_4!615 lt!439202)) (select (arr!9127 a2!948) (_4!615 lt!439202)))))

(declare-fun b!305795 () Bool)

(assert (=> b!305795 (= e!220269 (and (= (_3!1572 lt!439202) (_4!615 lt!439202)) (or (bvslt (_3!1572 lt!439202) #b00000000000000000000000000000000) (bvsge (_3!1572 lt!439202) (size!8044 a2!948)))))))

(declare-fun lt!439204 () Unit!21334)

(assert (=> b!305795 (= lt!439204 e!220270)))

(declare-fun c!14840 () Bool)

(assert (=> b!305795 (= c!14840 (and (bvslt (_4!615 lt!439202) (_4!615 lt!439201)) (bvslt (_3!1572 lt!439201) (_4!615 lt!439202))))))

(declare-fun lt!439199 () Unit!21334)

(assert (=> b!305795 (= lt!439199 e!220263)))

(declare-fun c!14839 () Bool)

(assert (=> b!305795 (= c!14839 (and (bvslt (_3!1572 lt!439201) (_3!1572 lt!439202)) (bvslt (_3!1572 lt!439202) (_4!615 lt!439201))))))

(declare-fun b!305796 () Bool)

(declare-fun Unit!21337 () Unit!21334)

(assert (=> b!305796 (= e!220263 Unit!21337)))

(declare-fun b!305797 () Bool)

(declare-fun res!251281 () Bool)

(assert (=> b!305797 (= res!251281 (= lt!439208 #b00000000000000000000000000000000))))

(declare-fun e!220273 () Bool)

(assert (=> b!305797 (=> res!251281 e!220273)))

(declare-fun e!220272 () Bool)

(assert (=> b!305797 (= e!220272 e!220273)))

(declare-fun b!305798 () Bool)

(declare-fun Unit!21338 () Unit!21334)

(assert (=> b!305798 (= e!220270 Unit!21338)))

(declare-fun b!305799 () Bool)

(assert (=> b!305799 (= e!220273 call!5786)))

(declare-fun b!305800 () Bool)

(declare-fun lt!439203 () Unit!21334)

(assert (=> b!305800 (= e!220266 lt!439203)))

(declare-fun arrayRangesEqSlicedLemma!268 (array!18557 array!18557 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21334)

(assert (=> b!305800 (= lt!439203 (arrayRangesEqSlicedLemma!268 a1!948 a2!948 (_1!13270 lt!439201) (_2!13270 lt!439201) (_1!13270 lt!439202) (_2!13270 lt!439202)))))

(declare-fun arrayRangesEq!1673 (array!18557 array!18557 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!305800 (arrayRangesEq!1673 a1!948 a2!948 (_1!13270 lt!439202) (_2!13270 lt!439202))))

(declare-fun b!305801 () Bool)

(declare-fun res!251279 () Bool)

(assert (=> b!305801 (=> (not res!251279) (not e!220268))))

(assert (=> b!305801 (= res!251279 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!439206) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!305802 () Bool)

(assert (=> b!305802 (= e!220264 e!220272)))

(declare-fun res!251278 () Bool)

(assert (=> b!305802 (= res!251278 (byteRangesEq!0 (select (arr!9127 a1!948) (_3!1572 lt!439201)) (select (arr!9127 a2!948) (_3!1572 lt!439201)) lt!439209 #b00000000000000000000000000000111))))

(assert (=> b!305802 (=> (not res!251278) (not e!220272))))

(declare-fun b!305803 () Bool)

(declare-fun res!251280 () Bool)

(assert (=> b!305803 (=> (not res!251280) (not e!220268))))

(declare-fun arrayBitRangesEq!0 (array!18557 array!18557 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!305803 (= res!251280 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(assert (= (and start!68124 res!251282) b!305790))

(assert (= (and b!305790 res!251277) b!305803))

(assert (= (and b!305803 res!251280) b!305801))

(assert (= (and b!305801 res!251279) b!305789))

(assert (= (and b!305789 c!14838) b!305800))

(assert (= (and b!305789 (not c!14838)) b!305792))

(assert (= (and b!305789 c!14841) b!305791))

(assert (= (and b!305789 (not c!14841)) b!305802))

(assert (= (and b!305802 res!251278) b!305797))

(assert (= (and b!305797 (not res!251281)) b!305799))

(assert (= (or b!305791 b!305799) bm!5783))

(assert (= (and b!305789 res!251283) b!305795))

(assert (= (and b!305795 c!14839) b!305793))

(assert (= (and b!305795 (not c!14839)) b!305796))

(assert (= (and b!305795 c!14840) b!305794))

(assert (= (and b!305795 (not c!14840)) b!305798))

(declare-fun m!444243 () Bool)

(assert (=> b!305789 m!444243))

(declare-fun m!444245 () Bool)

(assert (=> b!305789 m!444245))

(declare-fun m!444247 () Bool)

(assert (=> b!305802 m!444247))

(declare-fun m!444249 () Bool)

(assert (=> b!305802 m!444249))

(assert (=> b!305802 m!444247))

(assert (=> b!305802 m!444249))

(declare-fun m!444251 () Bool)

(assert (=> b!305802 m!444251))

(assert (=> bm!5783 m!444249))

(declare-fun m!444253 () Bool)

(assert (=> bm!5783 m!444253))

(declare-fun m!444255 () Bool)

(assert (=> bm!5783 m!444255))

(assert (=> bm!5783 m!444247))

(declare-fun m!444257 () Bool)

(assert (=> bm!5783 m!444257))

(declare-fun m!444259 () Bool)

(assert (=> start!68124 m!444259))

(declare-fun m!444261 () Bool)

(assert (=> start!68124 m!444261))

(declare-fun m!444263 () Bool)

(assert (=> b!305803 m!444263))

(declare-fun m!444265 () Bool)

(assert (=> b!305794 m!444265))

(declare-fun m!444267 () Bool)

(assert (=> b!305794 m!444267))

(declare-fun m!444269 () Bool)

(assert (=> b!305794 m!444269))

(declare-fun m!444271 () Bool)

(assert (=> b!305800 m!444271))

(declare-fun m!444273 () Bool)

(assert (=> b!305800 m!444273))

(declare-fun m!444275 () Bool)

(assert (=> b!305793 m!444275))

(declare-fun m!444277 () Bool)

(assert (=> b!305793 m!444277))

(declare-fun m!444279 () Bool)

(assert (=> b!305793 m!444279))

(push 1)

(assert (not b!305803))

(assert (not bm!5783))

(assert (not b!305800))

(assert (not b!305793))

(assert (not b!305802))

(assert (not start!68124))

(assert (not b!305794))

(assert (not b!305789))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!102062 () Bool)

(assert (=> d!102062 (= (byteRangesEq!0 (select (arr!9127 a1!948) (_3!1572 lt!439201)) (select (arr!9127 a2!948) (_3!1572 lt!439201)) lt!439209 #b00000000000000000000000000000111) (or (= lt!439209 #b00000000000000000000000000000111) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9127 a1!948) (_3!1572 lt!439201))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!439209)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9127 a2!948) (_3!1572 lt!439201))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!439209)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26299 () Bool)

(assert (= bs!26299 d!102062))

(declare-fun m!444369 () Bool)

(assert (=> bs!26299 m!444369))

(declare-fun m!444371 () Bool)

(assert (=> bs!26299 m!444371))

(assert (=> b!305802 d!102062))

(declare-fun d!102066 () Bool)

(assert (=> d!102066 (= (byteRangesEq!0 (ite c!14841 (select (arr!9127 a1!948) (_3!1572 lt!439201)) (select (arr!9127 a1!948) (_4!615 lt!439201))) (ite c!14841 (select (arr!9127 a2!948) (_3!1572 lt!439201)) (select (arr!9127 a2!948) (_4!615 lt!439201))) (ite c!14841 lt!439209 #b00000000000000000000000000000000) lt!439208) (or (= (ite c!14841 lt!439209 #b00000000000000000000000000000000) lt!439208) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!14841 (select (arr!9127 a1!948) (_3!1572 lt!439201)) (select (arr!9127 a1!948) (_4!615 lt!439201)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!439208))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!14841 lt!439209 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!14841 (select (arr!9127 a2!948) (_3!1572 lt!439201)) (select (arr!9127 a2!948) (_4!615 lt!439201)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!439208))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!14841 lt!439209 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26300 () Bool)

(assert (= bs!26300 d!102066))

(declare-fun m!444373 () Bool)

(assert (=> bs!26300 m!444373))

(declare-fun m!444375 () Bool)

(assert (=> bs!26300 m!444375))

(assert (=> bm!5783 d!102066))

(declare-fun d!102068 () Bool)

(assert (=> d!102068 (= (array_inv!7656 a1!948) (bvsge (size!8044 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!68124 d!102068))

(declare-fun d!102070 () Bool)

(assert (=> d!102070 (= (array_inv!7656 a2!948) (bvsge (size!8044 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!68124 d!102070))

(declare-fun d!102072 () Bool)

(assert (=> d!102072 (and (bvsge (_4!615 lt!439202) #b00000000000000000000000000000000) (bvslt (_4!615 lt!439202) (size!8044 a1!948)) (bvslt (_4!615 lt!439202) (size!8044 a2!948)) (= (select (arr!9127 a1!948) (_4!615 lt!439202)) (select (arr!9127 a2!948) (_4!615 lt!439202))))))

(declare-fun lt!439288 () Unit!21334)

(declare-fun choose!609 (array!18557 array!18557 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21334)

(assert (=> d!102072 (= lt!439288 (choose!609 a1!948 a2!948 (_1!13270 lt!439201) (_4!615 lt!439202) (_2!13270 lt!439201)))))

(assert (=> d!102072 (and (bvsle #b00000000000000000000000000000000 (_1!13270 lt!439201)) (bvsle (_1!13270 lt!439201) (_2!13270 lt!439201)))))

(assert (=> d!102072 (= (arrayRangesEqImpliesEq!277 a1!948 a2!948 (_1!13270 lt!439201) (_4!615 lt!439202) (_2!13270 lt!439201)) lt!439288)))

(declare-fun bs!26301 () Bool)

(assert (= bs!26301 d!102072))

(assert (=> bs!26301 m!444267))

(assert (=> bs!26301 m!444269))

(declare-fun m!444377 () Bool)

(assert (=> bs!26301 m!444377))

(assert (=> b!305794 d!102072))

(declare-fun d!102074 () Bool)

(assert (=> d!102074 (arrayRangesEq!1673 a1!948 a2!948 (_1!13270 lt!439202) (_2!13270 lt!439202))))

(declare-fun lt!439291 () Unit!21334)

(declare-fun choose!610 (array!18557 array!18557 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21334)

(assert (=> d!102074 (= lt!439291 (choose!610 a1!948 a2!948 (_1!13270 lt!439201) (_2!13270 lt!439201) (_1!13270 lt!439202) (_2!13270 lt!439202)))))

(assert (=> d!102074 (and (bvsle #b00000000000000000000000000000000 (_1!13270 lt!439201)) (bvsle (_1!13270 lt!439201) (_2!13270 lt!439201)))))

(assert (=> d!102074 (= (arrayRangesEqSlicedLemma!268 a1!948 a2!948 (_1!13270 lt!439201) (_2!13270 lt!439201) (_1!13270 lt!439202) (_2!13270 lt!439202)) lt!439291)))

(declare-fun bs!26302 () Bool)

(assert (= bs!26302 d!102074))

(assert (=> bs!26302 m!444273))

(declare-fun m!444379 () Bool)

(assert (=> bs!26302 m!444379))

(assert (=> b!305800 d!102074))

(declare-fun d!102076 () Bool)

(declare-fun res!251345 () Bool)

(declare-fun e!220362 () Bool)

(assert (=> d!102076 (=> res!251345 e!220362)))

(assert (=> d!102076 (= res!251345 (= (_1!13270 lt!439202) (_2!13270 lt!439202)))))

(assert (=> d!102076 (= (arrayRangesEq!1673 a1!948 a2!948 (_1!13270 lt!439202) (_2!13270 lt!439202)) e!220362)))

(declare-fun b!305919 () Bool)

(declare-fun e!220363 () Bool)

(assert (=> b!305919 (= e!220362 e!220363)))

(declare-fun res!251346 () Bool)

(assert (=> b!305919 (=> (not res!251346) (not e!220363))))

(assert (=> b!305919 (= res!251346 (= (select (arr!9127 a1!948) (_1!13270 lt!439202)) (select (arr!9127 a2!948) (_1!13270 lt!439202))))))

(declare-fun b!305920 () Bool)

(assert (=> b!305920 (= e!220363 (arrayRangesEq!1673 a1!948 a2!948 (bvadd (_1!13270 lt!439202) #b00000000000000000000000000000001) (_2!13270 lt!439202)))))

(assert (= (and d!102076 (not res!251345)) b!305919))

(assert (= (and b!305919 res!251346) b!305920))

(declare-fun m!444395 () Bool)

(assert (=> b!305919 m!444395))

(declare-fun m!444397 () Bool)

(assert (=> b!305919 m!444397))

(declare-fun m!444399 () Bool)

(assert (=> b!305920 m!444399))

(assert (=> b!305800 d!102076))

(declare-fun lt!439305 () tuple4!1230)

(declare-fun call!5798 () Bool)

(declare-fun lt!439304 () (_ BitVec 32))

(declare-fun bm!5795 () Bool)

(declare-fun lt!439306 () (_ BitVec 32))

(declare-fun c!14871 () Bool)

(assert (=> bm!5795 (= call!5798 (byteRangesEq!0 (select (arr!9127 a1!948) (_3!1572 lt!439305)) (select (arr!9127 a2!948) (_3!1572 lt!439305)) lt!439304 (ite c!14871 lt!439306 #b00000000000000000000000000001000)))))

(declare-fun e!220386 () Bool)

(declare-fun b!305941 () Bool)

(assert (=> b!305941 (= e!220386 (arrayRangesEq!1673 a1!948 a2!948 (_1!13270 lt!439305) (_2!13270 lt!439305)))))

(declare-fun d!102080 () Bool)

(declare-fun res!251363 () Bool)

(declare-fun e!220385 () Bool)

(assert (=> d!102080 (=> res!251363 e!220385)))

(assert (=> d!102080 (= res!251363 (bvsge fromBit!258 toBit!258))))

(assert (=> d!102080 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!220385)))

(declare-fun b!305942 () Bool)

(declare-fun res!251365 () Bool)

(assert (=> b!305942 (= res!251365 (= lt!439306 #b00000000000000000000000000000000))))

(declare-fun e!220387 () Bool)

(assert (=> b!305942 (=> res!251365 e!220387)))

(declare-fun e!220384 () Bool)

(assert (=> b!305942 (= e!220384 e!220387)))

(declare-fun b!305943 () Bool)

(declare-fun e!220383 () Bool)

(declare-fun e!220382 () Bool)

(assert (=> b!305943 (= e!220383 e!220382)))

(assert (=> b!305943 (= c!14871 (= (_3!1572 lt!439305) (_4!615 lt!439305)))))

(declare-fun b!305944 () Bool)

(assert (=> b!305944 (= e!220385 e!220383)))

(declare-fun res!251364 () Bool)

(assert (=> b!305944 (=> (not res!251364) (not e!220383))))

(assert (=> b!305944 (= res!251364 e!220386)))

(declare-fun res!251367 () Bool)

(assert (=> b!305944 (=> res!251367 e!220386)))

(assert (=> b!305944 (= res!251367 (bvsge (_1!13270 lt!439305) (_2!13270 lt!439305)))))

(assert (=> b!305944 (= lt!439306 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!305944 (= lt!439304 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!305944 (= lt!439305 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!305945 () Bool)

(assert (=> b!305945 (= e!220382 e!220384)))

(declare-fun res!251366 () Bool)

(assert (=> b!305945 (= res!251366 call!5798)))

(assert (=> b!305945 (=> (not res!251366) (not e!220384))))

(declare-fun b!305946 () Bool)

(assert (=> b!305946 (= e!220382 call!5798)))

(declare-fun b!305947 () Bool)

(assert (=> b!305947 (= e!220387 (byteRangesEq!0 (select (arr!9127 a1!948) (_4!615 lt!439305)) (select (arr!9127 a2!948) (_4!615 lt!439305)) #b00000000000000000000000000000000 lt!439306))))

(assert (= (and d!102080 (not res!251363)) b!305944))

(assert (= (and b!305944 (not res!251367)) b!305941))

(assert (= (and b!305944 res!251364) b!305943))

(assert (= (and b!305943 c!14871) b!305946))

(assert (= (and b!305943 (not c!14871)) b!305945))

(assert (= (and b!305945 res!251366) b!305942))

(assert (= (and b!305942 (not res!251365)) b!305947))

(assert (= (or b!305946 b!305945) bm!5795))

(declare-fun m!444409 () Bool)

(assert (=> bm!5795 m!444409))

(declare-fun m!444411 () Bool)

(assert (=> bm!5795 m!444411))

(assert (=> bm!5795 m!444409))

(assert (=> bm!5795 m!444411))

(declare-fun m!444413 () Bool)

(assert (=> bm!5795 m!444413))

(declare-fun m!444415 () Bool)

(assert (=> b!305941 m!444415))

(assert (=> b!305944 m!444245))

(declare-fun m!444417 () Bool)

(assert (=> b!305947 m!444417))

(declare-fun m!444419 () Bool)

(assert (=> b!305947 m!444419))

(assert (=> b!305947 m!444417))

(assert (=> b!305947 m!444419))

(declare-fun m!444421 () Bool)

(assert (=> b!305947 m!444421))

(assert (=> b!305803 d!102080))

(declare-fun d!102094 () Bool)

(assert (=> d!102094 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1231 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!305789 d!102094))

(declare-fun d!102096 () Bool)

(assert (=> d!102096 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1231 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!305789 d!102096))

(declare-fun d!102098 () Bool)

(assert (=> d!102098 (and (bvsge (_3!1572 lt!439202) #b00000000000000000000000000000000) (bvslt (_3!1572 lt!439202) (size!8044 a1!948)) (bvslt (_3!1572 lt!439202) (size!8044 a2!948)) (= (select (arr!9127 a1!948) (_3!1572 lt!439202)) (select (arr!9127 a2!948) (_3!1572 lt!439202))))))

(declare-fun lt!439307 () Unit!21334)

(assert (=> d!102098 (= lt!439307 (choose!609 a1!948 a2!948 (_1!13270 lt!439201) (_3!1572 lt!439202) (_2!13270 lt!439201)))))

(assert (=> d!102098 (and (bvsle #b00000000000000000000000000000000 (_1!13270 lt!439201)) (bvsle (_1!13270 lt!439201) (_2!13270 lt!439201)))))

(assert (=> d!102098 (= (arrayRangesEqImpliesEq!277 a1!948 a2!948 (_1!13270 lt!439201) (_3!1572 lt!439202) (_2!13270 lt!439201)) lt!439307)))

(declare-fun bs!26304 () Bool)

(assert (= bs!26304 d!102098))

(assert (=> bs!26304 m!444277))

(assert (=> bs!26304 m!444279))

(declare-fun m!444423 () Bool)

(assert (=> bs!26304 m!444423))

(assert (=> b!305793 d!102098))

(push 1)

(assert (not d!102072))

(assert (not d!102098))

(assert (not b!305947))

(assert (not b!305944))

(assert (not bm!5795))

(assert (not b!305920))

(assert (not d!102074))

(assert (not b!305941))

(check-sat)

(pop 1)

(push 1)

(check-sat)

