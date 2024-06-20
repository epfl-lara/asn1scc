; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!602 () Bool)

(assert start!602)

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!147 0))(
  ( (array!148 (arr!443 (Array (_ BitVec 32) (_ BitVec 8))) (size!56 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!147)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-datatypes ((BitStream!90 0))(
  ( (BitStream!91 (buf!365 array!147) (currentByte!1311 (_ BitVec 32)) (currentBit!1306 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!90)

(assert (=> start!602 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!56 srcBuffer!6)))) (bvsle ((_ sign_extend 32) (size!56 (buf!365 thiss!1486))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!1311 thiss!1486)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!1306 thiss!1486)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!56 (buf!365 thiss!1486))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!1311 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!1306 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!602 true))

(declare-fun array_inv!51 (array!147) Bool)

(assert (=> start!602 (array_inv!51 srcBuffer!6)))

(declare-fun e!1186 () Bool)

(declare-fun inv!12 (BitStream!90) Bool)

(assert (=> start!602 (and (inv!12 thiss!1486) e!1186)))

(declare-fun b!1824 () Bool)

(assert (=> b!1824 (= e!1186 (array_inv!51 (buf!365 thiss!1486)))))

(assert (= start!602 b!1824))

(declare-fun m!1259 () Bool)

(assert (=> start!602 m!1259))

(declare-fun m!1261 () Bool)

(assert (=> start!602 m!1261))

(declare-fun m!1263 () Bool)

(assert (=> b!1824 m!1263))

(check-sat (not start!602) (not b!1824))
(check-sat)
(get-model)

(declare-fun d!1294 () Bool)

(assert (=> d!1294 (= (array_inv!51 srcBuffer!6) (bvsge (size!56 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!602 d!1294))

(declare-fun d!1296 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!1296 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1306 thiss!1486) (currentByte!1311 thiss!1486) (size!56 (buf!365 thiss!1486))))))

(declare-fun bs!492 () Bool)

(assert (= bs!492 d!1296))

(declare-fun m!1271 () Bool)

(assert (=> bs!492 m!1271))

(assert (=> start!602 d!1296))

(declare-fun d!1298 () Bool)

(assert (=> d!1298 (= (array_inv!51 (buf!365 thiss!1486)) (bvsge (size!56 (buf!365 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!1824 d!1298))

(check-sat (not d!1296))
(check-sat)
(get-model)

(declare-fun d!1310 () Bool)

(assert (=> d!1310 (= (invariant!0 (currentBit!1306 thiss!1486) (currentByte!1311 thiss!1486) (size!56 (buf!365 thiss!1486))) (and (bvsge (currentBit!1306 thiss!1486) #b00000000000000000000000000000000) (bvslt (currentBit!1306 thiss!1486) #b00000000000000000000000000001000) (bvsge (currentByte!1311 thiss!1486) #b00000000000000000000000000000000) (or (bvslt (currentByte!1311 thiss!1486) (size!56 (buf!365 thiss!1486))) (and (= (currentBit!1306 thiss!1486) #b00000000000000000000000000000000) (= (currentByte!1311 thiss!1486) (size!56 (buf!365 thiss!1486)))))))))

(assert (=> d!1296 d!1310))

(check-sat)
