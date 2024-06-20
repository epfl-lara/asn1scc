; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67424 () Bool)

(assert start!67424)

(declare-fun b!302782 () Bool)

(declare-datatypes ((tuple4!1118 0))(
  ( (tuple4!1119 (_1!13214 (_ BitVec 32)) (_2!13214 (_ BitVec 32)) (_3!1516 (_ BitVec 32)) (_4!559 (_ BitVec 32))) )
))
(declare-fun lt!437425 () tuple4!1118)

(declare-datatypes ((array!18394 0))(
  ( (array!18395 (arr!9071 (Array (_ BitVec 32) (_ BitVec 8))) (size!7988 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18394)

(declare-fun lt!437426 () tuple4!1118)

(declare-fun e!217747 () Bool)

(assert (=> b!302782 (= e!217747 (and (bvslt (_1!13214 lt!437425) (_2!13214 lt!437425)) (bvsle #b00000000000000000000000000000000 (_1!13214 lt!437426)) (bvsle (_1!13214 lt!437426) (_2!13214 lt!437426)) (bvsle (_2!13214 lt!437426) (size!7988 a1!948)) (or (bvsgt (_1!13214 lt!437426) (_1!13214 lt!437425)) (bvsgt (_1!13214 lt!437425) (_2!13214 lt!437425)) (bvsgt (_2!13214 lt!437425) (_2!13214 lt!437426)))))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1118)

(assert (=> b!302782 (= lt!437425 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(assert (=> b!302782 (= lt!437426 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!302779 () Bool)

(declare-fun e!217750 () Bool)

(assert (=> b!302779 (= e!217750 e!217747)))

(declare-fun res!249204 () Bool)

(assert (=> b!302779 (=> (not res!249204) (not e!217747))))

(declare-fun lt!437427 () (_ BitVec 64))

(assert (=> b!302779 (= res!249204 (and (bvsle toBit!258 lt!437427) (bvsle fromBit!258 lt!437427)))))

(assert (=> b!302779 (= lt!437427 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7988 a1!948))))))

(declare-fun res!249203 () Bool)

(assert (=> start!67424 (=> (not res!249203) (not e!217750))))

(declare-fun a2!948 () array!18394)

(assert (=> start!67424 (= res!249203 (and (bvsle (size!7988 a1!948) (size!7988 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67424 e!217750))

(assert (=> start!67424 true))

(declare-fun array_inv!7600 (array!18394) Bool)

(assert (=> start!67424 (array_inv!7600 a1!948)))

(assert (=> start!67424 (array_inv!7600 a2!948)))

(declare-fun b!302781 () Bool)

(declare-fun res!249202 () Bool)

(assert (=> b!302781 (=> (not res!249202) (not e!217747))))

(assert (=> b!302781 (= res!249202 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437427) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!302780 () Bool)

(declare-fun res!249201 () Bool)

(assert (=> b!302780 (=> (not res!249201) (not e!217747))))

(declare-fun arrayBitRangesEq!0 (array!18394 array!18394 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!302780 (= res!249201 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(assert (= (and start!67424 res!249203) b!302779))

(assert (= (and b!302779 res!249204) b!302780))

(assert (= (and b!302780 res!249201) b!302781))

(assert (= (and b!302781 res!249202) b!302782))

(declare-fun m!441535 () Bool)

(assert (=> b!302782 m!441535))

(declare-fun m!441537 () Bool)

(assert (=> b!302782 m!441537))

(declare-fun m!441539 () Bool)

(assert (=> start!67424 m!441539))

(declare-fun m!441541 () Bool)

(assert (=> start!67424 m!441541))

(declare-fun m!441543 () Bool)

(assert (=> b!302780 m!441543))

(check-sat (not start!67424) (not b!302780) (not b!302782))
(check-sat)
(get-model)

(declare-fun d!101152 () Bool)

(assert (=> d!101152 (= (array_inv!7600 a1!948) (bvsge (size!7988 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67424 d!101152))

(declare-fun d!101154 () Bool)

(assert (=> d!101154 (= (array_inv!7600 a2!948) (bvsge (size!7988 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67424 d!101154))

(declare-fun d!101156 () Bool)

(declare-fun res!249228 () Bool)

(declare-fun e!217777 () Bool)

(assert (=> d!101156 (=> res!249228 e!217777)))

(assert (=> d!101156 (= res!249228 (bvsge fromBit!258 toBit!258))))

(assert (=> d!101156 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!217777)))

(declare-fun b!302809 () Bool)

(declare-fun e!217779 () Bool)

(declare-fun e!217778 () Bool)

(assert (=> b!302809 (= e!217779 e!217778)))

(declare-fun res!249230 () Bool)

(declare-fun call!5543 () Bool)

(assert (=> b!302809 (= res!249230 call!5543)))

(assert (=> b!302809 (=> (not res!249230) (not e!217778))))

(declare-fun b!302810 () Bool)

(declare-fun lt!437444 () tuple4!1118)

(declare-fun e!217776 () Bool)

(declare-fun lt!437443 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!302810 (= e!217776 (byteRangesEq!0 (select (arr!9071 a1!948) (_4!559 lt!437444)) (select (arr!9071 a2!948) (_4!559 lt!437444)) #b00000000000000000000000000000000 lt!437443))))

(declare-fun b!302811 () Bool)

(declare-fun res!249229 () Bool)

(assert (=> b!302811 (= res!249229 (= lt!437443 #b00000000000000000000000000000000))))

(assert (=> b!302811 (=> res!249229 e!217776)))

(assert (=> b!302811 (= e!217778 e!217776)))

(declare-fun b!302812 () Bool)

(declare-fun e!217780 () Bool)

(assert (=> b!302812 (= e!217777 e!217780)))

(declare-fun res!249231 () Bool)

(assert (=> b!302812 (=> (not res!249231) (not e!217780))))

(declare-fun e!217775 () Bool)

(assert (=> b!302812 (= res!249231 e!217775)))

(declare-fun res!249227 () Bool)

(assert (=> b!302812 (=> res!249227 e!217775)))

(assert (=> b!302812 (= res!249227 (bvsge (_1!13214 lt!437444) (_2!13214 lt!437444)))))

(assert (=> b!302812 (= lt!437443 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!437445 () (_ BitVec 32))

(assert (=> b!302812 (= lt!437445 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!302812 (= lt!437444 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!302813 () Bool)

(declare-fun arrayRangesEq!1616 (array!18394 array!18394 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!302813 (= e!217775 (arrayRangesEq!1616 a1!948 a2!948 (_1!13214 lt!437444) (_2!13214 lt!437444)))))

(declare-fun c!14373 () Bool)

(declare-fun bm!5540 () Bool)

(assert (=> bm!5540 (= call!5543 (byteRangesEq!0 (select (arr!9071 a1!948) (_3!1516 lt!437444)) (select (arr!9071 a2!948) (_3!1516 lt!437444)) lt!437445 (ite c!14373 lt!437443 #b00000000000000000000000000001000)))))

(declare-fun b!302814 () Bool)

(assert (=> b!302814 (= e!217780 e!217779)))

(assert (=> b!302814 (= c!14373 (= (_3!1516 lt!437444) (_4!559 lt!437444)))))

(declare-fun b!302815 () Bool)

(assert (=> b!302815 (= e!217779 call!5543)))

(assert (= (and d!101156 (not res!249228)) b!302812))

(assert (= (and b!302812 (not res!249227)) b!302813))

(assert (= (and b!302812 res!249231) b!302814))

(assert (= (and b!302814 c!14373) b!302815))

(assert (= (and b!302814 (not c!14373)) b!302809))

(assert (= (and b!302809 res!249230) b!302811))

(assert (= (and b!302811 (not res!249229)) b!302810))

(assert (= (or b!302815 b!302809) bm!5540))

(declare-fun m!441555 () Bool)

(assert (=> b!302810 m!441555))

(declare-fun m!441557 () Bool)

(assert (=> b!302810 m!441557))

(assert (=> b!302810 m!441555))

(assert (=> b!302810 m!441557))

(declare-fun m!441559 () Bool)

(assert (=> b!302810 m!441559))

(assert (=> b!302812 m!441537))

(declare-fun m!441561 () Bool)

(assert (=> b!302813 m!441561))

(declare-fun m!441563 () Bool)

(assert (=> bm!5540 m!441563))

(declare-fun m!441565 () Bool)

(assert (=> bm!5540 m!441565))

(assert (=> bm!5540 m!441563))

(assert (=> bm!5540 m!441565))

(declare-fun m!441567 () Bool)

(assert (=> bm!5540 m!441567))

(assert (=> b!302780 d!101156))

(declare-fun d!101174 () Bool)

(assert (=> d!101174 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1119 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!302782 d!101174))

(declare-fun d!101176 () Bool)

(assert (=> d!101176 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1119 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!302782 d!101176))

(check-sat (not b!302810) (not bm!5540) (not b!302813) (not b!302812))
(check-sat)
