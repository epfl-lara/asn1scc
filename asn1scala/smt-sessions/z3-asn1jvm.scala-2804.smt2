; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67514 () Bool)

(assert start!67514)

(declare-fun res!249491 () Bool)

(declare-fun e!218077 () Bool)

(assert (=> start!67514 (=> (not res!249491) (not e!218077))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18421 0))(
  ( (array!18422 (arr!9080 (Array (_ BitVec 32) (_ BitVec 8))) (size!7997 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18421)

(declare-fun a2!948 () array!18421)

(declare-fun toBit!258 () (_ BitVec 64))

(assert (=> start!67514 (= res!249491 (and (bvsle (size!7997 a1!948) (size!7997 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67514 e!218077))

(assert (=> start!67514 true))

(declare-fun array_inv!7609 (array!18421) Bool)

(assert (=> start!67514 (array_inv!7609 a1!948)))

(assert (=> start!67514 (array_inv!7609 a2!948)))

(declare-fun b!303149 () Bool)

(declare-fun res!249492 () Bool)

(declare-fun e!218079 () Bool)

(assert (=> b!303149 (=> (not res!249492) (not e!218079))))

(declare-fun lt!437624 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!303149 (= res!249492 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437624) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!303150 () Bool)

(declare-datatypes ((Unit!21172 0))(
  ( (Unit!21173) )
))
(declare-fun e!218080 () Unit!21172)

(declare-fun Unit!21174 () Unit!21172)

(assert (=> b!303150 (= e!218080 Unit!21174)))

(declare-fun b!303151 () Bool)

(declare-fun res!249489 () Bool)

(assert (=> b!303151 (=> (not res!249489) (not e!218079))))

(declare-fun arrayBitRangesEq!0 (array!18421 array!18421 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!303151 (= res!249489 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!303152 () Bool)

(assert (=> b!303152 (= e!218077 e!218079)))

(declare-fun res!249490 () Bool)

(assert (=> b!303152 (=> (not res!249490) (not e!218079))))

(assert (=> b!303152 (= res!249490 (and (bvsle toBit!258 lt!437624) (bvsle fromBit!258 lt!437624)))))

(assert (=> b!303152 (= lt!437624 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7997 a1!948))))))

(declare-fun b!303153 () Bool)

(declare-fun lt!437625 () Unit!21172)

(assert (=> b!303153 (= e!218080 lt!437625)))

(declare-datatypes ((tuple4!1136 0))(
  ( (tuple4!1137 (_1!13223 (_ BitVec 32)) (_2!13223 (_ BitVec 32)) (_3!1525 (_ BitVec 32)) (_4!568 (_ BitVec 32))) )
))
(declare-fun lt!437627 () tuple4!1136)

(declare-fun lt!437628 () tuple4!1136)

(declare-fun arrayRangesEqSlicedLemma!221 (array!18421 array!18421 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21172)

(assert (=> b!303153 (= lt!437625 (arrayRangesEqSlicedLemma!221 a1!948 a2!948 (_1!13223 lt!437628) (_2!13223 lt!437628) (_1!13223 lt!437627) (_2!13223 lt!437627)))))

(declare-fun arrayRangesEq!1626 (array!18421 array!18421 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!303153 (arrayRangesEq!1626 a1!948 a2!948 (_1!13223 lt!437627) (_2!13223 lt!437627))))

(declare-fun b!303154 () Bool)

(assert (=> b!303154 (= e!218079 (and (= (_3!1525 lt!437628) (_4!568 lt!437628)) (or (bvslt (_3!1525 lt!437628) #b00000000000000000000000000000000) (bvsge (_3!1525 lt!437628) (size!7997 a2!948)))))))

(declare-fun lt!437626 () Unit!21172)

(assert (=> b!303154 (= lt!437626 e!218080)))

(declare-fun c!14412 () Bool)

(assert (=> b!303154 (= c!14412 (bvslt (_1!13223 lt!437627) (_2!13223 lt!437627)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1136)

(assert (=> b!303154 (= lt!437627 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!303154 (= lt!437628 (arrayBitIndices!0 fromBit!258 toBit!258))))

(assert (= (and start!67514 res!249491) b!303152))

(assert (= (and b!303152 res!249490) b!303151))

(assert (= (and b!303151 res!249489) b!303149))

(assert (= (and b!303149 res!249492) b!303154))

(assert (= (and b!303154 c!14412) b!303153))

(assert (= (and b!303154 (not c!14412)) b!303150))

(declare-fun m!441815 () Bool)

(assert (=> start!67514 m!441815))

(declare-fun m!441817 () Bool)

(assert (=> start!67514 m!441817))

(declare-fun m!441819 () Bool)

(assert (=> b!303151 m!441819))

(declare-fun m!441821 () Bool)

(assert (=> b!303153 m!441821))

(declare-fun m!441823 () Bool)

(assert (=> b!303153 m!441823))

(declare-fun m!441825 () Bool)

(assert (=> b!303154 m!441825))

(declare-fun m!441827 () Bool)

(assert (=> b!303154 m!441827))

(check-sat (not b!303154) (not start!67514) (not b!303153) (not b!303151))
(check-sat)
(get-model)

(declare-fun d!101266 () Bool)

(assert (=> d!101266 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1137 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!303154 d!101266))

(declare-fun d!101268 () Bool)

(assert (=> d!101268 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1137 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!303154 d!101268))

(declare-fun d!101270 () Bool)

(assert (=> d!101270 (= (array_inv!7609 a1!948) (bvsge (size!7997 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67514 d!101270))

(declare-fun d!101272 () Bool)

(assert (=> d!101272 (= (array_inv!7609 a2!948) (bvsge (size!7997 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67514 d!101272))

(declare-fun d!101274 () Bool)

(assert (=> d!101274 (arrayRangesEq!1626 a1!948 a2!948 (_1!13223 lt!437627) (_2!13223 lt!437627))))

(declare-fun lt!437646 () Unit!21172)

(declare-fun choose!551 (array!18421 array!18421 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21172)

(assert (=> d!101274 (= lt!437646 (choose!551 a1!948 a2!948 (_1!13223 lt!437628) (_2!13223 lt!437628) (_1!13223 lt!437627) (_2!13223 lt!437627)))))

(assert (=> d!101274 (and (bvsle #b00000000000000000000000000000000 (_1!13223 lt!437628)) (bvsle (_1!13223 lt!437628) (_2!13223 lt!437628)))))

(assert (=> d!101274 (= (arrayRangesEqSlicedLemma!221 a1!948 a2!948 (_1!13223 lt!437628) (_2!13223 lt!437628) (_1!13223 lt!437627) (_2!13223 lt!437627)) lt!437646)))

(declare-fun bs!26127 () Bool)

(assert (= bs!26127 d!101274))

(assert (=> bs!26127 m!441823))

(declare-fun m!441843 () Bool)

(assert (=> bs!26127 m!441843))

(assert (=> b!303153 d!101274))

(declare-fun d!101276 () Bool)

(declare-fun res!249509 () Bool)

(declare-fun e!218100 () Bool)

(assert (=> d!101276 (=> res!249509 e!218100)))

(assert (=> d!101276 (= res!249509 (= (_1!13223 lt!437627) (_2!13223 lt!437627)))))

(assert (=> d!101276 (= (arrayRangesEq!1626 a1!948 a2!948 (_1!13223 lt!437627) (_2!13223 lt!437627)) e!218100)))

(declare-fun b!303177 () Bool)

(declare-fun e!218101 () Bool)

(assert (=> b!303177 (= e!218100 e!218101)))

(declare-fun res!249510 () Bool)

(assert (=> b!303177 (=> (not res!249510) (not e!218101))))

(assert (=> b!303177 (= res!249510 (= (select (arr!9080 a1!948) (_1!13223 lt!437627)) (select (arr!9080 a2!948) (_1!13223 lt!437627))))))

(declare-fun b!303178 () Bool)

(assert (=> b!303178 (= e!218101 (arrayRangesEq!1626 a1!948 a2!948 (bvadd (_1!13223 lt!437627) #b00000000000000000000000000000001) (_2!13223 lt!437627)))))

(assert (= (and d!101276 (not res!249509)) b!303177))

(assert (= (and b!303177 res!249510) b!303178))

(declare-fun m!441845 () Bool)

(assert (=> b!303177 m!441845))

(declare-fun m!441847 () Bool)

(assert (=> b!303177 m!441847))

(declare-fun m!441849 () Bool)

(assert (=> b!303178 m!441849))

(assert (=> b!303153 d!101276))

(declare-fun b!303205 () Bool)

(declare-fun e!218126 () Bool)

(declare-fun e!218129 () Bool)

(assert (=> b!303205 (= e!218126 e!218129)))

(declare-fun res!249533 () Bool)

(assert (=> b!303205 (=> (not res!249533) (not e!218129))))

(declare-fun e!218130 () Bool)

(assert (=> b!303205 (= res!249533 e!218130)))

(declare-fun res!249534 () Bool)

(assert (=> b!303205 (=> res!249534 e!218130)))

(declare-fun lt!437660 () tuple4!1136)

(assert (=> b!303205 (= res!249534 (bvsge (_1!13223 lt!437660) (_2!13223 lt!437660)))))

(declare-fun lt!437659 () (_ BitVec 32))

(assert (=> b!303205 (= lt!437659 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!437661 () (_ BitVec 32))

(assert (=> b!303205 (= lt!437661 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!303205 (= lt!437660 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!303206 () Bool)

(declare-fun res!249537 () Bool)

(assert (=> b!303206 (= res!249537 (= lt!437659 #b00000000000000000000000000000000))))

(declare-fun e!218131 () Bool)

(assert (=> b!303206 (=> res!249537 e!218131)))

(declare-fun e!218128 () Bool)

(assert (=> b!303206 (= e!218128 e!218131)))

(declare-fun b!303207 () Bool)

(declare-fun e!218127 () Bool)

(assert (=> b!303207 (= e!218127 e!218128)))

(declare-fun res!249535 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!303207 (= res!249535 (byteRangesEq!0 (select (arr!9080 a1!948) (_3!1525 lt!437660)) (select (arr!9080 a2!948) (_3!1525 lt!437660)) lt!437661 #b00000000000000000000000000001000))))

(assert (=> b!303207 (=> (not res!249535) (not e!218128))))

(declare-fun b!303208 () Bool)

(assert (=> b!303208 (= e!218130 (arrayRangesEq!1626 a1!948 a2!948 (_1!13223 lt!437660) (_2!13223 lt!437660)))))

(declare-fun d!101280 () Bool)

(declare-fun res!249536 () Bool)

(assert (=> d!101280 (=> res!249536 e!218126)))

(assert (=> d!101280 (= res!249536 (bvsge fromBit!258 toBit!258))))

(assert (=> d!101280 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!218126)))

(declare-fun b!303209 () Bool)

(assert (=> b!303209 (= e!218129 e!218127)))

(declare-fun c!14418 () Bool)

(assert (=> b!303209 (= c!14418 (= (_3!1525 lt!437660) (_4!568 lt!437660)))))

(declare-fun b!303210 () Bool)

(declare-fun call!5570 () Bool)

(assert (=> b!303210 (= e!218131 call!5570)))

(declare-fun bm!5567 () Bool)

(assert (=> bm!5567 (= call!5570 (byteRangesEq!0 (ite c!14418 (select (arr!9080 a1!948) (_3!1525 lt!437660)) (select (arr!9080 a1!948) (_4!568 lt!437660))) (ite c!14418 (select (arr!9080 a2!948) (_3!1525 lt!437660)) (select (arr!9080 a2!948) (_4!568 lt!437660))) (ite c!14418 lt!437661 #b00000000000000000000000000000000) lt!437659))))

(declare-fun b!303211 () Bool)

(assert (=> b!303211 (= e!218127 call!5570)))

(assert (= (and d!101280 (not res!249536)) b!303205))

(assert (= (and b!303205 (not res!249534)) b!303208))

(assert (= (and b!303205 res!249533) b!303209))

(assert (= (and b!303209 c!14418) b!303211))

(assert (= (and b!303209 (not c!14418)) b!303207))

(assert (= (and b!303207 res!249535) b!303206))

(assert (= (and b!303206 (not res!249537)) b!303210))

(assert (= (or b!303211 b!303210) bm!5567))

(assert (=> b!303205 m!441827))

(declare-fun m!441867 () Bool)

(assert (=> b!303207 m!441867))

(declare-fun m!441869 () Bool)

(assert (=> b!303207 m!441869))

(assert (=> b!303207 m!441867))

(assert (=> b!303207 m!441869))

(declare-fun m!441871 () Bool)

(assert (=> b!303207 m!441871))

(declare-fun m!441873 () Bool)

(assert (=> b!303208 m!441873))

(declare-fun m!441875 () Bool)

(assert (=> bm!5567 m!441875))

(declare-fun m!441877 () Bool)

(assert (=> bm!5567 m!441877))

(declare-fun m!441879 () Bool)

(assert (=> bm!5567 m!441879))

(assert (=> bm!5567 m!441867))

(assert (=> bm!5567 m!441869))

(assert (=> b!303151 d!101280))

(check-sat (not b!303205) (not d!101274) (not bm!5567) (not b!303208) (not b!303178) (not b!303207))
(check-sat)
