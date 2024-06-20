; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15856 () Bool)

(assert start!15856)

(declare-fun b!80014 () Bool)

(declare-fun e!52563 () Bool)

(declare-datatypes ((array!3468 0))(
  ( (array!3469 (arr!2206 (Array (_ BitVec 32) (_ BitVec 8))) (size!1599 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2760 0))(
  ( (BitStream!2761 (buf!1989 array!3468) (currentByte!3881 (_ BitVec 32)) (currentBit!3876 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2760)

(declare-fun array_inv!1445 (array!3468) Bool)

(assert (=> b!80014 (= e!52563 (array_inv!1445 (buf!1989 thiss!1716)))))

(declare-fun e!52566 () Bool)

(declare-datatypes ((Unit!5274 0))(
  ( (Unit!5275) )
))
(declare-datatypes ((tuple3!264 0))(
  ( (tuple3!265 (_1!3717 Unit!5274) (_2!3717 BitStream!2760) (_3!153 array!3468)) )
))
(declare-fun lt!127113 () tuple3!264)

(declare-fun b!80015 () Bool)

(declare-fun lt!127112 () (_ BitVec 32))

(declare-fun nBits!516 () (_ BitVec 64))

(assert (=> b!80015 (= e!52566 (and (= (size!1599 (_3!153 lt!127113)) lt!127112) (bvsle (currentByte!3881 thiss!1716) (currentByte!3881 (_2!3717 lt!127113))) (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!516)) (bvsgt nBits!516 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1599 (_3!153 lt!127113)))))))))

(declare-fun b!80016 () Bool)

(declare-fun res!66220 () Bool)

(assert (=> b!80016 (=> (not res!66220) (not e!52566))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!80016 (= res!66220 (invariant!0 (currentBit!3876 (_2!3717 lt!127113)) (currentByte!3881 (_2!3717 lt!127113)) (size!1599 (buf!1989 (_2!3717 lt!127113)))))))

(declare-fun b!80017 () Bool)

(declare-fun res!66219 () Bool)

(assert (=> b!80017 (=> (not res!66219) (not e!52566))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!80017 (= res!66219 (= (bvadd (bitIndex!0 (size!1599 (buf!1989 thiss!1716)) (currentByte!3881 thiss!1716) (currentBit!3876 thiss!1716)) nBits!516) (bitIndex!0 (size!1599 (buf!1989 (_2!3717 lt!127113))) (currentByte!3881 (_2!3717 lt!127113)) (currentBit!3876 (_2!3717 lt!127113)))))))

(declare-fun res!66222 () Bool)

(declare-fun e!52564 () Bool)

(assert (=> start!15856 (=> (not res!66222) (not e!52564))))

(assert (=> start!15856 (= res!66222 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15856 e!52564))

(assert (=> start!15856 true))

(declare-fun inv!12 (BitStream!2760) Bool)

(assert (=> start!15856 (and (inv!12 thiss!1716) e!52563)))

(declare-fun b!80018 () Bool)

(declare-fun res!66221 () Bool)

(assert (=> b!80018 (=> (not res!66221) (not e!52564))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!80018 (= res!66221 (validate_offset_bits!1 ((_ sign_extend 32) (size!1599 (buf!1989 thiss!1716))) ((_ sign_extend 32) (currentByte!3881 thiss!1716)) ((_ sign_extend 32) (currentBit!3876 thiss!1716)) nBits!516))))

(declare-fun b!80019 () Bool)

(assert (=> b!80019 (= e!52564 e!52566)))

(declare-fun res!66223 () Bool)

(assert (=> b!80019 (=> (not res!66223) (not e!52566))))

(assert (=> b!80019 (= res!66223 (= (buf!1989 (_2!3717 lt!127113)) (buf!1989 thiss!1716)))))

(declare-fun readBitsLoop!0 (BitStream!2760 (_ BitVec 64) array!3468 (_ BitVec 64) (_ BitVec 64)) tuple3!264)

(assert (=> b!80019 (= lt!127113 (readBitsLoop!0 thiss!1716 nBits!516 (array!3469 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!127112) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516))))

(assert (=> b!80019 (= lt!127112 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and start!15856 res!66222) b!80018))

(assert (= (and b!80018 res!66221) b!80019))

(assert (= (and b!80019 res!66223) b!80017))

(assert (= (and b!80017 res!66219) b!80016))

(assert (= (and b!80016 res!66220) b!80015))

(assert (= start!15856 b!80014))

(declare-fun m!125549 () Bool)

(assert (=> start!15856 m!125549))

(declare-fun m!125551 () Bool)

(assert (=> b!80018 m!125551))

(declare-fun m!125553 () Bool)

(assert (=> b!80014 m!125553))

(declare-fun m!125555 () Bool)

(assert (=> b!80016 m!125555))

(declare-fun m!125557 () Bool)

(assert (=> b!80017 m!125557))

(declare-fun m!125559 () Bool)

(assert (=> b!80017 m!125559))

(declare-fun m!125561 () Bool)

(assert (=> b!80019 m!125561))

(check-sat (not start!15856) (not b!80018) (not b!80017) (not b!80016) (not b!80014) (not b!80019))
(check-sat)
