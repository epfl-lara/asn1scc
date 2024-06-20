; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59548 () Bool)

(assert start!59548)

(declare-fun res!226654 () Bool)

(declare-fun e!191967 () Bool)

(assert (=> start!59548 (=> (not res!226654) (not e!191967))))

(declare-datatypes ((array!15172 0))(
  ( (array!15173 (arr!7583 (Array (_ BitVec 32) (_ BitVec 8))) (size!6596 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12006 0))(
  ( (BitStream!12007 (buf!7064 array!15172) (currentByte!13056 (_ BitVec 32)) (currentBit!13051 (_ BitVec 32))) )
))
(declare-fun w1!591 () BitStream!12006)

(declare-fun w2!587 () BitStream!12006)

(declare-fun isPrefixOf!0 (BitStream!12006 BitStream!12006) Bool)

(assert (=> start!59548 (= res!226654 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!59548 e!191967))

(declare-fun e!191973 () Bool)

(declare-fun inv!12 (BitStream!12006) Bool)

(assert (=> start!59548 (and (inv!12 w1!591) e!191973)))

(declare-fun e!191971 () Bool)

(assert (=> start!59548 (and (inv!12 w2!587) e!191971)))

(declare-fun w3!25 () BitStream!12006)

(declare-fun e!191968 () Bool)

(assert (=> start!59548 (and (inv!12 w3!25) e!191968)))

(declare-fun b!272124 () Bool)

(declare-fun res!226652 () Bool)

(assert (=> b!272124 (=> (not res!226652) (not e!191967))))

(assert (=> b!272124 (= res!226652 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!272125 () Bool)

(declare-fun e!191966 () Bool)

(assert (=> b!272125 (= e!191966 (isPrefixOf!0 w1!591 w3!25))))

(declare-fun b!272126 () Bool)

(declare-fun array_inv!6320 (array!15172) Bool)

(assert (=> b!272126 (= e!191968 (array_inv!6320 (buf!7064 w3!25)))))

(declare-fun b!272127 () Bool)

(declare-datatypes ((Unit!19161 0))(
  ( (Unit!19162) )
))
(declare-fun e!191977 () Unit!19161)

(declare-fun Unit!19163 () Unit!19161)

(assert (=> b!272127 (= e!191977 Unit!19163)))

(declare-fun lt!410166 () Unit!19161)

(declare-fun arrayRangesEqImpliesEq!179 (array!15172 array!15172 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19161)

(assert (=> b!272127 (= lt!410166 (arrayRangesEqImpliesEq!179 (buf!7064 w2!587) (buf!7064 w3!25) #b00000000000000000000000000000000 (currentByte!13056 w1!591) (currentByte!13056 w2!587)))))

(declare-fun res!226653 () Bool)

(assert (=> b!272127 (= res!226653 (= (select (arr!7583 (buf!7064 w2!587)) (currentByte!13056 w1!591)) (select (arr!7583 (buf!7064 w3!25)) (currentByte!13056 w1!591))))))

(declare-fun e!191969 () Bool)

(assert (=> b!272127 (=> (not res!226653) (not e!191969))))

(assert (=> b!272127 e!191969))

(declare-fun b!272128 () Bool)

(assert (=> b!272128 (= e!191971 (array_inv!6320 (buf!7064 w2!587)))))

(declare-fun b!272129 () Bool)

(declare-fun e!191974 () Bool)

(declare-fun e!191970 () Bool)

(assert (=> b!272129 (= e!191974 e!191970)))

(declare-fun res!226649 () Bool)

(assert (=> b!272129 (=> res!226649 e!191970)))

(assert (=> b!272129 (= res!226649 (or (bvsge (currentByte!13056 w1!591) (size!6596 (buf!7064 w1!591))) (bvslt (currentByte!13056 w1!591) (currentByte!13056 w2!587))))))

(declare-fun b!272130 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!272130 (= e!191969 (byteRangesEq!0 (select (arr!7583 (buf!7064 w1!591)) (currentByte!13056 w1!591)) (select (arr!7583 (buf!7064 w3!25)) (currentByte!13056 w1!591)) #b00000000000000000000000000000000 (currentBit!13051 w1!591)))))

(declare-fun b!272131 () Bool)

(declare-fun Unit!19164 () Unit!19161)

(assert (=> b!272131 (= e!191977 Unit!19164)))

(declare-fun b!272132 () Bool)

(assert (=> b!272132 (= e!191970 (byteRangesEq!0 (select (arr!7583 (buf!7064 w1!591)) (currentByte!13056 w1!591)) (select (arr!7583 (buf!7064 w3!25)) (currentByte!13056 w1!591)) #b00000000000000000000000000000000 (currentBit!13051 w1!591)))))

(declare-fun b!272133 () Bool)

(declare-fun e!191972 () Bool)

(assert (=> b!272133 (= e!191972 (not (byteRangesEq!0 (select (arr!7583 (buf!7064 w1!591)) (currentByte!13056 w1!591)) (select (arr!7583 (buf!7064 w3!25)) (currentByte!13056 w1!591)) #b00000000000000000000000000000000 (currentBit!13051 w1!591))))))

(declare-fun b!272134 () Bool)

(assert (=> b!272134 (= e!191967 (not e!191966))))

(declare-fun res!226648 () Bool)

(assert (=> b!272134 (=> res!226648 e!191966)))

(assert (=> b!272134 (= res!226648 e!191972)))

(declare-fun res!226650 () Bool)

(assert (=> b!272134 (=> (not res!226650) (not e!191972))))

(assert (=> b!272134 (= res!226650 (bvslt (currentByte!13056 w1!591) (size!6596 (buf!7064 w1!591))))))

(declare-fun lt!410167 () Unit!19161)

(assert (=> b!272134 (= lt!410167 e!191977)))

(declare-fun c!12528 () Bool)

(assert (=> b!272134 (= c!12528 (and (bvslt (currentByte!13056 w1!591) (size!6596 (buf!7064 w1!591))) (bvslt (currentByte!13056 w1!591) (currentByte!13056 w2!587))))))

(assert (=> b!272134 e!191974))

(declare-fun res!226651 () Bool)

(assert (=> b!272134 (=> (not res!226651) (not e!191974))))

(declare-fun arrayRangesEq!1128 (array!15172 array!15172 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!272134 (= res!226651 (arrayRangesEq!1128 (buf!7064 w1!591) (buf!7064 w3!25) #b00000000000000000000000000000000 (currentByte!13056 w1!591)))))

(declare-fun lt!410168 () Unit!19161)

(declare-fun arrayRangesEqTransitive!391 (array!15172 array!15172 array!15172 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19161)

(assert (=> b!272134 (= lt!410168 (arrayRangesEqTransitive!391 (buf!7064 w1!591) (buf!7064 w2!587) (buf!7064 w3!25) #b00000000000000000000000000000000 (currentByte!13056 w1!591) (currentByte!13056 w2!587)))))

(declare-fun b!272135 () Bool)

(assert (=> b!272135 (= e!191973 (array_inv!6320 (buf!7064 w1!591)))))

(assert (= (and start!59548 res!226654) b!272124))

(assert (= (and b!272124 res!226652) b!272134))

(assert (= (and b!272134 res!226651) b!272129))

(assert (= (and b!272129 (not res!226649)) b!272132))

(assert (= (and b!272134 c!12528) b!272127))

(assert (= (and b!272134 (not c!12528)) b!272131))

(assert (= (and b!272127 res!226653) b!272130))

(assert (= (and b!272134 res!226650) b!272133))

(assert (= (and b!272134 (not res!226648)) b!272125))

(assert (= start!59548 b!272135))

(assert (= start!59548 b!272128))

(assert (= start!59548 b!272126))

(declare-fun m!404759 () Bool)

(assert (=> start!59548 m!404759))

(declare-fun m!404761 () Bool)

(assert (=> start!59548 m!404761))

(declare-fun m!404763 () Bool)

(assert (=> start!59548 m!404763))

(declare-fun m!404765 () Bool)

(assert (=> start!59548 m!404765))

(declare-fun m!404767 () Bool)

(assert (=> b!272124 m!404767))

(declare-fun m!404769 () Bool)

(assert (=> b!272130 m!404769))

(declare-fun m!404771 () Bool)

(assert (=> b!272130 m!404771))

(assert (=> b!272130 m!404769))

(assert (=> b!272130 m!404771))

(declare-fun m!404773 () Bool)

(assert (=> b!272130 m!404773))

(declare-fun m!404775 () Bool)

(assert (=> b!272125 m!404775))

(declare-fun m!404777 () Bool)

(assert (=> b!272134 m!404777))

(declare-fun m!404779 () Bool)

(assert (=> b!272134 m!404779))

(assert (=> b!272132 m!404769))

(assert (=> b!272132 m!404771))

(assert (=> b!272132 m!404769))

(assert (=> b!272132 m!404771))

(assert (=> b!272132 m!404773))

(assert (=> b!272133 m!404769))

(assert (=> b!272133 m!404771))

(assert (=> b!272133 m!404769))

(assert (=> b!272133 m!404771))

(assert (=> b!272133 m!404773))

(declare-fun m!404781 () Bool)

(assert (=> b!272135 m!404781))

(declare-fun m!404783 () Bool)

(assert (=> b!272127 m!404783))

(declare-fun m!404785 () Bool)

(assert (=> b!272127 m!404785))

(assert (=> b!272127 m!404771))

(declare-fun m!404787 () Bool)

(assert (=> b!272128 m!404787))

(declare-fun m!404789 () Bool)

(assert (=> b!272126 m!404789))

(check-sat (not b!272133) (not b!272135) (not b!272125) (not b!272128) (not b!272124) (not start!59548) (not b!272132) (not b!272134) (not b!272126) (not b!272127) (not b!272130))
(check-sat)
(get-model)

(declare-fun d!93008 () Bool)

(assert (=> d!93008 (= (array_inv!6320 (buf!7064 w2!587)) (bvsge (size!6596 (buf!7064 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!272128 d!93008))

(declare-fun d!93010 () Bool)

(assert (=> d!93010 (= (byteRangesEq!0 (select (arr!7583 (buf!7064 w1!591)) (currentByte!13056 w1!591)) (select (arr!7583 (buf!7064 w3!25)) (currentByte!13056 w1!591)) #b00000000000000000000000000000000 (currentBit!13051 w1!591)) (or (= #b00000000000000000000000000000000 (currentBit!13051 w1!591)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7583 (buf!7064 w1!591)) (currentByte!13056 w1!591))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!13051 w1!591)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7583 (buf!7064 w3!25)) (currentByte!13056 w1!591))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!13051 w1!591)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23455 () Bool)

(assert (= bs!23455 d!93010))

(declare-fun m!404823 () Bool)

(assert (=> bs!23455 m!404823))

(declare-fun m!404825 () Bool)

(assert (=> bs!23455 m!404825))

(assert (=> b!272133 d!93010))

(declare-fun d!93012 () Bool)

(assert (=> d!93012 (and (bvsge (currentByte!13056 w1!591) #b00000000000000000000000000000000) (bvslt (currentByte!13056 w1!591) (size!6596 (buf!7064 w2!587))) (bvslt (currentByte!13056 w1!591) (size!6596 (buf!7064 w3!25))) (= (select (arr!7583 (buf!7064 w2!587)) (currentByte!13056 w1!591)) (select (arr!7583 (buf!7064 w3!25)) (currentByte!13056 w1!591))))))

(declare-fun lt!410180 () Unit!19161)

(declare-fun choose!441 (array!15172 array!15172 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19161)

(assert (=> d!93012 (= lt!410180 (choose!441 (buf!7064 w2!587) (buf!7064 w3!25) #b00000000000000000000000000000000 (currentByte!13056 w1!591) (currentByte!13056 w2!587)))))

(assert (=> d!93012 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!13056 w2!587)))))

(assert (=> d!93012 (= (arrayRangesEqImpliesEq!179 (buf!7064 w2!587) (buf!7064 w3!25) #b00000000000000000000000000000000 (currentByte!13056 w1!591) (currentByte!13056 w2!587)) lt!410180)))

(declare-fun bs!23456 () Bool)

(assert (= bs!23456 d!93012))

(assert (=> bs!23456 m!404785))

(assert (=> bs!23456 m!404771))

(declare-fun m!404827 () Bool)

(assert (=> bs!23456 m!404827))

(assert (=> b!272127 d!93012))

(assert (=> b!272132 d!93010))

(declare-fun d!93014 () Bool)

(assert (=> d!93014 (= (array_inv!6320 (buf!7064 w3!25)) (bvsge (size!6596 (buf!7064 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!272126 d!93014))

(declare-fun d!93016 () Bool)

(declare-fun res!226684 () Bool)

(declare-fun e!192021 () Bool)

(assert (=> d!93016 (=> (not res!226684) (not e!192021))))

(assert (=> d!93016 (= res!226684 (= (size!6596 (buf!7064 w1!591)) (size!6596 (buf!7064 w3!25))))))

(assert (=> d!93016 (= (isPrefixOf!0 w1!591 w3!25) e!192021)))

(declare-fun b!272178 () Bool)

(declare-fun res!226683 () Bool)

(assert (=> b!272178 (=> (not res!226683) (not e!192021))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!272178 (= res!226683 (bvsle (bitIndex!0 (size!6596 (buf!7064 w1!591)) (currentByte!13056 w1!591) (currentBit!13051 w1!591)) (bitIndex!0 (size!6596 (buf!7064 w3!25)) (currentByte!13056 w3!25) (currentBit!13051 w3!25))))))

(declare-fun b!272179 () Bool)

(declare-fun e!192022 () Bool)

(assert (=> b!272179 (= e!192021 e!192022)))

(declare-fun res!226682 () Bool)

(assert (=> b!272179 (=> res!226682 e!192022)))

(assert (=> b!272179 (= res!226682 (= (size!6596 (buf!7064 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!272180 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15172 array!15172 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!272180 (= e!192022 (arrayBitRangesEq!0 (buf!7064 w1!591) (buf!7064 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6596 (buf!7064 w1!591)) (currentByte!13056 w1!591) (currentBit!13051 w1!591))))))

(assert (= (and d!93016 res!226684) b!272178))

(assert (= (and b!272178 res!226683) b!272179))

(assert (= (and b!272179 (not res!226682)) b!272180))

(declare-fun m!404829 () Bool)

(assert (=> b!272178 m!404829))

(declare-fun m!404831 () Bool)

(assert (=> b!272178 m!404831))

(assert (=> b!272180 m!404829))

(assert (=> b!272180 m!404829))

(declare-fun m!404833 () Bool)

(assert (=> b!272180 m!404833))

(assert (=> b!272125 d!93016))

(assert (=> b!272130 d!93010))

(declare-fun d!93024 () Bool)

(assert (=> d!93024 (= (array_inv!6320 (buf!7064 w1!591)) (bvsge (size!6596 (buf!7064 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!272135 d!93024))

(declare-fun d!93026 () Bool)

(declare-fun res!226691 () Bool)

(declare-fun e!192025 () Bool)

(assert (=> d!93026 (=> (not res!226691) (not e!192025))))

(assert (=> d!93026 (= res!226691 (= (size!6596 (buf!7064 w2!587)) (size!6596 (buf!7064 w3!25))))))

(assert (=> d!93026 (= (isPrefixOf!0 w2!587 w3!25) e!192025)))

(declare-fun b!272185 () Bool)

(declare-fun res!226690 () Bool)

(assert (=> b!272185 (=> (not res!226690) (not e!192025))))

(assert (=> b!272185 (= res!226690 (bvsle (bitIndex!0 (size!6596 (buf!7064 w2!587)) (currentByte!13056 w2!587) (currentBit!13051 w2!587)) (bitIndex!0 (size!6596 (buf!7064 w3!25)) (currentByte!13056 w3!25) (currentBit!13051 w3!25))))))

(declare-fun b!272186 () Bool)

(declare-fun e!192028 () Bool)

(assert (=> b!272186 (= e!192025 e!192028)))

(declare-fun res!226689 () Bool)

(assert (=> b!272186 (=> res!226689 e!192028)))

(assert (=> b!272186 (= res!226689 (= (size!6596 (buf!7064 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!272187 () Bool)

(assert (=> b!272187 (= e!192028 (arrayBitRangesEq!0 (buf!7064 w2!587) (buf!7064 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6596 (buf!7064 w2!587)) (currentByte!13056 w2!587) (currentBit!13051 w2!587))))))

(assert (= (and d!93026 res!226691) b!272185))

(assert (= (and b!272185 res!226690) b!272186))

(assert (= (and b!272186 (not res!226689)) b!272187))

(declare-fun m!404835 () Bool)

(assert (=> b!272185 m!404835))

(assert (=> b!272185 m!404831))

(assert (=> b!272187 m!404835))

(assert (=> b!272187 m!404835))

(declare-fun m!404837 () Bool)

(assert (=> b!272187 m!404837))

(assert (=> b!272124 d!93026))

(declare-fun d!93028 () Bool)

(declare-fun res!226704 () Bool)

(declare-fun e!192037 () Bool)

(assert (=> d!93028 (=> res!226704 e!192037)))

(assert (=> d!93028 (= res!226704 (= #b00000000000000000000000000000000 (currentByte!13056 w1!591)))))

(assert (=> d!93028 (= (arrayRangesEq!1128 (buf!7064 w1!591) (buf!7064 w3!25) #b00000000000000000000000000000000 (currentByte!13056 w1!591)) e!192037)))

(declare-fun b!272200 () Bool)

(declare-fun e!192038 () Bool)

(assert (=> b!272200 (= e!192037 e!192038)))

(declare-fun res!226705 () Bool)

(assert (=> b!272200 (=> (not res!226705) (not e!192038))))

(assert (=> b!272200 (= res!226705 (= (select (arr!7583 (buf!7064 w1!591)) #b00000000000000000000000000000000) (select (arr!7583 (buf!7064 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!272201 () Bool)

(assert (=> b!272201 (= e!192038 (arrayRangesEq!1128 (buf!7064 w1!591) (buf!7064 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!13056 w1!591)))))

(assert (= (and d!93028 (not res!226704)) b!272200))

(assert (= (and b!272200 res!226705) b!272201))

(declare-fun m!404849 () Bool)

(assert (=> b!272200 m!404849))

(declare-fun m!404851 () Bool)

(assert (=> b!272200 m!404851))

(declare-fun m!404853 () Bool)

(assert (=> b!272201 m!404853))

(assert (=> b!272134 d!93028))

(declare-fun d!93036 () Bool)

(assert (=> d!93036 (arrayRangesEq!1128 (buf!7064 w1!591) (buf!7064 w3!25) #b00000000000000000000000000000000 (currentByte!13056 w1!591))))

(declare-fun lt!410183 () Unit!19161)

(declare-fun choose!442 (array!15172 array!15172 array!15172 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19161)

(assert (=> d!93036 (= lt!410183 (choose!442 (buf!7064 w1!591) (buf!7064 w2!587) (buf!7064 w3!25) #b00000000000000000000000000000000 (currentByte!13056 w1!591) (currentByte!13056 w2!587)))))

(assert (=> d!93036 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!13056 w1!591)) (bvsle (currentByte!13056 w1!591) (currentByte!13056 w2!587)))))

(assert (=> d!93036 (= (arrayRangesEqTransitive!391 (buf!7064 w1!591) (buf!7064 w2!587) (buf!7064 w3!25) #b00000000000000000000000000000000 (currentByte!13056 w1!591) (currentByte!13056 w2!587)) lt!410183)))

(declare-fun bs!23457 () Bool)

(assert (= bs!23457 d!93036))

(assert (=> bs!23457 m!404777))

(declare-fun m!404855 () Bool)

(assert (=> bs!23457 m!404855))

(assert (=> b!272134 d!93036))

(declare-fun d!93038 () Bool)

(declare-fun res!226714 () Bool)

(declare-fun e!192043 () Bool)

(assert (=> d!93038 (=> (not res!226714) (not e!192043))))

(assert (=> d!93038 (= res!226714 (= (size!6596 (buf!7064 w1!591)) (size!6596 (buf!7064 w2!587))))))

(assert (=> d!93038 (= (isPrefixOf!0 w1!591 w2!587) e!192043)))

(declare-fun b!272208 () Bool)

(declare-fun res!226713 () Bool)

(assert (=> b!272208 (=> (not res!226713) (not e!192043))))

(assert (=> b!272208 (= res!226713 (bvsle (bitIndex!0 (size!6596 (buf!7064 w1!591)) (currentByte!13056 w1!591) (currentBit!13051 w1!591)) (bitIndex!0 (size!6596 (buf!7064 w2!587)) (currentByte!13056 w2!587) (currentBit!13051 w2!587))))))

(declare-fun b!272209 () Bool)

(declare-fun e!192044 () Bool)

(assert (=> b!272209 (= e!192043 e!192044)))

(declare-fun res!226712 () Bool)

(assert (=> b!272209 (=> res!226712 e!192044)))

(assert (=> b!272209 (= res!226712 (= (size!6596 (buf!7064 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!272210 () Bool)

(assert (=> b!272210 (= e!192044 (arrayBitRangesEq!0 (buf!7064 w1!591) (buf!7064 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6596 (buf!7064 w1!591)) (currentByte!13056 w1!591) (currentBit!13051 w1!591))))))

(assert (= (and d!93038 res!226714) b!272208))

(assert (= (and b!272208 res!226713) b!272209))

(assert (= (and b!272209 (not res!226712)) b!272210))

(assert (=> b!272208 m!404829))

(assert (=> b!272208 m!404835))

(assert (=> b!272210 m!404829))

(assert (=> b!272210 m!404829))

(declare-fun m!404857 () Bool)

(assert (=> b!272210 m!404857))

(assert (=> start!59548 d!93038))

(declare-fun d!93040 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!93040 (= (inv!12 w1!591) (invariant!0 (currentBit!13051 w1!591) (currentByte!13056 w1!591) (size!6596 (buf!7064 w1!591))))))

(declare-fun bs!23459 () Bool)

(assert (= bs!23459 d!93040))

(declare-fun m!404861 () Bool)

(assert (=> bs!23459 m!404861))

(assert (=> start!59548 d!93040))

(declare-fun d!93044 () Bool)

(assert (=> d!93044 (= (inv!12 w2!587) (invariant!0 (currentBit!13051 w2!587) (currentByte!13056 w2!587) (size!6596 (buf!7064 w2!587))))))

(declare-fun bs!23460 () Bool)

(assert (= bs!23460 d!93044))

(declare-fun m!404865 () Bool)

(assert (=> bs!23460 m!404865))

(assert (=> start!59548 d!93044))

(declare-fun d!93046 () Bool)

(assert (=> d!93046 (= (inv!12 w3!25) (invariant!0 (currentBit!13051 w3!25) (currentByte!13056 w3!25) (size!6596 (buf!7064 w3!25))))))

(declare-fun bs!23461 () Bool)

(assert (= bs!23461 d!93046))

(declare-fun m!404869 () Bool)

(assert (=> bs!23461 m!404869))

(assert (=> start!59548 d!93046))

(check-sat (not b!272201) (not b!272208) (not b!272185) (not d!93012) (not b!272210) (not d!93036) (not b!272187) (not d!93040) (not d!93046) (not b!272180) (not d!93044) (not b!272178))
(check-sat)
(get-model)

(declare-fun d!93086 () Bool)

(assert (=> d!93086 (= (invariant!0 (currentBit!13051 w2!587) (currentByte!13056 w2!587) (size!6596 (buf!7064 w2!587))) (and (bvsge (currentBit!13051 w2!587) #b00000000000000000000000000000000) (bvslt (currentBit!13051 w2!587) #b00000000000000000000000000001000) (bvsge (currentByte!13056 w2!587) #b00000000000000000000000000000000) (or (bvslt (currentByte!13056 w2!587) (size!6596 (buf!7064 w2!587))) (and (= (currentBit!13051 w2!587) #b00000000000000000000000000000000) (= (currentByte!13056 w2!587) (size!6596 (buf!7064 w2!587)))))))))

(assert (=> d!93044 d!93086))

(declare-fun d!93088 () Bool)

(assert (=> d!93088 (= (invariant!0 (currentBit!13051 w1!591) (currentByte!13056 w1!591) (size!6596 (buf!7064 w1!591))) (and (bvsge (currentBit!13051 w1!591) #b00000000000000000000000000000000) (bvslt (currentBit!13051 w1!591) #b00000000000000000000000000001000) (bvsge (currentByte!13056 w1!591) #b00000000000000000000000000000000) (or (bvslt (currentByte!13056 w1!591) (size!6596 (buf!7064 w1!591))) (and (= (currentBit!13051 w1!591) #b00000000000000000000000000000000) (= (currentByte!13056 w1!591) (size!6596 (buf!7064 w1!591)))))))))

(assert (=> d!93040 d!93088))

(declare-fun b!272249 () Bool)

(declare-fun res!226753 () Bool)

(declare-fun lt!410204 () (_ BitVec 32))

(assert (=> b!272249 (= res!226753 (= lt!410204 #b00000000000000000000000000000000))))

(declare-fun e!192082 () Bool)

(assert (=> b!272249 (=> res!226753 e!192082)))

(declare-fun e!192081 () Bool)

(assert (=> b!272249 (= e!192081 e!192082)))

(declare-fun b!272250 () Bool)

(declare-fun e!192078 () Bool)

(declare-fun e!192080 () Bool)

(assert (=> b!272250 (= e!192078 e!192080)))

(declare-fun c!12534 () Bool)

(declare-datatypes ((tuple4!474 0))(
  ( (tuple4!475 (_1!12220 (_ BitVec 32)) (_2!12220 (_ BitVec 32)) (_3!1017 (_ BitVec 32)) (_4!237 (_ BitVec 32))) )
))
(declare-fun lt!410202 () tuple4!474)

(assert (=> b!272250 (= c!12534 (= (_3!1017 lt!410202) (_4!237 lt!410202)))))

(declare-fun e!192077 () Bool)

(declare-fun b!272251 () Bool)

(assert (=> b!272251 (= e!192077 (arrayRangesEq!1128 (buf!7064 w2!587) (buf!7064 w3!25) (_1!12220 lt!410202) (_2!12220 lt!410202)))))

(declare-fun d!93090 () Bool)

(declare-fun res!226752 () Bool)

(declare-fun e!192079 () Bool)

(assert (=> d!93090 (=> res!226752 e!192079)))

(assert (=> d!93090 (= res!226752 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6596 (buf!7064 w2!587)) (currentByte!13056 w2!587) (currentBit!13051 w2!587))))))

(assert (=> d!93090 (= (arrayBitRangesEq!0 (buf!7064 w2!587) (buf!7064 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6596 (buf!7064 w2!587)) (currentByte!13056 w2!587) (currentBit!13051 w2!587))) e!192079)))

(declare-fun b!272252 () Bool)

(assert (=> b!272252 (= e!192079 e!192078)))

(declare-fun res!226750 () Bool)

(assert (=> b!272252 (=> (not res!226750) (not e!192078))))

(assert (=> b!272252 (= res!226750 e!192077)))

(declare-fun res!226749 () Bool)

(assert (=> b!272252 (=> res!226749 e!192077)))

(assert (=> b!272252 (= res!226749 (bvsge (_1!12220 lt!410202) (_2!12220 lt!410202)))))

(assert (=> b!272252 (= lt!410204 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6596 (buf!7064 w2!587)) (currentByte!13056 w2!587) (currentBit!13051 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!410203 () (_ BitVec 32))

(assert (=> b!272252 (= lt!410203 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!474)

(assert (=> b!272252 (= lt!410202 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6596 (buf!7064 w2!587)) (currentByte!13056 w2!587) (currentBit!13051 w2!587))))))

(declare-fun b!272253 () Bool)

(assert (=> b!272253 (= e!192080 e!192081)))

(declare-fun res!226751 () Bool)

(assert (=> b!272253 (= res!226751 (byteRangesEq!0 (select (arr!7583 (buf!7064 w2!587)) (_3!1017 lt!410202)) (select (arr!7583 (buf!7064 w3!25)) (_3!1017 lt!410202)) lt!410203 #b00000000000000000000000000001000))))

(assert (=> b!272253 (=> (not res!226751) (not e!192081))))

(declare-fun b!272254 () Bool)

(declare-fun call!4358 () Bool)

(assert (=> b!272254 (= e!192080 call!4358)))

(declare-fun bm!4355 () Bool)

(assert (=> bm!4355 (= call!4358 (byteRangesEq!0 (ite c!12534 (select (arr!7583 (buf!7064 w2!587)) (_3!1017 lt!410202)) (select (arr!7583 (buf!7064 w2!587)) (_4!237 lt!410202))) (ite c!12534 (select (arr!7583 (buf!7064 w3!25)) (_3!1017 lt!410202)) (select (arr!7583 (buf!7064 w3!25)) (_4!237 lt!410202))) (ite c!12534 lt!410203 #b00000000000000000000000000000000) lt!410204))))

(declare-fun b!272255 () Bool)

(assert (=> b!272255 (= e!192082 call!4358)))

(assert (= (and d!93090 (not res!226752)) b!272252))

(assert (= (and b!272252 (not res!226749)) b!272251))

(assert (= (and b!272252 res!226750) b!272250))

(assert (= (and b!272250 c!12534) b!272254))

(assert (= (and b!272250 (not c!12534)) b!272253))

(assert (= (and b!272253 res!226751) b!272249))

(assert (= (and b!272249 (not res!226753)) b!272255))

(assert (= (or b!272254 b!272255) bm!4355))

(declare-fun m!404919 () Bool)

(assert (=> b!272251 m!404919))

(assert (=> b!272252 m!404835))

(declare-fun m!404921 () Bool)

(assert (=> b!272252 m!404921))

(declare-fun m!404923 () Bool)

(assert (=> b!272253 m!404923))

(declare-fun m!404925 () Bool)

(assert (=> b!272253 m!404925))

(assert (=> b!272253 m!404923))

(assert (=> b!272253 m!404925))

(declare-fun m!404927 () Bool)

(assert (=> b!272253 m!404927))

(declare-fun m!404929 () Bool)

(assert (=> bm!4355 m!404929))

(declare-fun m!404931 () Bool)

(assert (=> bm!4355 m!404931))

(assert (=> bm!4355 m!404925))

(assert (=> bm!4355 m!404923))

(declare-fun m!404933 () Bool)

(assert (=> bm!4355 m!404933))

(assert (=> b!272187 d!93090))

(declare-fun d!93092 () Bool)

(declare-fun e!192085 () Bool)

(assert (=> d!93092 e!192085))

(declare-fun res!226758 () Bool)

(assert (=> d!93092 (=> (not res!226758) (not e!192085))))

(declare-fun lt!410221 () (_ BitVec 64))

(declare-fun lt!410218 () (_ BitVec 64))

(declare-fun lt!410220 () (_ BitVec 64))

(assert (=> d!93092 (= res!226758 (= lt!410221 (bvsub lt!410220 lt!410218)))))

(assert (=> d!93092 (or (= (bvand lt!410220 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!410218 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!410220 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!410220 lt!410218) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!93092 (= lt!410218 (remainingBits!0 ((_ sign_extend 32) (size!6596 (buf!7064 w2!587))) ((_ sign_extend 32) (currentByte!13056 w2!587)) ((_ sign_extend 32) (currentBit!13051 w2!587))))))

(declare-fun lt!410217 () (_ BitVec 64))

(declare-fun lt!410222 () (_ BitVec 64))

(assert (=> d!93092 (= lt!410220 (bvmul lt!410217 lt!410222))))

(assert (=> d!93092 (or (= lt!410217 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!410222 (bvsdiv (bvmul lt!410217 lt!410222) lt!410217)))))

(assert (=> d!93092 (= lt!410222 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93092 (= lt!410217 ((_ sign_extend 32) (size!6596 (buf!7064 w2!587))))))

(assert (=> d!93092 (= lt!410221 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13056 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13051 w2!587))))))

(assert (=> d!93092 (invariant!0 (currentBit!13051 w2!587) (currentByte!13056 w2!587) (size!6596 (buf!7064 w2!587)))))

(assert (=> d!93092 (= (bitIndex!0 (size!6596 (buf!7064 w2!587)) (currentByte!13056 w2!587) (currentBit!13051 w2!587)) lt!410221)))

(declare-fun b!272260 () Bool)

(declare-fun res!226759 () Bool)

(assert (=> b!272260 (=> (not res!226759) (not e!192085))))

(assert (=> b!272260 (= res!226759 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!410221))))

(declare-fun b!272261 () Bool)

(declare-fun lt!410219 () (_ BitVec 64))

(assert (=> b!272261 (= e!192085 (bvsle lt!410221 (bvmul lt!410219 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!272261 (or (= lt!410219 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!410219 #b0000000000000000000000000000000000000000000000000000000000001000) lt!410219)))))

(assert (=> b!272261 (= lt!410219 ((_ sign_extend 32) (size!6596 (buf!7064 w2!587))))))

(assert (= (and d!93092 res!226758) b!272260))

(assert (= (and b!272260 res!226759) b!272261))

(declare-fun m!404935 () Bool)

(assert (=> d!93092 m!404935))

(assert (=> d!93092 m!404865))

(assert (=> b!272187 d!93092))

(declare-fun d!93094 () Bool)

(declare-fun res!226760 () Bool)

(declare-fun e!192086 () Bool)

(assert (=> d!93094 (=> res!226760 e!192086)))

(assert (=> d!93094 (= res!226760 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!13056 w1!591)))))

(assert (=> d!93094 (= (arrayRangesEq!1128 (buf!7064 w1!591) (buf!7064 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!13056 w1!591)) e!192086)))

(declare-fun b!272262 () Bool)

(declare-fun e!192087 () Bool)

(assert (=> b!272262 (= e!192086 e!192087)))

(declare-fun res!226761 () Bool)

(assert (=> b!272262 (=> (not res!226761) (not e!192087))))

(assert (=> b!272262 (= res!226761 (= (select (arr!7583 (buf!7064 w1!591)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!7583 (buf!7064 w3!25)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!272263 () Bool)

(assert (=> b!272263 (= e!192087 (arrayRangesEq!1128 (buf!7064 w1!591) (buf!7064 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!13056 w1!591)))))

(assert (= (and d!93094 (not res!226760)) b!272262))

(assert (= (and b!272262 res!226761) b!272263))

(declare-fun m!404937 () Bool)

(assert (=> b!272262 m!404937))

(declare-fun m!404939 () Bool)

(assert (=> b!272262 m!404939))

(declare-fun m!404941 () Bool)

(assert (=> b!272263 m!404941))

(assert (=> b!272201 d!93094))

(declare-fun b!272264 () Bool)

(declare-fun res!226766 () Bool)

(declare-fun lt!410225 () (_ BitVec 32))

(assert (=> b!272264 (= res!226766 (= lt!410225 #b00000000000000000000000000000000))))

(declare-fun e!192093 () Bool)

(assert (=> b!272264 (=> res!226766 e!192093)))

(declare-fun e!192092 () Bool)

(assert (=> b!272264 (= e!192092 e!192093)))

(declare-fun b!272265 () Bool)

(declare-fun e!192089 () Bool)

(declare-fun e!192091 () Bool)

(assert (=> b!272265 (= e!192089 e!192091)))

(declare-fun c!12535 () Bool)

(declare-fun lt!410223 () tuple4!474)

(assert (=> b!272265 (= c!12535 (= (_3!1017 lt!410223) (_4!237 lt!410223)))))

(declare-fun b!272266 () Bool)

(declare-fun e!192088 () Bool)

(assert (=> b!272266 (= e!192088 (arrayRangesEq!1128 (buf!7064 w1!591) (buf!7064 w3!25) (_1!12220 lt!410223) (_2!12220 lt!410223)))))

(declare-fun d!93096 () Bool)

(declare-fun res!226765 () Bool)

(declare-fun e!192090 () Bool)

(assert (=> d!93096 (=> res!226765 e!192090)))

(assert (=> d!93096 (= res!226765 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6596 (buf!7064 w1!591)) (currentByte!13056 w1!591) (currentBit!13051 w1!591))))))

(assert (=> d!93096 (= (arrayBitRangesEq!0 (buf!7064 w1!591) (buf!7064 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6596 (buf!7064 w1!591)) (currentByte!13056 w1!591) (currentBit!13051 w1!591))) e!192090)))

(declare-fun b!272267 () Bool)

(assert (=> b!272267 (= e!192090 e!192089)))

(declare-fun res!226763 () Bool)

(assert (=> b!272267 (=> (not res!226763) (not e!192089))))

(assert (=> b!272267 (= res!226763 e!192088)))

(declare-fun res!226762 () Bool)

(assert (=> b!272267 (=> res!226762 e!192088)))

(assert (=> b!272267 (= res!226762 (bvsge (_1!12220 lt!410223) (_2!12220 lt!410223)))))

(assert (=> b!272267 (= lt!410225 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6596 (buf!7064 w1!591)) (currentByte!13056 w1!591) (currentBit!13051 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!410224 () (_ BitVec 32))

(assert (=> b!272267 (= lt!410224 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!272267 (= lt!410223 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6596 (buf!7064 w1!591)) (currentByte!13056 w1!591) (currentBit!13051 w1!591))))))

(declare-fun b!272268 () Bool)

(assert (=> b!272268 (= e!192091 e!192092)))

(declare-fun res!226764 () Bool)

(assert (=> b!272268 (= res!226764 (byteRangesEq!0 (select (arr!7583 (buf!7064 w1!591)) (_3!1017 lt!410223)) (select (arr!7583 (buf!7064 w3!25)) (_3!1017 lt!410223)) lt!410224 #b00000000000000000000000000001000))))

(assert (=> b!272268 (=> (not res!226764) (not e!192092))))

(declare-fun b!272269 () Bool)

(declare-fun call!4359 () Bool)

(assert (=> b!272269 (= e!192091 call!4359)))

(declare-fun bm!4356 () Bool)

(assert (=> bm!4356 (= call!4359 (byteRangesEq!0 (ite c!12535 (select (arr!7583 (buf!7064 w1!591)) (_3!1017 lt!410223)) (select (arr!7583 (buf!7064 w1!591)) (_4!237 lt!410223))) (ite c!12535 (select (arr!7583 (buf!7064 w3!25)) (_3!1017 lt!410223)) (select (arr!7583 (buf!7064 w3!25)) (_4!237 lt!410223))) (ite c!12535 lt!410224 #b00000000000000000000000000000000) lt!410225))))

(declare-fun b!272270 () Bool)

(assert (=> b!272270 (= e!192093 call!4359)))

(assert (= (and d!93096 (not res!226765)) b!272267))

(assert (= (and b!272267 (not res!226762)) b!272266))

(assert (= (and b!272267 res!226763) b!272265))

(assert (= (and b!272265 c!12535) b!272269))

(assert (= (and b!272265 (not c!12535)) b!272268))

(assert (= (and b!272268 res!226764) b!272264))

(assert (= (and b!272264 (not res!226766)) b!272270))

(assert (= (or b!272269 b!272270) bm!4356))

(declare-fun m!404943 () Bool)

(assert (=> b!272266 m!404943))

(assert (=> b!272267 m!404829))

(declare-fun m!404945 () Bool)

(assert (=> b!272267 m!404945))

(declare-fun m!404947 () Bool)

(assert (=> b!272268 m!404947))

(declare-fun m!404949 () Bool)

(assert (=> b!272268 m!404949))

(assert (=> b!272268 m!404947))

(assert (=> b!272268 m!404949))

(declare-fun m!404951 () Bool)

(assert (=> b!272268 m!404951))

(declare-fun m!404953 () Bool)

(assert (=> bm!4356 m!404953))

(declare-fun m!404955 () Bool)

(assert (=> bm!4356 m!404955))

(assert (=> bm!4356 m!404949))

(assert (=> bm!4356 m!404947))

(declare-fun m!404957 () Bool)

(assert (=> bm!4356 m!404957))

(assert (=> b!272180 d!93096))

(declare-fun d!93098 () Bool)

(declare-fun e!192094 () Bool)

(assert (=> d!93098 e!192094))

(declare-fun res!226767 () Bool)

(assert (=> d!93098 (=> (not res!226767) (not e!192094))))

(declare-fun lt!410230 () (_ BitVec 64))

(declare-fun lt!410229 () (_ BitVec 64))

(declare-fun lt!410227 () (_ BitVec 64))

(assert (=> d!93098 (= res!226767 (= lt!410230 (bvsub lt!410229 lt!410227)))))

(assert (=> d!93098 (or (= (bvand lt!410229 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!410227 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!410229 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!410229 lt!410227) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!93098 (= lt!410227 (remainingBits!0 ((_ sign_extend 32) (size!6596 (buf!7064 w1!591))) ((_ sign_extend 32) (currentByte!13056 w1!591)) ((_ sign_extend 32) (currentBit!13051 w1!591))))))

(declare-fun lt!410226 () (_ BitVec 64))

(declare-fun lt!410231 () (_ BitVec 64))

(assert (=> d!93098 (= lt!410229 (bvmul lt!410226 lt!410231))))

(assert (=> d!93098 (or (= lt!410226 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!410231 (bvsdiv (bvmul lt!410226 lt!410231) lt!410226)))))

(assert (=> d!93098 (= lt!410231 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93098 (= lt!410226 ((_ sign_extend 32) (size!6596 (buf!7064 w1!591))))))

(assert (=> d!93098 (= lt!410230 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13056 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13051 w1!591))))))

(assert (=> d!93098 (invariant!0 (currentBit!13051 w1!591) (currentByte!13056 w1!591) (size!6596 (buf!7064 w1!591)))))

(assert (=> d!93098 (= (bitIndex!0 (size!6596 (buf!7064 w1!591)) (currentByte!13056 w1!591) (currentBit!13051 w1!591)) lt!410230)))

(declare-fun b!272271 () Bool)

(declare-fun res!226768 () Bool)

(assert (=> b!272271 (=> (not res!226768) (not e!192094))))

(assert (=> b!272271 (= res!226768 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!410230))))

(declare-fun b!272272 () Bool)

(declare-fun lt!410228 () (_ BitVec 64))

(assert (=> b!272272 (= e!192094 (bvsle lt!410230 (bvmul lt!410228 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!272272 (or (= lt!410228 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!410228 #b0000000000000000000000000000000000000000000000000000000000001000) lt!410228)))))

(assert (=> b!272272 (= lt!410228 ((_ sign_extend 32) (size!6596 (buf!7064 w1!591))))))

(assert (= (and d!93098 res!226767) b!272271))

(assert (= (and b!272271 res!226768) b!272272))

(declare-fun m!404959 () Bool)

(assert (=> d!93098 m!404959))

(assert (=> d!93098 m!404861))

(assert (=> b!272180 d!93098))

(declare-fun d!93100 () Bool)

(assert (=> d!93100 (= (select (arr!7583 (buf!7064 w2!587)) (currentByte!13056 w1!591)) (select (arr!7583 (buf!7064 w3!25)) (currentByte!13056 w1!591)))))

(assert (=> d!93100 true))

(declare-fun _$12!111 () Unit!19161)

(assert (=> d!93100 (= (choose!441 (buf!7064 w2!587) (buf!7064 w3!25) #b00000000000000000000000000000000 (currentByte!13056 w1!591) (currentByte!13056 w2!587)) _$12!111)))

(declare-fun bs!23473 () Bool)

(assert (= bs!23473 d!93100))

(assert (=> bs!23473 m!404785))

(assert (=> bs!23473 m!404771))

(assert (=> d!93012 d!93100))

(assert (=> b!272208 d!93098))

(assert (=> b!272208 d!93092))

(assert (=> b!272178 d!93098))

(declare-fun d!93102 () Bool)

(declare-fun e!192095 () Bool)

(assert (=> d!93102 e!192095))

(declare-fun res!226769 () Bool)

(assert (=> d!93102 (=> (not res!226769) (not e!192095))))

(declare-fun lt!410233 () (_ BitVec 64))

(declare-fun lt!410236 () (_ BitVec 64))

(declare-fun lt!410235 () (_ BitVec 64))

(assert (=> d!93102 (= res!226769 (= lt!410236 (bvsub lt!410235 lt!410233)))))

(assert (=> d!93102 (or (= (bvand lt!410235 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!410233 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!410235 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!410235 lt!410233) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!93102 (= lt!410233 (remainingBits!0 ((_ sign_extend 32) (size!6596 (buf!7064 w3!25))) ((_ sign_extend 32) (currentByte!13056 w3!25)) ((_ sign_extend 32) (currentBit!13051 w3!25))))))

(declare-fun lt!410232 () (_ BitVec 64))

(declare-fun lt!410237 () (_ BitVec 64))

(assert (=> d!93102 (= lt!410235 (bvmul lt!410232 lt!410237))))

(assert (=> d!93102 (or (= lt!410232 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!410237 (bvsdiv (bvmul lt!410232 lt!410237) lt!410232)))))

(assert (=> d!93102 (= lt!410237 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93102 (= lt!410232 ((_ sign_extend 32) (size!6596 (buf!7064 w3!25))))))

(assert (=> d!93102 (= lt!410236 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13056 w3!25)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13051 w3!25))))))

(assert (=> d!93102 (invariant!0 (currentBit!13051 w3!25) (currentByte!13056 w3!25) (size!6596 (buf!7064 w3!25)))))

(assert (=> d!93102 (= (bitIndex!0 (size!6596 (buf!7064 w3!25)) (currentByte!13056 w3!25) (currentBit!13051 w3!25)) lt!410236)))

(declare-fun b!272273 () Bool)

(declare-fun res!226770 () Bool)

(assert (=> b!272273 (=> (not res!226770) (not e!192095))))

(assert (=> b!272273 (= res!226770 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!410236))))

(declare-fun b!272274 () Bool)

(declare-fun lt!410234 () (_ BitVec 64))

(assert (=> b!272274 (= e!192095 (bvsle lt!410236 (bvmul lt!410234 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!272274 (or (= lt!410234 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!410234 #b0000000000000000000000000000000000000000000000000000000000001000) lt!410234)))))

(assert (=> b!272274 (= lt!410234 ((_ sign_extend 32) (size!6596 (buf!7064 w3!25))))))

(assert (= (and d!93102 res!226769) b!272273))

(assert (= (and b!272273 res!226770) b!272274))

(declare-fun m!404961 () Bool)

(assert (=> d!93102 m!404961))

(assert (=> d!93102 m!404869))

(assert (=> b!272178 d!93102))

(declare-fun d!93104 () Bool)

(assert (=> d!93104 (= (invariant!0 (currentBit!13051 w3!25) (currentByte!13056 w3!25) (size!6596 (buf!7064 w3!25))) (and (bvsge (currentBit!13051 w3!25) #b00000000000000000000000000000000) (bvslt (currentBit!13051 w3!25) #b00000000000000000000000000001000) (bvsge (currentByte!13056 w3!25) #b00000000000000000000000000000000) (or (bvslt (currentByte!13056 w3!25) (size!6596 (buf!7064 w3!25))) (and (= (currentBit!13051 w3!25) #b00000000000000000000000000000000) (= (currentByte!13056 w3!25) (size!6596 (buf!7064 w3!25)))))))))

(assert (=> d!93046 d!93104))

(assert (=> b!272185 d!93092))

(assert (=> b!272185 d!93102))

(assert (=> d!93036 d!93028))

(declare-fun d!93106 () Bool)

(assert (=> d!93106 (arrayRangesEq!1128 (buf!7064 w1!591) (buf!7064 w3!25) #b00000000000000000000000000000000 (currentByte!13056 w1!591))))

(assert (=> d!93106 true))

(declare-fun _$16!161 () Unit!19161)

(assert (=> d!93106 (= (choose!442 (buf!7064 w1!591) (buf!7064 w2!587) (buf!7064 w3!25) #b00000000000000000000000000000000 (currentByte!13056 w1!591) (currentByte!13056 w2!587)) _$16!161)))

(declare-fun bs!23474 () Bool)

(assert (= bs!23474 d!93106))

(assert (=> bs!23474 m!404777))

(assert (=> d!93036 d!93106))

(declare-fun b!272275 () Bool)

(declare-fun res!226775 () Bool)

(declare-fun lt!410240 () (_ BitVec 32))

(assert (=> b!272275 (= res!226775 (= lt!410240 #b00000000000000000000000000000000))))

(declare-fun e!192101 () Bool)

(assert (=> b!272275 (=> res!226775 e!192101)))

(declare-fun e!192100 () Bool)

(assert (=> b!272275 (= e!192100 e!192101)))

(declare-fun b!272276 () Bool)

(declare-fun e!192097 () Bool)

(declare-fun e!192099 () Bool)

(assert (=> b!272276 (= e!192097 e!192099)))

(declare-fun c!12536 () Bool)

(declare-fun lt!410238 () tuple4!474)

(assert (=> b!272276 (= c!12536 (= (_3!1017 lt!410238) (_4!237 lt!410238)))))

(declare-fun b!272277 () Bool)

(declare-fun e!192096 () Bool)

(assert (=> b!272277 (= e!192096 (arrayRangesEq!1128 (buf!7064 w1!591) (buf!7064 w2!587) (_1!12220 lt!410238) (_2!12220 lt!410238)))))

(declare-fun d!93108 () Bool)

(declare-fun res!226774 () Bool)

(declare-fun e!192098 () Bool)

(assert (=> d!93108 (=> res!226774 e!192098)))

(assert (=> d!93108 (= res!226774 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6596 (buf!7064 w1!591)) (currentByte!13056 w1!591) (currentBit!13051 w1!591))))))

(assert (=> d!93108 (= (arrayBitRangesEq!0 (buf!7064 w1!591) (buf!7064 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6596 (buf!7064 w1!591)) (currentByte!13056 w1!591) (currentBit!13051 w1!591))) e!192098)))

(declare-fun b!272278 () Bool)

(assert (=> b!272278 (= e!192098 e!192097)))

(declare-fun res!226772 () Bool)

(assert (=> b!272278 (=> (not res!226772) (not e!192097))))

(assert (=> b!272278 (= res!226772 e!192096)))

(declare-fun res!226771 () Bool)

(assert (=> b!272278 (=> res!226771 e!192096)))

(assert (=> b!272278 (= res!226771 (bvsge (_1!12220 lt!410238) (_2!12220 lt!410238)))))

(assert (=> b!272278 (= lt!410240 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6596 (buf!7064 w1!591)) (currentByte!13056 w1!591) (currentBit!13051 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!410239 () (_ BitVec 32))

(assert (=> b!272278 (= lt!410239 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!272278 (= lt!410238 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6596 (buf!7064 w1!591)) (currentByte!13056 w1!591) (currentBit!13051 w1!591))))))

(declare-fun b!272279 () Bool)

(assert (=> b!272279 (= e!192099 e!192100)))

(declare-fun res!226773 () Bool)

(assert (=> b!272279 (= res!226773 (byteRangesEq!0 (select (arr!7583 (buf!7064 w1!591)) (_3!1017 lt!410238)) (select (arr!7583 (buf!7064 w2!587)) (_3!1017 lt!410238)) lt!410239 #b00000000000000000000000000001000))))

(assert (=> b!272279 (=> (not res!226773) (not e!192100))))

(declare-fun b!272280 () Bool)

(declare-fun call!4360 () Bool)

(assert (=> b!272280 (= e!192099 call!4360)))

(declare-fun bm!4357 () Bool)

(assert (=> bm!4357 (= call!4360 (byteRangesEq!0 (ite c!12536 (select (arr!7583 (buf!7064 w1!591)) (_3!1017 lt!410238)) (select (arr!7583 (buf!7064 w1!591)) (_4!237 lt!410238))) (ite c!12536 (select (arr!7583 (buf!7064 w2!587)) (_3!1017 lt!410238)) (select (arr!7583 (buf!7064 w2!587)) (_4!237 lt!410238))) (ite c!12536 lt!410239 #b00000000000000000000000000000000) lt!410240))))

(declare-fun b!272281 () Bool)

(assert (=> b!272281 (= e!192101 call!4360)))

(assert (= (and d!93108 (not res!226774)) b!272278))

(assert (= (and b!272278 (not res!226771)) b!272277))

(assert (= (and b!272278 res!226772) b!272276))

(assert (= (and b!272276 c!12536) b!272280))

(assert (= (and b!272276 (not c!12536)) b!272279))

(assert (= (and b!272279 res!226773) b!272275))

(assert (= (and b!272275 (not res!226775)) b!272281))

(assert (= (or b!272280 b!272281) bm!4357))

(declare-fun m!404963 () Bool)

(assert (=> b!272277 m!404963))

(assert (=> b!272278 m!404829))

(assert (=> b!272278 m!404945))

(declare-fun m!404965 () Bool)

(assert (=> b!272279 m!404965))

(declare-fun m!404967 () Bool)

(assert (=> b!272279 m!404967))

(assert (=> b!272279 m!404965))

(assert (=> b!272279 m!404967))

(declare-fun m!404969 () Bool)

(assert (=> b!272279 m!404969))

(declare-fun m!404971 () Bool)

(assert (=> bm!4357 m!404971))

(declare-fun m!404973 () Bool)

(assert (=> bm!4357 m!404973))

(assert (=> bm!4357 m!404967))

(assert (=> bm!4357 m!404965))

(declare-fun m!404975 () Bool)

(assert (=> bm!4357 m!404975))

(assert (=> b!272210 d!93108))

(assert (=> b!272210 d!93098))

(check-sat (not b!272279) (not d!93106) (not b!272263) (not d!93092) (not d!93102) (not b!272252) (not b!272267) (not bm!4355) (not bm!4357) (not b!272277) (not b!272266) (not b!272278) (not b!272253) (not bm!4356) (not b!272268) (not d!93098) (not b!272251))
(check-sat)
(get-model)

(declare-fun d!93158 () Bool)

(assert (=> d!93158 (= (byteRangesEq!0 (select (arr!7583 (buf!7064 w1!591)) (_3!1017 lt!410238)) (select (arr!7583 (buf!7064 w2!587)) (_3!1017 lt!410238)) lt!410239 #b00000000000000000000000000001000) (or (= lt!410239 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7583 (buf!7064 w1!591)) (_3!1017 lt!410238))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!410239)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7583 (buf!7064 w2!587)) (_3!1017 lt!410238))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!410239)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23479 () Bool)

(assert (= bs!23479 d!93158))

(declare-fun m!405093 () Bool)

(assert (=> bs!23479 m!405093))

(declare-fun m!405095 () Bool)

(assert (=> bs!23479 m!405095))

(assert (=> b!272279 d!93158))

(declare-fun d!93160 () Bool)

(assert (=> d!93160 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6596 (buf!7064 w1!591)) (currentByte!13056 w1!591) (currentBit!13051 w1!591))) (tuple4!475 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6596 (buf!7064 w1!591)) (currentByte!13056 w1!591) (currentBit!13051 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6596 (buf!7064 w1!591)) (currentByte!13056 w1!591) (currentBit!13051 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!272278 d!93160))

(declare-fun d!93162 () Bool)

(declare-fun res!226850 () Bool)

(declare-fun e!192176 () Bool)

(assert (=> d!93162 (=> res!226850 e!192176)))

(assert (=> d!93162 (= res!226850 (= (_1!12220 lt!410238) (_2!12220 lt!410238)))))

(assert (=> d!93162 (= (arrayRangesEq!1128 (buf!7064 w1!591) (buf!7064 w2!587) (_1!12220 lt!410238) (_2!12220 lt!410238)) e!192176)))

(declare-fun b!272376 () Bool)

(declare-fun e!192177 () Bool)

(assert (=> b!272376 (= e!192176 e!192177)))

(declare-fun res!226851 () Bool)

(assert (=> b!272376 (=> (not res!226851) (not e!192177))))

(assert (=> b!272376 (= res!226851 (= (select (arr!7583 (buf!7064 w1!591)) (_1!12220 lt!410238)) (select (arr!7583 (buf!7064 w2!587)) (_1!12220 lt!410238))))))

(declare-fun b!272377 () Bool)

(assert (=> b!272377 (= e!192177 (arrayRangesEq!1128 (buf!7064 w1!591) (buf!7064 w2!587) (bvadd (_1!12220 lt!410238) #b00000000000000000000000000000001) (_2!12220 lt!410238)))))

(assert (= (and d!93162 (not res!226850)) b!272376))

(assert (= (and b!272376 res!226851) b!272377))

(declare-fun m!405097 () Bool)

(assert (=> b!272376 m!405097))

(declare-fun m!405099 () Bool)

(assert (=> b!272376 m!405099))

(declare-fun m!405101 () Bool)

(assert (=> b!272377 m!405101))

(assert (=> b!272277 d!93162))

(declare-fun d!93164 () Bool)

(declare-fun res!226852 () Bool)

(declare-fun e!192178 () Bool)

(assert (=> d!93164 (=> res!226852 e!192178)))

(assert (=> d!93164 (= res!226852 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!13056 w1!591)))))

(assert (=> d!93164 (= (arrayRangesEq!1128 (buf!7064 w1!591) (buf!7064 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!13056 w1!591)) e!192178)))

(declare-fun b!272378 () Bool)

(declare-fun e!192179 () Bool)

(assert (=> b!272378 (= e!192178 e!192179)))

(declare-fun res!226853 () Bool)

(assert (=> b!272378 (=> (not res!226853) (not e!192179))))

(assert (=> b!272378 (= res!226853 (= (select (arr!7583 (buf!7064 w1!591)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!7583 (buf!7064 w3!25)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!272379 () Bool)

(assert (=> b!272379 (= e!192179 (arrayRangesEq!1128 (buf!7064 w1!591) (buf!7064 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!13056 w1!591)))))

(assert (= (and d!93164 (not res!226852)) b!272378))

(assert (= (and b!272378 res!226853) b!272379))

(declare-fun m!405103 () Bool)

(assert (=> b!272378 m!405103))

(declare-fun m!405105 () Bool)

(assert (=> b!272378 m!405105))

(declare-fun m!405107 () Bool)

(assert (=> b!272379 m!405107))

(assert (=> b!272263 d!93164))

(declare-fun d!93166 () Bool)

(assert (=> d!93166 (= (byteRangesEq!0 (select (arr!7583 (buf!7064 w2!587)) (_3!1017 lt!410202)) (select (arr!7583 (buf!7064 w3!25)) (_3!1017 lt!410202)) lt!410203 #b00000000000000000000000000001000) (or (= lt!410203 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7583 (buf!7064 w2!587)) (_3!1017 lt!410202))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!410203)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7583 (buf!7064 w3!25)) (_3!1017 lt!410202))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!410203)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23480 () Bool)

(assert (= bs!23480 d!93166))

(assert (=> bs!23480 m!405093))

(declare-fun m!405109 () Bool)

(assert (=> bs!23480 m!405109))

(assert (=> b!272253 d!93166))

(declare-fun d!93168 () Bool)

(assert (=> d!93168 (= (byteRangesEq!0 (ite c!12536 (select (arr!7583 (buf!7064 w1!591)) (_3!1017 lt!410238)) (select (arr!7583 (buf!7064 w1!591)) (_4!237 lt!410238))) (ite c!12536 (select (arr!7583 (buf!7064 w2!587)) (_3!1017 lt!410238)) (select (arr!7583 (buf!7064 w2!587)) (_4!237 lt!410238))) (ite c!12536 lt!410239 #b00000000000000000000000000000000) lt!410240) (or (= (ite c!12536 lt!410239 #b00000000000000000000000000000000) lt!410240) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12536 (select (arr!7583 (buf!7064 w1!591)) (_3!1017 lt!410238)) (select (arr!7583 (buf!7064 w1!591)) (_4!237 lt!410238)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!410240))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12536 lt!410239 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12536 (select (arr!7583 (buf!7064 w2!587)) (_3!1017 lt!410238)) (select (arr!7583 (buf!7064 w2!587)) (_4!237 lt!410238)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!410240))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12536 lt!410239 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!23481 () Bool)

(assert (= bs!23481 d!93168))

(declare-fun m!405111 () Bool)

(assert (=> bs!23481 m!405111))

(declare-fun m!405113 () Bool)

(assert (=> bs!23481 m!405113))

(assert (=> bm!4357 d!93168))

(declare-fun d!93170 () Bool)

(assert (=> d!93170 (= (remainingBits!0 ((_ sign_extend 32) (size!6596 (buf!7064 w2!587))) ((_ sign_extend 32) (currentByte!13056 w2!587)) ((_ sign_extend 32) (currentBit!13051 w2!587))) (bvsub (bvmul ((_ sign_extend 32) (size!6596 (buf!7064 w2!587))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13056 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13051 w2!587)))))))

(assert (=> d!93092 d!93170))

(assert (=> d!93092 d!93086))

(declare-fun d!93172 () Bool)

(assert (=> d!93172 (= (remainingBits!0 ((_ sign_extend 32) (size!6596 (buf!7064 w3!25))) ((_ sign_extend 32) (currentByte!13056 w3!25)) ((_ sign_extend 32) (currentBit!13051 w3!25))) (bvsub (bvmul ((_ sign_extend 32) (size!6596 (buf!7064 w3!25))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13056 w3!25)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13051 w3!25)))))))

(assert (=> d!93102 d!93172))

(assert (=> d!93102 d!93104))

(declare-fun d!93174 () Bool)

(assert (=> d!93174 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6596 (buf!7064 w2!587)) (currentByte!13056 w2!587) (currentBit!13051 w2!587))) (tuple4!475 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6596 (buf!7064 w2!587)) (currentByte!13056 w2!587) (currentBit!13051 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6596 (buf!7064 w2!587)) (currentByte!13056 w2!587) (currentBit!13051 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!272252 d!93174))

(declare-fun d!93176 () Bool)

(declare-fun res!226854 () Bool)

(declare-fun e!192180 () Bool)

(assert (=> d!93176 (=> res!226854 e!192180)))

(assert (=> d!93176 (= res!226854 (= (_1!12220 lt!410202) (_2!12220 lt!410202)))))

(assert (=> d!93176 (= (arrayRangesEq!1128 (buf!7064 w2!587) (buf!7064 w3!25) (_1!12220 lt!410202) (_2!12220 lt!410202)) e!192180)))

(declare-fun b!272380 () Bool)

(declare-fun e!192181 () Bool)

(assert (=> b!272380 (= e!192180 e!192181)))

(declare-fun res!226855 () Bool)

(assert (=> b!272380 (=> (not res!226855) (not e!192181))))

(assert (=> b!272380 (= res!226855 (= (select (arr!7583 (buf!7064 w2!587)) (_1!12220 lt!410202)) (select (arr!7583 (buf!7064 w3!25)) (_1!12220 lt!410202))))))

(declare-fun b!272381 () Bool)

(assert (=> b!272381 (= e!192181 (arrayRangesEq!1128 (buf!7064 w2!587) (buf!7064 w3!25) (bvadd (_1!12220 lt!410202) #b00000000000000000000000000000001) (_2!12220 lt!410202)))))

(assert (= (and d!93176 (not res!226854)) b!272380))

(assert (= (and b!272380 res!226855) b!272381))

(declare-fun m!405115 () Bool)

(assert (=> b!272380 m!405115))

(declare-fun m!405117 () Bool)

(assert (=> b!272380 m!405117))

(declare-fun m!405119 () Bool)

(assert (=> b!272381 m!405119))

(assert (=> b!272251 d!93176))

(declare-fun d!93178 () Bool)

(assert (=> d!93178 (= (remainingBits!0 ((_ sign_extend 32) (size!6596 (buf!7064 w1!591))) ((_ sign_extend 32) (currentByte!13056 w1!591)) ((_ sign_extend 32) (currentBit!13051 w1!591))) (bvsub (bvmul ((_ sign_extend 32) (size!6596 (buf!7064 w1!591))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13056 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13051 w1!591)))))))

(assert (=> d!93098 d!93178))

(assert (=> d!93098 d!93088))

(declare-fun d!93180 () Bool)

(assert (=> d!93180 (= (byteRangesEq!0 (select (arr!7583 (buf!7064 w1!591)) (_3!1017 lt!410223)) (select (arr!7583 (buf!7064 w3!25)) (_3!1017 lt!410223)) lt!410224 #b00000000000000000000000000001000) (or (= lt!410224 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7583 (buf!7064 w1!591)) (_3!1017 lt!410223))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!410224)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7583 (buf!7064 w3!25)) (_3!1017 lt!410223))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!410224)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23482 () Bool)

(assert (= bs!23482 d!93180))

(assert (=> bs!23482 m!405093))

(declare-fun m!405121 () Bool)

(assert (=> bs!23482 m!405121))

(assert (=> b!272268 d!93180))

(assert (=> b!272267 d!93160))

(declare-fun d!93182 () Bool)

(assert (=> d!93182 (= (byteRangesEq!0 (ite c!12534 (select (arr!7583 (buf!7064 w2!587)) (_3!1017 lt!410202)) (select (arr!7583 (buf!7064 w2!587)) (_4!237 lt!410202))) (ite c!12534 (select (arr!7583 (buf!7064 w3!25)) (_3!1017 lt!410202)) (select (arr!7583 (buf!7064 w3!25)) (_4!237 lt!410202))) (ite c!12534 lt!410203 #b00000000000000000000000000000000) lt!410204) (or (= (ite c!12534 lt!410203 #b00000000000000000000000000000000) lt!410204) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12534 (select (arr!7583 (buf!7064 w2!587)) (_3!1017 lt!410202)) (select (arr!7583 (buf!7064 w2!587)) (_4!237 lt!410202)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!410204))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12534 lt!410203 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12534 (select (arr!7583 (buf!7064 w3!25)) (_3!1017 lt!410202)) (select (arr!7583 (buf!7064 w3!25)) (_4!237 lt!410202)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!410204))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12534 lt!410203 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!23483 () Bool)

(assert (= bs!23483 d!93182))

(declare-fun m!405123 () Bool)

(assert (=> bs!23483 m!405123))

(declare-fun m!405125 () Bool)

(assert (=> bs!23483 m!405125))

(assert (=> bm!4355 d!93182))

(declare-fun d!93184 () Bool)

(declare-fun res!226856 () Bool)

(declare-fun e!192182 () Bool)

(assert (=> d!93184 (=> res!226856 e!192182)))

(assert (=> d!93184 (= res!226856 (= (_1!12220 lt!410223) (_2!12220 lt!410223)))))

(assert (=> d!93184 (= (arrayRangesEq!1128 (buf!7064 w1!591) (buf!7064 w3!25) (_1!12220 lt!410223) (_2!12220 lt!410223)) e!192182)))

(declare-fun b!272382 () Bool)

(declare-fun e!192183 () Bool)

(assert (=> b!272382 (= e!192182 e!192183)))

(declare-fun res!226857 () Bool)

(assert (=> b!272382 (=> (not res!226857) (not e!192183))))

(assert (=> b!272382 (= res!226857 (= (select (arr!7583 (buf!7064 w1!591)) (_1!12220 lt!410223)) (select (arr!7583 (buf!7064 w3!25)) (_1!12220 lt!410223))))))

(declare-fun b!272383 () Bool)

(assert (=> b!272383 (= e!192183 (arrayRangesEq!1128 (buf!7064 w1!591) (buf!7064 w3!25) (bvadd (_1!12220 lt!410223) #b00000000000000000000000000000001) (_2!12220 lt!410223)))))

(assert (= (and d!93184 (not res!226856)) b!272382))

(assert (= (and b!272382 res!226857) b!272383))

(declare-fun m!405127 () Bool)

(assert (=> b!272382 m!405127))

(declare-fun m!405129 () Bool)

(assert (=> b!272382 m!405129))

(declare-fun m!405131 () Bool)

(assert (=> b!272383 m!405131))

(assert (=> b!272266 d!93184))

(assert (=> d!93106 d!93028))

(declare-fun d!93186 () Bool)

(assert (=> d!93186 (= (byteRangesEq!0 (ite c!12535 (select (arr!7583 (buf!7064 w1!591)) (_3!1017 lt!410223)) (select (arr!7583 (buf!7064 w1!591)) (_4!237 lt!410223))) (ite c!12535 (select (arr!7583 (buf!7064 w3!25)) (_3!1017 lt!410223)) (select (arr!7583 (buf!7064 w3!25)) (_4!237 lt!410223))) (ite c!12535 lt!410224 #b00000000000000000000000000000000) lt!410225) (or (= (ite c!12535 lt!410224 #b00000000000000000000000000000000) lt!410225) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12535 (select (arr!7583 (buf!7064 w1!591)) (_3!1017 lt!410223)) (select (arr!7583 (buf!7064 w1!591)) (_4!237 lt!410223)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!410225))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12535 lt!410224 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12535 (select (arr!7583 (buf!7064 w3!25)) (_3!1017 lt!410223)) (select (arr!7583 (buf!7064 w3!25)) (_4!237 lt!410223)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!410225))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12535 lt!410224 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!23484 () Bool)

(assert (= bs!23484 d!93186))

(declare-fun m!405133 () Bool)

(assert (=> bs!23484 m!405133))

(declare-fun m!405135 () Bool)

(assert (=> bs!23484 m!405135))

(assert (=> bm!4356 d!93186))

(check-sat (not b!272377) (not b!272379) (not b!272383) (not b!272381))
(check-sat)
