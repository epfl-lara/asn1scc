; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59172 () Bool)

(assert start!59172)

(declare-fun e!190900 () Bool)

(declare-datatypes ((array!15111 0))(
  ( (array!15112 (arr!7563 (Array (_ BitVec 32) (_ BitVec 8))) (size!6576 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11966 0))(
  ( (BitStream!11967 (buf!7044 array!15111) (currentByte!13018 (_ BitVec 32)) (currentBit!13013 (_ BitVec 32))) )
))
(declare-fun w3!25 () BitStream!11966)

(declare-fun w2!587 () BitStream!11966)

(declare-fun w1!591 () BitStream!11966)

(declare-fun b!271017 () Bool)

(assert (=> b!271017 (= e!190900 (or (not (= ((_ sign_extend 24) (select (arr!7563 (buf!7044 w2!587)) (currentByte!13018 w1!591))) ((_ sign_extend 24) (select (arr!7563 (buf!7044 w3!25)) (currentByte!13018 w1!591))))) (and (bvsge (currentByte!13018 w1!591) #b00000000000000000000000000000000) (bvslt (currentByte!13018 w1!591) (size!6576 (buf!7044 w3!25))))))))

(assert (=> b!271017 (= (select (arr!7563 (buf!7044 w2!587)) (currentByte!13018 w1!591)) (select (arr!7563 (buf!7044 w3!25)) (currentByte!13018 w1!591)))))

(declare-datatypes ((Unit!19107 0))(
  ( (Unit!19108) )
))
(declare-fun lt!409699 () Unit!19107)

(declare-fun arrayRangesEqImpliesEq!168 (array!15111 array!15111 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19107)

(assert (=> b!271017 (= lt!409699 (arrayRangesEqImpliesEq!168 (buf!7044 w2!587) (buf!7044 w3!25) #b00000000000000000000000000000000 (currentByte!13018 w1!591) (currentByte!13018 w2!587)))))

(declare-fun b!271018 () Bool)

(declare-fun e!190904 () Bool)

(declare-fun array_inv!6300 (array!15111) Bool)

(assert (=> b!271018 (= e!190904 (array_inv!6300 (buf!7044 w1!591)))))

(declare-fun b!271019 () Bool)

(declare-fun res!225816 () Bool)

(declare-fun e!190902 () Bool)

(assert (=> b!271019 (=> (not res!225816) (not e!190902))))

(declare-fun isPrefixOf!0 (BitStream!11966 BitStream!11966) Bool)

(assert (=> b!271019 (= res!225816 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!271021 () Bool)

(assert (=> b!271021 (= e!190902 (not e!190900))))

(declare-fun res!225817 () Bool)

(assert (=> b!271021 (=> res!225817 e!190900)))

(assert (=> b!271021 (= res!225817 (or (bvsge (currentByte!13018 w1!591) (size!6576 (buf!7044 w1!591))) (bvsge (currentByte!13018 w1!591) (currentByte!13018 w2!587))))))

(declare-fun arrayRangesEq!1108 (array!15111 array!15111 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!271021 (arrayRangesEq!1108 (buf!7044 w1!591) (buf!7044 w3!25) #b00000000000000000000000000000000 (currentByte!13018 w1!591))))

(declare-fun lt!409700 () Unit!19107)

(declare-fun arrayRangesEqTransitive!371 (array!15111 array!15111 array!15111 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19107)

(assert (=> b!271021 (= lt!409700 (arrayRangesEqTransitive!371 (buf!7044 w1!591) (buf!7044 w2!587) (buf!7044 w3!25) #b00000000000000000000000000000000 (currentByte!13018 w1!591) (currentByte!13018 w2!587)))))

(declare-fun b!271022 () Bool)

(declare-fun e!190901 () Bool)

(assert (=> b!271022 (= e!190901 (array_inv!6300 (buf!7044 w2!587)))))

(declare-fun res!225815 () Bool)

(assert (=> start!59172 (=> (not res!225815) (not e!190902))))

(assert (=> start!59172 (= res!225815 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!59172 e!190902))

(declare-fun inv!12 (BitStream!11966) Bool)

(assert (=> start!59172 (and (inv!12 w1!591) e!190904)))

(assert (=> start!59172 (and (inv!12 w2!587) e!190901)))

(declare-fun e!190899 () Bool)

(assert (=> start!59172 (and (inv!12 w3!25) e!190899)))

(declare-fun b!271020 () Bool)

(assert (=> b!271020 (= e!190899 (array_inv!6300 (buf!7044 w3!25)))))

(assert (= (and start!59172 res!225815) b!271019))

(assert (= (and b!271019 res!225816) b!271021))

(assert (= (and b!271021 (not res!225817)) b!271017))

(assert (= start!59172 b!271018))

(assert (= start!59172 b!271022))

(assert (= start!59172 b!271020))

(declare-fun m!403207 () Bool)

(assert (=> b!271020 m!403207))

(declare-fun m!403209 () Bool)

(assert (=> b!271017 m!403209))

(declare-fun m!403211 () Bool)

(assert (=> b!271017 m!403211))

(declare-fun m!403213 () Bool)

(assert (=> b!271017 m!403213))

(declare-fun m!403215 () Bool)

(assert (=> b!271018 m!403215))

(declare-fun m!403217 () Bool)

(assert (=> b!271019 m!403217))

(declare-fun m!403219 () Bool)

(assert (=> b!271021 m!403219))

(declare-fun m!403221 () Bool)

(assert (=> b!271021 m!403221))

(declare-fun m!403223 () Bool)

(assert (=> b!271022 m!403223))

(declare-fun m!403225 () Bool)

(assert (=> start!59172 m!403225))

(declare-fun m!403227 () Bool)

(assert (=> start!59172 m!403227))

(declare-fun m!403229 () Bool)

(assert (=> start!59172 m!403229))

(declare-fun m!403231 () Bool)

(assert (=> start!59172 m!403231))

(push 1)

(assert (not b!271021))

(assert (not b!271022))

(assert (not b!271017))

(assert (not b!271019))

(assert (not b!271020))

(assert (not start!59172))

(assert (not b!271018))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!92262 () Bool)

(assert (=> d!92262 (= (array_inv!6300 (buf!7044 w3!25)) (bvsge (size!6576 (buf!7044 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!271020 d!92262))

(declare-fun d!92264 () Bool)

(declare-fun res!225831 () Bool)

(declare-fun e!190918 () Bool)

(assert (=> d!92264 (=> (not res!225831) (not e!190918))))

(assert (=> d!92264 (= res!225831 (= (size!6576 (buf!7044 w2!587)) (size!6576 (buf!7044 w3!25))))))

(assert (=> d!92264 (= (isPrefixOf!0 w2!587 w3!25) e!190918)))

(declare-fun b!271035 () Bool)

(declare-fun res!225832 () Bool)

(assert (=> b!271035 (=> (not res!225832) (not e!190918))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!271035 (= res!225832 (bvsle (bitIndex!0 (size!6576 (buf!7044 w2!587)) (currentByte!13018 w2!587) (currentBit!13013 w2!587)) (bitIndex!0 (size!6576 (buf!7044 w3!25)) (currentByte!13018 w3!25) (currentBit!13013 w3!25))))))

(declare-fun b!271036 () Bool)

(declare-fun e!190917 () Bool)

(assert (=> b!271036 (= e!190918 e!190917)))

(declare-fun res!225830 () Bool)

(assert (=> b!271036 (=> res!225830 e!190917)))

(assert (=> b!271036 (= res!225830 (= (size!6576 (buf!7044 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!271037 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15111 array!15111 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!271037 (= e!190917 (arrayBitRangesEq!0 (buf!7044 w2!587) (buf!7044 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6576 (buf!7044 w2!587)) (currentByte!13018 w2!587) (currentBit!13013 w2!587))))))

(assert (= (and d!92264 res!225831) b!271035))

(assert (= (and b!271035 res!225832) b!271036))

(assert (= (and b!271036 (not res!225830)) b!271037))

(declare-fun m!403245 () Bool)

(assert (=> b!271035 m!403245))

(declare-fun m!403247 () Bool)

(assert (=> b!271035 m!403247))

(assert (=> b!271037 m!403245))

(assert (=> b!271037 m!403245))

(declare-fun m!403249 () Bool)

(assert (=> b!271037 m!403249))

(assert (=> b!271019 d!92264))

(declare-fun d!92274 () Bool)

(declare-fun res!225834 () Bool)

(declare-fun e!190920 () Bool)

(assert (=> d!92274 (=> (not res!225834) (not e!190920))))

(assert (=> d!92274 (= res!225834 (= (size!6576 (buf!7044 w1!591)) (size!6576 (buf!7044 w2!587))))))

(assert (=> d!92274 (= (isPrefixOf!0 w1!591 w2!587) e!190920)))

(declare-fun b!271038 () Bool)

(declare-fun res!225835 () Bool)

(assert (=> b!271038 (=> (not res!225835) (not e!190920))))

(assert (=> b!271038 (= res!225835 (bvsle (bitIndex!0 (size!6576 (buf!7044 w1!591)) (currentByte!13018 w1!591) (currentBit!13013 w1!591)) (bitIndex!0 (size!6576 (buf!7044 w2!587)) (currentByte!13018 w2!587) (currentBit!13013 w2!587))))))

(declare-fun b!271039 () Bool)

(declare-fun e!190919 () Bool)

(assert (=> b!271039 (= e!190920 e!190919)))

(declare-fun res!225833 () Bool)

(assert (=> b!271039 (=> res!225833 e!190919)))

(assert (=> b!271039 (= res!225833 (= (size!6576 (buf!7044 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!271040 () Bool)

(assert (=> b!271040 (= e!190919 (arrayBitRangesEq!0 (buf!7044 w1!591) (buf!7044 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6576 (buf!7044 w1!591)) (currentByte!13018 w1!591) (currentBit!13013 w1!591))))))

(assert (= (and d!92274 res!225834) b!271038))

(assert (= (and b!271038 res!225835) b!271039))

(assert (= (and b!271039 (not res!225833)) b!271040))

(declare-fun m!403251 () Bool)

(assert (=> b!271038 m!403251))

(assert (=> b!271038 m!403245))

(assert (=> b!271040 m!403251))

(assert (=> b!271040 m!403251))

(declare-fun m!403253 () Bool)

(assert (=> b!271040 m!403253))

(assert (=> start!59172 d!92274))

(declare-fun d!92276 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!92276 (= (inv!12 w1!591) (invariant!0 (currentBit!13013 w1!591) (currentByte!13018 w1!591) (size!6576 (buf!7044 w1!591))))))

(declare-fun bs!23296 () Bool)

(assert (= bs!23296 d!92276))

(declare-fun m!403255 () Bool)

(assert (=> bs!23296 m!403255))

(assert (=> start!59172 d!92276))

(declare-fun d!92278 () Bool)

(assert (=> d!92278 (= (inv!12 w2!587) (invariant!0 (currentBit!13013 w2!587) (currentByte!13018 w2!587) (size!6576 (buf!7044 w2!587))))))

(declare-fun bs!23297 () Bool)

(assert (= bs!23297 d!92278))

(declare-fun m!403257 () Bool)

(assert (=> bs!23297 m!403257))

(assert (=> start!59172 d!92278))

(declare-fun d!92280 () Bool)

(assert (=> d!92280 (= (inv!12 w3!25) (invariant!0 (currentBit!13013 w3!25) (currentByte!13018 w3!25) (size!6576 (buf!7044 w3!25))))))

(declare-fun bs!23298 () Bool)

(assert (= bs!23298 d!92280))

(declare-fun m!403259 () Bool)

(assert (=> bs!23298 m!403259))

(assert (=> start!59172 d!92280))

(declare-fun d!92282 () Bool)

(assert (=> d!92282 (= (array_inv!6300 (buf!7044 w1!591)) (bvsge (size!6576 (buf!7044 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!271018 d!92282))

(declare-fun d!92284 () Bool)

(assert (=> d!92284 (and (bvsge (currentByte!13018 w1!591) #b00000000000000000000000000000000) (bvslt (currentByte!13018 w1!591) (size!6576 (buf!7044 w2!587))) (bvslt (currentByte!13018 w1!591) (size!6576 (buf!7044 w3!25))) (= (select (arr!7563 (buf!7044 w2!587)) (currentByte!13018 w1!591)) (select (arr!7563 (buf!7044 w3!25)) (currentByte!13018 w1!591))))))

(declare-fun lt!409712 () Unit!19107)

(declare-fun choose!416 (array!15111 array!15111 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19107)

(assert (=> d!92284 (= lt!409712 (choose!416 (buf!7044 w2!587) (buf!7044 w3!25) #b00000000000000000000000000000000 (currentByte!13018 w1!591) (currentByte!13018 w2!587)))))

(assert (=> d!92284 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!13018 w2!587)))))

(assert (=> d!92284 (= (arrayRangesEqImpliesEq!168 (buf!7044 w2!587) (buf!7044 w3!25) #b00000000000000000000000000000000 (currentByte!13018 w1!591) (currentByte!13018 w2!587)) lt!409712)))

(declare-fun bs!23299 () Bool)

(assert (= bs!23299 d!92284))

(assert (=> bs!23299 m!403209))

(assert (=> bs!23299 m!403211))

(declare-fun m!403261 () Bool)

(assert (=> bs!23299 m!403261))

(assert (=> b!271017 d!92284))

(declare-fun d!92286 () Bool)

(assert (=> d!92286 (= (array_inv!6300 (buf!7044 w2!587)) (bvsge (size!6576 (buf!7044 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!271022 d!92286))

(declare-fun d!92288 () Bool)

(declare-fun res!225864 () Bool)

(declare-fun e!190941 () Bool)

(assert (=> d!92288 (=> res!225864 e!190941)))

(assert (=> d!92288 (= res!225864 (= #b00000000000000000000000000000000 (currentByte!13018 w1!591)))))

(assert (=> d!92288 (= (arrayRangesEq!1108 (buf!7044 w1!591) (buf!7044 w3!25) #b00000000000000000000000000000000 (currentByte!13018 w1!591)) e!190941)))

(declare-fun b!271069 () Bool)

(declare-fun e!190942 () Bool)

(assert (=> b!271069 (= e!190941 e!190942)))

