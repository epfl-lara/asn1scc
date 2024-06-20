; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57592 () Bool)

(assert start!57592)

(declare-fun b!264263 () Bool)

(declare-datatypes ((Unit!18836 0))(
  ( (Unit!18837) )
))
(declare-fun e!184442 () Unit!18836)

(declare-fun Unit!18838 () Unit!18836)

(assert (=> b!264263 (= e!184442 Unit!18838)))

(declare-fun b!264264 () Bool)

(declare-fun e!184443 () Bool)

(declare-datatypes ((array!14745 0))(
  ( (array!14746 (arr!7422 (Array (_ BitVec 32) (_ BitVec 8))) (size!6435 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11684 0))(
  ( (BitStream!11685 (buf!6903 array!14745) (currentByte!12767 (_ BitVec 32)) (currentBit!12762 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11684)

(declare-fun w2!580 () BitStream!11684)

(declare-fun arrayBitRangesEq!0 (array!14745 array!14745 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!264264 (= e!184443 (not (arrayBitRangesEq!0 (buf!6903 w1!584) (buf!6903 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6435 (buf!6903 w1!584)) (currentByte!12767 w1!584) (currentBit!12762 w1!584)))))))

(declare-fun b!264265 () Bool)

(declare-fun e!184438 () Bool)

(assert (=> b!264265 (= e!184438 (not (arrayBitRangesEq!0 (buf!6903 w2!580) (buf!6903 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6435 (buf!6903 w1!584)) (currentByte!12767 w1!584) (currentBit!12762 w1!584)))))))

(declare-fun b!264266 () Bool)

(declare-fun e!184441 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!264266 (= e!184441 (invariant!0 (currentBit!12762 w1!584) (currentByte!12767 w1!584) (size!6435 (buf!6903 w1!584))))))

(declare-fun lt!405595 () Unit!18836)

(declare-fun lt!405593 () BitStream!11684)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!11684 BitStream!11684 BitStream!11684) Unit!18836)

(assert (=> b!264266 (= lt!405595 (lemmaIsPrefixTransitive!0 lt!405593 w2!580 w2!580))))

(declare-fun isPrefixOf!0 (BitStream!11684 BitStream!11684) Bool)

(assert (=> b!264266 (isPrefixOf!0 lt!405593 w2!580)))

(declare-fun lt!405591 () Unit!18836)

(assert (=> b!264266 (= lt!405591 (lemmaIsPrefixTransitive!0 lt!405593 w1!584 w2!580))))

(declare-fun b!264267 () Bool)

(declare-fun res!220927 () Bool)

(assert (=> b!264267 (=> res!220927 e!184441)))

(assert (=> b!264267 (= res!220927 (not (isPrefixOf!0 lt!405593 w1!584)))))

(declare-fun b!264268 () Bool)

(declare-fun lt!405590 () Unit!18836)

(assert (=> b!264268 (= e!184442 lt!405590)))

(declare-fun lt!405594 () (_ BitVec 64))

(assert (=> b!264268 (= lt!405594 (bitIndex!0 (size!6435 (buf!6903 w1!584)) (currentByte!12767 w1!584) (currentBit!12762 w1!584)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!14745 array!14745 (_ BitVec 64) (_ BitVec 64)) Unit!18836)

(assert (=> b!264268 (= lt!405590 (arrayBitRangesEqSymmetric!0 (buf!6903 w1!584) (buf!6903 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405594))))

(assert (=> b!264268 (arrayBitRangesEq!0 (buf!6903 w2!580) (buf!6903 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405594)))

(declare-fun b!264269 () Bool)

(declare-fun e!184440 () Bool)

(declare-fun e!184439 () Bool)

(assert (=> b!264269 (= e!184440 (not e!184439))))

(declare-fun res!220922 () Bool)

(assert (=> b!264269 (=> res!220922 e!184439)))

(assert (=> b!264269 (= res!220922 e!184443)))

(declare-fun res!220926 () Bool)

(assert (=> b!264269 (=> (not res!220926) (not e!184443))))

(assert (=> b!264269 (= res!220926 (not (= (size!6435 (buf!6903 w1!584)) #b00000000000000000000000000000000)))))

(assert (=> b!264269 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!405589 () Unit!18836)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11684) Unit!18836)

(assert (=> b!264269 (= lt!405589 (lemmaIsPrefixRefl!0 w2!580))))

(assert (=> b!264269 (isPrefixOf!0 lt!405593 lt!405593)))

(declare-fun lt!405596 () Unit!18836)

(assert (=> b!264269 (= lt!405596 (lemmaIsPrefixRefl!0 lt!405593))))

(assert (=> b!264269 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!405592 () Unit!18836)

(assert (=> b!264269 (= lt!405592 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!264269 (= lt!405593 (BitStream!11685 (buf!6903 w2!580) (currentByte!12767 w1!584) (currentBit!12762 w1!584)))))

(declare-fun b!264270 () Bool)

(declare-fun e!184446 () Bool)

(declare-fun array_inv!6159 (array!14745) Bool)

(assert (=> b!264270 (= e!184446 (array_inv!6159 (buf!6903 w2!580)))))

(declare-fun res!220923 () Bool)

(assert (=> start!57592 (=> (not res!220923) (not e!184440))))

(assert (=> start!57592 (= res!220923 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57592 e!184440))

(declare-fun e!184444 () Bool)

(declare-fun inv!12 (BitStream!11684) Bool)

(assert (=> start!57592 (and (inv!12 w1!584) e!184444)))

(assert (=> start!57592 (and (inv!12 w2!580) e!184446)))

(declare-fun b!264271 () Bool)

(assert (=> b!264271 (= e!184444 (array_inv!6159 (buf!6903 w1!584)))))

(declare-fun b!264272 () Bool)

(assert (=> b!264272 (= e!184439 e!184441)))

(declare-fun res!220925 () Bool)

(assert (=> b!264272 (=> res!220925 e!184441)))

(assert (=> b!264272 (= res!220925 e!184438)))

(declare-fun res!220924 () Bool)

(assert (=> b!264272 (=> (not res!220924) (not e!184438))))

(assert (=> b!264272 (= res!220924 (not (= (size!6435 (buf!6903 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun lt!405588 () Unit!18836)

(assert (=> b!264272 (= lt!405588 e!184442)))

(declare-fun c!12111 () Bool)

(assert (=> b!264272 (= c!12111 (not (= (size!6435 (buf!6903 w1!584)) #b00000000000000000000000000000000)))))

(assert (= (and start!57592 res!220923) b!264269))

(assert (= (and b!264269 res!220926) b!264264))

(assert (= (and b!264269 (not res!220922)) b!264272))

(assert (= (and b!264272 c!12111) b!264268))

(assert (= (and b!264272 (not c!12111)) b!264263))

(assert (= (and b!264272 res!220924) b!264265))

(assert (= (and b!264272 (not res!220925)) b!264267))

(assert (= (and b!264267 (not res!220927)) b!264266))

(assert (= start!57592 b!264271))

(assert (= start!57592 b!264270))

(declare-fun m!394721 () Bool)

(assert (=> b!264270 m!394721))

(declare-fun m!394723 () Bool)

(assert (=> b!264267 m!394723))

(declare-fun m!394725 () Bool)

(assert (=> b!264265 m!394725))

(assert (=> b!264265 m!394725))

(declare-fun m!394727 () Bool)

(assert (=> b!264265 m!394727))

(assert (=> b!264268 m!394725))

(declare-fun m!394729 () Bool)

(assert (=> b!264268 m!394729))

(declare-fun m!394731 () Bool)

(assert (=> b!264268 m!394731))

(declare-fun m!394733 () Bool)

(assert (=> start!57592 m!394733))

(declare-fun m!394735 () Bool)

(assert (=> start!57592 m!394735))

(declare-fun m!394737 () Bool)

(assert (=> start!57592 m!394737))

(declare-fun m!394739 () Bool)

(assert (=> b!264269 m!394739))

(declare-fun m!394741 () Bool)

(assert (=> b!264269 m!394741))

(declare-fun m!394743 () Bool)

(assert (=> b!264269 m!394743))

(declare-fun m!394745 () Bool)

(assert (=> b!264269 m!394745))

(declare-fun m!394747 () Bool)

(assert (=> b!264269 m!394747))

(declare-fun m!394749 () Bool)

(assert (=> b!264269 m!394749))

(declare-fun m!394751 () Bool)

(assert (=> b!264266 m!394751))

(declare-fun m!394753 () Bool)

(assert (=> b!264266 m!394753))

(declare-fun m!394755 () Bool)

(assert (=> b!264266 m!394755))

(declare-fun m!394757 () Bool)

(assert (=> b!264266 m!394757))

(declare-fun m!394759 () Bool)

(assert (=> b!264271 m!394759))

(assert (=> b!264264 m!394725))

(assert (=> b!264264 m!394725))

(declare-fun m!394761 () Bool)

(assert (=> b!264264 m!394761))

(push 1)

(assert (not b!264266))

(assert (not b!264267))

(assert (not b!264270))

(assert (not b!264271))

(assert (not start!57592))

(assert (not b!264264))

(assert (not b!264268))

(assert (not b!264265))

(assert (not b!264269))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!89090 () Bool)

(declare-fun e!184455 () Bool)

(assert (=> d!89090 e!184455))

(declare-fun res!220942 () Bool)

(assert (=> d!89090 (=> (not res!220942) (not e!184455))))

(declare-fun lt!405613 () (_ BitVec 64))

(declare-fun lt!405611 () (_ BitVec 64))

(declare-fun lt!405610 () (_ BitVec 64))

(assert (=> d!89090 (= res!220942 (= lt!405611 (bvsub lt!405613 lt!405610)))))

(assert (=> d!89090 (or (= (bvand lt!405613 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!405610 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!405613 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!405613 lt!405610) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!89090 (= lt!405610 (remainingBits!0 ((_ sign_extend 32) (size!6435 (buf!6903 w1!584))) ((_ sign_extend 32) (currentByte!12767 w1!584)) ((_ sign_extend 32) (currentBit!12762 w1!584))))))

(declare-fun lt!405612 () (_ BitVec 64))

(declare-fun lt!405609 () (_ BitVec 64))

(assert (=> d!89090 (= lt!405613 (bvmul lt!405612 lt!405609))))

(assert (=> d!89090 (or (= lt!405612 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!405609 (bvsdiv (bvmul lt!405612 lt!405609) lt!405612)))))

(assert (=> d!89090 (= lt!405609 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!89090 (= lt!405612 ((_ sign_extend 32) (size!6435 (buf!6903 w1!584))))))

(assert (=> d!89090 (= lt!405611 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12767 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12762 w1!584))))))

(assert (=> d!89090 (invariant!0 (currentBit!12762 w1!584) (currentByte!12767 w1!584) (size!6435 (buf!6903 w1!584)))))

(assert (=> d!89090 (= (bitIndex!0 (size!6435 (buf!6903 w1!584)) (currentByte!12767 w1!584) (currentBit!12762 w1!584)) lt!405611)))

(declare-fun b!264286 () Bool)

(declare-fun res!220941 () Bool)

(assert (=> b!264286 (=> (not res!220941) (not e!184455))))

(assert (=> b!264286 (= res!220941 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!405611))))

(declare-fun b!264287 () Bool)

(declare-fun lt!405614 () (_ BitVec 64))

(assert (=> b!264287 (= e!184455 (bvsle lt!405611 (bvmul lt!405614 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!264287 (or (= lt!405614 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!405614 #b0000000000000000000000000000000000000000000000000000000000001000) lt!405614)))))

(assert (=> b!264287 (= lt!405614 ((_ sign_extend 32) (size!6435 (buf!6903 w1!584))))))

(assert (= (and d!89090 res!220942) b!264286))

(assert (= (and b!264286 res!220941) b!264287))

(declare-fun m!394767 () Bool)

(assert (=> d!89090 m!394767))

(assert (=> d!89090 m!394751))

(assert (=> b!264268 d!89090))

(declare-fun d!89096 () Bool)

(assert (=> d!89096 (arrayBitRangesEq!0 (buf!6903 w2!580) (buf!6903 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405594)))

(declare-fun lt!405629 () Unit!18836)

(declare-fun choose!8 (array!14745 array!14745 (_ BitVec 64) (_ BitVec 64)) Unit!18836)

(assert (=> d!89096 (= lt!405629 (choose!8 (buf!6903 w1!584) (buf!6903 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405594))))

(assert (=> d!89096 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!405594))))

(assert (=> d!89096 (= (arrayBitRangesEqSymmetric!0 (buf!6903 w1!584) (buf!6903 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405594) lt!405629)))

(declare-fun bs!22617 () Bool)

(assert (= bs!22617 d!89096))

(assert (=> bs!22617 m!394731))

(declare-fun m!394769 () Bool)

(assert (=> bs!22617 m!394769))

(assert (=> b!264268 d!89096))

(declare-fun b!264348 () Bool)

(declare-fun e!184510 () Bool)

(declare-fun e!184507 () Bool)

(assert (=> b!264348 (= e!184510 e!184507)))

(declare-fun c!12120 () Bool)

(declare-datatypes ((tuple4!344 0))(
  ( (tuple4!345 (_1!12152 (_ BitVec 32)) (_2!12152 (_ BitVec 32)) (_3!952 (_ BitVec 32)) (_4!172 (_ BitVec 32))) )
))
(declare-fun lt!405654 () tuple4!344)

(assert (=> b!264348 (= c!12120 (= (_3!952 lt!405654) (_4!172 lt!405654)))))

(declare-fun b!264349 () Bool)

(declare-fun e!184508 () Bool)

(assert (=> b!264349 (= e!184508 e!184510)))

(declare-fun res!220987 () Bool)

(assert (=> b!264349 (=> (not res!220987) (not e!184510))))

(declare-fun e!184506 () Bool)

(assert (=> b!264349 (= res!220987 e!184506)))

(declare-fun res!220989 () Bool)

(assert (=> b!264349 (=> res!220989 e!184506)))

(assert (=> b!264349 (= res!220989 (bvsge (_1!12152 lt!405654) (_2!12152 lt!405654)))))

(declare-fun lt!405656 () (_ BitVec 32))

(assert (=> b!264349 (= lt!405656 ((_ extract 31 0) (bvsrem lt!405594 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!405655 () (_ BitVec 32))

(assert (=> b!264349 (= lt!405655 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!344)

(assert (=> b!264349 (= lt!405654 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!405594))))

(declare-fun b!264350 () Bool)

(declare-fun e!184511 () Bool)

(declare-fun call!4079 () Bool)

(assert (=> b!264350 (= e!184511 call!4079)))

(declare-fun b!264351 () Bool)

(declare-fun res!220991 () Bool)

(assert (=> b!264351 (= res!220991 (= lt!405656 #b00000000000000000000000000000000))))

(assert (=> b!264351 (=> res!220991 e!184511)))

(declare-fun e!184509 () Bool)

(assert (=> b!264351 (= e!184509 e!184511)))

(declare-fun d!89098 () Bool)

(declare-fun res!220988 () Bool)

(assert (=> d!89098 (=> res!220988 e!184508)))

(assert (=> d!89098 (= res!220988 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!405594))))

(assert (=> d!89098 (= (arrayBitRangesEq!0 (buf!6903 w2!580) (buf!6903 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405594) e!184508)))

(declare-fun b!264352 () Bool)

(declare-fun arrayRangesEq!1008 (array!14745 array!14745 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!264352 (= e!184506 (arrayRangesEq!1008 (buf!6903 w2!580) (buf!6903 w1!584) (_1!12152 lt!405654) (_2!12152 lt!405654)))))

(declare-fun bm!4076 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4076 (= call!4079 (byteRangesEq!0 (ite c!12120 (select (arr!7422 (buf!6903 w2!580)) (_3!952 lt!405654)) (select (arr!7422 (buf!6903 w2!580)) (_4!172 lt!405654))) (ite c!12120 (select (arr!7422 (buf!6903 w1!584)) (_3!952 lt!405654)) (select (arr!7422 (buf!6903 w1!584)) (_4!172 lt!405654))) (ite c!12120 lt!405655 #b00000000000000000000000000000000) lt!405656))))

(declare-fun b!264353 () Bool)

(assert (=> b!264353 (= e!184507 call!4079)))

(declare-fun b!264354 () Bool)

(assert (=> b!264354 (= e!184507 e!184509)))

(declare-fun res!220990 () Bool)

(assert (=> b!264354 (= res!220990 (byteRangesEq!0 (select (arr!7422 (buf!6903 w2!580)) (_3!952 lt!405654)) (select (arr!7422 (buf!6903 w1!584)) (_3!952 lt!405654)) lt!405655 #b00000000000000000000000000001000))))

(assert (=> b!264354 (=> (not res!220990) (not e!184509))))

(assert (= (and d!89098 (not res!220988)) b!264349))

(assert (= (and b!264349 (not res!220989)) b!264352))

(assert (= (and b!264349 res!220987) b!264348))

(assert (= (and b!264348 c!12120) b!264353))

(assert (= (and b!264348 (not c!12120)) b!264354))

(assert (= (and b!264354 res!220990) b!264351))

(assert (= (and b!264351 (not res!220991)) b!264350))

(assert (= (or b!264353 b!264350) bm!4076))

(declare-fun m!394805 () Bool)

(assert (=> b!264349 m!394805))

(declare-fun m!394807 () Bool)

(assert (=> b!264352 m!394807))

(declare-fun m!394809 () Bool)

(assert (=> bm!4076 m!394809))

(declare-fun m!394811 () Bool)

(assert (=> bm!4076 m!394811))

(declare-fun m!394813 () Bool)

(assert (=> bm!4076 m!394813))

(declare-fun m!394815 () Bool)

(assert (=> bm!4076 m!394815))

(declare-fun m!394817 () Bool)

(assert (=> bm!4076 m!394817))

(assert (=> b!264354 m!394811))

(assert (=> b!264354 m!394817))

(assert (=> b!264354 m!394811))

(assert (=> b!264354 m!394817))

(declare-fun m!394821 () Bool)

(assert (=> b!264354 m!394821))

(assert (=> b!264268 d!89098))

(declare-fun b!264364 () Bool)

(declare-fun e!184521 () Bool)

(declare-fun e!184518 () Bool)

(assert (=> b!264364 (= e!184521 e!184518)))

(declare-fun c!12121 () Bool)

(declare-fun lt!405675 () tuple4!344)

(assert (=> b!264364 (= c!12121 (= (_3!952 lt!405675) (_4!172 lt!405675)))))

(declare-fun b!264365 () Bool)

(declare-fun e!184519 () Bool)

(assert (=> b!264365 (= e!184519 e!184521)))

(declare-fun res!221001 () Bool)

(assert (=> b!264365 (=> (not res!221001) (not e!184521))))

(declare-fun e!184517 () Bool)

(assert (=> b!264365 (= res!221001 e!184517)))

(declare-fun res!221003 () Bool)

(assert (=> b!264365 (=> res!221003 e!184517)))

(assert (=> b!264365 (= res!221003 (bvsge (_1!12152 lt!405675) (_2!12152 lt!405675)))))

(declare-fun lt!405677 () (_ BitVec 32))

(assert (=> b!264365 (= lt!405677 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6435 (buf!6903 w1!584)) (currentByte!12767 w1!584) (currentBit!12762 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!405676 () (_ BitVec 32))

(assert (=> b!264365 (= lt!405676 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!264365 (= lt!405675 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6435 (buf!6903 w1!584)) (currentByte!12767 w1!584) (currentBit!12762 w1!584))))))

(declare-fun b!264366 () Bool)

(declare-fun e!184522 () Bool)

(declare-fun call!4080 () Bool)

(assert (=> b!264366 (= e!184522 call!4080)))

(declare-fun b!264367 () Bool)

(declare-fun res!221005 () Bool)

(assert (=> b!264367 (= res!221005 (= lt!405677 #b00000000000000000000000000000000))))

(assert (=> b!264367 (=> res!221005 e!184522)))

(declare-fun e!184520 () Bool)

(assert (=> b!264367 (= e!184520 e!184522)))

(declare-fun d!89108 () Bool)

(declare-fun res!221002 () Bool)

(assert (=> d!89108 (=> res!221002 e!184519)))

(assert (=> d!89108 (= res!221002 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6435 (buf!6903 w1!584)) (currentByte!12767 w1!584) (currentBit!12762 w1!584))))))

(assert (=> d!89108 (= (arrayBitRangesEq!0 (buf!6903 w1!584) (buf!6903 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6435 (buf!6903 w1!584)) (currentByte!12767 w1!584) (currentBit!12762 w1!584))) e!184519)))

(declare-fun b!264368 () Bool)

(assert (=> b!264368 (= e!184517 (arrayRangesEq!1008 (buf!6903 w1!584) (buf!6903 w2!580) (_1!12152 lt!405675) (_2!12152 lt!405675)))))

(declare-fun bm!4077 () Bool)

(assert (=> bm!4077 (= call!4080 (byteRangesEq!0 (ite c!12121 (select (arr!7422 (buf!6903 w1!584)) (_3!952 lt!405675)) (select (arr!7422 (buf!6903 w1!584)) (_4!172 lt!405675))) (ite c!12121 (select (arr!7422 (buf!6903 w2!580)) (_3!952 lt!405675)) (select (arr!7422 (buf!6903 w2!580)) (_4!172 lt!405675))) (ite c!12121 lt!405676 #b00000000000000000000000000000000) lt!405677))))

(declare-fun b!264369 () Bool)

(assert (=> b!264369 (= e!184518 call!4080)))

(declare-fun b!264370 () Bool)

(assert (=> b!264370 (= e!184518 e!184520)))

(declare-fun res!221004 () Bool)

(assert (=> b!264370 (= res!221004 (byteRangesEq!0 (select (arr!7422 (buf!6903 w1!584)) (_3!952 lt!405675)) (select (arr!7422 (buf!6903 w2!580)) (_3!952 lt!405675)) lt!405676 #b00000000000000000000000000001000))))

(assert (=> b!264370 (=> (not res!221004) (not e!184520))))

(assert (= (and d!89108 (not res!221002)) b!264365))

(assert (= (and b!264365 (not res!221003)) b!264368))

(assert (= (and b!264365 res!221001) b!264364))

(assert (= (and b!264364 c!12121) b!264369))

(assert (= (and b!264364 (not c!12121)) b!264370))

(assert (= (and b!264370 res!221004) b!264367))

(assert (= (and b!264367 (not res!221005)) b!264366))

(assert (= (or b!264369 b!264366) bm!4077))

(assert (=> b!264365 m!394725))

(declare-fun m!394823 () Bool)

(assert (=> b!264365 m!394823))

(declare-fun m!394825 () Bool)

(assert (=> b!264368 m!394825))

(declare-fun m!394827 () Bool)

(assert (=> bm!4077 m!394827))

(declare-fun m!394829 () Bool)

(assert (=> bm!4077 m!394829))

(declare-fun m!394831 () Bool)

(assert (=> bm!4077 m!394831))

(declare-fun m!394835 () Bool)

(assert (=> bm!4077 m!394835))

(declare-fun m!394837 () Bool)

(assert (=> bm!4077 m!394837))

(assert (=> b!264370 m!394829))

(assert (=> b!264370 m!394837))

(assert (=> b!264370 m!394829))

(assert (=> b!264370 m!394837))

(declare-fun m!394839 () Bool)

(assert (=> b!264370 m!394839))

(assert (=> b!264264 d!89108))

(assert (=> b!264264 d!89090))

(declare-fun d!89116 () Bool)

(assert (=> d!89116 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!405691 () Unit!18836)

(declare-fun choose!11 (BitStream!11684) Unit!18836)

(assert (=> d!89116 (= lt!405691 (choose!11 w2!580))))

(assert (=> d!89116 (= (lemmaIsPrefixRefl!0 w2!580) lt!405691)))

(declare-fun bs!22621 () Bool)

(assert (= bs!22621 d!89116))

(assert (=> bs!22621 m!394747))

(declare-fun m!394843 () Bool)

(assert (=> bs!22621 m!394843))

(assert (=> b!264269 d!89116))

(declare-fun d!89120 () Bool)

(declare-fun res!221027 () Bool)

(declare-fun e!184543 () Bool)

(assert (=> d!89120 (=> (not res!221027) (not e!184543))))

(assert (=> d!89120 (= res!221027 (= (size!6435 (buf!6903 lt!405593)) (size!6435 (buf!6903 lt!405593))))))

(assert (=> d!89120 (= (isPrefixOf!0 lt!405593 lt!405593) e!184543)))

(declare-fun b!264396 () Bool)

(declare-fun res!221029 () Bool)

(assert (=> b!264396 (=> (not res!221029) (not e!184543))))

(assert (=> b!264396 (= res!221029 (bvsle (bitIndex!0 (size!6435 (buf!6903 lt!405593)) (currentByte!12767 lt!405593) (currentBit!12762 lt!405593)) (bitIndex!0 (size!6435 (buf!6903 lt!405593)) (currentByte!12767 lt!405593) (currentBit!12762 lt!405593))))))

(declare-fun b!264397 () Bool)

(declare-fun e!184542 () Bool)

(assert (=> b!264397 (= e!184543 e!184542)))

(declare-fun res!221028 () Bool)

(assert (=> b!264397 (=> res!221028 e!184542)))

(assert (=> b!264397 (= res!221028 (= (size!6435 (buf!6903 lt!405593)) #b00000000000000000000000000000000))))

(declare-fun b!264398 () Bool)

(assert (=> b!264398 (= e!184542 (arrayBitRangesEq!0 (buf!6903 lt!405593) (buf!6903 lt!405593) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6435 (buf!6903 lt!405593)) (currentByte!12767 lt!405593) (currentBit!12762 lt!405593))))))

(assert (= (and d!89120 res!221027) b!264396))

(assert (= (and b!264396 res!221029) b!264397))

(assert (= (and b!264397 (not res!221028)) b!264398))

(declare-fun m!394887 () Bool)

(assert (=> b!264396 m!394887))

(assert (=> b!264396 m!394887))

(assert (=> b!264398 m!394887))

(assert (=> b!264398 m!394887))

(declare-fun m!394889 () Bool)

(assert (=> b!264398 m!394889))

(assert (=> b!264269 d!89120))

(declare-fun d!89138 () Bool)

(assert (=> d!89138 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!405707 () Unit!18836)

(assert (=> d!89138 (= lt!405707 (choose!11 w1!584))))

(assert (=> d!89138 (= (lemmaIsPrefixRefl!0 w1!584) lt!405707)))

(declare-fun bs!22628 () Bool)

(assert (= bs!22628 d!89138))

(assert (=> bs!22628 m!394745))

(declare-fun m!394891 () Bool)

(assert (=> bs!22628 m!394891))

(assert (=> b!264269 d!89138))

(declare-fun d!89140 () Bool)

(assert (=> d!89140 (isPrefixOf!0 lt!405593 lt!405593)))

(declare-fun lt!405708 () Unit!18836)

(assert (=> d!89140 (= lt!405708 (choose!11 lt!405593))))

(assert (=> d!89140 (= (lemmaIsPrefixRefl!0 lt!405593) lt!405708)))

(declare-fun bs!22629 () Bool)

(assert (= bs!22629 d!89140))

(assert (=> bs!22629 m!394743))

(declare-fun m!394895 () Bool)

(assert (=> bs!22629 m!394895))

(assert (=> b!264269 d!89140))

(declare-fun d!89144 () Bool)

(declare-fun res!221041 () Bool)

(declare-fun e!184555 () Bool)

(assert (=> d!89144 (=> (not res!221041) (not e!184555))))

(assert (=> d!89144 (= res!221041 (= (size!6435 (buf!6903 w1!584)) (size!6435 (buf!6903 w1!584))))))

(assert (=> d!89144 (= (isPrefixOf!0 w1!584 w1!584) e!184555)))

(declare-fun b!264412 () Bool)

(declare-fun res!221043 () Bool)

(assert (=> b!264412 (=> (not res!221043) (not e!184555))))

(assert (=> b!264412 (= res!221043 (bvsle (bitIndex!0 (size!6435 (buf!6903 w1!584)) (currentByte!12767 w1!584) (currentBit!12762 w1!584)) (bitIndex!0 (size!6435 (buf!6903 w1!584)) (currentByte!12767 w1!584) (currentBit!12762 w1!584))))))

(declare-fun b!264413 () Bool)

(declare-fun e!184554 () Bool)

(assert (=> b!264413 (= e!184555 e!184554)))

(declare-fun res!221042 () Bool)

(assert (=> b!264413 (=> res!221042 e!184554)))

(assert (=> b!264413 (= res!221042 (= (size!6435 (buf!6903 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!264414 () Bool)

(assert (=> b!264414 (= e!184554 (arrayBitRangesEq!0 (buf!6903 w1!584) (buf!6903 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6435 (buf!6903 w1!584)) (currentByte!12767 w1!584) (currentBit!12762 w1!584))))))

(assert (= (and d!89144 res!221041) b!264412))

(assert (= (and b!264412 res!221043) b!264413))

(assert (= (and b!264413 (not res!221042)) b!264414))

(assert (=> b!264412 m!394725))

(assert (=> b!264412 m!394725))

(assert (=> b!264414 m!394725))

(assert (=> b!264414 m!394725))

(declare-fun m!394911 () Bool)

(assert (=> b!264414 m!394911))

(assert (=> b!264269 d!89144))

(declare-fun d!89148 () Bool)

(declare-fun res!221044 () Bool)

(declare-fun e!184557 () Bool)

(assert (=> d!89148 (=> (not res!221044) (not e!184557))))

(assert (=> d!89148 (= res!221044 (= (size!6435 (buf!6903 w2!580)) (size!6435 (buf!6903 w2!580))))))

(assert (=> d!89148 (= (isPrefixOf!0 w2!580 w2!580) e!184557)))

(declare-fun b!264415 () Bool)

(declare-fun res!221046 () Bool)

(assert (=> b!264415 (=> (not res!221046) (not e!184557))))

(assert (=> b!264415 (= res!221046 (bvsle (bitIndex!0 (size!6435 (buf!6903 w2!580)) (currentByte!12767 w2!580) (currentBit!12762 w2!580)) (bitIndex!0 (size!6435 (buf!6903 w2!580)) (currentByte!12767 w2!580) (currentBit!12762 w2!580))))))

(declare-fun b!264416 () Bool)

(declare-fun e!184556 () Bool)

(assert (=> b!264416 (= e!184557 e!184556)))

(declare-fun res!221045 () Bool)

(assert (=> b!264416 (=> res!221045 e!184556)))

(assert (=> b!264416 (= res!221045 (= (size!6435 (buf!6903 w2!580)) #b00000000000000000000000000000000))))

(declare-fun b!264417 () Bool)

(assert (=> b!264417 (= e!184556 (arrayBitRangesEq!0 (buf!6903 w2!580) (buf!6903 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6435 (buf!6903 w2!580)) (currentByte!12767 w2!580) (currentBit!12762 w2!580))))))

(assert (= (and d!89148 res!221044) b!264415))

(assert (= (and b!264415 res!221046) b!264416))

(assert (= (and b!264416 (not res!221045)) b!264417))

(declare-fun m!394917 () Bool)

(assert (=> b!264415 m!394917))

(assert (=> b!264415 m!394917))

(assert (=> b!264417 m!394917))

(assert (=> b!264417 m!394917))

(declare-fun m!394919 () Bool)

(assert (=> b!264417 m!394919))

(assert (=> b!264269 d!89148))

(declare-fun d!89152 () Bool)

(assert (=> d!89152 (= (array_inv!6159 (buf!6903 w1!584)) (bvsge (size!6435 (buf!6903 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!264271 d!89152))

(declare-fun d!89154 () Bool)

(declare-fun res!221047 () Bool)

(declare-fun e!184559 () Bool)

(assert (=> d!89154 (=> (not res!221047) (not e!184559))))

(assert (=> d!89154 (= res!221047 (= (size!6435 (buf!6903 w1!584)) (size!6435 (buf!6903 w2!580))))))

(assert (=> d!89154 (= (isPrefixOf!0 w1!584 w2!580) e!184559)))

(declare-fun b!264418 () Bool)

(declare-fun res!221049 () Bool)

(assert (=> b!264418 (=> (not res!221049) (not e!184559))))

(assert (=> b!264418 (= res!221049 (bvsle (bitIndex!0 (size!6435 (buf!6903 w1!584)) (currentByte!12767 w1!584) (currentBit!12762 w1!584)) (bitIndex!0 (size!6435 (buf!6903 w2!580)) (currentByte!12767 w2!580) (currentBit!12762 w2!580))))))

(declare-fun b!264419 () Bool)

(declare-fun e!184558 () Bool)

(assert (=> b!264419 (= e!184559 e!184558)))

(declare-fun res!221048 () Bool)

(assert (=> b!264419 (=> res!221048 e!184558)))

(assert (=> b!264419 (= res!221048 (= (size!6435 (buf!6903 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!264420 () Bool)

(assert (=> b!264420 (= e!184558 (arrayBitRangesEq!0 (buf!6903 w1!584) (buf!6903 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6435 (buf!6903 w1!584)) (currentByte!12767 w1!584) (currentBit!12762 w1!584))))))

(assert (= (and d!89154 res!221047) b!264418))

(assert (= (and b!264418 res!221049) b!264419))

(assert (= (and b!264419 (not res!221048)) b!264420))

(assert (=> b!264418 m!394725))

(assert (=> b!264418 m!394917))

(assert (=> b!264420 m!394725))

(assert (=> b!264420 m!394725))

(assert (=> b!264420 m!394761))

(assert (=> start!57592 d!89154))

(declare-fun d!89158 () Bool)

(assert (=> d!89158 (= (inv!12 w1!584) (invariant!0 (currentBit!12762 w1!584) (currentByte!12767 w1!584) (size!6435 (buf!6903 w1!584))))))

(declare-fun bs!22631 () Bool)

(assert (= bs!22631 d!89158))

(assert (=> bs!22631 m!394751))

(assert (=> start!57592 d!89158))

(declare-fun d!89160 () Bool)

(assert (=> d!89160 (= (inv!12 w2!580) (invariant!0 (currentBit!12762 w2!580) (currentByte!12767 w2!580) (size!6435 (buf!6903 w2!580))))))

(declare-fun bs!22632 () Bool)

(assert (= bs!22632 d!89160))

(declare-fun m!394921 () Bool)

(assert (=> bs!22632 m!394921))

(assert (=> start!57592 d!89160))

(declare-fun b!264421 () Bool)

(declare-fun e!184564 () Bool)

(declare-fun e!184561 () Bool)

(assert (=> b!264421 (= e!184564 e!184561)))

(declare-fun c!12125 () Bool)

(declare-fun lt!405711 () tuple4!344)

(assert (=> b!264421 (= c!12125 (= (_3!952 lt!405711) (_4!172 lt!405711)))))

(declare-fun b!264422 () Bool)

(declare-fun e!184562 () Bool)

(assert (=> b!264422 (= e!184562 e!184564)))

(declare-fun res!221050 () Bool)

(assert (=> b!264422 (=> (not res!221050) (not e!184564))))

(declare-fun e!184560 () Bool)

(assert (=> b!264422 (= res!221050 e!184560)))

(declare-fun res!221052 () Bool)

(assert (=> b!264422 (=> res!221052 e!184560)))

(assert (=> b!264422 (= res!221052 (bvsge (_1!12152 lt!405711) (_2!12152 lt!405711)))))

(declare-fun lt!405713 () (_ BitVec 32))

(assert (=> b!264422 (= lt!405713 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6435 (buf!6903 w1!584)) (currentByte!12767 w1!584) (currentBit!12762 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!405712 () (_ BitVec 32))

(assert (=> b!264422 (= lt!405712 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!264422 (= lt!405711 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6435 (buf!6903 w1!584)) (currentByte!12767 w1!584) (currentBit!12762 w1!584))))))

(declare-fun b!264423 () Bool)

(declare-fun e!184565 () Bool)

(declare-fun call!4084 () Bool)

(assert (=> b!264423 (= e!184565 call!4084)))

(declare-fun b!264424 () Bool)

(declare-fun res!221054 () Bool)

(assert (=> b!264424 (= res!221054 (= lt!405713 #b00000000000000000000000000000000))))

(assert (=> b!264424 (=> res!221054 e!184565)))

(declare-fun e!184563 () Bool)

(assert (=> b!264424 (= e!184563 e!184565)))

(declare-fun d!89162 () Bool)

(declare-fun res!221051 () Bool)

(assert (=> d!89162 (=> res!221051 e!184562)))

(assert (=> d!89162 (= res!221051 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6435 (buf!6903 w1!584)) (currentByte!12767 w1!584) (currentBit!12762 w1!584))))))

(assert (=> d!89162 (= (arrayBitRangesEq!0 (buf!6903 w2!580) (buf!6903 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6435 (buf!6903 w1!584)) (currentByte!12767 w1!584) (currentBit!12762 w1!584))) e!184562)))

(declare-fun b!264425 () Bool)

(assert (=> b!264425 (= e!184560 (arrayRangesEq!1008 (buf!6903 w2!580) (buf!6903 w1!584) (_1!12152 lt!405711) (_2!12152 lt!405711)))))

(declare-fun bm!4081 () Bool)

(assert (=> bm!4081 (= call!4084 (byteRangesEq!0 (ite c!12125 (select (arr!7422 (buf!6903 w2!580)) (_3!952 lt!405711)) (select (arr!7422 (buf!6903 w2!580)) (_4!172 lt!405711))) (ite c!12125 (select (arr!7422 (buf!6903 w1!584)) (_3!952 lt!405711)) (select (arr!7422 (buf!6903 w1!584)) (_4!172 lt!405711))) (ite c!12125 lt!405712 #b00000000000000000000000000000000) lt!405713))))

(declare-fun b!264426 () Bool)

(assert (=> b!264426 (= e!184561 call!4084)))

(declare-fun b!264427 () Bool)

(assert (=> b!264427 (= e!184561 e!184563)))

(declare-fun res!221053 () Bool)

(assert (=> b!264427 (= res!221053 (byteRangesEq!0 (select (arr!7422 (buf!6903 w2!580)) (_3!952 lt!405711)) (select (arr!7422 (buf!6903 w1!584)) (_3!952 lt!405711)) lt!405712 #b00000000000000000000000000001000))))

(assert (=> b!264427 (=> (not res!221053) (not e!184563))))

(assert (= (and d!89162 (not res!221051)) b!264422))

(assert (= (and b!264422 (not res!221052)) b!264425))

(assert (= (and b!264422 res!221050) b!264421))

(assert (= (and b!264421 c!12125) b!264426))

(assert (= (and b!264421 (not c!12125)) b!264427))

(assert (= (and b!264427 res!221053) b!264424))

(assert (= (and b!264424 (not res!221054)) b!264423))

(assert (= (or b!264426 b!264423) bm!4081))

(assert (=> b!264422 m!394725))

(assert (=> b!264422 m!394823))

(declare-fun m!394929 () Bool)

(assert (=> b!264425 m!394929))

(declare-fun m!394931 () Bool)

(assert (=> bm!4081 m!394931))

(declare-fun m!394933 () Bool)

(assert (=> bm!4081 m!394933))

(declare-fun m!394935 () Bool)

(assert (=> bm!4081 m!394935))

(declare-fun m!394937 () Bool)

(assert (=> bm!4081 m!394937))

(declare-fun m!394939 () Bool)

(assert (=> bm!4081 m!394939))

(assert (=> b!264427 m!394933))

(assert (=> b!264427 m!394939))

(assert (=> b!264427 m!394933))

(assert (=> b!264427 m!394939))

(declare-fun m!394941 () Bool)

(assert (=> b!264427 m!394941))

(assert (=> b!264265 d!89162))

(assert (=> b!264265 d!89090))

(declare-fun d!89170 () Bool)

(assert (=> d!89170 (= (array_inv!6159 (buf!6903 w2!580)) (bvsge (size!6435 (buf!6903 w2!580)) #b00000000000000000000000000000000))))

(assert (=> b!264270 d!89170))

(declare-fun d!89172 () Bool)

(declare-fun res!221055 () Bool)

(declare-fun e!184567 () Bool)

(assert (=> d!89172 (=> (not res!221055) (not e!184567))))

(assert (=> d!89172 (= res!221055 (= (size!6435 (buf!6903 lt!405593)) (size!6435 (buf!6903 w1!584))))))

(assert (=> d!89172 (= (isPrefixOf!0 lt!405593 w1!584) e!184567)))

(declare-fun b!264428 () Bool)

(declare-fun res!221057 () Bool)

(assert (=> b!264428 (=> (not res!221057) (not e!184567))))

(assert (=> b!264428 (= res!221057 (bvsle (bitIndex!0 (size!6435 (buf!6903 lt!405593)) (currentByte!12767 lt!405593) (currentBit!12762 lt!405593)) (bitIndex!0 (size!6435 (buf!6903 w1!584)) (currentByte!12767 w1!584) (currentBit!12762 w1!584))))))

(declare-fun b!264429 () Bool)

(declare-fun e!184566 () Bool)

(assert (=> b!264429 (= e!184567 e!184566)))

(declare-fun res!221056 () Bool)

(assert (=> b!264429 (=> res!221056 e!184566)))

(assert (=> b!264429 (= res!221056 (= (size!6435 (buf!6903 lt!405593)) #b00000000000000000000000000000000))))

(declare-fun b!264430 () Bool)

(assert (=> b!264430 (= e!184566 (arrayBitRangesEq!0 (buf!6903 lt!405593) (buf!6903 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6435 (buf!6903 lt!405593)) (currentByte!12767 lt!405593) (currentBit!12762 lt!405593))))))

(assert (= (and d!89172 res!221055) b!264428))

(assert (= (and b!264428 res!221057) b!264429))

(assert (= (and b!264429 (not res!221056)) b!264430))

(assert (=> b!264428 m!394887))

(assert (=> b!264428 m!394725))

(assert (=> b!264430 m!394887))

(assert (=> b!264430 m!394887))

(declare-fun m!394945 () Bool)

(assert (=> b!264430 m!394945))

(assert (=> b!264267 d!89172))

(declare-fun d!89176 () Bool)

(assert (=> d!89176 (= (invariant!0 (currentBit!12762 w1!584) (currentByte!12767 w1!584) (size!6435 (buf!6903 w1!584))) (and (bvsge (currentBit!12762 w1!584) #b00000000000000000000000000000000) (bvslt (currentBit!12762 w1!584) #b00000000000000000000000000001000) (bvsge (currentByte!12767 w1!584) #b00000000000000000000000000000000) (or (bvslt (currentByte!12767 w1!584) (size!6435 (buf!6903 w1!584))) (and (= (currentBit!12762 w1!584) #b00000000000000000000000000000000) (= (currentByte!12767 w1!584) (size!6435 (buf!6903 w1!584)))))))))

(assert (=> b!264266 d!89176))

(declare-fun d!89182 () Bool)

(assert (=> d!89182 (isPrefixOf!0 lt!405593 w2!580)))

(declare-fun lt!405726 () Unit!18836)

(declare-fun choose!30 (BitStream!11684 BitStream!11684 BitStream!11684) Unit!18836)

(assert (=> d!89182 (= lt!405726 (choose!30 lt!405593 w2!580 w2!580))))

(assert (=> d!89182 (isPrefixOf!0 lt!405593 w2!580)))

(assert (=> d!89182 (= (lemmaIsPrefixTransitive!0 lt!405593 w2!580 w2!580) lt!405726)))

(declare-fun bs!22638 () Bool)

(assert (= bs!22638 d!89182))

(assert (=> bs!22638 m!394755))

(declare-fun m!394965 () Bool)

(assert (=> bs!22638 m!394965))

(assert (=> bs!22638 m!394755))

(assert (=> b!264266 d!89182))

(declare-fun d!89184 () Bool)

(declare-fun res!221072 () Bool)

(declare-fun e!184581 () Bool)

(assert (=> d!89184 (=> (not res!221072) (not e!184581))))

(assert (=> d!89184 (= res!221072 (= (size!6435 (buf!6903 lt!405593)) (size!6435 (buf!6903 w2!580))))))

(assert (=> d!89184 (= (isPrefixOf!0 lt!405593 w2!580) e!184581)))

(declare-fun b!264447 () Bool)

(declare-fun res!221074 () Bool)

(assert (=> b!264447 (=> (not res!221074) (not e!184581))))

(assert (=> b!264447 (= res!221074 (bvsle (bitIndex!0 (size!6435 (buf!6903 lt!405593)) (currentByte!12767 lt!405593) (currentBit!12762 lt!405593)) (bitIndex!0 (size!6435 (buf!6903 w2!580)) (currentByte!12767 w2!580) (currentBit!12762 w2!580))))))

(declare-fun b!264448 () Bool)

(declare-fun e!184580 () Bool)

(assert (=> b!264448 (= e!184581 e!184580)))

(declare-fun res!221073 () Bool)

(assert (=> b!264448 (=> res!221073 e!184580)))

(assert (=> b!264448 (= res!221073 (= (size!6435 (buf!6903 lt!405593)) #b00000000000000000000000000000000))))

(declare-fun b!264449 () Bool)

(assert (=> b!264449 (= e!184580 (arrayBitRangesEq!0 (buf!6903 lt!405593) (buf!6903 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6435 (buf!6903 lt!405593)) (currentByte!12767 lt!405593) (currentBit!12762 lt!405593))))))

(assert (= (and d!89184 res!221072) b!264447))

(assert (= (and b!264447 res!221074) b!264448))

(assert (= (and b!264448 (not res!221073)) b!264449))

(assert (=> b!264447 m!394887))

(assert (=> b!264447 m!394917))

(assert (=> b!264449 m!394887))

(assert (=> b!264449 m!394887))

(declare-fun m!394967 () Bool)

(assert (=> b!264449 m!394967))

(assert (=> b!264266 d!89184))

(declare-fun d!89186 () Bool)

(assert (=> d!89186 (isPrefixOf!0 lt!405593 w2!580)))

(declare-fun lt!405727 () Unit!18836)

(assert (=> d!89186 (= lt!405727 (choose!30 lt!405593 w1!584 w2!580))))

(assert (=> d!89186 (isPrefixOf!0 lt!405593 w1!584)))

(assert (=> d!89186 (= (lemmaIsPrefixTransitive!0 lt!405593 w1!584 w2!580) lt!405727)))

(declare-fun bs!22639 () Bool)

(assert (= bs!22639 d!89186))

(assert (=> bs!22639 m!394755))

(declare-fun m!394969 () Bool)

(assert (=> bs!22639 m!394969))

(assert (=> bs!22639 m!394723))

(assert (=> b!264266 d!89186))

(push 1)

(assert (not b!264418))

(assert (not bm!4076))

(assert (not d!89138))

(assert (not d!89116))

(assert (not b!264427))

(assert (not b!264398))

(assert (not b!264352))

(assert (not b!264415))

(assert (not b!264414))

(assert (not b!264449))

(assert (not d!89186))

(assert (not b!264447))

(assert (not b!264365))

(assert (not b!264412))

(assert (not d!89090))

(assert (not b!264422))

(assert (not b!264420))

(assert (not b!264430))

(assert (not b!264428))

(assert (not d!89182))

(assert (not d!89160))

(assert (not b!264349))

(assert (not b!264370))

(assert (not bm!4077))

(assert (not b!264396))

(assert (not d!89096))

(assert (not b!264425))

(assert (not b!264368))

(assert (not b!264417))

(assert (not d!89140))

(assert (not b!264354))

(assert (not bm!4081))

(assert (not d!89158))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

