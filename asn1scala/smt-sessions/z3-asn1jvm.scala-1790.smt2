; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48812 () Bool)

(assert start!48812)

(declare-fun res!193520 () Bool)

(declare-fun e!158772 () Bool)

(assert (=> start!48812 (=> (not res!193520) (not e!158772))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-datatypes ((array!11817 0))(
  ( (array!11818 (arr!6164 (Array (_ BitVec 32) (_ BitVec 8))) (size!5177 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9450 0))(
  ( (BitStream!9451 (buf!5718 array!11817) (currentByte!10716 (_ BitVec 32)) (currentBit!10711 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9450)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9450)

(assert (=> start!48812 (= res!193520 (and (= (size!5177 (buf!5718 b1!101)) (size!5177 (buf!5718 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48812 e!158772))

(declare-fun e!158770 () Bool)

(declare-fun inv!12 (BitStream!9450) Bool)

(assert (=> start!48812 (and (inv!12 b1!101) e!158770)))

(declare-fun e!158774 () Bool)

(assert (=> start!48812 (and (inv!12 b2!99) e!158774)))

(assert (=> start!48812 true))

(declare-fun b!230972 () Bool)

(declare-fun res!193521 () Bool)

(assert (=> b!230972 (=> (not res!193521) (not e!158772))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!230972 (= res!193521 (bvsle bits!86 (bitIndex!0 (size!5177 (buf!5718 b2!99)) (currentByte!10716 b2!99) (currentBit!10711 b2!99))))))

(declare-fun b!230975 () Bool)

(declare-fun array_inv!4918 (array!11817) Bool)

(assert (=> b!230975 (= e!158774 (array_inv!4918 (buf!5718 b2!99)))))

(declare-fun b!230974 () Bool)

(assert (=> b!230974 (= e!158770 (array_inv!4918 (buf!5718 b1!101)))))

(declare-fun b!230973 () Bool)

(declare-fun lt!368451 () (_ BitVec 64))

(assert (=> b!230973 (= e!158772 (and (bvslt lt!368451 #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt lt!368451 #b1111111111111111111111111111111110000000000000000000000000000000)))))

(assert (=> b!230973 (= lt!368451 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and start!48812 res!193520) b!230972))

(assert (= (and b!230972 res!193521) b!230973))

(assert (= start!48812 b!230974))

(assert (= start!48812 b!230975))

(declare-fun m!354195 () Bool)

(assert (=> start!48812 m!354195))

(declare-fun m!354197 () Bool)

(assert (=> start!48812 m!354197))

(declare-fun m!354199 () Bool)

(assert (=> b!230972 m!354199))

(declare-fun m!354201 () Bool)

(assert (=> b!230975 m!354201))

(declare-fun m!354203 () Bool)

(assert (=> b!230974 m!354203))

(check-sat (not b!230972) (not start!48812) (not b!230974) (not b!230975))
(check-sat)
(get-model)

(declare-fun d!78378 () Bool)

(declare-fun e!158792 () Bool)

(assert (=> d!78378 e!158792))

(declare-fun res!193533 () Bool)

(assert (=> d!78378 (=> (not res!193533) (not e!158792))))

(declare-fun lt!368468 () (_ BitVec 64))

(declare-fun lt!368472 () (_ BitVec 64))

(declare-fun lt!368470 () (_ BitVec 64))

(assert (=> d!78378 (= res!193533 (= lt!368472 (bvsub lt!368468 lt!368470)))))

(assert (=> d!78378 (or (= (bvand lt!368468 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!368470 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!368468 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!368468 lt!368470) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!78378 (= lt!368470 (remainingBits!0 ((_ sign_extend 32) (size!5177 (buf!5718 b2!99))) ((_ sign_extend 32) (currentByte!10716 b2!99)) ((_ sign_extend 32) (currentBit!10711 b2!99))))))

(declare-fun lt!368469 () (_ BitVec 64))

(declare-fun lt!368471 () (_ BitVec 64))

(assert (=> d!78378 (= lt!368468 (bvmul lt!368469 lt!368471))))

(assert (=> d!78378 (or (= lt!368469 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!368471 (bvsdiv (bvmul lt!368469 lt!368471) lt!368469)))))

(assert (=> d!78378 (= lt!368471 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78378 (= lt!368469 ((_ sign_extend 32) (size!5177 (buf!5718 b2!99))))))

(assert (=> d!78378 (= lt!368472 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10716 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10711 b2!99))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!78378 (invariant!0 (currentBit!10711 b2!99) (currentByte!10716 b2!99) (size!5177 (buf!5718 b2!99)))))

(assert (=> d!78378 (= (bitIndex!0 (size!5177 (buf!5718 b2!99)) (currentByte!10716 b2!99) (currentBit!10711 b2!99)) lt!368472)))

(declare-fun b!230992 () Bool)

(declare-fun res!193532 () Bool)

(assert (=> b!230992 (=> (not res!193532) (not e!158792))))

(assert (=> b!230992 (= res!193532 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!368472))))

(declare-fun b!230993 () Bool)

(declare-fun lt!368467 () (_ BitVec 64))

(assert (=> b!230993 (= e!158792 (bvsle lt!368472 (bvmul lt!368467 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!230993 (or (= lt!368467 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!368467 #b0000000000000000000000000000000000000000000000000000000000001000) lt!368467)))))

(assert (=> b!230993 (= lt!368467 ((_ sign_extend 32) (size!5177 (buf!5718 b2!99))))))

(assert (= (and d!78378 res!193533) b!230992))

(assert (= (and b!230992 res!193532) b!230993))

(declare-fun m!354215 () Bool)

(assert (=> d!78378 m!354215))

(declare-fun m!354217 () Bool)

(assert (=> d!78378 m!354217))

(assert (=> b!230972 d!78378))

(declare-fun d!78380 () Bool)

(assert (=> d!78380 (= (inv!12 b1!101) (invariant!0 (currentBit!10711 b1!101) (currentByte!10716 b1!101) (size!5177 (buf!5718 b1!101))))))

(declare-fun bs!19222 () Bool)

(assert (= bs!19222 d!78380))

(declare-fun m!354219 () Bool)

(assert (=> bs!19222 m!354219))

(assert (=> start!48812 d!78380))

(declare-fun d!78382 () Bool)

(assert (=> d!78382 (= (inv!12 b2!99) (invariant!0 (currentBit!10711 b2!99) (currentByte!10716 b2!99) (size!5177 (buf!5718 b2!99))))))

(declare-fun bs!19223 () Bool)

(assert (= bs!19223 d!78382))

(assert (=> bs!19223 m!354217))

(assert (=> start!48812 d!78382))

(declare-fun d!78384 () Bool)

(assert (=> d!78384 (= (array_inv!4918 (buf!5718 b1!101)) (bvsge (size!5177 (buf!5718 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!230974 d!78384))

(declare-fun d!78386 () Bool)

(assert (=> d!78386 (= (array_inv!4918 (buf!5718 b2!99)) (bvsge (size!5177 (buf!5718 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!230975 d!78386))

(check-sat (not d!78382) (not d!78380) (not d!78378))
