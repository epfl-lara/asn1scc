; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4722 () Bool)

(assert start!4722)

(declare-datatypes ((array!1305 0))(
  ( (array!1306 (arr!992 (Array (_ BitVec 32) (_ BitVec 8))) (size!551 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1305)

(declare-datatypes ((BitStream!936 0))(
  ( (BitStream!937 (buf!851 array!1305) (currentByte!2118 (_ BitVec 32)) (currentBit!2113 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!936)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!4722 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!551 srcBuffer!2)))) (bvsle ((_ sign_extend 32) (size!551 (buf!851 thiss!1379))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!2118 thiss!1379)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!2113 thiss!1379)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!551 (buf!851 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!2118 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!2113 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!4722 true))

(declare-fun array_inv!521 (array!1305) Bool)

(assert (=> start!4722 (array_inv!521 srcBuffer!2)))

(declare-fun e!12146 () Bool)

(declare-fun inv!12 (BitStream!936) Bool)

(assert (=> start!4722 (and (inv!12 thiss!1379) e!12146)))

(declare-fun b!18767 () Bool)

(assert (=> b!18767 (= e!12146 (array_inv!521 (buf!851 thiss!1379)))))

(assert (= start!4722 b!18767))

(declare-fun m!25209 () Bool)

(assert (=> start!4722 m!25209))

(declare-fun m!25211 () Bool)

(assert (=> start!4722 m!25211))

(declare-fun m!25213 () Bool)

(assert (=> b!18767 m!25213))

(check-sat (not b!18767) (not start!4722))
(check-sat)
(get-model)

(declare-fun d!6224 () Bool)

(assert (=> d!6224 (= (array_inv!521 (buf!851 thiss!1379)) (bvsge (size!551 (buf!851 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!18767 d!6224))

(declare-fun d!6226 () Bool)

(assert (=> d!6226 (= (array_inv!521 srcBuffer!2) (bvsge (size!551 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!4722 d!6226))

(declare-fun d!6228 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!6228 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2113 thiss!1379) (currentByte!2118 thiss!1379) (size!551 (buf!851 thiss!1379))))))

(declare-fun bs!1795 () Bool)

(assert (= bs!1795 d!6228))

(declare-fun m!25221 () Bool)

(assert (=> bs!1795 m!25221))

(assert (=> start!4722 d!6228))

(check-sat (not d!6228))
(check-sat)
(get-model)

(declare-fun d!6230 () Bool)

(assert (=> d!6230 (= (invariant!0 (currentBit!2113 thiss!1379) (currentByte!2118 thiss!1379) (size!551 (buf!851 thiss!1379))) (and (bvsge (currentBit!2113 thiss!1379) #b00000000000000000000000000000000) (bvslt (currentBit!2113 thiss!1379) #b00000000000000000000000000001000) (bvsge (currentByte!2118 thiss!1379) #b00000000000000000000000000000000) (or (bvslt (currentByte!2118 thiss!1379) (size!551 (buf!851 thiss!1379))) (and (= (currentBit!2113 thiss!1379) #b00000000000000000000000000000000) (= (currentByte!2118 thiss!1379) (size!551 (buf!851 thiss!1379)))))))))

(assert (=> d!6228 d!6230))

(check-sat)
