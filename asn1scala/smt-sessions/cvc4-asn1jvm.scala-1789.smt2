; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48790 () Bool)

(assert start!48790)

(declare-fun b!230931 () Bool)

(declare-fun e!158735 () Bool)

(declare-fun bits!86 () (_ BitVec 64))

(assert (=> b!230931 (= e!158735 (bvsge (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))

(declare-fun b!230933 () Bool)

(declare-fun e!158731 () Bool)

(declare-datatypes ((array!11810 0))(
  ( (array!11811 (arr!6162 (Array (_ BitVec 32) (_ BitVec 8))) (size!5175 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9446 0))(
  ( (BitStream!9447 (buf!5716 array!11810) (currentByte!10711 (_ BitVec 32)) (currentBit!10706 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9446)

(declare-fun array_inv!4916 (array!11810) Bool)

(assert (=> b!230933 (= e!158731 (array_inv!4916 (buf!5716 b2!99)))))

(declare-fun res!193491 () Bool)

(assert (=> start!48790 (=> (not res!193491) (not e!158735))))

(declare-fun b1!101 () BitStream!9446)

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> start!48790 (= res!193491 (and (= (size!5175 (buf!5716 b1!101)) (size!5175 (buf!5716 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48790 e!158735))

(declare-fun e!158733 () Bool)

(declare-fun inv!12 (BitStream!9446) Bool)

(assert (=> start!48790 (and (inv!12 b1!101) e!158733)))

(assert (=> start!48790 (and (inv!12 b2!99) e!158731)))

(assert (=> start!48790 true))

(declare-fun b!230932 () Bool)

(assert (=> b!230932 (= e!158733 (array_inv!4916 (buf!5716 b1!101)))))

(declare-fun b!230930 () Bool)

(declare-fun res!193490 () Bool)

(assert (=> b!230930 (=> (not res!193490) (not e!158735))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!230930 (= res!193490 (bvsle bits!86 (bitIndex!0 (size!5175 (buf!5716 b2!99)) (currentByte!10711 b2!99) (currentBit!10706 b2!99))))))

(assert (= (and start!48790 res!193491) b!230930))

(assert (= (and b!230930 res!193490) b!230931))

(assert (= start!48790 b!230932))

(assert (= start!48790 b!230933))

(declare-fun m!354157 () Bool)

(assert (=> b!230933 m!354157))

(declare-fun m!354159 () Bool)

(assert (=> start!48790 m!354159))

(declare-fun m!354161 () Bool)

(assert (=> start!48790 m!354161))

(declare-fun m!354163 () Bool)

(assert (=> b!230932 m!354163))

(declare-fun m!354165 () Bool)

(assert (=> b!230930 m!354165))

(push 1)

(assert (not b!230930))

(assert (not b!230933))

(assert (not b!230932))

(assert (not start!48790))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!78366 () Bool)

(declare-fun e!158744 () Bool)

(assert (=> d!78366 e!158744))

(declare-fun res!193508 () Bool)

(assert (=> d!78366 (=> (not res!193508) (not e!158744))))

(declare-fun lt!368445 () (_ BitVec 64))

(declare-fun lt!368444 () (_ BitVec 64))

(declare-fun lt!368442 () (_ BitVec 64))

(assert (=> d!78366 (= res!193508 (= lt!368445 (bvsub lt!368442 lt!368444)))))

(assert (=> d!78366 (or (= (bvand lt!368442 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!368444 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!368442 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!368442 lt!368444) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!78366 (= lt!368444 (remainingBits!0 ((_ sign_extend 32) (size!5175 (buf!5716 b2!99))) ((_ sign_extend 32) (currentByte!10711 b2!99)) ((_ sign_extend 32) (currentBit!10706 b2!99))))))

(declare-fun lt!368443 () (_ BitVec 64))

(declare-fun lt!368441 () (_ BitVec 64))

(assert (=> d!78366 (= lt!368442 (bvmul lt!368443 lt!368441))))

(assert (=> d!78366 (or (= lt!368443 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!368441 (bvsdiv (bvmul lt!368443 lt!368441) lt!368443)))))

(assert (=> d!78366 (= lt!368441 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78366 (= lt!368443 ((_ sign_extend 32) (size!5175 (buf!5716 b2!99))))))

(assert (=> d!78366 (= lt!368445 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10711 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10706 b2!99))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!78366 (invariant!0 (currentBit!10706 b2!99) (currentByte!10711 b2!99) (size!5175 (buf!5716 b2!99)))))

(assert (=> d!78366 (= (bitIndex!0 (size!5175 (buf!5716 b2!99)) (currentByte!10711 b2!99) (currentBit!10706 b2!99)) lt!368445)))

(declare-fun b!230950 () Bool)

(declare-fun res!193509 () Bool)

(assert (=> b!230950 (=> (not res!193509) (not e!158744))))

(assert (=> b!230950 (= res!193509 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!368445))))

(declare-fun b!230951 () Bool)

(declare-fun lt!368440 () (_ BitVec 64))

(assert (=> b!230951 (= e!158744 (bvsle lt!368445 (bvmul lt!368440 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!230951 (or (= lt!368440 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!368440 #b0000000000000000000000000000000000000000000000000000000000001000) lt!368440)))))

(assert (=> b!230951 (= lt!368440 ((_ sign_extend 32) (size!5175 (buf!5716 b2!99))))))

(assert (= (and d!78366 res!193508) b!230950))

(assert (= (and b!230950 res!193509) b!230951))

(declare-fun m!354179 () Bool)

(assert (=> d!78366 m!354179))

(declare-fun m!354181 () Bool)

(assert (=> d!78366 m!354181))

(assert (=> b!230930 d!78366))

(declare-fun d!78368 () Bool)

(assert (=> d!78368 (= (array_inv!4916 (buf!5716 b2!99)) (bvsge (size!5175 (buf!5716 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!230933 d!78368))

(declare-fun d!78370 () Bool)

(assert (=> d!78370 (= (array_inv!4916 (buf!5716 b1!101)) (bvsge (size!5175 (buf!5716 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!230932 d!78370))

(declare-fun d!78372 () Bool)

(assert (=> d!78372 (= (inv!12 b1!101) (invariant!0 (currentBit!10706 b1!101) (currentByte!10711 b1!101) (size!5175 (buf!5716 b1!101))))))

(declare-fun bs!19217 () Bool)

(assert (= bs!19217 d!78372))

(declare-fun m!354183 () Bool)

(assert (=> bs!19217 m!354183))

(assert (=> start!48790 d!78372))

(declare-fun d!78374 () Bool)

(assert (=> d!78374 (= (inv!12 b2!99) (invariant!0 (currentBit!10706 b2!99) (currentByte!10711 b2!99) (size!5175 (buf!5716 b2!99))))))

(declare-fun bs!19218 () Bool)

(assert (= bs!19218 d!78374))

(assert (=> bs!19218 m!354181))

(assert (=> start!48790 d!78374))

(push 1)

(assert (not d!78366))

(assert (not d!78374))

(assert (not d!78372))

(check-sat)

(pop 1)

(push 1)

(check-sat)

