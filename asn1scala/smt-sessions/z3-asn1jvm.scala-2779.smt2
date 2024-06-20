; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67080 () Bool)

(assert start!67080)

(declare-fun b!300811 () Bool)

(declare-datatypes ((Unit!21051 0))(
  ( (Unit!21052) )
))
(declare-fun e!216033 () Unit!21051)

(declare-fun lt!436267 () Unit!21051)

(assert (=> b!300811 (= e!216033 lt!436267)))

(declare-datatypes ((array!18241 0))(
  ( (array!18242 (arr!9005 (Array (_ BitVec 32) (_ BitVec 8))) (size!7922 (_ BitVec 32))) )
))
(declare-fun a2!948 () array!18241)

(declare-datatypes ((tuple4!1052 0))(
  ( (tuple4!1053 (_1!13181 (_ BitVec 32)) (_2!13181 (_ BitVec 32)) (_3!1483 (_ BitVec 32)) (_4!526 (_ BitVec 32))) )
))
(declare-fun lt!436275 () tuple4!1052)

(declare-fun lt!436270 () tuple4!1052)

(declare-fun a1!948 () array!18241)

(declare-fun arrayRangesEqImpliesEq!239 (array!18241 array!18241 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21051)

(assert (=> b!300811 (= lt!436267 (arrayRangesEqImpliesEq!239 a1!948 a2!948 (_1!13181 lt!436275) (_4!526 lt!436270) (_2!13181 lt!436275)))))

(assert (=> b!300811 (= (select (arr!9005 a1!948) (_4!526 lt!436270)) (select (arr!9005 a2!948) (_4!526 lt!436270)))))

(declare-fun b!300812 () Bool)

(declare-fun e!216030 () Bool)

(declare-fun call!5408 () Bool)

(assert (=> b!300812 (= e!216030 call!5408)))

(declare-fun b!300813 () Bool)

(declare-fun e!216029 () Unit!21051)

(declare-fun lt!436264 () Unit!21051)

(assert (=> b!300813 (= e!216029 lt!436264)))

(declare-fun arrayRangesEqSlicedLemma!194 (array!18241 array!18241 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21051)

(assert (=> b!300813 (= lt!436264 (arrayRangesEqSlicedLemma!194 a1!948 a2!948 (_1!13181 lt!436275) (_2!13181 lt!436275) (_1!13181 lt!436270) (_2!13181 lt!436270)))))

(declare-fun arrayRangesEq!1584 (array!18241 array!18241 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!300813 (arrayRangesEq!1584 a1!948 a2!948 (_1!13181 lt!436270) (_2!13181 lt!436270))))

(declare-fun b!300814 () Bool)

(declare-fun e!216025 () Bool)

(declare-fun e!216024 () Bool)

(assert (=> b!300814 (= e!216025 e!216024)))

(declare-fun res!247869 () Bool)

(assert (=> b!300814 (=> (not res!247869) (not e!216024))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!436272 () (_ BitVec 64))

(assert (=> b!300814 (= res!247869 (and (bvsle toBit!258 lt!436272) (bvsle fromBit!258 lt!436272)))))

(assert (=> b!300814 (= lt!436272 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7922 a1!948))))))

(declare-fun bm!5405 () Bool)

(declare-fun lt!436265 () (_ BitVec 32))

(declare-fun lt!436268 () (_ BitVec 32))

(declare-fun c!14057 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5405 (= call!5408 (byteRangesEq!0 (ite c!14057 (select (arr!9005 a1!948) (_3!1483 lt!436275)) (select (arr!9005 a1!948) (_4!526 lt!436275))) (ite c!14057 (select (arr!9005 a2!948) (_3!1483 lt!436275)) (select (arr!9005 a2!948) (_4!526 lt!436275))) (ite c!14057 lt!436268 #b00000000000000000000000000000000) lt!436265))))

(declare-fun b!300815 () Bool)

(declare-fun e!216026 () Bool)

(assert (=> b!300815 (= e!216024 e!216026)))

(declare-fun res!247866 () Bool)

(assert (=> b!300815 (=> (not res!247866) (not e!216026))))

(assert (=> b!300815 (= res!247866 e!216030)))

(assert (=> b!300815 (= c!14057 (= (_3!1483 lt!436275) (_4!526 lt!436275)))))

(declare-fun lt!436269 () Unit!21051)

(assert (=> b!300815 (= lt!436269 e!216029)))

(declare-fun c!14056 () Bool)

(assert (=> b!300815 (= c!14056 (bvslt (_1!13181 lt!436270) (_2!13181 lt!436270)))))

(declare-fun lt!436266 () (_ BitVec 32))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!300815 (= lt!436266 ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1052)

(assert (=> b!300815 (= lt!436270 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!300815 (= lt!436265 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!300815 (= lt!436268 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!300815 (= lt!436275 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!300816 () Bool)

(declare-fun e!216031 () Unit!21051)

(declare-fun Unit!21053 () Unit!21051)

(assert (=> b!300816 (= e!216031 Unit!21053)))

(declare-fun b!300817 () Bool)

(declare-fun Unit!21054 () Unit!21051)

(assert (=> b!300817 (= e!216033 Unit!21054)))

(declare-fun res!247868 () Bool)

(assert (=> start!67080 (=> (not res!247868) (not e!216025))))

(assert (=> start!67080 (= res!247868 (and (bvsle (size!7922 a1!948) (size!7922 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67080 e!216025))

(assert (=> start!67080 true))

(declare-fun array_inv!7534 (array!18241) Bool)

(assert (=> start!67080 (array_inv!7534 a1!948)))

(assert (=> start!67080 (array_inv!7534 a2!948)))

(declare-fun b!300818 () Bool)

(declare-fun res!247870 () Bool)

(assert (=> b!300818 (= res!247870 (= lt!436265 #b00000000000000000000000000000000))))

(declare-fun e!216027 () Bool)

(assert (=> b!300818 (=> res!247870 e!216027)))

(declare-fun e!216028 () Bool)

(assert (=> b!300818 (= e!216028 e!216027)))

(declare-fun b!300819 () Bool)

(assert (=> b!300819 (= e!216026 (and (not (= (_3!1483 lt!436270) (_4!526 lt!436270))) (or (bvsgt #b00000000000000000000000000000000 lt!436266) (bvsgt lt!436266 #b00000000000000000000000000000111))))))

(declare-fun lt!436273 () Unit!21051)

(assert (=> b!300819 (= lt!436273 e!216033)))

(declare-fun c!14055 () Bool)

(assert (=> b!300819 (= c!14055 (and (bvslt (_4!526 lt!436270) (_4!526 lt!436275)) (bvslt (_3!1483 lt!436275) (_4!526 lt!436270))))))

(declare-fun lt!436271 () Unit!21051)

(assert (=> b!300819 (= lt!436271 e!216031)))

(declare-fun c!14058 () Bool)

(assert (=> b!300819 (= c!14058 (and (bvslt (_3!1483 lt!436275) (_3!1483 lt!436270)) (bvslt (_3!1483 lt!436270) (_4!526 lt!436275))))))

(declare-fun b!300820 () Bool)

(assert (=> b!300820 (= e!216030 e!216028)))

(declare-fun res!247867 () Bool)

(assert (=> b!300820 (= res!247867 (byteRangesEq!0 (select (arr!9005 a1!948) (_3!1483 lt!436275)) (select (arr!9005 a2!948) (_3!1483 lt!436275)) lt!436268 #b00000000000000000000000000000111))))

(assert (=> b!300820 (=> (not res!247867) (not e!216028))))

(declare-fun b!300821 () Bool)

(declare-fun Unit!21055 () Unit!21051)

(assert (=> b!300821 (= e!216029 Unit!21055)))

(declare-fun b!300822 () Bool)

(assert (=> b!300822 (= e!216027 call!5408)))

(declare-fun b!300823 () Bool)

(declare-fun res!247865 () Bool)

(assert (=> b!300823 (=> (not res!247865) (not e!216024))))

(assert (=> b!300823 (= res!247865 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!436272) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!300824 () Bool)

(declare-fun lt!436274 () Unit!21051)

(assert (=> b!300824 (= e!216031 lt!436274)))

(assert (=> b!300824 (= lt!436274 (arrayRangesEqImpliesEq!239 a1!948 a2!948 (_1!13181 lt!436275) (_3!1483 lt!436270) (_2!13181 lt!436275)))))

(assert (=> b!300824 (= (select (arr!9005 a1!948) (_3!1483 lt!436270)) (select (arr!9005 a2!948) (_3!1483 lt!436270)))))

(declare-fun b!300825 () Bool)

(declare-fun res!247871 () Bool)

(assert (=> b!300825 (=> (not res!247871) (not e!216024))))

(declare-fun arrayBitRangesEq!0 (array!18241 array!18241 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!300825 (= res!247871 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(assert (= (and start!67080 res!247868) b!300814))

(assert (= (and b!300814 res!247869) b!300825))

(assert (= (and b!300825 res!247871) b!300823))

(assert (= (and b!300823 res!247865) b!300815))

(assert (= (and b!300815 c!14056) b!300813))

(assert (= (and b!300815 (not c!14056)) b!300821))

(assert (= (and b!300815 c!14057) b!300812))

(assert (= (and b!300815 (not c!14057)) b!300820))

(assert (= (and b!300820 res!247867) b!300818))

(assert (= (and b!300818 (not res!247870)) b!300822))

(assert (= (or b!300812 b!300822) bm!5405))

(assert (= (and b!300815 res!247866) b!300819))

(assert (= (and b!300819 c!14058) b!300824))

(assert (= (and b!300819 (not c!14058)) b!300816))

(assert (= (and b!300819 c!14055) b!300811))

(assert (= (and b!300819 (not c!14055)) b!300817))

(declare-fun m!439743 () Bool)

(assert (=> b!300815 m!439743))

(declare-fun m!439745 () Bool)

(assert (=> b!300815 m!439745))

(declare-fun m!439747 () Bool)

(assert (=> b!300825 m!439747))

(declare-fun m!439749 () Bool)

(assert (=> b!300820 m!439749))

(declare-fun m!439751 () Bool)

(assert (=> b!300820 m!439751))

(assert (=> b!300820 m!439749))

(assert (=> b!300820 m!439751))

(declare-fun m!439753 () Bool)

(assert (=> b!300820 m!439753))

(declare-fun m!439755 () Bool)

(assert (=> b!300813 m!439755))

(declare-fun m!439757 () Bool)

(assert (=> b!300813 m!439757))

(declare-fun m!439759 () Bool)

(assert (=> start!67080 m!439759))

(declare-fun m!439761 () Bool)

(assert (=> start!67080 m!439761))

(assert (=> bm!5405 m!439751))

(declare-fun m!439763 () Bool)

(assert (=> bm!5405 m!439763))

(assert (=> bm!5405 m!439749))

(declare-fun m!439765 () Bool)

(assert (=> bm!5405 m!439765))

(declare-fun m!439767 () Bool)

(assert (=> bm!5405 m!439767))

(declare-fun m!439769 () Bool)

(assert (=> b!300824 m!439769))

(declare-fun m!439771 () Bool)

(assert (=> b!300824 m!439771))

(declare-fun m!439773 () Bool)

(assert (=> b!300824 m!439773))

(declare-fun m!439775 () Bool)

(assert (=> b!300811 m!439775))

(declare-fun m!439777 () Bool)

(assert (=> b!300811 m!439777))

(declare-fun m!439779 () Bool)

(assert (=> b!300811 m!439779))

(check-sat (not b!300811) (not b!300815) (not start!67080) (not b!300824) (not b!300820) (not bm!5405) (not b!300813) (not b!300825))
(check-sat)
