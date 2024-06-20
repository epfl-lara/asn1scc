; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58930 () Bool)

(assert start!58930)

(declare-fun b!270307 () Bool)

(declare-fun e!190181 () Bool)

(declare-datatypes ((array!15064 0))(
  ( (array!15065 (arr!7547 (Array (_ BitVec 32) (_ BitVec 8))) (size!6560 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11934 0))(
  ( (BitStream!11935 (buf!7028 array!15064) (currentByte!12993 (_ BitVec 32)) (currentBit!12988 (_ BitVec 32))) )
))
(declare-fun w2!587 () BitStream!11934)

(declare-fun array_inv!6284 (array!15064) Bool)

(assert (=> b!270307 (= e!190181 (array_inv!6284 (buf!7028 w2!587)))))

(declare-fun b!270308 () Bool)

(declare-fun res!225273 () Bool)

(declare-fun e!190184 () Bool)

(assert (=> b!270308 (=> (not res!225273) (not e!190184))))

(declare-fun w3!25 () BitStream!11934)

(declare-fun isPrefixOf!0 (BitStream!11934 BitStream!11934) Bool)

(assert (=> b!270308 (= res!225273 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!270309 () Bool)

(declare-fun e!190183 () Bool)

(declare-fun w1!591 () BitStream!11934)

(assert (=> b!270309 (= e!190183 (array_inv!6284 (buf!7028 w1!591)))))

(declare-fun res!225274 () Bool)

(assert (=> start!58930 (=> (not res!225274) (not e!190184))))

(assert (=> start!58930 (= res!225274 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58930 e!190184))

(declare-fun inv!12 (BitStream!11934) Bool)

(assert (=> start!58930 (and (inv!12 w1!591) e!190183)))

(assert (=> start!58930 (and (inv!12 w2!587) e!190181)))

(declare-fun e!190180 () Bool)

(assert (=> start!58930 (and (inv!12 w3!25) e!190180)))

(declare-fun b!270310 () Bool)

(assert (=> b!270310 (= e!190180 (array_inv!6284 (buf!7028 w3!25)))))

(declare-fun b!270311 () Bool)

(assert (=> b!270311 (= e!190184 (not (or (bvsge (currentByte!12993 w1!591) (size!6560 (buf!7028 w1!591))) (bvsge (currentByte!12993 w1!591) (currentByte!12993 w2!587)) (bvsgt #b00000000000000000000000000000000 (currentByte!12993 w2!587)) (bvsgt (size!6560 (buf!7028 w2!587)) (size!6560 (buf!7028 w3!25))) (bvsgt (currentByte!12993 w2!587) (size!6560 (buf!7028 w2!587))) (bvsle #b00000000000000000000000000000000 (currentByte!12993 w1!591)))))))

(declare-fun arrayRangesEq!1092 (array!15064 array!15064 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!270311 (arrayRangesEq!1092 (buf!7028 w1!591) (buf!7028 w3!25) #b00000000000000000000000000000000 (currentByte!12993 w1!591))))

(declare-datatypes ((Unit!19075 0))(
  ( (Unit!19076) )
))
(declare-fun lt!409418 () Unit!19075)

(declare-fun arrayRangesEqTransitive!355 (array!15064 array!15064 array!15064 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19075)

(assert (=> b!270311 (= lt!409418 (arrayRangesEqTransitive!355 (buf!7028 w1!591) (buf!7028 w2!587) (buf!7028 w3!25) #b00000000000000000000000000000000 (currentByte!12993 w1!591) (currentByte!12993 w2!587)))))

(assert (= (and start!58930 res!225274) b!270308))

(assert (= (and b!270308 res!225273) b!270311))

(assert (= start!58930 b!270309))

(assert (= start!58930 b!270307))

(assert (= start!58930 b!270310))

(declare-fun m!402173 () Bool)

(assert (=> b!270309 m!402173))

(declare-fun m!402175 () Bool)

(assert (=> start!58930 m!402175))

(declare-fun m!402177 () Bool)

(assert (=> start!58930 m!402177))

(declare-fun m!402179 () Bool)

(assert (=> start!58930 m!402179))

(declare-fun m!402181 () Bool)

(assert (=> start!58930 m!402181))

(declare-fun m!402183 () Bool)

(assert (=> b!270308 m!402183))

(declare-fun m!402185 () Bool)

(assert (=> b!270310 m!402185))

(declare-fun m!402187 () Bool)

(assert (=> b!270307 m!402187))

(declare-fun m!402189 () Bool)

(assert (=> b!270311 m!402189))

(declare-fun m!402191 () Bool)

(assert (=> b!270311 m!402191))

(check-sat (not b!270310) (not start!58930) (not b!270308) (not b!270309) (not b!270311) (not b!270307))
(check-sat)
(get-model)

(declare-fun d!91786 () Bool)

(declare-fun res!225325 () Bool)

(declare-fun e!190240 () Bool)

(assert (=> d!91786 (=> (not res!225325) (not e!190240))))

(assert (=> d!91786 (= res!225325 (= (size!6560 (buf!7028 w1!591)) (size!6560 (buf!7028 w2!587))))))

(assert (=> d!91786 (= (isPrefixOf!0 w1!591 w2!587) e!190240)))

(declare-fun b!270369 () Bool)

(declare-fun res!225324 () Bool)

(assert (=> b!270369 (=> (not res!225324) (not e!190240))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!270369 (= res!225324 (bvsle (bitIndex!0 (size!6560 (buf!7028 w1!591)) (currentByte!12993 w1!591) (currentBit!12988 w1!591)) (bitIndex!0 (size!6560 (buf!7028 w2!587)) (currentByte!12993 w2!587) (currentBit!12988 w2!587))))))

(declare-fun b!270370 () Bool)

(declare-fun e!190241 () Bool)

(assert (=> b!270370 (= e!190240 e!190241)))

(declare-fun res!225323 () Bool)

(assert (=> b!270370 (=> res!225323 e!190241)))

(assert (=> b!270370 (= res!225323 (= (size!6560 (buf!7028 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!270371 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15064 array!15064 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!270371 (= e!190241 (arrayBitRangesEq!0 (buf!7028 w1!591) (buf!7028 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6560 (buf!7028 w1!591)) (currentByte!12993 w1!591) (currentBit!12988 w1!591))))))

(assert (= (and d!91786 res!225325) b!270369))

(assert (= (and b!270369 res!225324) b!270370))

(assert (= (and b!270370 (not res!225323)) b!270371))

(declare-fun m!402261 () Bool)

(assert (=> b!270369 m!402261))

(declare-fun m!402263 () Bool)

(assert (=> b!270369 m!402263))

(assert (=> b!270371 m!402261))

(assert (=> b!270371 m!402261))

(declare-fun m!402265 () Bool)

(assert (=> b!270371 m!402265))

(assert (=> start!58930 d!91786))

(declare-fun d!91820 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!91820 (= (inv!12 w1!591) (invariant!0 (currentBit!12988 w1!591) (currentByte!12993 w1!591) (size!6560 (buf!7028 w1!591))))))

(declare-fun bs!23202 () Bool)

(assert (= bs!23202 d!91820))

(declare-fun m!402267 () Bool)

(assert (=> bs!23202 m!402267))

(assert (=> start!58930 d!91820))

(declare-fun d!91822 () Bool)

(assert (=> d!91822 (= (inv!12 w2!587) (invariant!0 (currentBit!12988 w2!587) (currentByte!12993 w2!587) (size!6560 (buf!7028 w2!587))))))

(declare-fun bs!23203 () Bool)

(assert (= bs!23203 d!91822))

(declare-fun m!402269 () Bool)

(assert (=> bs!23203 m!402269))

(assert (=> start!58930 d!91822))

(declare-fun d!91824 () Bool)

(assert (=> d!91824 (= (inv!12 w3!25) (invariant!0 (currentBit!12988 w3!25) (currentByte!12993 w3!25) (size!6560 (buf!7028 w3!25))))))

(declare-fun bs!23204 () Bool)

(assert (= bs!23204 d!91824))

(declare-fun m!402271 () Bool)

(assert (=> bs!23204 m!402271))

(assert (=> start!58930 d!91824))

(declare-fun d!91826 () Bool)

(assert (=> d!91826 (= (array_inv!6284 (buf!7028 w1!591)) (bvsge (size!6560 (buf!7028 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!270309 d!91826))

(declare-fun d!91828 () Bool)

(declare-fun res!225328 () Bool)

(declare-fun e!190242 () Bool)

(assert (=> d!91828 (=> (not res!225328) (not e!190242))))

(assert (=> d!91828 (= res!225328 (= (size!6560 (buf!7028 w2!587)) (size!6560 (buf!7028 w3!25))))))

(assert (=> d!91828 (= (isPrefixOf!0 w2!587 w3!25) e!190242)))

(declare-fun b!270372 () Bool)

(declare-fun res!225327 () Bool)

(assert (=> b!270372 (=> (not res!225327) (not e!190242))))

(assert (=> b!270372 (= res!225327 (bvsle (bitIndex!0 (size!6560 (buf!7028 w2!587)) (currentByte!12993 w2!587) (currentBit!12988 w2!587)) (bitIndex!0 (size!6560 (buf!7028 w3!25)) (currentByte!12993 w3!25) (currentBit!12988 w3!25))))))

(declare-fun b!270373 () Bool)

(declare-fun e!190243 () Bool)

(assert (=> b!270373 (= e!190242 e!190243)))

(declare-fun res!225326 () Bool)

(assert (=> b!270373 (=> res!225326 e!190243)))

(assert (=> b!270373 (= res!225326 (= (size!6560 (buf!7028 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!270374 () Bool)

(assert (=> b!270374 (= e!190243 (arrayBitRangesEq!0 (buf!7028 w2!587) (buf!7028 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6560 (buf!7028 w2!587)) (currentByte!12993 w2!587) (currentBit!12988 w2!587))))))

(assert (= (and d!91828 res!225328) b!270372))

(assert (= (and b!270372 res!225327) b!270373))

(assert (= (and b!270373 (not res!225326)) b!270374))

(assert (=> b!270372 m!402263))

(declare-fun m!402273 () Bool)

(assert (=> b!270372 m!402273))

(assert (=> b!270374 m!402263))

(assert (=> b!270374 m!402263))

(declare-fun m!402275 () Bool)

(assert (=> b!270374 m!402275))

(assert (=> b!270308 d!91828))

(declare-fun d!91830 () Bool)

(assert (=> d!91830 (= (array_inv!6284 (buf!7028 w2!587)) (bvsge (size!6560 (buf!7028 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!270307 d!91830))

(declare-fun d!91832 () Bool)

(assert (=> d!91832 (= (array_inv!6284 (buf!7028 w3!25)) (bvsge (size!6560 (buf!7028 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!270310 d!91832))

(declare-fun d!91834 () Bool)

(declare-fun res!225333 () Bool)

(declare-fun e!190248 () Bool)

(assert (=> d!91834 (=> res!225333 e!190248)))

(assert (=> d!91834 (= res!225333 (= #b00000000000000000000000000000000 (currentByte!12993 w1!591)))))

(assert (=> d!91834 (= (arrayRangesEq!1092 (buf!7028 w1!591) (buf!7028 w3!25) #b00000000000000000000000000000000 (currentByte!12993 w1!591)) e!190248)))

(declare-fun b!270379 () Bool)

(declare-fun e!190249 () Bool)

(assert (=> b!270379 (= e!190248 e!190249)))

(declare-fun res!225334 () Bool)

(assert (=> b!270379 (=> (not res!225334) (not e!190249))))

(assert (=> b!270379 (= res!225334 (= (select (arr!7547 (buf!7028 w1!591)) #b00000000000000000000000000000000) (select (arr!7547 (buf!7028 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!270380 () Bool)

(assert (=> b!270380 (= e!190249 (arrayRangesEq!1092 (buf!7028 w1!591) (buf!7028 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12993 w1!591)))))

(assert (= (and d!91834 (not res!225333)) b!270379))

(assert (= (and b!270379 res!225334) b!270380))

(declare-fun m!402277 () Bool)

(assert (=> b!270379 m!402277))

(declare-fun m!402279 () Bool)

(assert (=> b!270379 m!402279))

(declare-fun m!402281 () Bool)

(assert (=> b!270380 m!402281))

(assert (=> b!270311 d!91834))

(declare-fun d!91836 () Bool)

(assert (=> d!91836 (arrayRangesEq!1092 (buf!7028 w1!591) (buf!7028 w3!25) #b00000000000000000000000000000000 (currentByte!12993 w1!591))))

(declare-fun lt!409430 () Unit!19075)

(declare-fun choose!394 (array!15064 array!15064 array!15064 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19075)

(assert (=> d!91836 (= lt!409430 (choose!394 (buf!7028 w1!591) (buf!7028 w2!587) (buf!7028 w3!25) #b00000000000000000000000000000000 (currentByte!12993 w1!591) (currentByte!12993 w2!587)))))

(assert (=> d!91836 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!12993 w1!591)) (bvsle (currentByte!12993 w1!591) (currentByte!12993 w2!587)))))

(assert (=> d!91836 (= (arrayRangesEqTransitive!355 (buf!7028 w1!591) (buf!7028 w2!587) (buf!7028 w3!25) #b00000000000000000000000000000000 (currentByte!12993 w1!591) (currentByte!12993 w2!587)) lt!409430)))

(declare-fun bs!23205 () Bool)

