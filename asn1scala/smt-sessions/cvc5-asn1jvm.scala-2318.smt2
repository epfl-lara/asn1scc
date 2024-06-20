; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58928 () Bool)

(assert start!58928)

(declare-fun b!270292 () Bool)

(declare-fun e!190162 () Bool)

(declare-datatypes ((array!15062 0))(
  ( (array!15063 (arr!7546 (Array (_ BitVec 32) (_ BitVec 8))) (size!6559 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11932 0))(
  ( (BitStream!11933 (buf!7027 array!15062) (currentByte!12992 (_ BitVec 32)) (currentBit!12987 (_ BitVec 32))) )
))
(declare-fun w3!25 () BitStream!11932)

(declare-fun array_inv!6283 (array!15062) Bool)

(assert (=> b!270292 (= e!190162 (array_inv!6283 (buf!7027 w3!25)))))

(declare-fun res!225267 () Bool)

(declare-fun e!190163 () Bool)

(assert (=> start!58928 (=> (not res!225267) (not e!190163))))

(declare-fun w1!591 () BitStream!11932)

(declare-fun w2!587 () BitStream!11932)

(declare-fun isPrefixOf!0 (BitStream!11932 BitStream!11932) Bool)

(assert (=> start!58928 (= res!225267 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58928 e!190163))

(declare-fun e!190160 () Bool)

(declare-fun inv!12 (BitStream!11932) Bool)

(assert (=> start!58928 (and (inv!12 w1!591) e!190160)))

(declare-fun e!190161 () Bool)

(assert (=> start!58928 (and (inv!12 w2!587) e!190161)))

(assert (=> start!58928 (and (inv!12 w3!25) e!190162)))

(declare-fun b!270293 () Bool)

(declare-fun res!225268 () Bool)

(assert (=> b!270293 (=> (not res!225268) (not e!190163))))

(assert (=> b!270293 (= res!225268 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!270294 () Bool)

(assert (=> b!270294 (= e!190161 (array_inv!6283 (buf!7027 w2!587)))))

(declare-fun b!270295 () Bool)

(assert (=> b!270295 (= e!190163 (not (or (bvsge (currentByte!12992 w1!591) (size!6559 (buf!7027 w1!591))) (bvsge (currentByte!12992 w1!591) (currentByte!12992 w2!587)) (bvsgt #b00000000000000000000000000000000 (currentByte!12992 w2!587)) (bvsgt (size!6559 (buf!7027 w2!587)) (size!6559 (buf!7027 w3!25))) (bvsgt (currentByte!12992 w2!587) (size!6559 (buf!7027 w2!587))) (bvsle #b00000000000000000000000000000000 (currentByte!12992 w1!591)))))))

(declare-fun arrayRangesEq!1091 (array!15062 array!15062 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!270295 (arrayRangesEq!1091 (buf!7027 w1!591) (buf!7027 w3!25) #b00000000000000000000000000000000 (currentByte!12992 w1!591))))

(declare-datatypes ((Unit!19073 0))(
  ( (Unit!19074) )
))
(declare-fun lt!409415 () Unit!19073)

(declare-fun arrayRangesEqTransitive!354 (array!15062 array!15062 array!15062 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19073)

(assert (=> b!270295 (= lt!409415 (arrayRangesEqTransitive!354 (buf!7027 w1!591) (buf!7027 w2!587) (buf!7027 w3!25) #b00000000000000000000000000000000 (currentByte!12992 w1!591) (currentByte!12992 w2!587)))))

(declare-fun b!270296 () Bool)

(assert (=> b!270296 (= e!190160 (array_inv!6283 (buf!7027 w1!591)))))

(assert (= (and start!58928 res!225267) b!270293))

(assert (= (and b!270293 res!225268) b!270295))

(assert (= start!58928 b!270296))

(assert (= start!58928 b!270294))

(assert (= start!58928 b!270292))

(declare-fun m!402153 () Bool)

(assert (=> b!270293 m!402153))

(declare-fun m!402155 () Bool)

(assert (=> b!270294 m!402155))

(declare-fun m!402157 () Bool)

(assert (=> b!270292 m!402157))

(declare-fun m!402159 () Bool)

(assert (=> start!58928 m!402159))

(declare-fun m!402161 () Bool)

(assert (=> start!58928 m!402161))

(declare-fun m!402163 () Bool)

(assert (=> start!58928 m!402163))

(declare-fun m!402165 () Bool)

(assert (=> start!58928 m!402165))

(declare-fun m!402167 () Bool)

(assert (=> b!270295 m!402167))

(declare-fun m!402169 () Bool)

(assert (=> b!270295 m!402169))

(declare-fun m!402171 () Bool)

(assert (=> b!270296 m!402171))

(push 1)

(assert (not b!270294))

(assert (not b!270292))

(assert (not b!270296))

(assert (not start!58928))

(assert (not b!270293))

(assert (not b!270295))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!91778 () Bool)

(declare-fun res!225285 () Bool)

(declare-fun e!190212 () Bool)

(assert (=> d!91778 (=> res!225285 e!190212)))

(assert (=> d!91778 (= res!225285 (= #b00000000000000000000000000000000 (currentByte!12992 w1!591)))))

(assert (=> d!91778 (= (arrayRangesEq!1091 (buf!7027 w1!591) (buf!7027 w3!25) #b00000000000000000000000000000000 (currentByte!12992 w1!591)) e!190212)))

(declare-fun b!270331 () Bool)

(declare-fun e!190213 () Bool)

(assert (=> b!270331 (= e!190212 e!190213)))

(declare-fun res!225286 () Bool)

(assert (=> b!270331 (=> (not res!225286) (not e!190213))))

(assert (=> b!270331 (= res!225286 (= (select (arr!7546 (buf!7027 w1!591)) #b00000000000000000000000000000000) (select (arr!7546 (buf!7027 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!270332 () Bool)

(assert (=> b!270332 (= e!190213 (arrayRangesEq!1091 (buf!7027 w1!591) (buf!7027 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12992 w1!591)))))

(assert (= (and d!91778 (not res!225285)) b!270331))

(assert (= (and b!270331 res!225286) b!270332))

(declare-fun m!402213 () Bool)

(assert (=> b!270331 m!402213))

(declare-fun m!402215 () Bool)

(assert (=> b!270331 m!402215))

(declare-fun m!402217 () Bool)

(assert (=> b!270332 m!402217))

(assert (=> b!270295 d!91778))

(declare-fun d!91784 () Bool)

(assert (=> d!91784 (arrayRangesEq!1091 (buf!7027 w1!591) (buf!7027 w3!25) #b00000000000000000000000000000000 (currentByte!12992 w1!591))))

(declare-fun lt!409424 () Unit!19073)

(declare-fun choose!392 (array!15062 array!15062 array!15062 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19073)

(assert (=> d!91784 (= lt!409424 (choose!392 (buf!7027 w1!591) (buf!7027 w2!587) (buf!7027 w3!25) #b00000000000000000000000000000000 (currentByte!12992 w1!591) (currentByte!12992 w2!587)))))

(assert (=> d!91784 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!12992 w1!591)) (bvsle (currentByte!12992 w1!591) (currentByte!12992 w2!587)))))

(assert (=> d!91784 (= (arrayRangesEqTransitive!354 (buf!7027 w1!591) (buf!7027 w2!587) (buf!7027 w3!25) #b00000000000000000000000000000000 (currentByte!12992 w1!591) (currentByte!12992 w2!587)) lt!409424)))

(declare-fun bs!23194 () Bool)

(assert (= bs!23194 d!91784))

(assert (=> bs!23194 m!402167))

(declare-fun m!402219 () Bool)

(assert (=> bs!23194 m!402219))

(assert (=> b!270295 d!91784))

(declare-fun d!91788 () Bool)

(declare-fun res!225308 () Bool)

(declare-fun e!190231 () Bool)

(assert (=> d!91788 (=> (not res!225308) (not e!190231))))

(assert (=> d!91788 (= res!225308 (= (size!6559 (buf!7027 w1!591)) (size!6559 (buf!7027 w2!587))))))

(assert (=> d!91788 (= (isPrefixOf!0 w1!591 w2!587) e!190231)))

(declare-fun b!270354 () Bool)

(declare-fun res!225309 () Bool)

(assert (=> b!270354 (=> (not res!225309) (not e!190231))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!270354 (= res!225309 (bvsle (bitIndex!0 (size!6559 (buf!7027 w1!591)) (currentByte!12992 w1!591) (currentBit!12987 w1!591)) (bitIndex!0 (size!6559 (buf!7027 w2!587)) (currentByte!12992 w2!587) (currentBit!12987 w2!587))))))

(declare-fun b!270355 () Bool)

(declare-fun e!190230 () Bool)

(assert (=> b!270355 (= e!190231 e!190230)))

(declare-fun res!225310 () Bool)

(assert (=> b!270355 (=> res!225310 e!190230)))

(assert (=> b!270355 (= res!225310 (= (size!6559 (buf!7027 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!270356 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15062 array!15062 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!270356 (= e!190230 (arrayBitRangesEq!0 (buf!7027 w1!591) (buf!7027 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6559 (buf!7027 w1!591)) (currentByte!12992 w1!591) (currentBit!12987 w1!591))))))

(assert (= (and d!91788 res!225308) b!270354))

(assert (= (and b!270354 res!225309) b!270355))

(assert (= (and b!270355 (not res!225310)) b!270356))

(declare-fun m!402239 () Bool)

(assert (=> b!270354 m!402239))

(declare-fun m!402241 () Bool)

(assert (=> b!270354 m!402241))

(assert (=> b!270356 m!402239))

(assert (=> b!270356 m!402239))

(declare-fun m!402243 () Bool)

(assert (=> b!270356 m!402243))

(assert (=> start!58928 d!91788))

(declare-fun d!91800 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!91800 (= (inv!12 w1!591) (invariant!0 (currentBit!12987 w1!591) (currentByte!12992 w1!591) (size!6559 (buf!7027 w1!591))))))

(declare-fun bs!23198 () Bool)

(assert (= bs!23198 d!91800))

(declare-fun m!402245 () Bool)

(assert (=> bs!23198 m!402245))

(assert (=> start!58928 d!91800))

(declare-fun d!91802 () Bool)

(assert (=> d!91802 (= (inv!12 w2!587) (invariant!0 (currentBit!12987 w2!587) (currentByte!12992 w2!587) (size!6559 (buf!7027 w2!587))))))

(declare-fun bs!23199 () Bool)

(assert (= bs!23199 d!91802))

(declare-fun m!402247 () Bool)

(assert (=> bs!23199 m!402247))

(assert (=> start!58928 d!91802))

(declare-fun d!91804 () Bool)

(assert (=> d!91804 (= (inv!12 w3!25) (invariant!0 (currentBit!12987 w3!25) (currentByte!12992 w3!25) (size!6559 (buf!7027 w3!25))))))

(declare-fun bs!23200 () Bool)

(assert (= bs!23200 d!91804))

(declare-fun m!402249 () Bool)

(assert (=> bs!23200 m!402249))

(assert (=> start!58928 d!91804))

(declare-fun d!91806 () Bool)

(assert (=> d!91806 (= (array_inv!6283 (buf!7027 w2!587)) (bvsge (size!6559 (buf!7027 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!270294 d!91806))

(declare-fun d!91808 () Bool)

(assert (=> d!91808 (= (array_inv!6283 (buf!7027 w3!25)) (bvsge (size!6559 (buf!7027 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!270292 d!91808))

(declare-fun d!91810 () Bool)

(declare-fun res!225317 () Bool)

(declare-fun e!190237 () Bool)

(assert (=> d!91810 (=> (not res!225317) (not e!190237))))

(assert (=> d!91810 (= res!225317 (= (size!6559 (buf!7027 w2!587)) (size!6559 (buf!7027 w3!25))))))

(assert (=> d!91810 (= (isPrefixOf!0 w2!587 w3!25) e!190237)))

(declare-fun b!270363 () Bool)

(declare-fun res!225318 () Bool)

(assert (=> b!270363 (=> (not res!225318) (not e!190237))))

(assert (=> b!270363 (= res!225318 (bvsle (bitIndex!0 (size!6559 (buf!7027 w2!587)) (currentByte!12992 w2!587) (currentBit!12987 w2!587)) (bitIndex!0 (size!6559 (buf!7027 w3!25)) (currentByte!12992 w3!25) (currentBit!12987 w3!25))))))

(declare-fun b!270364 () Bool)

(declare-fun e!190236 () Bool)

(assert (=> b!270364 (= e!190237 e!190236)))

(declare-fun res!225319 () Bool)

(assert (=> b!270364 (=> res!225319 e!190236)))

(assert (=> b!270364 (= res!225319 (= (size!6559 (buf!7027 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!270365 () Bool)

(assert (=> b!270365 (= e!190236 (arrayBitRangesEq!0 (buf!7027 w2!587) (buf!7027 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6559 (buf!7027 w2!587)) (currentByte!12992 w2!587) (currentBit!12987 w2!587))))))

(assert (= (and d!91810 res!225317) b!270363))

(assert (= (and b!270363 res!225318) b!270364))

(assert (= (and b!270364 (not res!225319)) b!270365))

(assert (=> b!270363 m!402241))

(declare-fun m!402253 () Bool)

(assert (=> b!270363 m!402253))

(assert (=> b!270365 m!402241))

(assert (=> b!270365 m!402241))

(declare-fun m!402255 () Bool)

(assert (=> b!270365 m!402255))

(assert (=> b!270293 d!91810))

(declare-fun d!91814 () Bool)

(assert (=> d!91814 (= (array_inv!6283 (buf!7027 w1!591)) (bvsge (size!6559 (buf!7027 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!270296 d!91814))

(push 1)

(assert (not d!91802))

(assert (not b!270356))

(assert (not b!270363))

(assert (not b!270354))

(assert (not b!270332))

(assert (not d!91800))

(assert (not b!270365))

(assert (not d!91804))

(assert (not d!91784))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

