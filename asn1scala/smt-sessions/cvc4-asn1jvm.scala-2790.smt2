; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67312 () Bool)

(assert start!67312)

(declare-fun b!302260 () Bool)

(declare-datatypes ((array!18321 0))(
  ( (array!18322 (arr!9039 (Array (_ BitVec 32) (_ BitVec 8))) (size!7956 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18321)

(declare-fun a2!948 () array!18321)

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun e!217184 () Bool)

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!18321 array!18321 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!302260 (= e!217184 (not (arrayBitRangesEq!0 a1!948 a2!948 fromSlice!52 toSlice!52)))))

(declare-fun b!302258 () Bool)

(declare-fun res!248739 () Bool)

(assert (=> b!302258 (=> (not res!248739) (not e!217184))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(assert (=> b!302258 (= res!248739 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!302259 () Bool)

(declare-fun res!248741 () Bool)

(assert (=> b!302259 (=> (not res!248741) (not e!217184))))

(declare-fun lt!437193 () (_ BitVec 64))

(assert (=> b!302259 (= res!248741 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437193) (= fromSlice!52 toSlice!52)))))

(declare-fun res!248742 () Bool)

(declare-fun e!217186 () Bool)

(assert (=> start!67312 (=> (not res!248742) (not e!217186))))

(assert (=> start!67312 (= res!248742 (and (bvsle (size!7956 a1!948) (size!7956 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67312 e!217186))

(assert (=> start!67312 true))

(declare-fun array_inv!7568 (array!18321) Bool)

(assert (=> start!67312 (array_inv!7568 a1!948)))

(assert (=> start!67312 (array_inv!7568 a2!948)))

(declare-fun b!302257 () Bool)

(assert (=> b!302257 (= e!217186 e!217184)))

(declare-fun res!248740 () Bool)

(assert (=> b!302257 (=> (not res!248740) (not e!217184))))

(assert (=> b!302257 (= res!248740 (and (bvsle toBit!258 lt!437193) (bvsle fromBit!258 lt!437193)))))

(assert (=> b!302257 (= lt!437193 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7956 a1!948))))))

(assert (= (and start!67312 res!248742) b!302257))

(assert (= (and b!302257 res!248740) b!302258))

(assert (= (and b!302258 res!248739) b!302259))

(assert (= (and b!302259 res!248741) b!302260))

(declare-fun m!441133 () Bool)

(assert (=> b!302260 m!441133))

(declare-fun m!441135 () Bool)

(assert (=> b!302258 m!441135))

(declare-fun m!441137 () Bool)

(assert (=> start!67312 m!441137))

(declare-fun m!441139 () Bool)

(assert (=> start!67312 m!441139))

(push 1)

(assert (not start!67312))

(assert (not b!302258))

(assert (not b!302260))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!101050 () Bool)

(assert (=> d!101050 (= (array_inv!7568 a1!948) (bvsge (size!7956 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67312 d!101050))

(declare-fun d!101052 () Bool)

(assert (=> d!101052 (= (array_inv!7568 a2!948) (bvsge (size!7956 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67312 d!101052))

(declare-fun lt!437226 () (_ BitVec 32))

(declare-fun c!14351 () Bool)

(declare-datatypes ((tuple4!1102 0))(
  ( (tuple4!1103 (_1!13206 (_ BitVec 32)) (_2!13206 (_ BitVec 32)) (_3!1508 (_ BitVec 32)) (_4!551 (_ BitVec 32))) )
))
(declare-fun lt!437225 () tuple4!1102)

(declare-fun bm!5518 () Bool)

(declare-fun lt!437224 () (_ BitVec 32))

(declare-fun call!5521 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5518 (= call!5521 (byteRangesEq!0 (ite c!14351 (select (arr!9039 a1!948) (_3!1508 lt!437225)) (select (arr!9039 a1!948) (_4!551 lt!437225))) (ite c!14351 (select (arr!9039 a2!948) (_3!1508 lt!437225)) (select (arr!9039 a2!948) (_4!551 lt!437225))) (ite c!14351 lt!437226 #b00000000000000000000000000000000) lt!437224))))

(declare-fun d!101054 () Bool)

(declare-fun res!248795 () Bool)

(declare-fun e!217252 () Bool)

(assert (=> d!101054 (=> res!248795 e!217252)))

(assert (=> d!101054 (= res!248795 (bvsge fromBit!258 toBit!258))))

(assert (=> d!101054 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!217252)))

(declare-fun b!302331 () Bool)

(declare-fun e!217248 () Bool)

(assert (=> b!302331 (= e!217248 call!5521)))

(declare-fun e!217250 () Bool)

(declare-fun b!302332 () Bool)

(declare-fun arrayRangesEq!1609 (array!18321 array!18321 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!302332 (= e!217250 (arrayRangesEq!1609 a1!948 a2!948 (_1!13206 lt!437225) (_2!13206 lt!437225)))))

(declare-fun b!302333 () Bool)

(declare-fun e!217249 () Bool)

(assert (=> b!302333 (= e!217249 call!5521)))

(declare-fun b!302334 () Bool)

(declare-fun e!217247 () Bool)

(assert (=> b!302334 (= e!217247 e!217249)))

(assert (=> b!302334 (= c!14351 (= (_3!1508 lt!437225) (_4!551 lt!437225)))))

(declare-fun b!302335 () Bool)

(assert (=> b!302335 (= e!217252 e!217247)))

(declare-fun res!248793 () Bool)

(assert (=> b!302335 (=> (not res!248793) (not e!217247))))

(assert (=> b!302335 (= res!248793 e!217250)))

(declare-fun res!248797 () Bool)

(assert (=> b!302335 (=> res!248797 e!217250)))

(assert (=> b!302335 (= res!248797 (bvsge (_1!13206 lt!437225) (_2!13206 lt!437225)))))

(assert (=> b!302335 (= lt!437224 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!302335 (= lt!437226 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1102)

(assert (=> b!302335 (= lt!437225 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!302336 () Bool)

(declare-fun e!217251 () Bool)

(assert (=> b!302336 (= e!217249 e!217251)))

(declare-fun res!248796 () Bool)

(assert (=> b!302336 (= res!248796 (byteRangesEq!0 (select (arr!9039 a1!948) (_3!1508 lt!437225)) (select (arr!9039 a2!948) (_3!1508 lt!437225)) lt!437226 #b00000000000000000000000000001000))))

(assert (=> b!302336 (=> (not res!248796) (not e!217251))))

(declare-fun b!302337 () Bool)

(declare-fun res!248794 () Bool)

(assert (=> b!302337 (= res!248794 (= lt!437224 #b00000000000000000000000000000000))))

(assert (=> b!302337 (=> res!248794 e!217248)))

(assert (=> b!302337 (= e!217251 e!217248)))

(assert (= (and d!101054 (not res!248795)) b!302335))

(assert (= (and b!302335 (not res!248797)) b!302332))

(assert (= (and b!302335 res!248793) b!302334))

(assert (= (and b!302334 c!14351) b!302333))

(assert (= (and b!302334 (not c!14351)) b!302336))

(assert (= (and b!302336 res!248796) b!302337))

(assert (= (and b!302337 (not res!248794)) b!302331))

(assert (= (or b!302333 b!302331) bm!5518))

(declare-fun m!441205 () Bool)

(assert (=> bm!5518 m!441205))

(declare-fun m!441207 () Bool)

(assert (=> bm!5518 m!441207))

(declare-fun m!441209 () Bool)

(assert (=> bm!5518 m!441209))

(declare-fun m!441211 () Bool)

(assert (=> bm!5518 m!441211))

(declare-fun m!441213 () Bool)

(assert (=> bm!5518 m!441213))

(declare-fun m!441215 () Bool)

(assert (=> b!302332 m!441215))

(declare-fun m!441217 () Bool)

(assert (=> b!302335 m!441217))

(assert (=> b!302336 m!441211))

(assert (=> b!302336 m!441209))

(assert (=> b!302336 m!441211))

(assert (=> b!302336 m!441209))

(declare-fun m!441219 () Bool)

(assert (=> b!302336 m!441219))

(assert (=> b!302258 d!101054))

(declare-fun lt!437228 () tuple4!1102)

(declare-fun bm!5519 () Bool)

(declare-fun c!14352 () Bool)

(declare-fun lt!437227 () (_ BitVec 32))

(declare-fun call!5522 () Bool)

(declare-fun lt!437229 () (_ BitVec 32))

(assert (=> bm!5519 (= call!5522 (byteRangesEq!0 (ite c!14352 (select (arr!9039 a1!948) (_3!1508 lt!437228)) (select (arr!9039 a1!948) (_4!551 lt!437228))) (ite c!14352 (select (arr!9039 a2!948) (_3!1508 lt!437228)) (select (arr!9039 a2!948) (_4!551 lt!437228))) (ite c!14352 lt!437229 #b00000000000000000000000000000000) lt!437227))))

(declare-fun d!101068 () Bool)

(declare-fun res!248800 () Bool)

(declare-fun e!217258 () Bool)

