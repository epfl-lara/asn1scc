; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4734 () Bool)

(assert start!4734)

(declare-fun res!16448 () Bool)

(declare-fun e!12179 () Bool)

(assert (=> start!4734 (=> (not res!16448) (not e!12179))))

(declare-datatypes ((array!1312 0))(
  ( (array!1313 (arr!995 (Array (_ BitVec 32) (_ BitVec 8))) (size!554 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1312)

(declare-datatypes ((BitStream!942 0))(
  ( (BitStream!943 (buf!854 array!1312) (currentByte!2122 (_ BitVec 32)) (currentBit!2117 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!942)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!4734 (= res!16448 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!554 srcBuffer!2)))) (bvsle ((_ sign_extend 32) (size!554 (buf!854 thiss!1379))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!2122 thiss!1379)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!2117 thiss!1379)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!554 (buf!854 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!2122 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!2117 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!4734 e!12179))

(assert (=> start!4734 true))

(declare-fun array_inv!524 (array!1312) Bool)

(assert (=> start!4734 (array_inv!524 srcBuffer!2)))

(declare-fun e!12178 () Bool)

(declare-fun inv!12 (BitStream!942) Bool)

(assert (=> start!4734 (and (inv!12 thiss!1379) e!12178)))

(declare-fun b!18781 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!18781 (= e!12179 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!2117 thiss!1379))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!2122 thiss!1379))) ((_ extract 31 0) ((_ sign_extend 32) (size!554 (buf!854 thiss!1379)))))))))

(declare-fun b!18782 () Bool)

(assert (=> b!18782 (= e!12178 (array_inv!524 (buf!854 thiss!1379)))))

(assert (= (and start!4734 res!16448) b!18781))

(assert (= start!4734 b!18782))

(declare-fun m!25231 () Bool)

(assert (=> start!4734 m!25231))

(declare-fun m!25233 () Bool)

(assert (=> start!4734 m!25233))

(declare-fun m!25235 () Bool)

(assert (=> b!18781 m!25235))

(declare-fun m!25237 () Bool)

(assert (=> b!18782 m!25237))

(check-sat (not b!18781) (not start!4734) (not b!18782))
(check-sat)
(get-model)

(declare-fun d!6234 () Bool)

(assert (=> d!6234 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!2117 thiss!1379))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!2122 thiss!1379))) ((_ extract 31 0) ((_ sign_extend 32) (size!554 (buf!854 thiss!1379))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!2117 thiss!1379))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!2117 thiss!1379))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!2122 thiss!1379))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!2122 thiss!1379))) ((_ extract 31 0) ((_ sign_extend 32) (size!554 (buf!854 thiss!1379))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!2117 thiss!1379))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!2122 thiss!1379))) ((_ extract 31 0) ((_ sign_extend 32) (size!554 (buf!854 thiss!1379)))))))))))

(assert (=> b!18781 d!6234))

(declare-fun d!6236 () Bool)

(assert (=> d!6236 (= (array_inv!524 srcBuffer!2) (bvsge (size!554 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!4734 d!6236))

(declare-fun d!6238 () Bool)

(assert (=> d!6238 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2117 thiss!1379) (currentByte!2122 thiss!1379) (size!554 (buf!854 thiss!1379))))))

(declare-fun bs!1799 () Bool)

(assert (= bs!1799 d!6238))

(declare-fun m!25247 () Bool)

(assert (=> bs!1799 m!25247))

(assert (=> start!4734 d!6238))

(declare-fun d!6240 () Bool)

(assert (=> d!6240 (= (array_inv!524 (buf!854 thiss!1379)) (bvsge (size!554 (buf!854 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!18782 d!6240))

(check-sat (not d!6238))
(check-sat)
