; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67512 () Bool)

(assert start!67512)

(declare-fun b!303131 () Bool)

(declare-fun res!249477 () Bool)

(declare-fun e!218064 () Bool)

(assert (=> b!303131 (=> (not res!249477) (not e!218064))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18419 0))(
  ( (array!18420 (arr!9079 (Array (_ BitVec 32) (_ BitVec 8))) (size!7996 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18419)

(declare-fun a2!948 () array!18419)

(declare-fun arrayBitRangesEq!0 (array!18419 array!18419 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!303131 (= res!249477 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!303132 () Bool)

(declare-fun e!218062 () Bool)

(assert (=> b!303132 (= e!218062 e!218064)))

(declare-fun res!249478 () Bool)

(assert (=> b!303132 (=> (not res!249478) (not e!218064))))

(declare-fun lt!437609 () (_ BitVec 64))

(assert (=> b!303132 (= res!249478 (and (bvsle toBit!258 lt!437609) (bvsle fromBit!258 lt!437609)))))

(assert (=> b!303132 (= lt!437609 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7996 a1!948))))))

(declare-fun res!249480 () Bool)

(assert (=> start!67512 (=> (not res!249480) (not e!218062))))

(assert (=> start!67512 (= res!249480 (and (bvsle (size!7996 a1!948) (size!7996 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67512 e!218062))

(assert (=> start!67512 true))

(declare-fun array_inv!7608 (array!18419) Bool)

(assert (=> start!67512 (array_inv!7608 a1!948)))

(assert (=> start!67512 (array_inv!7608 a2!948)))

(declare-fun b!303133 () Bool)

(declare-datatypes ((Unit!21169 0))(
  ( (Unit!21170) )
))
(declare-fun e!218061 () Unit!21169)

(declare-fun lt!437612 () Unit!21169)

(assert (=> b!303133 (= e!218061 lt!437612)))

(declare-datatypes ((tuple4!1134 0))(
  ( (tuple4!1135 (_1!13222 (_ BitVec 32)) (_2!13222 (_ BitVec 32)) (_3!1524 (_ BitVec 32)) (_4!567 (_ BitVec 32))) )
))
(declare-fun lt!437613 () tuple4!1134)

(declare-fun lt!437611 () tuple4!1134)

(declare-fun arrayRangesEqSlicedLemma!220 (array!18419 array!18419 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21169)

(assert (=> b!303133 (= lt!437612 (arrayRangesEqSlicedLemma!220 a1!948 a2!948 (_1!13222 lt!437613) (_2!13222 lt!437613) (_1!13222 lt!437611) (_2!13222 lt!437611)))))

(declare-fun arrayRangesEq!1625 (array!18419 array!18419 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!303133 (arrayRangesEq!1625 a1!948 a2!948 (_1!13222 lt!437611) (_2!13222 lt!437611))))

(declare-fun b!303134 () Bool)

(assert (=> b!303134 (= e!218064 (and (= (_3!1524 lt!437613) (_4!567 lt!437613)) (or (bvslt (_3!1524 lt!437613) #b00000000000000000000000000000000) (bvsge (_3!1524 lt!437613) (size!7996 a2!948)))))))

(declare-fun lt!437610 () Unit!21169)

(assert (=> b!303134 (= lt!437610 e!218061)))

(declare-fun c!14409 () Bool)

(assert (=> b!303134 (= c!14409 (bvslt (_1!13222 lt!437611) (_2!13222 lt!437611)))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1134)

(assert (=> b!303134 (= lt!437611 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!303134 (= lt!437613 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!303135 () Bool)

(declare-fun Unit!21171 () Unit!21169)

(assert (=> b!303135 (= e!218061 Unit!21171)))

(declare-fun b!303136 () Bool)

(declare-fun res!249479 () Bool)

(assert (=> b!303136 (=> (not res!249479) (not e!218064))))

(assert (=> b!303136 (= res!249479 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437609) (not (= fromSlice!52 toSlice!52))))))

(assert (= (and start!67512 res!249480) b!303132))

(assert (= (and b!303132 res!249478) b!303131))

(assert (= (and b!303131 res!249477) b!303136))

(assert (= (and b!303136 res!249479) b!303134))

(assert (= (and b!303134 c!14409) b!303133))

(assert (= (and b!303134 (not c!14409)) b!303135))

(declare-fun m!441801 () Bool)

(assert (=> b!303131 m!441801))

(declare-fun m!441803 () Bool)

(assert (=> start!67512 m!441803))

(declare-fun m!441805 () Bool)

(assert (=> start!67512 m!441805))

(declare-fun m!441807 () Bool)

(assert (=> b!303133 m!441807))

(declare-fun m!441809 () Bool)

(assert (=> b!303133 m!441809))

(declare-fun m!441811 () Bool)

(assert (=> b!303134 m!441811))

(declare-fun m!441813 () Bool)

(assert (=> b!303134 m!441813))

(push 1)

(assert (not b!303134))

(assert (not b!303133))

(assert (not b!303131))

(assert (not start!67512))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!101278 () Bool)

(assert (=> d!101278 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1135 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!303134 d!101278))

(declare-fun d!101282 () Bool)

(assert (=> d!101282 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1135 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!303134 d!101282))

(declare-fun d!101284 () Bool)

(assert (=> d!101284 (arrayRangesEq!1625 a1!948 a2!948 (_1!13222 lt!437611) (_2!13222 lt!437611))))

(declare-fun lt!437649 () Unit!21169)

(declare-fun choose!552 (array!18419 array!18419 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21169)

(assert (=> d!101284 (= lt!437649 (choose!552 a1!948 a2!948 (_1!13222 lt!437613) (_2!13222 lt!437613) (_1!13222 lt!437611) (_2!13222 lt!437611)))))

(assert (=> d!101284 (and (bvsle #b00000000000000000000000000000000 (_1!13222 lt!437613)) (bvsle (_1!13222 lt!437613) (_2!13222 lt!437613)))))

(assert (=> d!101284 (= (arrayRangesEqSlicedLemma!220 a1!948 a2!948 (_1!13222 lt!437613) (_2!13222 lt!437613) (_1!13222 lt!437611) (_2!13222 lt!437611)) lt!437649)))

(declare-fun bs!26128 () Bool)

(assert (= bs!26128 d!101284))

(assert (=> bs!26128 m!441809))

(declare-fun m!441851 () Bool)

(assert (=> bs!26128 m!441851))

(assert (=> b!303133 d!101284))

(declare-fun d!101288 () Bool)

(declare-fun res!249515 () Bool)

(declare-fun e!218106 () Bool)

(assert (=> d!101288 (=> res!249515 e!218106)))

(assert (=> d!101288 (= res!249515 (= (_1!13222 lt!437611) (_2!13222 lt!437611)))))

(assert (=> d!101288 (= (arrayRangesEq!1625 a1!948 a2!948 (_1!13222 lt!437611) (_2!13222 lt!437611)) e!218106)))

(declare-fun b!303183 () Bool)

(declare-fun e!218107 () Bool)

(assert (=> b!303183 (= e!218106 e!218107)))

(declare-fun res!249516 () Bool)

(assert (=> b!303183 (=> (not res!249516) (not e!218107))))

(assert (=> b!303183 (= res!249516 (= (select (arr!9079 a1!948) (_1!13222 lt!437611)) (select (arr!9079 a2!948) (_1!13222 lt!437611))))))

(declare-fun b!303184 () Bool)

(assert (=> b!303184 (= e!218107 (arrayRangesEq!1625 a1!948 a2!948 (bvadd (_1!13222 lt!437611) #b00000000000000000000000000000001) (_2!13222 lt!437611)))))

(assert (= (and d!101288 (not res!249515)) b!303183))

(assert (= (and b!303183 res!249516) b!303184))

(declare-fun m!441853 () Bool)

(assert (=> b!303183 m!441853))

(declare-fun m!441855 () Bool)

(assert (=> b!303183 m!441855))

(declare-fun m!441857 () Bool)

(assert (=> b!303184 m!441857))

(assert (=> b!303133 d!101288))

(declare-fun d!101290 () Bool)

(declare-fun res!249551 () Bool)

(declare-fun e!218146 () Bool)

(assert (=> d!101290 (=> res!249551 e!218146)))

(assert (=> d!101290 (= res!249551 (bvsge fromBit!258 toBit!258))))

(assert (=> d!101290 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!218146)))

(declare-fun b!303226 () Bool)

(declare-fun e!218148 () Bool)

(declare-fun e!218144 () Bool)

(assert (=> b!303226 (= e!218148 e!218144)))

(declare-fun res!249550 () Bool)

(declare-fun call!5573 () Bool)

(assert (=> b!303226 (= res!249550 call!5573)))

(assert (=> b!303226 (=> (not res!249550) (not e!218144))))

(declare-fun e!218147 () Bool)

(declare-fun lt!437668 () (_ BitVec 32))

(declare-fun b!303227 () Bool)

(declare-fun lt!437670 () tuple4!1134)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!303227 (= e!218147 (byteRangesEq!0 (select (arr!9079 a1!948) (_4!567 lt!437670)) (select (arr!9079 a2!948) (_4!567 lt!437670)) #b00000000000000000000000000000000 lt!437668))))

(declare-fun b!303228 () Bool)

(assert (=> b!303228 (= e!218148 call!5573)))

(declare-fun c!14421 () Bool)

(declare-fun bm!5570 () Bool)

(declare-fun lt!437669 () (_ BitVec 32))

(assert (=> bm!5570 (= call!5573 (byteRangesEq!0 (select (arr!9079 a1!948) (_3!1524 lt!437670)) (select (arr!9079 a2!948) (_3!1524 lt!437670)) lt!437669 (ite c!14421 lt!437668 #b00000000000000000000000000001000)))))

(declare-fun e!218149 () Bool)

(declare-fun b!303229 () Bool)

(assert (=> b!303229 (= e!218149 (arrayRangesEq!1625 a1!948 a2!948 (_1!13222 lt!437670) (_2!13222 lt!437670)))))

(declare-fun b!303230 () Bool)

(declare-fun res!249552 () Bool)

(assert (=> b!303230 (= res!249552 (= lt!437668 #b00000000000000000000000000000000))))

(assert (=> b!303230 (=> res!249552 e!218147)))

(assert (=> b!303230 (= e!218144 e!218147)))

(declare-fun b!303231 () Bool)

(declare-fun e!218145 () Bool)

(assert (=> b!303231 (= e!218145 e!218148)))

(assert (=> b!303231 (= c!14421 (= (_3!1524 lt!437670) (_4!567 lt!437670)))))

(declare-fun b!303232 () Bool)

(assert (=> b!303232 (= e!218146 e!218145)))

(declare-fun res!249548 () Bool)

(assert (=> b!303232 (=> (not res!249548) (not e!218145))))

(assert (=> b!303232 (= res!249548 e!218149)))

(declare-fun res!249549 () Bool)

(assert (=> b!303232 (=> res!249549 e!218149)))

(assert (=> b!303232 (= res!249549 (bvsge (_1!13222 lt!437670) (_2!13222 lt!437670)))))

(assert (=> b!303232 (= lt!437668 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!303232 (= lt!437669 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!303232 (= lt!437670 (arrayBitIndices!0 fromBit!258 toBit!258))))

(assert (= (and d!101290 (not res!249551)) b!303232))

(assert (= (and b!303232 (not res!249549)) b!303229))

(assert (= (and b!303232 res!249548) b!303231))

(assert (= (and b!303231 c!14421) b!303228))

(assert (= (and b!303231 (not c!14421)) b!303226))

(assert (= (and b!303226 res!249550) b!303230))

(assert (= (and b!303230 (not res!249552)) b!303227))

(assert (= (or b!303228 b!303226) bm!5570))

(declare-fun m!441881 () Bool)

(assert (=> b!303227 m!441881))

(declare-fun m!441883 () Bool)

(assert (=> b!303227 m!441883))

(assert (=> b!303227 m!441881))

(assert (=> b!303227 m!441883))

(declare-fun m!441885 () Bool)

(assert (=> b!303227 m!441885))

(declare-fun m!441887 () Bool)

(assert (=> bm!5570 m!441887))

(declare-fun m!441889 () Bool)

(assert (=> bm!5570 m!441889))

(assert (=> bm!5570 m!441887))

(assert (=> bm!5570 m!441889))

(declare-fun m!441891 () Bool)

(assert (=> bm!5570 m!441891))

(declare-fun m!441893 () Bool)

(assert (=> b!303229 m!441893))

(assert (=> b!303232 m!441813))

(assert (=> b!303131 d!101290))

(declare-fun d!101304 () Bool)

(assert (=> d!101304 (= (array_inv!7608 a1!948) (bvsge (size!7996 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67512 d!101304))

(declare-fun d!101306 () Bool)

(assert (=> d!101306 (= (array_inv!7608 a2!948) (bvsge (size!7996 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67512 d!101306))

(push 1)

(assert (not b!303232))

(assert (not b!303227))

(assert (not b!303229))

(assert (not d!101284))

(assert (not bm!5570))

(assert (not b!303184))

(check-sat)

