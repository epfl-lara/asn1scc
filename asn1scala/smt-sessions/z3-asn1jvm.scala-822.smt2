; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24388 () Bool)

(assert start!24388)

(declare-fun b!123999 () Bool)

(declare-fun res!102791 () Bool)

(declare-fun e!81285 () Bool)

(assert (=> b!123999 (=> (not res!102791) (not e!81285))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!123999 (= res!102791 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!124000 () Bool)

(declare-fun res!102789 () Bool)

(assert (=> b!124000 (=> (not res!102789) (not e!81285))))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!124000 (= res!102789 (bvsge i!615 nBits!396))))

(declare-fun res!102792 () Bool)

(declare-fun e!81284 () Bool)

(assert (=> start!24388 (=> (not res!102792) (not e!81284))))

(assert (=> start!24388 (= res!102792 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!24388 e!81284))

(assert (=> start!24388 true))

(declare-datatypes ((array!5449 0))(
  ( (array!5450 (arr!3058 (Array (_ BitVec 32) (_ BitVec 8))) (size!2465 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4404 0))(
  ( (BitStream!4405 (buf!2911 array!5449) (currentByte!5617 (_ BitVec 32)) (currentBit!5612 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4404)

(declare-fun e!81282 () Bool)

(declare-fun inv!12 (BitStream!4404) Bool)

(assert (=> start!24388 (and (inv!12 thiss!1305) e!81282)))

(declare-fun lt!195709 () (_ BitVec 64))

(declare-fun lt!195711 () (_ BitVec 64))

(declare-fun b!124001 () Bool)

(declare-fun lt!195708 () (_ BitVec 64))

(assert (=> b!124001 (= e!81285 (not (or (not (= lt!195711 (bvand lt!195708 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!195711 (bvand (bvadd lt!195709 lt!195708) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!124001 (= lt!195711 (bvand lt!195709 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!124001 (= lt!195709 (bitIndex!0 (size!2465 (buf!2911 thiss!1305)) (currentByte!5617 thiss!1305) (currentBit!5612 thiss!1305)))))

(declare-fun isPrefixOf!0 (BitStream!4404 BitStream!4404) Bool)

(assert (=> b!124001 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-datatypes ((Unit!7674 0))(
  ( (Unit!7675) )
))
(declare-fun lt!195710 () Unit!7674)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4404) Unit!7674)

(assert (=> b!124001 (= lt!195710 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun b!124002 () Bool)

(declare-fun array_inv!2267 (array!5449) Bool)

(assert (=> b!124002 (= e!81282 (array_inv!2267 (buf!2911 thiss!1305)))))

(declare-fun b!124003 () Bool)

(assert (=> b!124003 (= e!81284 e!81285)))

(declare-fun res!102790 () Bool)

(assert (=> b!124003 (=> (not res!102790) (not e!81285))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!124003 (= res!102790 (validate_offset_bits!1 ((_ sign_extend 32) (size!2465 (buf!2911 thiss!1305))) ((_ sign_extend 32) (currentByte!5617 thiss!1305)) ((_ sign_extend 32) (currentBit!5612 thiss!1305)) lt!195708))))

(assert (=> b!124003 (= lt!195708 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (= (and start!24388 res!102792) b!124003))

(assert (= (and b!124003 res!102790) b!123999))

(assert (= (and b!123999 res!102791) b!124000))

(assert (= (and b!124000 res!102789) b!124001))

(assert (= start!24388 b!124002))

(declare-fun m!189231 () Bool)

(assert (=> start!24388 m!189231))

(declare-fun m!189233 () Bool)

(assert (=> b!124002 m!189233))

(declare-fun m!189235 () Bool)

(assert (=> b!124001 m!189235))

(declare-fun m!189237 () Bool)

(assert (=> b!124001 m!189237))

(declare-fun m!189239 () Bool)

(assert (=> b!124001 m!189239))

(declare-fun m!189241 () Bool)

(assert (=> b!123999 m!189241))

(declare-fun m!189243 () Bool)

(assert (=> b!124003 m!189243))

(check-sat (not b!123999) (not b!124001) (not start!24388) (not b!124003) (not b!124002))
(check-sat)
