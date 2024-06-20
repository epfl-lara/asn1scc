; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30022 () Bool)

(assert start!30022)

(declare-fun res!128969 () Bool)

(declare-fun e!103454 () Bool)

(assert (=> start!30022 (=> (not res!128969) (not e!103454))))

(declare-datatypes ((array!6953 0))(
  ( (array!6954 (arr!3956 (Array (_ BitVec 32) (_ BitVec 8))) (size!3133 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5524 0))(
  ( (BitStream!5525 (buf!3636 array!6953) (currentByte!6652 (_ BitVec 32)) (currentBit!6647 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5524)

(declare-fun bs2!18 () BitStream!5524)

(assert (=> start!30022 (= res!128969 (= (size!3133 (buf!3636 bs1!10)) (size!3133 (buf!3636 bs2!18))))))

(assert (=> start!30022 e!103454))

(declare-fun e!103453 () Bool)

(declare-fun inv!12 (BitStream!5524) Bool)

(assert (=> start!30022 (and (inv!12 bs1!10) e!103453)))

(declare-fun e!103452 () Bool)

(assert (=> start!30022 (and (inv!12 bs2!18) e!103452)))

(declare-fun b!154039 () Bool)

(declare-fun e!103451 () Bool)

(assert (=> b!154039 (= e!103454 e!103451)))

(declare-fun res!128970 () Bool)

(assert (=> b!154039 (=> (not res!128970) (not e!103451))))

(declare-fun lt!240456 () (_ BitVec 64))

(assert (=> b!154039 (= res!128970 (bvsle lt!240456 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3133 (buf!3636 bs1!10))))))))

(declare-fun lt!240455 () (_ BitVec 64))

(assert (=> b!154039 (= lt!240456 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!240455))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!154039 (= lt!240455 (bitIndex!0 (size!3133 (buf!3636 bs1!10)) (currentByte!6652 bs1!10) (currentBit!6647 bs1!10)))))

(declare-fun b!154040 () Bool)

(declare-fun array_inv!2922 (array!6953) Bool)

(assert (=> b!154040 (= e!103452 (array_inv!2922 (buf!3636 bs2!18)))))

(declare-fun b!154041 () Bool)

(declare-fun res!128968 () Bool)

(assert (=> b!154041 (=> (not res!128968) (not e!103451))))

(assert (=> b!154041 (= res!128968 (bvsle lt!240456 (bitIndex!0 (size!3133 (buf!3636 bs2!18)) (currentByte!6652 bs2!18) (currentBit!6647 bs2!18))))))

(declare-fun b!154042 () Bool)

(assert (=> b!154042 (= e!103453 (array_inv!2922 (buf!3636 bs1!10)))))

(declare-fun b!154043 () Bool)

(declare-fun lt!240457 () (_ BitVec 64))

(assert (=> b!154043 (= e!103451 (and (= lt!240457 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= lt!240457 (bvand lt!240456 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!154043 (= lt!240457 (bvand lt!240455 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!30022 res!128969) b!154039))

(assert (= (and b!154039 res!128970) b!154041))

(assert (= (and b!154041 res!128968) b!154043))

(assert (= start!30022 b!154042))

(assert (= start!30022 b!154040))

(declare-fun m!240031 () Bool)

(assert (=> b!154040 m!240031))

(declare-fun m!240033 () Bool)

(assert (=> start!30022 m!240033))

(declare-fun m!240035 () Bool)

(assert (=> start!30022 m!240035))

(declare-fun m!240037 () Bool)

(assert (=> b!154041 m!240037))

(declare-fun m!240039 () Bool)

(assert (=> b!154042 m!240039))

(declare-fun m!240041 () Bool)

(assert (=> b!154039 m!240041))

(push 1)

(assert (not b!154040))

(assert (not b!154041))

(assert (not start!30022))

(assert (not b!154039))

(assert (not b!154042))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!50798 () Bool)

(declare-fun e!103498 () Bool)

(assert (=> d!50798 e!103498))

(declare-fun res!129002 () Bool)

(assert (=> d!50798 (=> (not res!129002) (not e!103498))))

(declare-fun lt!240516 () (_ BitVec 64))

(declare-fun lt!240514 () (_ BitVec 64))

(declare-fun lt!240515 () (_ BitVec 64))

(assert (=> d!50798 (= res!129002 (= lt!240514 (bvsub lt!240515 lt!240516)))))

(assert (=> d!50798 (or (= (bvand lt!240515 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!240516 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!240515 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!240515 lt!240516) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!50798 (= lt!240516 (remainingBits!0 ((_ sign_extend 32) (size!3133 (buf!3636 bs1!10))) ((_ sign_extend 32) (currentByte!6652 bs1!10)) ((_ sign_extend 32) (currentBit!6647 bs1!10))))))

(declare-fun lt!240512 () (_ BitVec 64))

(declare-fun lt!240517 () (_ BitVec 64))

(assert (=> d!50798 (= lt!240515 (bvmul lt!240512 lt!240517))))

(assert (=> d!50798 (or (= lt!240512 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!240517 (bvsdiv (bvmul lt!240512 lt!240517) lt!240512)))))

(assert (=> d!50798 (= lt!240517 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50798 (= lt!240512 ((_ sign_extend 32) (size!3133 (buf!3636 bs1!10))))))

(assert (=> d!50798 (= lt!240514 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6652 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6647 bs1!10))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!50798 (invariant!0 (currentBit!6647 bs1!10) (currentByte!6652 bs1!10) (size!3133 (buf!3636 bs1!10)))))

(assert (=> d!50798 (= (bitIndex!0 (size!3133 (buf!3636 bs1!10)) (currentByte!6652 bs1!10) (currentBit!6647 bs1!10)) lt!240514)))

(declare-fun b!154086 () Bool)

(declare-fun res!129001 () Bool)

(assert (=> b!154086 (=> (not res!129001) (not e!103498))))

(assert (=> b!154086 (= res!129001 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!240514))))

(declare-fun b!154087 () Bool)

(declare-fun lt!240513 () (_ BitVec 64))

(assert (=> b!154087 (= e!103498 (bvsle lt!240514 (bvmul lt!240513 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!154087 (or (= lt!240513 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!240513 #b0000000000000000000000000000000000000000000000000000000000001000) lt!240513)))))

(assert (=> b!154087 (= lt!240513 ((_ sign_extend 32) (size!3133 (buf!3636 bs1!10))))))

(assert (= (and d!50798 res!129002) b!154086))

(assert (= (and b!154086 res!129001) b!154087))

(declare-fun m!240075 () Bool)

(assert (=> d!50798 m!240075))

(declare-fun m!240077 () Bool)

(assert (=> d!50798 m!240077))

(assert (=> b!154039 d!50798))

(declare-fun d!50814 () Bool)

(assert (=> d!50814 (= (array_inv!2922 (buf!3636 bs1!10)) (bvsge (size!3133 (buf!3636 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!154042 d!50814))

(declare-fun d!50816 () Bool)

(declare-fun e!103499 () Bool)

(assert (=> d!50816 e!103499))

(declare-fun res!129004 () Bool)

(assert (=> d!50816 (=> (not res!129004) (not e!103499))))

(declare-fun lt!240520 () (_ BitVec 64))

(declare-fun lt!240522 () (_ BitVec 64))

(declare-fun lt!240521 () (_ BitVec 64))

(assert (=> d!50816 (= res!129004 (= lt!240520 (bvsub lt!240521 lt!240522)))))

(assert (=> d!50816 (or (= (bvand lt!240521 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!240522 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!240521 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!240521 lt!240522) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50816 (= lt!240522 (remainingBits!0 ((_ sign_extend 32) (size!3133 (buf!3636 bs2!18))) ((_ sign_extend 32) (currentByte!6652 bs2!18)) ((_ sign_extend 32) (currentBit!6647 bs2!18))))))

(declare-fun lt!240518 () (_ BitVec 64))

(declare-fun lt!240523 () (_ BitVec 64))

(assert (=> d!50816 (= lt!240521 (bvmul lt!240518 lt!240523))))

(assert (=> d!50816 (or (= lt!240518 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!240523 (bvsdiv (bvmul lt!240518 lt!240523) lt!240518)))))

(assert (=> d!50816 (= lt!240523 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50816 (= lt!240518 ((_ sign_extend 32) (size!3133 (buf!3636 bs2!18))))))

(assert (=> d!50816 (= lt!240520 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6652 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6647 bs2!18))))))

(assert (=> d!50816 (invariant!0 (currentBit!6647 bs2!18) (currentByte!6652 bs2!18) (size!3133 (buf!3636 bs2!18)))))

(assert (=> d!50816 (= (bitIndex!0 (size!3133 (buf!3636 bs2!18)) (currentByte!6652 bs2!18) (currentBit!6647 bs2!18)) lt!240520)))

(declare-fun b!154088 () Bool)

(declare-fun res!129003 () Bool)

(assert (=> b!154088 (=> (not res!129003) (not e!103499))))

(assert (=> b!154088 (= res!129003 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!240520))))

(declare-fun b!154089 () Bool)

(declare-fun lt!240519 () (_ BitVec 64))

(assert (=> b!154089 (= e!103499 (bvsle lt!240520 (bvmul lt!240519 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!154089 (or (= lt!240519 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!240519 #b0000000000000000000000000000000000000000000000000000000000001000) lt!240519)))))

(assert (=> b!154089 (= lt!240519 ((_ sign_extend 32) (size!3133 (buf!3636 bs2!18))))))

(assert (= (and d!50816 res!129004) b!154088))

(assert (= (and b!154088 res!129003) b!154089))

(declare-fun m!240079 () Bool)

(assert (=> d!50816 m!240079))

(declare-fun m!240081 () Bool)

(assert (=> d!50816 m!240081))

(assert (=> b!154041 d!50816))

(declare-fun d!50818 () Bool)

(assert (=> d!50818 (= (array_inv!2922 (buf!3636 bs2!18)) (bvsge (size!3133 (buf!3636 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!154040 d!50818))

(declare-fun d!50820 () Bool)

(assert (=> d!50820 (= (inv!12 bs1!10) (invariant!0 (currentBit!6647 bs1!10) (currentByte!6652 bs1!10) (size!3133 (buf!3636 bs1!10))))))

(declare-fun bs!12424 () Bool)

(assert (= bs!12424 d!50820))

(assert (=> bs!12424 m!240077))

(assert (=> start!30022 d!50820))

(declare-fun d!50822 () Bool)

(assert (=> d!50822 (= (inv!12 bs2!18) (invariant!0 (currentBit!6647 bs2!18) (currentByte!6652 bs2!18) (size!3133 (buf!3636 bs2!18))))))

(declare-fun bs!12425 () Bool)

(assert (= bs!12425 d!50822))

(assert (=> bs!12425 m!240081))

(assert (=> start!30022 d!50822))

(push 1)

(assert (not d!50822))

(assert (not d!50798))

(assert (not d!50820))

(assert (not d!50816))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

