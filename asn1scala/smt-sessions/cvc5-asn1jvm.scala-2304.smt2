; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58284 () Bool)

(assert start!58284)

(declare-fun b!267813 () Bool)

(declare-fun e!187863 () Bool)

(declare-datatypes ((array!14942 0))(
  ( (array!14943 (arr!7504 (Array (_ BitVec 32) (_ BitVec 8))) (size!6517 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11848 0))(
  ( (BitStream!11849 (buf!6985 array!14942) (currentByte!12891 (_ BitVec 32)) (currentBit!12886 (_ BitVec 32))) )
))
(declare-fun w2!587 () BitStream!11848)

(declare-fun array_inv!6241 (array!14942) Bool)

(assert (=> b!267813 (= e!187863 (array_inv!6241 (buf!6985 w2!587)))))

(declare-fun b!267814 () Bool)

(declare-fun e!187864 () Bool)

(declare-fun w1!591 () BitStream!11848)

(assert (=> b!267814 (= e!187864 (array_inv!6241 (buf!6985 w1!591)))))

(declare-fun b!267815 () Bool)

(declare-fun res!223420 () Bool)

(declare-fun e!187862 () Bool)

(assert (=> b!267815 (=> (not res!223420) (not e!187862))))

(declare-fun w3!25 () BitStream!11848)

(declare-fun isPrefixOf!0 (BitStream!11848 BitStream!11848) Bool)

(assert (=> b!267815 (= res!223420 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!267816 () Bool)

(declare-fun e!187865 () Bool)

(assert (=> b!267816 (= e!187865 (array_inv!6241 (buf!6985 w3!25)))))

(declare-fun res!223418 () Bool)

(assert (=> start!58284 (=> (not res!223418) (not e!187862))))

(assert (=> start!58284 (= res!223418 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58284 e!187862))

(declare-fun inv!12 (BitStream!11848) Bool)

(assert (=> start!58284 (and (inv!12 w1!591) e!187864)))

(assert (=> start!58284 (and (inv!12 w2!587) e!187863)))

(assert (=> start!58284 (and (inv!12 w3!25) e!187865)))

(declare-fun b!267817 () Bool)

(declare-fun e!187861 () Bool)

(assert (=> b!267817 (= e!187862 (not e!187861))))

(declare-fun res!223419 () Bool)

(assert (=> b!267817 (=> res!223419 e!187861)))

(assert (=> b!267817 (= res!223419 (or (bvsge (currentByte!12891 w1!591) (size!6517 (buf!6985 w1!591))) (bvsge (currentByte!12891 w1!591) (currentByte!12891 w2!587))))))

(declare-fun arrayRangesEq!1052 (array!14942 array!14942 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!267817 (arrayRangesEq!1052 (buf!6985 w1!591) (buf!6985 w3!25) #b00000000000000000000000000000000 (currentByte!12891 w1!591))))

(declare-datatypes ((Unit!19007 0))(
  ( (Unit!19008) )
))
(declare-fun lt!408070 () Unit!19007)

(declare-fun arrayRangesEqTransitive!327 (array!14942 array!14942 array!14942 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19007)

(assert (=> b!267817 (= lt!408070 (arrayRangesEqTransitive!327 (buf!6985 w1!591) (buf!6985 w2!587) (buf!6985 w3!25) #b00000000000000000000000000000000 (currentByte!12891 w1!591) (currentByte!12891 w2!587)))))

(declare-fun b!267818 () Bool)

(assert (=> b!267818 (= e!187861 (or (not (= ((_ sign_extend 24) (select (arr!7504 (buf!6985 w2!587)) (currentByte!12891 w1!591))) ((_ sign_extend 24) (select (arr!7504 (buf!6985 w3!25)) (currentByte!12891 w1!591))))) (and (bvsle #b00000000000000000000000000000000 (currentBit!12886 w1!591)) (bvsle (currentBit!12886 w1!591) #b00000000000000000000000000001000))))))

(assert (=> b!267818 (= (select (arr!7504 (buf!6985 w2!587)) (currentByte!12891 w1!591)) (select (arr!7504 (buf!6985 w3!25)) (currentByte!12891 w1!591)))))

(declare-fun lt!408071 () Unit!19007)

(declare-fun arrayRangesEqImpliesEq!145 (array!14942 array!14942 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19007)

(assert (=> b!267818 (= lt!408071 (arrayRangesEqImpliesEq!145 (buf!6985 w2!587) (buf!6985 w3!25) #b00000000000000000000000000000000 (currentByte!12891 w1!591) (currentByte!12891 w2!587)))))

(assert (= (and start!58284 res!223418) b!267815))

(assert (= (and b!267815 res!223420) b!267817))

(assert (= (and b!267817 (not res!223419)) b!267818))

(assert (= start!58284 b!267814))

(assert (= start!58284 b!267813))

(assert (= start!58284 b!267816))

(declare-fun m!399125 () Bool)

(assert (=> b!267813 m!399125))

(declare-fun m!399127 () Bool)

(assert (=> b!267815 m!399127))

(declare-fun m!399129 () Bool)

(assert (=> b!267818 m!399129))

(declare-fun m!399131 () Bool)

(assert (=> b!267818 m!399131))

(declare-fun m!399133 () Bool)

(assert (=> b!267818 m!399133))

(declare-fun m!399135 () Bool)

(assert (=> b!267817 m!399135))

(declare-fun m!399137 () Bool)

(assert (=> b!267817 m!399137))

(declare-fun m!399139 () Bool)

(assert (=> b!267814 m!399139))

(declare-fun m!399141 () Bool)

(assert (=> start!58284 m!399141))

(declare-fun m!399143 () Bool)

(assert (=> start!58284 m!399143))

(declare-fun m!399145 () Bool)

(assert (=> start!58284 m!399145))

(declare-fun m!399147 () Bool)

(assert (=> start!58284 m!399147))

(declare-fun m!399149 () Bool)

(assert (=> b!267816 m!399149))

(push 1)

(assert (not b!267816))

(assert (not b!267815))

(assert (not b!267813))

(assert (not b!267814))

(assert (not b!267817))

(assert (not b!267818))

(assert (not start!58284))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!90424 () Bool)

(declare-fun res!223445 () Bool)

(declare-fun e!187919 () Bool)

(assert (=> d!90424 (=> (not res!223445) (not e!187919))))

(assert (=> d!90424 (= res!223445 (= (size!6517 (buf!6985 w2!587)) (size!6517 (buf!6985 w3!25))))))

(assert (=> d!90424 (= (isPrefixOf!0 w2!587 w3!25) e!187919)))

(declare-fun b!267861 () Bool)

(declare-fun res!223447 () Bool)

(assert (=> b!267861 (=> (not res!223447) (not e!187919))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!267861 (= res!223447 (bvsle (bitIndex!0 (size!6517 (buf!6985 w2!587)) (currentByte!12891 w2!587) (currentBit!12886 w2!587)) (bitIndex!0 (size!6517 (buf!6985 w3!25)) (currentByte!12891 w3!25) (currentBit!12886 w3!25))))))

(declare-fun b!267862 () Bool)

(declare-fun e!187920 () Bool)

(assert (=> b!267862 (= e!187919 e!187920)))

(declare-fun res!223446 () Bool)

(assert (=> b!267862 (=> res!223446 e!187920)))

(assert (=> b!267862 (= res!223446 (= (size!6517 (buf!6985 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!267863 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14942 array!14942 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!267863 (= e!187920 (arrayBitRangesEq!0 (buf!6985 w2!587) (buf!6985 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6517 (buf!6985 w2!587)) (currentByte!12891 w2!587) (currentBit!12886 w2!587))))))

(assert (= (and d!90424 res!223445) b!267861))

(assert (= (and b!267861 res!223447) b!267862))

(assert (= (and b!267862 (not res!223446)) b!267863))

(declare-fun m!399203 () Bool)

(assert (=> b!267861 m!399203))

(declare-fun m!399205 () Bool)

(assert (=> b!267861 m!399205))

(assert (=> b!267863 m!399203))

(assert (=> b!267863 m!399203))

(declare-fun m!399207 () Bool)

(assert (=> b!267863 m!399207))

(assert (=> b!267815 d!90424))

(declare-fun d!90430 () Bool)

(assert (=> d!90430 (= (array_inv!6241 (buf!6985 w3!25)) (bvsge (size!6517 (buf!6985 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!267816 d!90430))

(declare-fun d!90432 () Bool)

(assert (=> d!90432 (= (array_inv!6241 (buf!6985 w1!591)) (bvsge (size!6517 (buf!6985 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!267814 d!90432))

(declare-fun d!90434 () Bool)

(declare-fun res!223448 () Bool)

(declare-fun e!187921 () Bool)

(assert (=> d!90434 (=> (not res!223448) (not e!187921))))

(assert (=> d!90434 (= res!223448 (= (size!6517 (buf!6985 w1!591)) (size!6517 (buf!6985 w2!587))))))

(assert (=> d!90434 (= (isPrefixOf!0 w1!591 w2!587) e!187921)))

(declare-fun b!267864 () Bool)

(declare-fun res!223450 () Bool)

(assert (=> b!267864 (=> (not res!223450) (not e!187921))))

(assert (=> b!267864 (= res!223450 (bvsle (bitIndex!0 (size!6517 (buf!6985 w1!591)) (currentByte!12891 w1!591) (currentBit!12886 w1!591)) (bitIndex!0 (size!6517 (buf!6985 w2!587)) (currentByte!12891 w2!587) (currentBit!12886 w2!587))))))

(declare-fun b!267865 () Bool)

(declare-fun e!187922 () Bool)

(assert (=> b!267865 (= e!187921 e!187922)))

(declare-fun res!223449 () Bool)

(assert (=> b!267865 (=> res!223449 e!187922)))

(assert (=> b!267865 (= res!223449 (= (size!6517 (buf!6985 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!267866 () Bool)

(assert (=> b!267866 (= e!187922 (arrayBitRangesEq!0 (buf!6985 w1!591) (buf!6985 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6517 (buf!6985 w1!591)) (currentByte!12891 w1!591) (currentBit!12886 w1!591))))))

(assert (= (and d!90434 res!223448) b!267864))

(assert (= (and b!267864 res!223450) b!267865))

(assert (= (and b!267865 (not res!223449)) b!267866))

(declare-fun m!399209 () Bool)

(assert (=> b!267864 m!399209))

(assert (=> b!267864 m!399203))

(assert (=> b!267866 m!399209))

(assert (=> b!267866 m!399209))

(declare-fun m!399211 () Bool)

(assert (=> b!267866 m!399211))

(assert (=> start!58284 d!90434))

(declare-fun d!90436 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!90436 (= (inv!12 w1!591) (invariant!0 (currentBit!12886 w1!591) (currentByte!12891 w1!591) (size!6517 (buf!6985 w1!591))))))

(declare-fun bs!22977 () Bool)

(assert (= bs!22977 d!90436))

(declare-fun m!399213 () Bool)

(assert (=> bs!22977 m!399213))

(assert (=> start!58284 d!90436))

(declare-fun d!90438 () Bool)

(assert (=> d!90438 (= (inv!12 w2!587) (invariant!0 (currentBit!12886 w2!587) (currentByte!12891 w2!587) (size!6517 (buf!6985 w2!587))))))

(declare-fun bs!22978 () Bool)

(assert (= bs!22978 d!90438))

(declare-fun m!399215 () Bool)

(assert (=> bs!22978 m!399215))

(assert (=> start!58284 d!90438))

(declare-fun d!90440 () Bool)

(assert (=> d!90440 (= (inv!12 w3!25) (invariant!0 (currentBit!12886 w3!25) (currentByte!12891 w3!25) (size!6517 (buf!6985 w3!25))))))

(declare-fun bs!22979 () Bool)

(assert (= bs!22979 d!90440))

(declare-fun m!399217 () Bool)

(assert (=> bs!22979 m!399217))

(assert (=> start!58284 d!90440))

(declare-fun d!90442 () Bool)

(assert (=> d!90442 (and (bvsge (currentByte!12891 w1!591) #b00000000000000000000000000000000) (bvslt (currentByte!12891 w1!591) (size!6517 (buf!6985 w2!587))) (bvslt (currentByte!12891 w1!591) (size!6517 (buf!6985 w3!25))) (= (select (arr!7504 (buf!6985 w2!587)) (currentByte!12891 w1!591)) (select (arr!7504 (buf!6985 w3!25)) (currentByte!12891 w1!591))))))

(declare-fun lt!408088 () Unit!19007)

(declare-fun choose!367 (array!14942 array!14942 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19007)

(assert (=> d!90442 (= lt!408088 (choose!367 (buf!6985 w2!587) (buf!6985 w3!25) #b00000000000000000000000000000000 (currentByte!12891 w1!591) (currentByte!12891 w2!587)))))

(assert (=> d!90442 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!12891 w2!587)))))

(assert (=> d!90442 (= (arrayRangesEqImpliesEq!145 (buf!6985 w2!587) (buf!6985 w3!25) #b00000000000000000000000000000000 (currentByte!12891 w1!591) (currentByte!12891 w2!587)) lt!408088)))

(declare-fun bs!22980 () Bool)

(assert (= bs!22980 d!90442))

(assert (=> bs!22980 m!399129))

(assert (=> bs!22980 m!399131))

(declare-fun m!399231 () Bool)

(assert (=> bs!22980 m!399231))

(assert (=> b!267818 d!90442))

(declare-fun d!90448 () Bool)

(assert (=> d!90448 (= (array_inv!6241 (buf!6985 w2!587)) (bvsge (size!6517 (buf!6985 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!267813 d!90448))

(declare-fun d!90450 () Bool)

(declare-fun res!223476 () Bool)

(declare-fun e!187941 () Bool)

(assert (=> d!90450 (=> res!223476 e!187941)))

(assert (=> d!90450 (= res!223476 (= #b00000000000000000000000000000000 (currentByte!12891 w1!591)))))

(assert (=> d!90450 (= (arrayRangesEq!1052 (buf!6985 w1!591) (buf!6985 w3!25) #b00000000000000000000000000000000 (currentByte!12891 w1!591)) e!187941)))

(declare-fun b!267892 () Bool)

(declare-fun e!187942 () Bool)

(assert (=> b!267892 (= e!187941 e!187942)))

(declare-fun res!223477 () Bool)

(assert (=> b!267892 (=> (not res!223477) (not e!187942))))

(assert (=> b!267892 (= res!223477 (= (select (arr!7504 (buf!6985 w1!591)) #b00000000000000000000000000000000) (select (arr!7504 (buf!6985 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!267893 () Bool)

(assert (=> b!267893 (= e!187942 (arrayRangesEq!1052 (buf!6985 w1!591) (buf!6985 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12891 w1!591)))))

(assert (= (and d!90450 (not res!223476)) b!267892))

(assert (= (and b!267892 res!223477) b!267893))

(declare-fun m!399247 () Bool)

(assert (=> b!267892 m!399247))

(declare-fun m!399249 () Bool)

(assert (=> b!267892 m!399249))

(declare-fun m!399251 () Bool)

(assert (=> b!267893 m!399251))

(assert (=> b!267817 d!90450))

(declare-fun d!90470 () Bool)

(assert (=> d!90470 (arrayRangesEq!1052 (buf!6985 w1!591) (buf!6985 w3!25) #b00000000000000000000000000000000 (currentByte!12891 w1!591))))

(declare-fun lt!408095 () Unit!19007)

(declare-fun choose!369 (array!14942 array!14942 array!14942 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19007)

(assert (=> d!90470 (= lt!408095 (choose!369 (buf!6985 w1!591) (buf!6985 w2!587) (buf!6985 w3!25) #b00000000000000000000000000000000 (currentByte!12891 w1!591) (currentByte!12891 w2!587)))))

(assert (=> d!90470 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!12891 w1!591)) (bvsle (currentByte!12891 w1!591) (currentByte!12891 w2!587)))))

(assert (=> d!90470 (= (arrayRangesEqTransitive!327 (buf!6985 w1!591) (buf!6985 w2!587) (buf!6985 w3!25) #b00000000000000000000000000000000 (currentByte!12891 w1!591) (currentByte!12891 w2!587)) lt!408095)))

(declare-fun bs!22989 () Bool)

(assert (= bs!22989 d!90470))

(assert (=> bs!22989 m!399135))

(declare-fun m!399269 () Bool)

(assert (=> bs!22989 m!399269))

(assert (=> b!267817 d!90470))

(push 1)

(assert (not b!267861))

(assert (not d!90436))

(assert (not b!267863))

(assert (not b!267893))

(assert (not d!90470))

(assert (not d!90438))

(assert (not d!90442))

(assert (not b!267864))

(assert (not d!90440))

(assert (not b!267866))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!90488 () Bool)

(assert (=> d!90488 (= (select (arr!7504 (buf!6985 w2!587)) (currentByte!12891 w1!591)) (select (arr!7504 (buf!6985 w3!25)) (currentByte!12891 w1!591)))))

(assert (=> d!90488 true))

(declare-fun _$12!84 () Unit!19007)

(assert (=> d!90488 (= (choose!367 (buf!6985 w2!587) (buf!6985 w3!25) #b00000000000000000000000000000000 (currentByte!12891 w1!591) (currentByte!12891 w2!587)) _$12!84)))

(declare-fun bs!22992 () Bool)

(assert (= bs!22992 d!90488))

(assert (=> bs!22992 m!399129))

(assert (=> bs!22992 m!399131))

(assert (=> d!90442 d!90488))

(declare-fun d!90492 () Bool)

(assert (=> d!90492 (= (invariant!0 (currentBit!12886 w3!25) (currentByte!12891 w3!25) (size!6517 (buf!6985 w3!25))) (and (bvsge (currentBit!12886 w3!25) #b00000000000000000000000000000000) (bvslt (currentBit!12886 w3!25) #b00000000000000000000000000001000) (bvsge (currentByte!12891 w3!25) #b00000000000000000000000000000000) (or (bvslt (currentByte!12891 w3!25) (size!6517 (buf!6985 w3!25))) (and (= (currentBit!12886 w3!25) #b00000000000000000000000000000000) (= (currentByte!12891 w3!25) (size!6517 (buf!6985 w3!25)))))))))

(assert (=> d!90440 d!90492))

(assert (=> d!90470 d!90450))

(declare-fun d!90494 () Bool)

(assert (=> d!90494 (arrayRangesEq!1052 (buf!6985 w1!591) (buf!6985 w3!25) #b00000000000000000000000000000000 (currentByte!12891 w1!591))))

(assert (=> d!90494 true))

(declare-fun _$16!89 () Unit!19007)

(assert (=> d!90494 (= (choose!369 (buf!6985 w1!591) (buf!6985 w2!587) (buf!6985 w3!25) #b00000000000000000000000000000000 (currentByte!12891 w1!591) (currentByte!12891 w2!587)) _$16!89)))

(declare-fun bs!22993 () Bool)

(assert (= bs!22993 d!90494))

(assert (=> bs!22993 m!399135))

(assert (=> d!90470 d!90494))

(declare-fun d!90496 () Bool)

(assert (=> d!90496 (= (invariant!0 (currentBit!12886 w1!591) (currentByte!12891 w1!591) (size!6517 (buf!6985 w1!591))) (and (bvsge (currentBit!12886 w1!591) #b00000000000000000000000000000000) (bvslt (currentBit!12886 w1!591) #b00000000000000000000000000001000) (bvsge (currentByte!12891 w1!591) #b00000000000000000000000000000000) (or (bvslt (currentByte!12891 w1!591) (size!6517 (buf!6985 w1!591))) (and (= (currentBit!12886 w1!591) #b00000000000000000000000000000000) (= (currentByte!12891 w1!591) (size!6517 (buf!6985 w1!591)))))))))

(assert (=> d!90436 d!90496))

(declare-fun d!90498 () Bool)

(declare-fun e!187959 () Bool)

(assert (=> d!90498 e!187959))

(declare-fun res!223497 () Bool)

(assert (=> d!90498 (=> (not res!223497) (not e!187959))))

(declare-fun lt!408115 () (_ BitVec 64))

(declare-fun lt!408117 () (_ BitVec 64))

(declare-fun lt!408114 () (_ BitVec 64))

(assert (=> d!90498 (= res!223497 (= lt!408114 (bvsub lt!408117 lt!408115)))))

(assert (=> d!90498 (or (= (bvand lt!408117 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!408115 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408117 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408117 lt!408115) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!90498 (= lt!408115 (remainingBits!0 ((_ sign_extend 32) (size!6517 (buf!6985 w1!591))) ((_ sign_extend 32) (currentByte!12891 w1!591)) ((_ sign_extend 32) (currentBit!12886 w1!591))))))

(declare-fun lt!408116 () (_ BitVec 64))

(declare-fun lt!408118 () (_ BitVec 64))

(assert (=> d!90498 (= lt!408117 (bvmul lt!408116 lt!408118))))

(assert (=> d!90498 (or (= lt!408116 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!408118 (bvsdiv (bvmul lt!408116 lt!408118) lt!408116)))))

(assert (=> d!90498 (= lt!408118 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!90498 (= lt!408116 ((_ sign_extend 32) (size!6517 (buf!6985 w1!591))))))

(assert (=> d!90498 (= lt!408114 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12891 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12886 w1!591))))))

(assert (=> d!90498 (invariant!0 (currentBit!12886 w1!591) (currentByte!12891 w1!591) (size!6517 (buf!6985 w1!591)))))

(assert (=> d!90498 (= (bitIndex!0 (size!6517 (buf!6985 w1!591)) (currentByte!12891 w1!591) (currentBit!12886 w1!591)) lt!408114)))

(declare-fun b!267913 () Bool)

(declare-fun res!223498 () Bool)

(assert (=> b!267913 (=> (not res!223498) (not e!187959))))

(assert (=> b!267913 (= res!223498 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!408114))))

(declare-fun b!267914 () Bool)

(declare-fun lt!408119 () (_ BitVec 64))

(assert (=> b!267914 (= e!187959 (bvsle lt!408114 (bvmul lt!408119 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267914 (or (= lt!408119 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!408119 #b0000000000000000000000000000000000000000000000000000000000001000) lt!408119)))))

(assert (=> b!267914 (= lt!408119 ((_ sign_extend 32) (size!6517 (buf!6985 w1!591))))))

(assert (= (and d!90498 res!223497) b!267913))

(assert (= (and b!267913 res!223498) b!267914))

(declare-fun m!399281 () Bool)

(assert (=> d!90498 m!399281))

(assert (=> d!90498 m!399213))

(assert (=> b!267864 d!90498))

(declare-fun d!90500 () Bool)

(declare-fun e!187960 () Bool)

(assert (=> d!90500 e!187960))

(declare-fun res!223499 () Bool)

(assert (=> d!90500 (=> (not res!223499) (not e!187960))))

(declare-fun lt!408123 () (_ BitVec 64))

(declare-fun lt!408121 () (_ BitVec 64))

(declare-fun lt!408120 () (_ BitVec 64))

(assert (=> d!90500 (= res!223499 (= lt!408120 (bvsub lt!408123 lt!408121)))))

(assert (=> d!90500 (or (= (bvand lt!408123 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!408121 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408123 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408123 lt!408121) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!90500 (= lt!408121 (remainingBits!0 ((_ sign_extend 32) (size!6517 (buf!6985 w2!587))) ((_ sign_extend 32) (currentByte!12891 w2!587)) ((_ sign_extend 32) (currentBit!12886 w2!587))))))

(declare-fun lt!408122 () (_ BitVec 64))

(declare-fun lt!408124 () (_ BitVec 64))

(assert (=> d!90500 (= lt!408123 (bvmul lt!408122 lt!408124))))

(assert (=> d!90500 (or (= lt!408122 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!408124 (bvsdiv (bvmul lt!408122 lt!408124) lt!408122)))))

(assert (=> d!90500 (= lt!408124 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!90500 (= lt!408122 ((_ sign_extend 32) (size!6517 (buf!6985 w2!587))))))

(assert (=> d!90500 (= lt!408120 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12891 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12886 w2!587))))))

(assert (=> d!90500 (invariant!0 (currentBit!12886 w2!587) (currentByte!12891 w2!587) (size!6517 (buf!6985 w2!587)))))

(assert (=> d!90500 (= (bitIndex!0 (size!6517 (buf!6985 w2!587)) (currentByte!12891 w2!587) (currentBit!12886 w2!587)) lt!408120)))

(declare-fun b!267915 () Bool)

(declare-fun res!223500 () Bool)

(assert (=> b!267915 (=> (not res!223500) (not e!187960))))

(assert (=> b!267915 (= res!223500 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!408120))))

(declare-fun b!267916 () Bool)

(declare-fun lt!408125 () (_ BitVec 64))

(assert (=> b!267916 (= e!187960 (bvsle lt!408120 (bvmul lt!408125 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267916 (or (= lt!408125 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!408125 #b0000000000000000000000000000000000000000000000000000000000001000) lt!408125)))))

(assert (=> b!267916 (= lt!408125 ((_ sign_extend 32) (size!6517 (buf!6985 w2!587))))))

(assert (= (and d!90500 res!223499) b!267915))

(assert (= (and b!267915 res!223500) b!267916))

(declare-fun m!399283 () Bool)

(assert (=> d!90500 m!399283))

(assert (=> d!90500 m!399215))

(assert (=> b!267864 d!90500))

(declare-fun b!267966 () Bool)

(declare-fun e!188004 () Bool)

(declare-fun e!188006 () Bool)

(assert (=> b!267966 (= e!188004 e!188006)))

(declare-fun res!223539 () Bool)

(assert (=> b!267966 (=> (not res!223539) (not e!188006))))

(declare-fun e!188007 () Bool)

(assert (=> b!267966 (= res!223539 e!188007)))

(declare-fun res!223537 () Bool)

(assert (=> b!267966 (=> res!223537 e!188007)))

(declare-datatypes ((tuple4!402 0))(
  ( (tuple4!403 (_1!12184 (_ BitVec 32)) (_2!12184 (_ BitVec 32)) (_3!981 (_ BitVec 32)) (_4!201 (_ BitVec 32))) )
))
(declare-fun lt!408149 () tuple4!402)

(assert (=> b!267966 (= res!223537 (bvsge (_1!12184 lt!408149) (_2!12184 lt!408149)))))

(declare-fun lt!408148 () (_ BitVec 32))

(assert (=> b!267966 (= lt!408148 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6517 (buf!6985 w2!587)) (currentByte!12891 w2!587) (currentBit!12886 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!408147 () (_ BitVec 32))

(assert (=> b!267966 (= lt!408147 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!402)

(assert (=> b!267966 (= lt!408149 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6517 (buf!6985 w2!587)) (currentByte!12891 w2!587) (currentBit!12886 w2!587))))))

(declare-fun b!267967 () Bool)

(declare-fun e!188003 () Bool)

(assert (=> b!267967 (= e!188006 e!188003)))

(declare-fun c!12350 () Bool)

(assert (=> b!267967 (= c!12350 (= (_3!981 lt!408149) (_4!201 lt!408149)))))

(declare-fun bm!4216 () Bool)

(declare-fun call!4219 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4216 (= call!4219 (byteRangesEq!0 (ite c!12350 (select (arr!7504 (buf!6985 w2!587)) (_3!981 lt!408149)) (select (arr!7504 (buf!6985 w2!587)) (_4!201 lt!408149))) (ite c!12350 (select (arr!7504 (buf!6985 w3!25)) (_3!981 lt!408149)) (select (arr!7504 (buf!6985 w3!25)) (_4!201 lt!408149))) (ite c!12350 lt!408147 #b00000000000000000000000000000000) lt!408148))))

(declare-fun b!267969 () Bool)

(declare-fun res!223536 () Bool)

(assert (=> b!267969 (= res!223536 (= lt!408148 #b00000000000000000000000000000000))))

(declare-fun e!188005 () Bool)

(assert (=> b!267969 (=> res!223536 e!188005)))

(declare-fun e!188008 () Bool)

(assert (=> b!267969 (= e!188008 e!188005)))

(declare-fun b!267970 () Bool)

(assert (=> b!267970 (= e!188005 call!4219)))

(declare-fun b!267971 () Bool)

(assert (=> b!267971 (= e!188007 (arrayRangesEq!1052 (buf!6985 w2!587) (buf!6985 w3!25) (_1!12184 lt!408149) (_2!12184 lt!408149)))))

(declare-fun b!267972 () Bool)

(assert (=> b!267972 (= e!188003 e!188008)))

(declare-fun res!223540 () Bool)

(assert (=> b!267972 (= res!223540 (byteRangesEq!0 (select (arr!7504 (buf!6985 w2!587)) (_3!981 lt!408149)) (select (arr!7504 (buf!6985 w3!25)) (_3!981 lt!408149)) lt!408147 #b00000000000000000000000000001000))))

(assert (=> b!267972 (=> (not res!223540) (not e!188008))))

(declare-fun d!90502 () Bool)

(declare-fun res!223538 () Bool)

(assert (=> d!90502 (=> res!223538 e!188004)))

(assert (=> d!90502 (= res!223538 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6517 (buf!6985 w2!587)) (currentByte!12891 w2!587) (currentBit!12886 w2!587))))))

(assert (=> d!90502 (= (arrayBitRangesEq!0 (buf!6985 w2!587) (buf!6985 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6517 (buf!6985 w2!587)) (currentByte!12891 w2!587) (currentBit!12886 w2!587))) e!188004)))

(declare-fun b!267968 () Bool)

(assert (=> b!267968 (= e!188003 call!4219)))

(assert (= (and d!90502 (not res!223538)) b!267966))

(assert (= (and b!267966 (not res!223537)) b!267971))

(assert (= (and b!267966 res!223539) b!267967))

(assert (= (and b!267967 c!12350) b!267968))

(assert (= (and b!267967 (not c!12350)) b!267972))

(assert (= (and b!267972 res!223540) b!267969))

(assert (= (and b!267969 (not res!223536)) b!267970))

(assert (= (or b!267968 b!267970) bm!4216))

(assert (=> b!267966 m!399203))

(declare-fun m!399301 () Bool)

(assert (=> b!267966 m!399301))

(declare-fun m!399303 () Bool)

(assert (=> bm!4216 m!399303))

(declare-fun m!399305 () Bool)

(assert (=> bm!4216 m!399305))

(declare-fun m!399307 () Bool)

(assert (=> bm!4216 m!399307))

(declare-fun m!399309 () Bool)

(assert (=> bm!4216 m!399309))

(declare-fun m!399311 () Bool)

(assert (=> bm!4216 m!399311))

(declare-fun m!399313 () Bool)

(assert (=> b!267971 m!399313))

(assert (=> b!267972 m!399309))

(assert (=> b!267972 m!399311))

(assert (=> b!267972 m!399309))

(assert (=> b!267972 m!399311))

(declare-fun m!399315 () Bool)

(assert (=> b!267972 m!399315))

(assert (=> b!267863 d!90502))

(assert (=> b!267863 d!90500))

(declare-fun d!90508 () Bool)

(assert (=> d!90508 (= (invariant!0 (currentBit!12886 w2!587) (currentByte!12891 w2!587) (size!6517 (buf!6985 w2!587))) (and (bvsge (currentBit!12886 w2!587) #b00000000000000000000000000000000) (bvslt (currentBit!12886 w2!587) #b00000000000000000000000000001000) (bvsge (currentByte!12891 w2!587) #b00000000000000000000000000000000) (or (bvslt (currentByte!12891 w2!587) (size!6517 (buf!6985 w2!587))) (and (= (currentBit!12886 w2!587) #b00000000000000000000000000000000) (= (currentByte!12891 w2!587) (size!6517 (buf!6985 w2!587)))))))))

(assert (=> d!90438 d!90508))

(declare-fun b!267980 () Bool)

(declare-fun e!188016 () Bool)

(declare-fun e!188018 () Bool)

(assert (=> b!267980 (= e!188016 e!188018)))

(declare-fun res!223549 () Bool)

(assert (=> b!267980 (=> (not res!223549) (not e!188018))))

(declare-fun e!188019 () Bool)

(assert (=> b!267980 (= res!223549 e!188019)))

(declare-fun res!223547 () Bool)

(assert (=> b!267980 (=> res!223547 e!188019)))

(declare-fun lt!408155 () tuple4!402)

(assert (=> b!267980 (= res!223547 (bvsge (_1!12184 lt!408155) (_2!12184 lt!408155)))))

(declare-fun lt!408154 () (_ BitVec 32))

(assert (=> b!267980 (= lt!408154 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6517 (buf!6985 w1!591)) (currentByte!12891 w1!591) (currentBit!12886 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!408153 () (_ BitVec 32))

(assert (=> b!267980 (= lt!408153 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267980 (= lt!408155 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6517 (buf!6985 w1!591)) (currentByte!12891 w1!591) (currentBit!12886 w1!591))))))

(declare-fun b!267981 () Bool)

(declare-fun e!188015 () Bool)

(assert (=> b!267981 (= e!188018 e!188015)))

(declare-fun c!12352 () Bool)

(assert (=> b!267981 (= c!12352 (= (_3!981 lt!408155) (_4!201 lt!408155)))))

(declare-fun bm!4218 () Bool)

(declare-fun call!4221 () Bool)

(assert (=> bm!4218 (= call!4221 (byteRangesEq!0 (ite c!12352 (select (arr!7504 (buf!6985 w1!591)) (_3!981 lt!408155)) (select (arr!7504 (buf!6985 w1!591)) (_4!201 lt!408155))) (ite c!12352 (select (arr!7504 (buf!6985 w2!587)) (_3!981 lt!408155)) (select (arr!7504 (buf!6985 w2!587)) (_4!201 lt!408155))) (ite c!12352 lt!408153 #b00000000000000000000000000000000) lt!408154))))

(declare-fun b!267983 () Bool)

(declare-fun res!223546 () Bool)

(assert (=> b!267983 (= res!223546 (= lt!408154 #b00000000000000000000000000000000))))

(declare-fun e!188017 () Bool)

(assert (=> b!267983 (=> res!223546 e!188017)))

(declare-fun e!188020 () Bool)

(assert (=> b!267983 (= e!188020 e!188017)))

(declare-fun b!267984 () Bool)

(assert (=> b!267984 (= e!188017 call!4221)))

(declare-fun b!267985 () Bool)

(assert (=> b!267985 (= e!188019 (arrayRangesEq!1052 (buf!6985 w1!591) (buf!6985 w2!587) (_1!12184 lt!408155) (_2!12184 lt!408155)))))

(declare-fun b!267986 () Bool)

(assert (=> b!267986 (= e!188015 e!188020)))

(declare-fun res!223550 () Bool)

(assert (=> b!267986 (= res!223550 (byteRangesEq!0 (select (arr!7504 (buf!6985 w1!591)) (_3!981 lt!408155)) (select (arr!7504 (buf!6985 w2!587)) (_3!981 lt!408155)) lt!408153 #b00000000000000000000000000001000))))

(assert (=> b!267986 (=> (not res!223550) (not e!188020))))

(declare-fun d!90510 () Bool)

(declare-fun res!223548 () Bool)

(assert (=> d!90510 (=> res!223548 e!188016)))

(assert (=> d!90510 (= res!223548 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6517 (buf!6985 w1!591)) (currentByte!12891 w1!591) (currentBit!12886 w1!591))))))

(assert (=> d!90510 (= (arrayBitRangesEq!0 (buf!6985 w1!591) (buf!6985 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6517 (buf!6985 w1!591)) (currentByte!12891 w1!591) (currentBit!12886 w1!591))) e!188016)))

(declare-fun b!267982 () Bool)

(assert (=> b!267982 (= e!188015 call!4221)))

(assert (= (and d!90510 (not res!223548)) b!267980))

(assert (= (and b!267980 (not res!223547)) b!267985))

(assert (= (and b!267980 res!223549) b!267981))

(assert (= (and b!267981 c!12352) b!267982))

(assert (= (and b!267981 (not c!12352)) b!267986))

(assert (= (and b!267986 res!223550) b!267983))

(assert (= (and b!267983 (not res!223546)) b!267984))

(assert (= (or b!267982 b!267984) bm!4218))

(assert (=> b!267980 m!399209))

(declare-fun m!399319 () Bool)

(assert (=> b!267980 m!399319))

(declare-fun m!399323 () Bool)

(assert (=> bm!4218 m!399323))

(declare-fun m!399327 () Bool)

(assert (=> bm!4218 m!399327))

(declare-fun m!399333 () Bool)

(assert (=> bm!4218 m!399333))

(declare-fun m!399337 () Bool)

(assert (=> bm!4218 m!399337))

(declare-fun m!399341 () Bool)

(assert (=> bm!4218 m!399341))

(declare-fun m!399343 () Bool)

(assert (=> b!267985 m!399343))

(assert (=> b!267986 m!399337))

(assert (=> b!267986 m!399341))

(assert (=> b!267986 m!399337))

(assert (=> b!267986 m!399341))

(declare-fun m!399347 () Bool)

(assert (=> b!267986 m!399347))

(assert (=> b!267866 d!90510))

(assert (=> b!267866 d!90498))

(declare-fun d!90514 () Bool)

(declare-fun res!223551 () Bool)

(declare-fun e!188021 () Bool)

(assert (=> d!90514 (=> res!223551 e!188021)))

(assert (=> d!90514 (= res!223551 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12891 w1!591)))))

(assert (=> d!90514 (= (arrayRangesEq!1052 (buf!6985 w1!591) (buf!6985 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12891 w1!591)) e!188021)))

(declare-fun b!267987 () Bool)

(declare-fun e!188022 () Bool)

(assert (=> b!267987 (= e!188021 e!188022)))

(declare-fun res!223552 () Bool)

(assert (=> b!267987 (=> (not res!223552) (not e!188022))))

(assert (=> b!267987 (= res!223552 (= (select (arr!7504 (buf!6985 w1!591)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!7504 (buf!6985 w3!25)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!267988 () Bool)

(assert (=> b!267988 (= e!188022 (arrayRangesEq!1052 (buf!6985 w1!591) (buf!6985 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12891 w1!591)))))

(assert (= (and d!90514 (not res!223551)) b!267987))

(assert (= (and b!267987 res!223552) b!267988))

(declare-fun m!399349 () Bool)

(assert (=> b!267987 m!399349))

(declare-fun m!399351 () Bool)

(assert (=> b!267987 m!399351))

(declare-fun m!399353 () Bool)

(assert (=> b!267988 m!399353))

(assert (=> b!267893 d!90514))

(assert (=> b!267861 d!90500))

(declare-fun d!90516 () Bool)

(declare-fun e!188023 () Bool)

(assert (=> d!90516 e!188023))

(declare-fun res!223553 () Bool)

(assert (=> d!90516 (=> (not res!223553) (not e!188023))))

(declare-fun lt!408157 () (_ BitVec 64))

(declare-fun lt!408156 () (_ BitVec 64))

(declare-fun lt!408159 () (_ BitVec 64))

(assert (=> d!90516 (= res!223553 (= lt!408156 (bvsub lt!408159 lt!408157)))))

(assert (=> d!90516 (or (= (bvand lt!408159 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!408157 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408159 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408159 lt!408157) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!90516 (= lt!408157 (remainingBits!0 ((_ sign_extend 32) (size!6517 (buf!6985 w3!25))) ((_ sign_extend 32) (currentByte!12891 w3!25)) ((_ sign_extend 32) (currentBit!12886 w3!25))))))

(declare-fun lt!408158 () (_ BitVec 64))

(declare-fun lt!408160 () (_ BitVec 64))

(assert (=> d!90516 (= lt!408159 (bvmul lt!408158 lt!408160))))

(assert (=> d!90516 (or (= lt!408158 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!408160 (bvsdiv (bvmul lt!408158 lt!408160) lt!408158)))))

(assert (=> d!90516 (= lt!408160 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!90516 (= lt!408158 ((_ sign_extend 32) (size!6517 (buf!6985 w3!25))))))

(assert (=> d!90516 (= lt!408156 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12891 w3!25)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12886 w3!25))))))

(assert (=> d!90516 (invariant!0 (currentBit!12886 w3!25) (currentByte!12891 w3!25) (size!6517 (buf!6985 w3!25)))))

(assert (=> d!90516 (= (bitIndex!0 (size!6517 (buf!6985 w3!25)) (currentByte!12891 w3!25) (currentBit!12886 w3!25)) lt!408156)))

(declare-fun b!267989 () Bool)

(declare-fun res!223554 () Bool)

(assert (=> b!267989 (=> (not res!223554) (not e!188023))))

(assert (=> b!267989 (= res!223554 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!408156))))

(declare-fun b!267990 () Bool)

(declare-fun lt!408161 () (_ BitVec 64))

(assert (=> b!267990 (= e!188023 (bvsle lt!408156 (bvmul lt!408161 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267990 (or (= lt!408161 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!408161 #b0000000000000000000000000000000000000000000000000000000000001000) lt!408161)))))

(assert (=> b!267990 (= lt!408161 ((_ sign_extend 32) (size!6517 (buf!6985 w3!25))))))

(assert (= (and d!90516 res!223553) b!267989))

(assert (= (and b!267989 res!223554) b!267990))

(declare-fun m!399355 () Bool)

(assert (=> d!90516 m!399355))

(assert (=> d!90516 m!399217))

(assert (=> b!267861 d!90516))

(push 1)

(assert (not b!267988))

(assert (not b!267966))

(assert (not bm!4218))

(assert (not d!90516))

(assert (not d!90498))

(assert (not b!267971))

(assert (not b!267986))

(assert (not b!267980))

(assert (not b!267985))

(assert (not bm!4216))

(assert (not d!90494))

(assert (not b!267972))

(assert (not d!90500))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

