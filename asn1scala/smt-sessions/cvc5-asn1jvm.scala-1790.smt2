; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48810 () Bool)

(assert start!48810)

(declare-fun b!230960 () Bool)

(declare-fun res!193515 () Bool)

(declare-fun e!158758 () Bool)

(assert (=> b!230960 (=> (not res!193515) (not e!158758))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-datatypes ((array!11815 0))(
  ( (array!11816 (arr!6163 (Array (_ BitVec 32) (_ BitVec 8))) (size!5176 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9448 0))(
  ( (BitStream!9449 (buf!5717 array!11815) (currentByte!10715 (_ BitVec 32)) (currentBit!10710 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9448)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!230960 (= res!193515 (bvsle bits!86 (bitIndex!0 (size!5176 (buf!5717 b2!99)) (currentByte!10715 b2!99) (currentBit!10710 b2!99))))))

(declare-fun b!230963 () Bool)

(declare-fun e!158756 () Bool)

(declare-fun array_inv!4917 (array!11815) Bool)

(assert (=> b!230963 (= e!158756 (array_inv!4917 (buf!5717 b2!99)))))

(declare-fun res!193514 () Bool)

(assert (=> start!48810 (=> (not res!193514) (not e!158758))))

(declare-fun b1!101 () BitStream!9448)

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> start!48810 (= res!193514 (and (= (size!5176 (buf!5717 b1!101)) (size!5176 (buf!5717 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48810 e!158758))

(declare-fun e!158755 () Bool)

(declare-fun inv!12 (BitStream!9448) Bool)

(assert (=> start!48810 (and (inv!12 b1!101) e!158755)))

(assert (=> start!48810 (and (inv!12 b2!99) e!158756)))

(assert (=> start!48810 true))

(declare-fun b!230962 () Bool)

(assert (=> b!230962 (= e!158755 (array_inv!4917 (buf!5717 b1!101)))))

(declare-fun b!230961 () Bool)

(declare-fun lt!368448 () (_ BitVec 64))

(assert (=> b!230961 (= e!158758 (and (bvslt lt!368448 #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt lt!368448 #b1111111111111111111111111111111110000000000000000000000000000000)))))

(assert (=> b!230961 (= lt!368448 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and start!48810 res!193514) b!230960))

(assert (= (and b!230960 res!193515) b!230961))

(assert (= start!48810 b!230962))

(assert (= start!48810 b!230963))

(declare-fun m!354185 () Bool)

(assert (=> b!230960 m!354185))

(declare-fun m!354187 () Bool)

(assert (=> b!230963 m!354187))

(declare-fun m!354189 () Bool)

(assert (=> start!48810 m!354189))

(declare-fun m!354191 () Bool)

(assert (=> start!48810 m!354191))

(declare-fun m!354193 () Bool)

(assert (=> b!230962 m!354193))

(push 1)

(assert (not b!230960))

(assert (not start!48810))

(assert (not b!230963))

(assert (not b!230962))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!78388 () Bool)

(declare-fun e!158795 () Bool)

(assert (=> d!78388 e!158795))

(declare-fun res!193538 () Bool)

(assert (=> d!78388 (=> (not res!193538) (not e!158795))))

(declare-fun lt!368488 () (_ BitVec 64))

(declare-fun lt!368489 () (_ BitVec 64))

(declare-fun lt!368485 () (_ BitVec 64))

(assert (=> d!78388 (= res!193538 (= lt!368488 (bvsub lt!368489 lt!368485)))))

(assert (=> d!78388 (or (= (bvand lt!368489 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!368485 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!368489 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!368489 lt!368485) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!78388 (= lt!368485 (remainingBits!0 ((_ sign_extend 32) (size!5176 (buf!5717 b2!99))) ((_ sign_extend 32) (currentByte!10715 b2!99)) ((_ sign_extend 32) (currentBit!10710 b2!99))))))

(declare-fun lt!368487 () (_ BitVec 64))

(declare-fun lt!368486 () (_ BitVec 64))

(assert (=> d!78388 (= lt!368489 (bvmul lt!368487 lt!368486))))

(assert (=> d!78388 (or (= lt!368487 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!368486 (bvsdiv (bvmul lt!368487 lt!368486) lt!368487)))))

(assert (=> d!78388 (= lt!368486 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78388 (= lt!368487 ((_ sign_extend 32) (size!5176 (buf!5717 b2!99))))))

(assert (=> d!78388 (= lt!368488 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10715 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10710 b2!99))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!78388 (invariant!0 (currentBit!10710 b2!99) (currentByte!10715 b2!99) (size!5176 (buf!5717 b2!99)))))

(assert (=> d!78388 (= (bitIndex!0 (size!5176 (buf!5717 b2!99)) (currentByte!10715 b2!99) (currentBit!10710 b2!99)) lt!368488)))

(declare-fun b!230998 () Bool)

(declare-fun res!193539 () Bool)

(assert (=> b!230998 (=> (not res!193539) (not e!158795))))

(assert (=> b!230998 (= res!193539 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!368488))))

(declare-fun b!230999 () Bool)

(declare-fun lt!368490 () (_ BitVec 64))

(assert (=> b!230999 (= e!158795 (bvsle lt!368488 (bvmul lt!368490 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!230999 (or (= lt!368490 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!368490 #b0000000000000000000000000000000000000000000000000000000000001000) lt!368490)))))

(assert (=> b!230999 (= lt!368490 ((_ sign_extend 32) (size!5176 (buf!5717 b2!99))))))

(assert (= (and d!78388 res!193538) b!230998))

(assert (= (and b!230998 res!193539) b!230999))

(declare-fun m!354221 () Bool)

(assert (=> d!78388 m!354221))

(declare-fun m!354223 () Bool)

(assert (=> d!78388 m!354223))

(assert (=> b!230960 d!78388))

(declare-fun d!78390 () Bool)

(assert (=> d!78390 (= (inv!12 b1!101) (invariant!0 (currentBit!10710 b1!101) (currentByte!10715 b1!101) (size!5176 (buf!5717 b1!101))))))

(declare-fun bs!19224 () Bool)

(assert (= bs!19224 d!78390))

(declare-fun m!354225 () Bool)

(assert (=> bs!19224 m!354225))

(assert (=> start!48810 d!78390))

(declare-fun d!78392 () Bool)

(assert (=> d!78392 (= (inv!12 b2!99) (invariant!0 (currentBit!10710 b2!99) (currentByte!10715 b2!99) (size!5176 (buf!5717 b2!99))))))

(declare-fun bs!19225 () Bool)

(assert (= bs!19225 d!78392))

(assert (=> bs!19225 m!354223))

(assert (=> start!48810 d!78392))

(declare-fun d!78394 () Bool)

(assert (=> d!78394 (= (array_inv!4917 (buf!5717 b2!99)) (bvsge (size!5176 (buf!5717 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!230963 d!78394))

(declare-fun d!78396 () Bool)

(assert (=> d!78396 (= (array_inv!4917 (buf!5717 b1!101)) (bvsge (size!5176 (buf!5717 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!230962 d!78396))

(push 1)

(assert (not d!78388))

(assert (not d!78392))

(assert (not d!78390))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

