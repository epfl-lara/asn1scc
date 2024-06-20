; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!622 () Bool)

(assert start!622)

(declare-fun res!3676 () Bool)

(declare-fun e!1218 () Bool)

(assert (=> start!622 (=> (not res!3676) (not e!1218))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun nBits!460 () (_ BitVec 64))

(declare-datatypes ((array!156 0))(
  ( (array!157 (arr!446 (Array (_ BitVec 32) (_ BitVec 8))) (size!59 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!96 0))(
  ( (BitStream!97 (buf!368 array!156) (currentByte!1315 (_ BitVec 32)) (currentBit!1310 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!96)

(declare-fun srcBuffer!6 () array!156)

(assert (=> start!622 (= res!3676 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!59 srcBuffer!6)))) (bvsle ((_ sign_extend 32) (size!59 (buf!368 thiss!1486))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!1315 thiss!1486)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!1310 thiss!1486)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!59 (buf!368 thiss!1486))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!1315 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!1310 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!622 e!1218))

(assert (=> start!622 true))

(declare-fun array_inv!54 (array!156) Bool)

(assert (=> start!622 (array_inv!54 srcBuffer!6)))

(declare-fun e!1220 () Bool)

(declare-fun inv!12 (BitStream!96) Bool)

(assert (=> start!622 (and (inv!12 thiss!1486) e!1220)))

(declare-fun b!1838 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1838 (= e!1218 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1310 thiss!1486))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1315 thiss!1486))) ((_ extract 31 0) ((_ sign_extend 32) (size!59 (buf!368 thiss!1486)))))))))

(declare-fun b!1839 () Bool)

(assert (=> b!1839 (= e!1220 (array_inv!54 (buf!368 thiss!1486)))))

(assert (= (and start!622 res!3676) b!1838))

(assert (= start!622 b!1839))

(declare-fun m!1285 () Bool)

(assert (=> start!622 m!1285))

(declare-fun m!1287 () Bool)

(assert (=> start!622 m!1287))

(declare-fun m!1289 () Bool)

(assert (=> b!1838 m!1289))

(declare-fun m!1291 () Bool)

(assert (=> b!1839 m!1291))

(check-sat (not start!622) (not b!1839) (not b!1838))
(check-sat)
(get-model)

(declare-fun d!1316 () Bool)

(assert (=> d!1316 (= (array_inv!54 srcBuffer!6) (bvsge (size!59 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!622 d!1316))

(declare-fun d!1318 () Bool)

(assert (=> d!1318 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1310 thiss!1486) (currentByte!1315 thiss!1486) (size!59 (buf!368 thiss!1486))))))

(declare-fun bs!498 () Bool)

(assert (= bs!498 d!1318))

(declare-fun m!1301 () Bool)

(assert (=> bs!498 m!1301))

(assert (=> start!622 d!1318))

(declare-fun d!1322 () Bool)

(assert (=> d!1322 (= (array_inv!54 (buf!368 thiss!1486)) (bvsge (size!59 (buf!368 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!1839 d!1322))

(declare-fun d!1324 () Bool)

(assert (=> d!1324 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1310 thiss!1486))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1315 thiss!1486))) ((_ extract 31 0) ((_ sign_extend 32) (size!59 (buf!368 thiss!1486))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1310 thiss!1486))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1310 thiss!1486))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1315 thiss!1486))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1315 thiss!1486))) ((_ extract 31 0) ((_ sign_extend 32) (size!59 (buf!368 thiss!1486))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1310 thiss!1486))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1315 thiss!1486))) ((_ extract 31 0) ((_ sign_extend 32) (size!59 (buf!368 thiss!1486)))))))))))

(assert (=> b!1838 d!1324))

(check-sat (not d!1318))
(check-sat)
