; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58360 () Bool)

(assert start!58360)

(declare-fun res!223606 () Bool)

(declare-fun e!188107 () Bool)

(assert (=> start!58360 (=> (not res!223606) (not e!188107))))

(declare-datatypes ((array!14955 0))(
  ( (array!14956 (arr!7509 (Array (_ BitVec 32) (_ BitVec 8))) (size!6522 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11858 0))(
  ( (BitStream!11859 (buf!6990 array!14955) (currentByte!12902 (_ BitVec 32)) (currentBit!12897 (_ BitVec 32))) )
))
(declare-fun w1!591 () BitStream!11858)

(declare-fun w2!587 () BitStream!11858)

(declare-fun isPrefixOf!0 (BitStream!11858 BitStream!11858) Bool)

(assert (=> start!58360 (= res!223606 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58360 e!188107))

(declare-fun e!188110 () Bool)

(declare-fun inv!12 (BitStream!11858) Bool)

(assert (=> start!58360 (and (inv!12 w1!591) e!188110)))

(declare-fun e!188112 () Bool)

(assert (=> start!58360 (and (inv!12 w2!587) e!188112)))

(declare-fun w3!25 () BitStream!11858)

(declare-fun e!188108 () Bool)

(assert (=> start!58360 (and (inv!12 w3!25) e!188108)))

(declare-fun b!268069 () Bool)

(declare-fun array_inv!6246 (array!14955) Bool)

(assert (=> b!268069 (= e!188108 (array_inv!6246 (buf!6990 w3!25)))))

(declare-fun b!268070 () Bool)

(assert (=> b!268070 (= e!188107 (not (or (bvsge (currentByte!12902 w1!591) (size!6522 (buf!6990 w1!591))) (bvslt (currentByte!12902 w1!591) (currentByte!12902 w2!587)) (bvsgt (currentBit!12897 w1!591) (currentBit!12897 w2!587)) (and (bvsle #b00000000000000000000000000000000 (currentBit!12897 w1!591)) (bvsle (currentBit!12897 w1!591) #b00000000000000000000000000001000)))))))

(declare-fun arrayRangesEq!1057 (array!14955 array!14955 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!268070 (arrayRangesEq!1057 (buf!6990 w1!591) (buf!6990 w3!25) #b00000000000000000000000000000000 (currentByte!12902 w1!591))))

(declare-datatypes ((Unit!19017 0))(
  ( (Unit!19018) )
))
(declare-fun lt!408236 () Unit!19017)

(declare-fun arrayRangesEqTransitive!332 (array!14955 array!14955 array!14955 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19017)

(assert (=> b!268070 (= lt!408236 (arrayRangesEqTransitive!332 (buf!6990 w1!591) (buf!6990 w2!587) (buf!6990 w3!25) #b00000000000000000000000000000000 (currentByte!12902 w1!591) (currentByte!12902 w2!587)))))

(declare-fun b!268071 () Bool)

(declare-fun res!223605 () Bool)

(assert (=> b!268071 (=> (not res!223605) (not e!188107))))

(assert (=> b!268071 (= res!223605 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!268072 () Bool)

(assert (=> b!268072 (= e!188112 (array_inv!6246 (buf!6990 w2!587)))))

(declare-fun b!268073 () Bool)

(assert (=> b!268073 (= e!188110 (array_inv!6246 (buf!6990 w1!591)))))

(assert (= (and start!58360 res!223606) b!268071))

(assert (= (and b!268071 res!223605) b!268070))

(assert (= start!58360 b!268073))

(assert (= start!58360 b!268072))

(assert (= start!58360 b!268069))

(declare-fun m!399453 () Bool)

(assert (=> b!268071 m!399453))

(declare-fun m!399455 () Bool)

(assert (=> b!268072 m!399455))

(declare-fun m!399457 () Bool)

(assert (=> b!268069 m!399457))

(declare-fun m!399459 () Bool)

(assert (=> b!268070 m!399459))

(declare-fun m!399461 () Bool)

(assert (=> b!268070 m!399461))

(declare-fun m!399463 () Bool)

(assert (=> start!58360 m!399463))

(declare-fun m!399465 () Bool)

(assert (=> start!58360 m!399465))

(declare-fun m!399467 () Bool)

(assert (=> start!58360 m!399467))

(declare-fun m!399469 () Bool)

(assert (=> start!58360 m!399469))

(declare-fun m!399471 () Bool)

(assert (=> b!268073 m!399471))

(push 1)

(assert (not b!268073))

(assert (not b!268071))

(assert (not b!268072))

(assert (not start!58360))

(assert (not b!268070))

(assert (not b!268069))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!90560 () Bool)

(assert (=> d!90560 (= (array_inv!6246 (buf!6990 w3!25)) (bvsge (size!6522 (buf!6990 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!268069 d!90560))

(declare-fun d!90562 () Bool)

(declare-fun res!223619 () Bool)

(declare-fun e!188124 () Bool)

(assert (=> d!90562 (=> (not res!223619) (not e!188124))))

(assert (=> d!90562 (= res!223619 (= (size!6522 (buf!6990 w1!591)) (size!6522 (buf!6990 w2!587))))))

(assert (=> d!90562 (= (isPrefixOf!0 w1!591 w2!587) e!188124)))

(declare-fun b!268086 () Bool)

(declare-fun res!223620 () Bool)

(assert (=> b!268086 (=> (not res!223620) (not e!188124))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!268086 (= res!223620 (bvsle (bitIndex!0 (size!6522 (buf!6990 w1!591)) (currentByte!12902 w1!591) (currentBit!12897 w1!591)) (bitIndex!0 (size!6522 (buf!6990 w2!587)) (currentByte!12902 w2!587) (currentBit!12897 w2!587))))))

(declare-fun b!268087 () Bool)

(declare-fun e!188123 () Bool)

(assert (=> b!268087 (= e!188124 e!188123)))

(declare-fun res!223621 () Bool)

(assert (=> b!268087 (=> res!223621 e!188123)))

(assert (=> b!268087 (= res!223621 (= (size!6522 (buf!6990 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!268088 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14955 array!14955 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!268088 (= e!188123 (arrayBitRangesEq!0 (buf!6990 w1!591) (buf!6990 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6522 (buf!6990 w1!591)) (currentByte!12902 w1!591) (currentBit!12897 w1!591))))))

(assert (= (and d!90562 res!223619) b!268086))

(assert (= (and b!268086 res!223620) b!268087))

(assert (= (and b!268087 (not res!223621)) b!268088))

(declare-fun m!399481 () Bool)

(assert (=> b!268086 m!399481))

(declare-fun m!399483 () Bool)

(assert (=> b!268086 m!399483))

(assert (=> b!268088 m!399481))

(assert (=> b!268088 m!399481))

(declare-fun m!399485 () Bool)

(assert (=> b!268088 m!399485))

(assert (=> start!58360 d!90562))

(declare-fun d!90568 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!90568 (= (inv!12 w1!591) (invariant!0 (currentBit!12897 w1!591) (currentByte!12902 w1!591) (size!6522 (buf!6990 w1!591))))))

(declare-fun bs!23002 () Bool)

(assert (= bs!23002 d!90568))

(declare-fun m!399487 () Bool)

(assert (=> bs!23002 m!399487))

(assert (=> start!58360 d!90568))

(declare-fun d!90570 () Bool)

(assert (=> d!90570 (= (inv!12 w2!587) (invariant!0 (currentBit!12897 w2!587) (currentByte!12902 w2!587) (size!6522 (buf!6990 w2!587))))))

(declare-fun bs!23003 () Bool)

(assert (= bs!23003 d!90570))

(declare-fun m!399489 () Bool)

(assert (=> bs!23003 m!399489))

(assert (=> start!58360 d!90570))

(declare-fun d!90572 () Bool)

(assert (=> d!90572 (= (inv!12 w3!25) (invariant!0 (currentBit!12897 w3!25) (currentByte!12902 w3!25) (size!6522 (buf!6990 w3!25))))))

(declare-fun bs!23004 () Bool)

(assert (= bs!23004 d!90572))

(declare-fun m!399491 () Bool)

(assert (=> bs!23004 m!399491))

(assert (=> start!58360 d!90572))

(declare-fun d!90574 () Bool)

(declare-fun res!223637 () Bool)

(declare-fun e!188137 () Bool)

(assert (=> d!90574 (=> res!223637 e!188137)))

(assert (=> d!90574 (= res!223637 (= #b00000000000000000000000000000000 (currentByte!12902 w1!591)))))

(assert (=> d!90574 (= (arrayRangesEq!1057 (buf!6990 w1!591) (buf!6990 w3!25) #b00000000000000000000000000000000 (currentByte!12902 w1!591)) e!188137)))

(declare-fun b!268104 () Bool)

(declare-fun e!188138 () Bool)

(assert (=> b!268104 (= e!188137 e!188138)))

(declare-fun res!223638 () Bool)

(assert (=> b!268104 (=> (not res!223638) (not e!188138))))

(assert (=> b!268104 (= res!223638 (= (select (arr!7509 (buf!6990 w1!591)) #b00000000000000000000000000000000) (select (arr!7509 (buf!6990 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!268105 () Bool)

(assert (=> b!268105 (= e!188138 (arrayRangesEq!1057 (buf!6990 w1!591) (buf!6990 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12902 w1!591)))))

(assert (= (and d!90574 (not res!223637)) b!268104))

(assert (= (and b!268104 res!223638) b!268105))

(declare-fun m!399499 () Bool)

(assert (=> b!268104 m!399499))

(declare-fun m!399501 () Bool)

(assert (=> b!268104 m!399501))

(declare-fun m!399503 () Bool)

(assert (=> b!268105 m!399503))

(assert (=> b!268070 d!90574))

(declare-fun d!90578 () Bool)

(assert (=> d!90578 (arrayRangesEq!1057 (buf!6990 w1!591) (buf!6990 w3!25) #b00000000000000000000000000000000 (currentByte!12902 w1!591))))

(declare-fun lt!408242 () Unit!19017)

(declare-fun choose!373 (array!14955 array!14955 array!14955 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19017)

(assert (=> d!90578 (= lt!408242 (choose!373 (buf!6990 w1!591) (buf!6990 w2!587) (buf!6990 w3!25) #b00000000000000000000000000000000 (currentByte!12902 w1!591) (currentByte!12902 w2!587)))))

(assert (=> d!90578 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!12902 w1!591)) (bvsle (currentByte!12902 w1!591) (currentByte!12902 w2!587)))))

(assert (=> d!90578 (= (arrayRangesEqTransitive!332 (buf!6990 w1!591) (buf!6990 w2!587) (buf!6990 w3!25) #b00000000000000000000000000000000 (currentByte!12902 w1!591) (currentByte!12902 w2!587)) lt!408242)))

(declare-fun bs!23008 () Bool)

(assert (= bs!23008 d!90578))

(assert (=> bs!23008 m!399459))

(declare-fun m!399515 () Bool)

(assert (=> bs!23008 m!399515))

(assert (=> b!268070 d!90578))

(declare-fun d!90592 () Bool)

(assert (=> d!90592 (= (array_inv!6246 (buf!6990 w2!587)) (bvsge (size!6522 (buf!6990 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!268072 d!90592))

(declare-fun d!90594 () Bool)

(declare-fun res!223646 () Bool)

(declare-fun e!188146 () Bool)

(assert (=> d!90594 (=> (not res!223646) (not e!188146))))

(assert (=> d!90594 (= res!223646 (= (size!6522 (buf!6990 w2!587)) (size!6522 (buf!6990 w3!25))))))

(assert (=> d!90594 (= (isPrefixOf!0 w2!587 w3!25) e!188146)))

(declare-fun b!268113 () Bool)

(declare-fun res!223648 () Bool)

(assert (=> b!268113 (=> (not res!223648) (not e!188146))))

(assert (=> b!268113 (= res!223648 (bvsle (bitIndex!0 (size!6522 (buf!6990 w2!587)) (currentByte!12902 w2!587) (currentBit!12897 w2!587)) (bitIndex!0 (size!6522 (buf!6990 w3!25)) (currentByte!12902 w3!25) (currentBit!12897 w3!25))))))

(declare-fun b!268115 () Bool)

(declare-fun e!188145 () Bool)

(assert (=> b!268115 (= e!188146 e!188145)))

(declare-fun res!223650 () Bool)

(assert (=> b!268115 (=> res!223650 e!188145)))

(assert (=> b!268115 (= res!223650 (= (size!6522 (buf!6990 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!268117 () Bool)

(assert (=> b!268117 (= e!188145 (arrayBitRangesEq!0 (buf!6990 w2!587) (buf!6990 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6522 (buf!6990 w2!587)) (currentByte!12902 w2!587) (currentBit!12897 w2!587))))))

(assert (= (and d!90594 res!223646) b!268113))

(assert (= (and b!268113 res!223648) b!268115))

(assert (= (and b!268115 (not res!223650)) b!268117))

(assert (=> b!268113 m!399483))

(declare-fun m!399517 () Bool)

(assert (=> b!268113 m!399517))

(assert (=> b!268117 m!399483))

(assert (=> b!268117 m!399483))

(declare-fun m!399519 () Bool)

(assert (=> b!268117 m!399519))

(assert (=> b!268071 d!90594))

(declare-fun d!90596 () Bool)

(assert (=> d!90596 (= (array_inv!6246 (buf!6990 w1!591)) (bvsge (size!6522 (buf!6990 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!268073 d!90596))

(push 1)

(assert (not b!268105))

(assert (not b!268086))

(assert (not b!268113))

(assert (not d!90572))

(assert (not d!90578))

(assert (not b!268117))

(assert (not b!268088))

(assert (not d!90568))

(assert (not d!90570))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!90620 () Bool)

(declare-fun e!188177 () Bool)

(assert (=> d!90620 e!188177))

(declare-fun res!223684 () Bool)

(assert (=> d!90620 (=> (not res!223684) (not e!188177))))

(declare-fun lt!408283 () (_ BitVec 64))

(declare-fun lt!408280 () (_ BitVec 64))

(declare-fun lt!408279 () (_ BitVec 64))

(assert (=> d!90620 (= res!223684 (= lt!408279 (bvsub lt!408283 lt!408280)))))

(assert (=> d!90620 (or (= (bvand lt!408283 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!408280 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408283 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408283 lt!408280) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!90620 (= lt!408280 (remainingBits!0 ((_ sign_extend 32) (size!6522 (buf!6990 w1!591))) ((_ sign_extend 32) (currentByte!12902 w1!591)) ((_ sign_extend 32) (currentBit!12897 w1!591))))))

(declare-fun lt!408284 () (_ BitVec 64))

(declare-fun lt!408281 () (_ BitVec 64))

(assert (=> d!90620 (= lt!408283 (bvmul lt!408284 lt!408281))))

(assert (=> d!90620 (or (= lt!408284 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!408281 (bvsdiv (bvmul lt!408284 lt!408281) lt!408284)))))

(assert (=> d!90620 (= lt!408281 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!90620 (= lt!408284 ((_ sign_extend 32) (size!6522 (buf!6990 w1!591))))))

(assert (=> d!90620 (= lt!408279 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12902 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12897 w1!591))))))

(assert (=> d!90620 (invariant!0 (currentBit!12897 w1!591) (currentByte!12902 w1!591) (size!6522 (buf!6990 w1!591)))))

(assert (=> d!90620 (= (bitIndex!0 (size!6522 (buf!6990 w1!591)) (currentByte!12902 w1!591) (currentBit!12897 w1!591)) lt!408279)))

(declare-fun b!268157 () Bool)

(declare-fun res!223685 () Bool)

(assert (=> b!268157 (=> (not res!223685) (not e!188177))))

(assert (=> b!268157 (= res!223685 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!408279))))

(declare-fun b!268158 () Bool)

(declare-fun lt!408282 () (_ BitVec 64))

(assert (=> b!268158 (= e!188177 (bvsle lt!408279 (bvmul lt!408282 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!268158 (or (= lt!408282 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!408282 #b0000000000000000000000000000000000000000000000000000000000001000) lt!408282)))))

(assert (=> b!268158 (= lt!408282 ((_ sign_extend 32) (size!6522 (buf!6990 w1!591))))))

(assert (= (and d!90620 res!223684) b!268157))

(assert (= (and b!268157 res!223685) b!268158))

(declare-fun m!399561 () Bool)

(assert (=> d!90620 m!399561))

(assert (=> d!90620 m!399487))

(assert (=> b!268086 d!90620))

(declare-fun d!90624 () Bool)

(declare-fun e!188178 () Bool)

(assert (=> d!90624 e!188178))

(declare-fun res!223686 () Bool)

(assert (=> d!90624 (=> (not res!223686) (not e!188178))))

(declare-fun lt!408289 () (_ BitVec 64))

(declare-fun lt!408286 () (_ BitVec 64))

(declare-fun lt!408285 () (_ BitVec 64))

(assert (=> d!90624 (= res!223686 (= lt!408285 (bvsub lt!408289 lt!408286)))))

(assert (=> d!90624 (or (= (bvand lt!408289 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!408286 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408289 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408289 lt!408286) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!90624 (= lt!408286 (remainingBits!0 ((_ sign_extend 32) (size!6522 (buf!6990 w2!587))) ((_ sign_extend 32) (currentByte!12902 w2!587)) ((_ sign_extend 32) (currentBit!12897 w2!587))))))

(declare-fun lt!408290 () (_ BitVec 64))

(declare-fun lt!408287 () (_ BitVec 64))

(assert (=> d!90624 (= lt!408289 (bvmul lt!408290 lt!408287))))

(assert (=> d!90624 (or (= lt!408290 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!408287 (bvsdiv (bvmul lt!408290 lt!408287) lt!408290)))))

(assert (=> d!90624 (= lt!408287 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!90624 (= lt!408290 ((_ sign_extend 32) (size!6522 (buf!6990 w2!587))))))

(assert (=> d!90624 (= lt!408285 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12902 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12897 w2!587))))))

(assert (=> d!90624 (invariant!0 (currentBit!12897 w2!587) (currentByte!12902 w2!587) (size!6522 (buf!6990 w2!587)))))

(assert (=> d!90624 (= (bitIndex!0 (size!6522 (buf!6990 w2!587)) (currentByte!12902 w2!587) (currentBit!12897 w2!587)) lt!408285)))

(declare-fun b!268159 () Bool)

(declare-fun res!223687 () Bool)

(assert (=> b!268159 (=> (not res!223687) (not e!188178))))

(assert (=> b!268159 (= res!223687 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!408285))))

(declare-fun b!268160 () Bool)

(declare-fun lt!408288 () (_ BitVec 64))

(assert (=> b!268160 (= e!188178 (bvsle lt!408285 (bvmul lt!408288 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!268160 (or (= lt!408288 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!408288 #b0000000000000000000000000000000000000000000000000000000000001000) lt!408288)))))

(assert (=> b!268160 (= lt!408288 ((_ sign_extend 32) (size!6522 (buf!6990 w2!587))))))

(assert (= (and d!90624 res!223686) b!268159))

(assert (= (and b!268159 res!223687) b!268160))

(declare-fun m!399563 () Bool)

(assert (=> d!90624 m!399563))

(assert (=> d!90624 m!399489))

(assert (=> b!268086 d!90624))

(declare-fun d!90626 () Bool)

(assert (=> d!90626 (= (invariant!0 (currentBit!12897 w3!25) (currentByte!12902 w3!25) (size!6522 (buf!6990 w3!25))) (and (bvsge (currentBit!12897 w3!25) #b00000000000000000000000000000000) (bvslt (currentBit!12897 w3!25) #b00000000000000000000000000001000) (bvsge (currentByte!12902 w3!25) #b00000000000000000000000000000000) (or (bvslt (currentByte!12902 w3!25) (size!6522 (buf!6990 w3!25))) (and (= (currentBit!12897 w3!25) #b00000000000000000000000000000000) (= (currentByte!12902 w3!25) (size!6522 (buf!6990 w3!25)))))))))

(assert (=> d!90572 d!90626))

(declare-fun d!90630 () Bool)

(assert (=> d!90630 (= (invariant!0 (currentBit!12897 w1!591) (currentByte!12902 w1!591) (size!6522 (buf!6990 w1!591))) (and (bvsge (currentBit!12897 w1!591) #b00000000000000000000000000000000) (bvslt (currentBit!12897 w1!591) #b00000000000000000000000000001000) (bvsge (currentByte!12902 w1!591) #b00000000000000000000000000000000) (or (bvslt (currentByte!12902 w1!591) (size!6522 (buf!6990 w1!591))) (and (= (currentBit!12897 w1!591) #b00000000000000000000000000000000) (= (currentByte!12902 w1!591) (size!6522 (buf!6990 w1!591)))))))))

(assert (=> d!90568 d!90630))

(declare-fun b!268211 () Bool)

(declare-fun e!188221 () Bool)

(declare-fun e!188220 () Bool)

(assert (=> b!268211 (= e!188221 e!188220)))

(declare-fun res!223727 () Bool)

(declare-fun call!4233 () Bool)

(assert (=> b!268211 (= res!223727 call!4233)))

(assert (=> b!268211 (=> (not res!223727) (not e!188220))))

(declare-fun d!90632 () Bool)

(declare-fun res!223730 () Bool)

(declare-fun e!188223 () Bool)

(assert (=> d!90632 (=> res!223730 e!188223)))

(assert (=> d!90632 (= res!223730 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6522 (buf!6990 w2!587)) (currentByte!12902 w2!587) (currentBit!12897 w2!587))))))

(assert (=> d!90632 (= (arrayBitRangesEq!0 (buf!6990 w2!587) (buf!6990 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6522 (buf!6990 w2!587)) (currentByte!12902 w2!587) (currentBit!12897 w2!587))) e!188223)))

(declare-datatypes ((tuple4!412 0))(
  ( (tuple4!413 (_1!12189 (_ BitVec 32)) (_2!12189 (_ BitVec 32)) (_3!986 (_ BitVec 32)) (_4!206 (_ BitVec 32))) )
))
(declare-fun lt!408327 () tuple4!412)

(declare-fun e!188225 () Bool)

(declare-fun b!268212 () Bool)

(assert (=> b!268212 (= e!188225 (arrayRangesEq!1057 (buf!6990 w2!587) (buf!6990 w3!25) (_1!12189 lt!408327) (_2!12189 lt!408327)))))

(declare-fun b!268213 () Bool)

(assert (=> b!268213 (= e!188221 call!4233)))

(declare-fun b!268214 () Bool)

(declare-fun e!188224 () Bool)

(assert (=> b!268214 (= e!188224 e!188221)))

(declare-fun c!12364 () Bool)

(assert (=> b!268214 (= c!12364 (= (_3!986 lt!408327) (_4!206 lt!408327)))))

(declare-fun e!188222 () Bool)

(declare-fun b!268215 () Bool)

(declare-fun lt!408328 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!268215 (= e!188222 (byteRangesEq!0 (select (arr!7509 (buf!6990 w2!587)) (_4!206 lt!408327)) (select (arr!7509 (buf!6990 w3!25)) (_4!206 lt!408327)) #b00000000000000000000000000000000 lt!408328))))

(declare-fun b!268216 () Bool)

(declare-fun res!223726 () Bool)

(assert (=> b!268216 (= res!223726 (= lt!408328 #b00000000000000000000000000000000))))

(assert (=> b!268216 (=> res!223726 e!188222)))

(assert (=> b!268216 (= e!188220 e!188222)))

(declare-fun lt!408329 () (_ BitVec 32))

(declare-fun bm!4230 () Bool)

(assert (=> bm!4230 (= call!4233 (byteRangesEq!0 (select (arr!7509 (buf!6990 w2!587)) (_3!986 lt!408327)) (select (arr!7509 (buf!6990 w3!25)) (_3!986 lt!408327)) lt!408329 (ite c!12364 lt!408328 #b00000000000000000000000000001000)))))

(declare-fun b!268217 () Bool)

(assert (=> b!268217 (= e!188223 e!188224)))

(declare-fun res!223729 () Bool)

(assert (=> b!268217 (=> (not res!223729) (not e!188224))))

(assert (=> b!268217 (= res!223729 e!188225)))

(declare-fun res!223728 () Bool)

(assert (=> b!268217 (=> res!223728 e!188225)))

(assert (=> b!268217 (= res!223728 (bvsge (_1!12189 lt!408327) (_2!12189 lt!408327)))))

(assert (=> b!268217 (= lt!408328 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6522 (buf!6990 w2!587)) (currentByte!12902 w2!587) (currentBit!12897 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!268217 (= lt!408329 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!412)

(assert (=> b!268217 (= lt!408327 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6522 (buf!6990 w2!587)) (currentByte!12902 w2!587) (currentBit!12897 w2!587))))))

(assert (= (and d!90632 (not res!223730)) b!268217))

(assert (= (and b!268217 (not res!223728)) b!268212))

(assert (= (and b!268217 res!223729) b!268214))

(assert (= (and b!268214 c!12364) b!268213))

(assert (= (and b!268214 (not c!12364)) b!268211))

(assert (= (and b!268211 res!223727) b!268216))

(assert (= (and b!268216 (not res!223726)) b!268215))

(assert (= (or b!268213 b!268211) bm!4230))

(declare-fun m!399609 () Bool)

(assert (=> b!268212 m!399609))

(declare-fun m!399611 () Bool)

(assert (=> b!268215 m!399611))

(declare-fun m!399613 () Bool)

(assert (=> b!268215 m!399613))

(assert (=> b!268215 m!399611))

(assert (=> b!268215 m!399613))

(declare-fun m!399615 () Bool)

(assert (=> b!268215 m!399615))

(declare-fun m!399617 () Bool)

(assert (=> bm!4230 m!399617))

(declare-fun m!399619 () Bool)

(assert (=> bm!4230 m!399619))

(assert (=> bm!4230 m!399617))

(assert (=> bm!4230 m!399619))

(declare-fun m!399621 () Bool)

(assert (=> bm!4230 m!399621))

(assert (=> b!268217 m!399483))

(declare-fun m!399623 () Bool)

(assert (=> b!268217 m!399623))

(assert (=> b!268117 d!90632))

(assert (=> b!268117 d!90624))

(assert (=> b!268113 d!90624))

(declare-fun d!90650 () Bool)

(declare-fun e!188226 () Bool)

(assert (=> d!90650 e!188226))

(declare-fun res!223731 () Bool)

(assert (=> d!90650 (=> (not res!223731) (not e!188226))))

(declare-fun lt!408334 () (_ BitVec 64))

(declare-fun lt!408331 () (_ BitVec 64))

(declare-fun lt!408330 () (_ BitVec 64))

(assert (=> d!90650 (= res!223731 (= lt!408330 (bvsub lt!408334 lt!408331)))))

(assert (=> d!90650 (or (= (bvand lt!408334 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!408331 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408334 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408334 lt!408331) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!90650 (= lt!408331 (remainingBits!0 ((_ sign_extend 32) (size!6522 (buf!6990 w3!25))) ((_ sign_extend 32) (currentByte!12902 w3!25)) ((_ sign_extend 32) (currentBit!12897 w3!25))))))

(declare-fun lt!408335 () (_ BitVec 64))

(declare-fun lt!408332 () (_ BitVec 64))

(assert (=> d!90650 (= lt!408334 (bvmul lt!408335 lt!408332))))

(assert (=> d!90650 (or (= lt!408335 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!408332 (bvsdiv (bvmul lt!408335 lt!408332) lt!408335)))))

(assert (=> d!90650 (= lt!408332 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!90650 (= lt!408335 ((_ sign_extend 32) (size!6522 (buf!6990 w3!25))))))

(assert (=> d!90650 (= lt!408330 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12902 w3!25)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12897 w3!25))))))

(assert (=> d!90650 (invariant!0 (currentBit!12897 w3!25) (currentByte!12902 w3!25) (size!6522 (buf!6990 w3!25)))))

(assert (=> d!90650 (= (bitIndex!0 (size!6522 (buf!6990 w3!25)) (currentByte!12902 w3!25) (currentBit!12897 w3!25)) lt!408330)))

(declare-fun b!268218 () Bool)

(declare-fun res!223732 () Bool)

(assert (=> b!268218 (=> (not res!223732) (not e!188226))))

(assert (=> b!268218 (= res!223732 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!408330))))

(declare-fun b!268219 () Bool)

(declare-fun lt!408333 () (_ BitVec 64))

(assert (=> b!268219 (= e!188226 (bvsle lt!408330 (bvmul lt!408333 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!268219 (or (= lt!408333 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!408333 #b0000000000000000000000000000000000000000000000000000000000001000) lt!408333)))))

(assert (=> b!268219 (= lt!408333 ((_ sign_extend 32) (size!6522 (buf!6990 w3!25))))))

(assert (= (and d!90650 res!223731) b!268218))

(assert (= (and b!268218 res!223732) b!268219))

(declare-fun m!399625 () Bool)

(assert (=> d!90650 m!399625))

(assert (=> d!90650 m!399491))

(assert (=> b!268113 d!90650))

(assert (=> d!90578 d!90574))

(declare-fun d!90652 () Bool)

(assert (=> d!90652 (arrayRangesEq!1057 (buf!6990 w1!591) (buf!6990 w3!25) #b00000000000000000000000000000000 (currentByte!12902 w1!591))))

(assert (=> d!90652 true))

(declare-fun _$16!101 () Unit!19017)

(assert (=> d!90652 (= (choose!373 (buf!6990 w1!591) (buf!6990 w2!587) (buf!6990 w3!25) #b00000000000000000000000000000000 (currentByte!12902 w1!591) (currentByte!12902 w2!587)) _$16!101)))

(declare-fun bs!23014 () Bool)

(assert (= bs!23014 d!90652))

(assert (=> bs!23014 m!399459))

(assert (=> d!90578 d!90652))

(declare-fun d!90654 () Bool)

(assert (=> d!90654 (= (invariant!0 (currentBit!12897 w2!587) (currentByte!12902 w2!587) (size!6522 (buf!6990 w2!587))) (and (bvsge (currentBit!12897 w2!587) #b00000000000000000000000000000000) (bvslt (currentBit!12897 w2!587) #b00000000000000000000000000001000) (bvsge (currentByte!12902 w2!587) #b00000000000000000000000000000000) (or (bvslt (currentByte!12902 w2!587) (size!6522 (buf!6990 w2!587))) (and (= (currentBit!12897 w2!587) #b00000000000000000000000000000000) (= (currentByte!12902 w2!587) (size!6522 (buf!6990 w2!587)))))))))

(assert (=> d!90570 d!90654))

(declare-fun b!268220 () Bool)

(declare-fun e!188228 () Bool)

(declare-fun e!188227 () Bool)

(assert (=> b!268220 (= e!188228 e!188227)))

(declare-fun res!223734 () Bool)

(declare-fun call!4234 () Bool)

(assert (=> b!268220 (= res!223734 call!4234)))

(assert (=> b!268220 (=> (not res!223734) (not e!188227))))

(declare-fun d!90656 () Bool)

(declare-fun res!223737 () Bool)

(declare-fun e!188230 () Bool)

(assert (=> d!90656 (=> res!223737 e!188230)))

(assert (=> d!90656 (= res!223737 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6522 (buf!6990 w1!591)) (currentByte!12902 w1!591) (currentBit!12897 w1!591))))))

(assert (=> d!90656 (= (arrayBitRangesEq!0 (buf!6990 w1!591) (buf!6990 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6522 (buf!6990 w1!591)) (currentByte!12902 w1!591) (currentBit!12897 w1!591))) e!188230)))

(declare-fun b!268221 () Bool)

(declare-fun e!188232 () Bool)

(declare-fun lt!408336 () tuple4!412)

(assert (=> b!268221 (= e!188232 (arrayRangesEq!1057 (buf!6990 w1!591) (buf!6990 w2!587) (_1!12189 lt!408336) (_2!12189 lt!408336)))))

(declare-fun b!268222 () Bool)

(assert (=> b!268222 (= e!188228 call!4234)))

(declare-fun b!268223 () Bool)

(declare-fun e!188231 () Bool)

(assert (=> b!268223 (= e!188231 e!188228)))

(declare-fun c!12365 () Bool)

(assert (=> b!268223 (= c!12365 (= (_3!986 lt!408336) (_4!206 lt!408336)))))

(declare-fun b!268224 () Bool)

(declare-fun e!188229 () Bool)

(declare-fun lt!408337 () (_ BitVec 32))

(assert (=> b!268224 (= e!188229 (byteRangesEq!0 (select (arr!7509 (buf!6990 w1!591)) (_4!206 lt!408336)) (select (arr!7509 (buf!6990 w2!587)) (_4!206 lt!408336)) #b00000000000000000000000000000000 lt!408337))))

(declare-fun b!268225 () Bool)

(declare-fun res!223733 () Bool)

(assert (=> b!268225 (= res!223733 (= lt!408337 #b00000000000000000000000000000000))))

(assert (=> b!268225 (=> res!223733 e!188229)))

(assert (=> b!268225 (= e!188227 e!188229)))

(declare-fun bm!4231 () Bool)

(declare-fun lt!408338 () (_ BitVec 32))

(assert (=> bm!4231 (= call!4234 (byteRangesEq!0 (select (arr!7509 (buf!6990 w1!591)) (_3!986 lt!408336)) (select (arr!7509 (buf!6990 w2!587)) (_3!986 lt!408336)) lt!408338 (ite c!12365 lt!408337 #b00000000000000000000000000001000)))))

(declare-fun b!268226 () Bool)

(assert (=> b!268226 (= e!188230 e!188231)))

(declare-fun res!223736 () Bool)

(assert (=> b!268226 (=> (not res!223736) (not e!188231))))

(assert (=> b!268226 (= res!223736 e!188232)))

(declare-fun res!223735 () Bool)

(assert (=> b!268226 (=> res!223735 e!188232)))

(assert (=> b!268226 (= res!223735 (bvsge (_1!12189 lt!408336) (_2!12189 lt!408336)))))

(assert (=> b!268226 (= lt!408337 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6522 (buf!6990 w1!591)) (currentByte!12902 w1!591) (currentBit!12897 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!268226 (= lt!408338 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!268226 (= lt!408336 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6522 (buf!6990 w1!591)) (currentByte!12902 w1!591) (currentBit!12897 w1!591))))))

(assert (= (and d!90656 (not res!223737)) b!268226))

(assert (= (and b!268226 (not res!223735)) b!268221))

(assert (= (and b!268226 res!223736) b!268223))

(assert (= (and b!268223 c!12365) b!268222))

(assert (= (and b!268223 (not c!12365)) b!268220))

(assert (= (and b!268220 res!223734) b!268225))

(assert (= (and b!268225 (not res!223733)) b!268224))

(assert (= (or b!268222 b!268220) bm!4231))

(declare-fun m!399627 () Bool)

(assert (=> b!268221 m!399627))

(declare-fun m!399629 () Bool)

(assert (=> b!268224 m!399629))

(declare-fun m!399631 () Bool)

(assert (=> b!268224 m!399631))

(assert (=> b!268224 m!399629))

(assert (=> b!268224 m!399631))

(declare-fun m!399633 () Bool)

(assert (=> b!268224 m!399633))

(declare-fun m!399635 () Bool)

(assert (=> bm!4231 m!399635))

(declare-fun m!399637 () Bool)

(assert (=> bm!4231 m!399637))

(assert (=> bm!4231 m!399635))

(assert (=> bm!4231 m!399637))

(declare-fun m!399639 () Bool)

(assert (=> bm!4231 m!399639))

(assert (=> b!268226 m!399481))

(declare-fun m!399641 () Bool)

(assert (=> b!268226 m!399641))

(assert (=> b!268088 d!90656))

(assert (=> b!268088 d!90620))

(declare-fun d!90658 () Bool)

(declare-fun res!223740 () Bool)

(declare-fun e!188235 () Bool)

(assert (=> d!90658 (=> res!223740 e!188235)))

(assert (=> d!90658 (= res!223740 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12902 w1!591)))))

(assert (=> d!90658 (= (arrayRangesEq!1057 (buf!6990 w1!591) (buf!6990 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12902 w1!591)) e!188235)))

(declare-fun b!268227 () Bool)

(declare-fun e!188236 () Bool)

(assert (=> b!268227 (= e!188235 e!188236)))

(declare-fun res!223741 () Bool)

(assert (=> b!268227 (=> (not res!223741) (not e!188236))))

(assert (=> b!268227 (= res!223741 (= (select (arr!7509 (buf!6990 w1!591)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!7509 (buf!6990 w3!25)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!268228 () Bool)

(assert (=> b!268228 (= e!188236 (arrayRangesEq!1057 (buf!6990 w1!591) (buf!6990 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12902 w1!591)))))

(assert (= (and d!90658 (not res!223740)) b!268227))

(assert (= (and b!268227 res!223741) b!268228))

(declare-fun m!399643 () Bool)

(assert (=> b!268227 m!399643))

(declare-fun m!399645 () Bool)

(assert (=> b!268227 m!399645))

(declare-fun m!399647 () Bool)

(assert (=> b!268228 m!399647))

(assert (=> b!268105 d!90658))

(push 1)

(assert (not d!90652))

(assert (not d!90624))

(assert (not b!268224))

(assert (not bm!4231))

(assert (not b!268221))

(assert (not b!268212))

(assert (not b!268215))

(assert (not d!90650))

(assert (not b!268228))

(assert (not d!90620))

(assert (not bm!4230))

(assert (not b!268226))

(assert (not b!268217))

(check-sat)

(pop 1)

(push 1)

(check-sat)

