; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27306 () Bool)

(assert start!27306)

(declare-fun b!140230 () Bool)

(declare-fun res!116911 () Bool)

(declare-fun e!93463 () Bool)

(assert (=> b!140230 (=> (not res!116911) (not e!93463))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(declare-datatypes ((array!6399 0))(
  ( (array!6400 (arr!3603 (Array (_ BitVec 32) (_ BitVec 8))) (size!2896 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5050 0))(
  ( (BitStream!5051 (buf!3317 array!6399) (currentByte!6159 (_ BitVec 32)) (currentBit!6154 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5050)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!140230 (= res!116911 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2896 (buf!3317 thiss!1634))) ((_ sign_extend 32) (currentByte!6159 thiss!1634)) ((_ sign_extend 32) (currentBit!6154 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!140231 () Bool)

(declare-fun e!93465 () Bool)

(declare-fun array_inv!2685 (array!6399) Bool)

(assert (=> b!140231 (= e!93465 (array_inv!2685 (buf!3317 thiss!1634)))))

(declare-fun b!140232 () Bool)

(declare-fun res!116912 () Bool)

(assert (=> b!140232 (=> (not res!116912) (not e!93463))))

(assert (=> b!140232 (= res!116912 (bvslt from!447 to!404))))

(declare-fun b!140234 () Bool)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!140234 (= e!93463 (not (validate_offset_byte!0 ((_ sign_extend 32) (size!2896 (buf!3317 thiss!1634))) ((_ sign_extend 32) (currentByte!6159 thiss!1634)) ((_ sign_extend 32) (currentBit!6154 thiss!1634)))))))

(declare-fun res!116913 () Bool)

(assert (=> start!27306 (=> (not res!116913) (not e!93463))))

(declare-fun arr!237 () array!6399)

(assert (=> start!27306 (= res!116913 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2896 arr!237))))))

(assert (=> start!27306 e!93463))

(assert (=> start!27306 true))

(assert (=> start!27306 (array_inv!2685 arr!237)))

(declare-fun inv!12 (BitStream!5050) Bool)

(assert (=> start!27306 (and (inv!12 thiss!1634) e!93465)))

(declare-fun b!140233 () Bool)

(declare-fun res!116914 () Bool)

(assert (=> b!140233 (=> (not res!116914) (not e!93463))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!140233 (= res!116914 (invariant!0 (currentBit!6154 thiss!1634) (currentByte!6159 thiss!1634) (size!2896 (buf!3317 thiss!1634))))))

(assert (= (and start!27306 res!116913) b!140230))

(assert (= (and b!140230 res!116911) b!140232))

(assert (= (and b!140232 res!116912) b!140233))

(assert (= (and b!140233 res!116914) b!140234))

(assert (= start!27306 b!140231))

(declare-fun m!216023 () Bool)

(assert (=> b!140231 m!216023))

(declare-fun m!216025 () Bool)

(assert (=> b!140234 m!216025))

(declare-fun m!216027 () Bool)

(assert (=> start!27306 m!216027))

(declare-fun m!216029 () Bool)

(assert (=> start!27306 m!216029))

(declare-fun m!216031 () Bool)

(assert (=> b!140233 m!216031))

(declare-fun m!216033 () Bool)

(assert (=> b!140230 m!216033))

(push 1)

(assert (not start!27306))

(assert (not b!140234))

(assert (not b!140231))

(assert (not b!140233))

(assert (not b!140230))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!45258 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!45258 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!2896 (buf!3317 thiss!1634))) ((_ sign_extend 32) (currentByte!6159 thiss!1634)) ((_ sign_extend 32) (currentBit!6154 thiss!1634))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2896 (buf!3317 thiss!1634))) ((_ sign_extend 32) (currentByte!6159 thiss!1634)) ((_ sign_extend 32) (currentBit!6154 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!11096 () Bool)

(assert (= bs!11096 d!45258))

(declare-fun m!216059 () Bool)

(assert (=> bs!11096 m!216059))

(assert (=> b!140234 d!45258))

(declare-fun d!45260 () Bool)

(assert (=> d!45260 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2896 (buf!3317 thiss!1634))) ((_ sign_extend 32) (currentByte!6159 thiss!1634)) ((_ sign_extend 32) (currentBit!6154 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2896 (buf!3317 thiss!1634))) ((_ sign_extend 32) (currentByte!6159 thiss!1634)) ((_ sign_extend 32) (currentBit!6154 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11097 () Bool)

(assert (= bs!11097 d!45260))

(assert (=> bs!11097 m!216059))

(assert (=> b!140230 d!45260))

(declare-fun d!45264 () Bool)

(assert (=> d!45264 (= (array_inv!2685 (buf!3317 thiss!1634)) (bvsge (size!2896 (buf!3317 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!140231 d!45264))

(declare-fun d!45266 () Bool)

(assert (=> d!45266 (= (array_inv!2685 arr!237) (bvsge (size!2896 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!27306 d!45266))

(declare-fun d!45268 () Bool)

(assert (=> d!45268 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6154 thiss!1634) (currentByte!6159 thiss!1634) (size!2896 (buf!3317 thiss!1634))))))

(declare-fun bs!11098 () Bool)

(assert (= bs!11098 d!45268))

(assert (=> bs!11098 m!216031))

(assert (=> start!27306 d!45268))

(declare-fun d!45272 () Bool)

(assert (=> d!45272 (= (invariant!0 (currentBit!6154 thiss!1634) (currentByte!6159 thiss!1634) (size!2896 (buf!3317 thiss!1634))) (and (bvsge (currentBit!6154 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6154 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6159 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6159 thiss!1634) (size!2896 (buf!3317 thiss!1634))) (and (= (currentBit!6154 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6159 thiss!1634) (size!2896 (buf!3317 thiss!1634)))))))))

(assert (=> b!140233 d!45272))

(push 1)

(assert (not d!45260))

(assert (not d!45258))

(assert (not d!45268))

(check-sat)

(pop 1)

(push 1)

(check-sat)

