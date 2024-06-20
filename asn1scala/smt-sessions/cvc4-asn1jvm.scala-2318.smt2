; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58932 () Bool)

(assert start!58932)

(declare-fun res!225280 () Bool)

(declare-fun e!190207 () Bool)

(assert (=> start!58932 (=> (not res!225280) (not e!190207))))

(declare-datatypes ((array!15066 0))(
  ( (array!15067 (arr!7548 (Array (_ BitVec 32) (_ BitVec 8))) (size!6561 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11936 0))(
  ( (BitStream!11937 (buf!7029 array!15066) (currentByte!12994 (_ BitVec 32)) (currentBit!12989 (_ BitVec 32))) )
))
(declare-fun w1!591 () BitStream!11936)

(declare-fun w2!587 () BitStream!11936)

(declare-fun isPrefixOf!0 (BitStream!11936 BitStream!11936) Bool)

(assert (=> start!58932 (= res!225280 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58932 e!190207))

(declare-fun e!190205 () Bool)

(declare-fun inv!12 (BitStream!11936) Bool)

(assert (=> start!58932 (and (inv!12 w1!591) e!190205)))

(declare-fun e!190203 () Bool)

(assert (=> start!58932 (and (inv!12 w2!587) e!190203)))

(declare-fun w3!25 () BitStream!11936)

(declare-fun e!190206 () Bool)

(assert (=> start!58932 (and (inv!12 w3!25) e!190206)))

(declare-fun b!270322 () Bool)

(assert (=> b!270322 (= e!190207 (not (or (bvsge (currentByte!12994 w1!591) (size!6561 (buf!7029 w1!591))) (bvsge (currentByte!12994 w1!591) (currentByte!12994 w2!587)) (bvsgt #b00000000000000000000000000000000 (currentByte!12994 w2!587)) (bvsgt (size!6561 (buf!7029 w2!587)) (size!6561 (buf!7029 w3!25))) (bvsgt (currentByte!12994 w2!587) (size!6561 (buf!7029 w2!587))) (bvsle #b00000000000000000000000000000000 (currentByte!12994 w1!591)))))))

(declare-fun arrayRangesEq!1093 (array!15066 array!15066 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!270322 (arrayRangesEq!1093 (buf!7029 w1!591) (buf!7029 w3!25) #b00000000000000000000000000000000 (currentByte!12994 w1!591))))

(declare-datatypes ((Unit!19077 0))(
  ( (Unit!19078) )
))
(declare-fun lt!409421 () Unit!19077)

(declare-fun arrayRangesEqTransitive!356 (array!15066 array!15066 array!15066 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19077)

(assert (=> b!270322 (= lt!409421 (arrayRangesEqTransitive!356 (buf!7029 w1!591) (buf!7029 w2!587) (buf!7029 w3!25) #b00000000000000000000000000000000 (currentByte!12994 w1!591) (currentByte!12994 w2!587)))))

(declare-fun b!270323 () Bool)

(declare-fun array_inv!6285 (array!15066) Bool)

(assert (=> b!270323 (= e!190203 (array_inv!6285 (buf!7029 w2!587)))))

(declare-fun b!270324 () Bool)

(assert (=> b!270324 (= e!190205 (array_inv!6285 (buf!7029 w1!591)))))

(declare-fun b!270325 () Bool)

(assert (=> b!270325 (= e!190206 (array_inv!6285 (buf!7029 w3!25)))))

(declare-fun b!270326 () Bool)

(declare-fun res!225279 () Bool)

(assert (=> b!270326 (=> (not res!225279) (not e!190207))))

(assert (=> b!270326 (= res!225279 (isPrefixOf!0 w2!587 w3!25))))

(assert (= (and start!58932 res!225280) b!270326))

(assert (= (and b!270326 res!225279) b!270322))

(assert (= start!58932 b!270324))

(assert (= start!58932 b!270323))

(assert (= start!58932 b!270325))

(declare-fun m!402193 () Bool)

(assert (=> start!58932 m!402193))

(declare-fun m!402195 () Bool)

(assert (=> start!58932 m!402195))

(declare-fun m!402197 () Bool)

(assert (=> start!58932 m!402197))

(declare-fun m!402199 () Bool)

(assert (=> start!58932 m!402199))

(declare-fun m!402201 () Bool)

(assert (=> b!270324 m!402201))

(declare-fun m!402203 () Bool)

(assert (=> b!270325 m!402203))

(declare-fun m!402205 () Bool)

(assert (=> b!270326 m!402205))

(declare-fun m!402207 () Bool)

(assert (=> b!270323 m!402207))

(declare-fun m!402209 () Bool)

(assert (=> b!270322 m!402209))

(declare-fun m!402211 () Bool)

(assert (=> b!270322 m!402211))

(push 1)

(assert (not b!270323))

(assert (not b!270324))

(assert (not start!58932))

(assert (not b!270322))

(assert (not b!270325))

(assert (not b!270326))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!91780 () Bool)

(assert (=> d!91780 (= (array_inv!6285 (buf!7029 w2!587)) (bvsge (size!6561 (buf!7029 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!270323 d!91780))

(declare-fun d!91782 () Bool)

(declare-fun res!225294 () Bool)

(declare-fun e!190218 () Bool)

(assert (=> d!91782 (=> (not res!225294) (not e!190218))))

(assert (=> d!91782 (= res!225294 (= (size!6561 (buf!7029 w1!591)) (size!6561 (buf!7029 w2!587))))))

(assert (=> d!91782 (= (isPrefixOf!0 w1!591 w2!587) e!190218)))

(declare-fun b!270339 () Bool)

(declare-fun res!225295 () Bool)

(assert (=> b!270339 (=> (not res!225295) (not e!190218))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!270339 (= res!225295 (bvsle (bitIndex!0 (size!6561 (buf!7029 w1!591)) (currentByte!12994 w1!591) (currentBit!12989 w1!591)) (bitIndex!0 (size!6561 (buf!7029 w2!587)) (currentByte!12994 w2!587) (currentBit!12989 w2!587))))))

(declare-fun b!270340 () Bool)

(declare-fun e!190219 () Bool)

(assert (=> b!270340 (= e!190218 e!190219)))

(declare-fun res!225293 () Bool)

(assert (=> b!270340 (=> res!225293 e!190219)))

(assert (=> b!270340 (= res!225293 (= (size!6561 (buf!7029 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!270341 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15066 array!15066 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!270341 (= e!190219 (arrayBitRangesEq!0 (buf!7029 w1!591) (buf!7029 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6561 (buf!7029 w1!591)) (currentByte!12994 w1!591) (currentBit!12989 w1!591))))))

(assert (= (and d!91782 res!225294) b!270339))

(assert (= (and b!270339 res!225295) b!270340))

(assert (= (and b!270340 (not res!225293)) b!270341))

(declare-fun m!402221 () Bool)

(assert (=> b!270339 m!402221))

(declare-fun m!402223 () Bool)

(assert (=> b!270339 m!402223))

(assert (=> b!270341 m!402221))

(assert (=> b!270341 m!402221))

(declare-fun m!402225 () Bool)

(assert (=> b!270341 m!402225))

(assert (=> start!58932 d!91782))

(declare-fun d!91790 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!91790 (= (inv!12 w1!591) (invariant!0 (currentBit!12989 w1!591) (currentByte!12994 w1!591) (size!6561 (buf!7029 w1!591))))))

(declare-fun bs!23195 () Bool)

(assert (= bs!23195 d!91790))

(declare-fun m!402227 () Bool)

(assert (=> bs!23195 m!402227))

(assert (=> start!58932 d!91790))

(declare-fun d!91792 () Bool)

(assert (=> d!91792 (= (inv!12 w2!587) (invariant!0 (currentBit!12989 w2!587) (currentByte!12994 w2!587) (size!6561 (buf!7029 w2!587))))))

(declare-fun bs!23196 () Bool)

(assert (= bs!23196 d!91792))

(declare-fun m!402229 () Bool)

(assert (=> bs!23196 m!402229))

(assert (=> start!58932 d!91792))

(declare-fun d!91794 () Bool)

(assert (=> d!91794 (= (inv!12 w3!25) (invariant!0 (currentBit!12989 w3!25) (currentByte!12994 w3!25) (size!6561 (buf!7029 w3!25))))))

(declare-fun bs!23197 () Bool)

(assert (= bs!23197 d!91794))

(declare-fun m!402231 () Bool)

(assert (=> bs!23197 m!402231))

(assert (=> start!58932 d!91794))

(declare-fun d!91796 () Bool)

(declare-fun res!225306 () Bool)

(declare-fun e!190228 () Bool)

(assert (=> d!91796 (=> res!225306 e!190228)))

(assert (=> d!91796 (= res!225306 (= #b00000000000000000000000000000000 (currentByte!12994 w1!591)))))

(assert (=> d!91796 (= (arrayRangesEq!1093 (buf!7029 w1!591) (buf!7029 w3!25) #b00000000000000000000000000000000 (currentByte!12994 w1!591)) e!190228)))

(declare-fun b!270352 () Bool)

(declare-fun e!190229 () Bool)

(assert (=> b!270352 (= e!190228 e!190229)))

(declare-fun res!225307 () Bool)

(assert (=> b!270352 (=> (not res!225307) (not e!190229))))

(assert (=> b!270352 (= res!225307 (= (select (arr!7548 (buf!7029 w1!591)) #b00000000000000000000000000000000) (select (arr!7548 (buf!7029 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!270353 () Bool)

(assert (=> b!270353 (= e!190229 (arrayRangesEq!1093 (buf!7029 w1!591) (buf!7029 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12994 w1!591)))))

(assert (= (and d!91796 (not res!225306)) b!270352))

(assert (= (and b!270352 res!225307) b!270353))

(declare-fun m!402233 () Bool)

(assert (=> b!270352 m!402233))

(declare-fun m!402235 () Bool)

(assert (=> b!270352 m!402235))

(declare-fun m!402237 () Bool)

(assert (=> b!270353 m!402237))

(assert (=> b!270322 d!91796))

(declare-fun d!91798 () Bool)

(assert (=> d!91798 (arrayRangesEq!1093 (buf!7029 w1!591) (buf!7029 w3!25) #b00000000000000000000000000000000 (currentByte!12994 w1!591))))

(declare-fun lt!409427 () Unit!19077)

(declare-fun choose!393 (array!15066 array!15066 array!15066 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19077)

(assert (=> d!91798 (= lt!409427 (choose!393 (buf!7029 w1!591) (buf!7029 w2!587) (buf!7029 w3!25) #b00000000000000000000000000000000 (currentByte!12994 w1!591) (currentByte!12994 w2!587)))))

(assert (=> d!91798 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!12994 w1!591)) (bvsle (currentByte!12994 w1!591) (currentByte!12994 w2!587)))))

(assert (=> d!91798 (= (arrayRangesEqTransitive!356 (buf!7029 w1!591) (buf!7029 w2!587) (buf!7029 w3!25) #b00000000000000000000000000000000 (currentByte!12994 w1!591) (currentByte!12994 w2!587)) lt!409427)))

(declare-fun bs!23201 () Bool)

(assert (= bs!23201 d!91798))

(assert (=> bs!23201 m!402209))

(declare-fun m!402251 () Bool)

(assert (=> bs!23201 m!402251))

(assert (=> b!270322 d!91798))

(declare-fun d!91812 () Bool)

(declare-fun res!225321 () Bool)

(declare-fun e!190238 () Bool)

(assert (=> d!91812 (=> (not res!225321) (not e!190238))))

(assert (=> d!91812 (= res!225321 (= (size!6561 (buf!7029 w2!587)) (size!6561 (buf!7029 w3!25))))))

(assert (=> d!91812 (= (isPrefixOf!0 w2!587 w3!25) e!190238)))

(declare-fun b!270366 () Bool)

(declare-fun res!225322 () Bool)

(assert (=> b!270366 (=> (not res!225322) (not e!190238))))

(assert (=> b!270366 (= res!225322 (bvsle (bitIndex!0 (size!6561 (buf!7029 w2!587)) (currentByte!12994 w2!587) (currentBit!12989 w2!587)) (bitIndex!0 (size!6561 (buf!7029 w3!25)) (currentByte!12994 w3!25) (currentBit!12989 w3!25))))))

(declare-fun b!270367 () Bool)

(declare-fun e!190239 () Bool)

(assert (=> b!270367 (= e!190238 e!190239)))

(declare-fun res!225320 () Bool)

(assert (=> b!270367 (=> res!225320 e!190239)))

(assert (=> b!270367 (= res!225320 (= (size!6561 (buf!7029 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!270368 () Bool)

(assert (=> b!270368 (= e!190239 (arrayBitRangesEq!0 (buf!7029 w2!587) (buf!7029 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6561 (buf!7029 w2!587)) (currentByte!12994 w2!587) (currentBit!12989 w2!587))))))

(assert (= (and d!91812 res!225321) b!270366))

(assert (= (and b!270366 res!225322) b!270367))

(assert (= (and b!270367 (not res!225320)) b!270368))

(assert (=> b!270366 m!402223))

(declare-fun m!402257 () Bool)

(assert (=> b!270366 m!402257))

(assert (=> b!270368 m!402223))

(assert (=> b!270368 m!402223))

(declare-fun m!402259 () Bool)

(assert (=> b!270368 m!402259))

(assert (=> b!270326 d!91812))

(declare-fun d!91816 () Bool)

(assert (=> d!91816 (= (array_inv!6285 (buf!7029 w1!591)) (bvsge (size!6561 (buf!7029 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!270324 d!91816))

(declare-fun d!91818 () Bool)

(assert (=> d!91818 (= (array_inv!6285 (buf!7029 w3!25)) (bvsge (size!6561 (buf!7029 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!270325 d!91818))

