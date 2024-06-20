; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73036 () Bool)

(assert start!73036)

(declare-fun b!325000 () Bool)

(declare-fun e!234268 () Bool)

(declare-datatypes ((array!20944 0))(
  ( (array!20945 (arr!10190 (Array (_ BitVec 32) (_ BitVec 8))) (size!9098 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14358 0))(
  ( (BitStream!14359 (buf!8240 array!20944) (currentByte!15266 (_ BitVec 32)) (currentBit!15261 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14358)

(declare-fun array_inv!8650 (array!20944) Bool)

(assert (=> b!325000 (= e!234268 (array_inv!8650 (buf!8240 thiss!877)))))

(declare-fun b!324998 () Bool)

(declare-fun res!266724 () Bool)

(declare-fun e!234269 () Bool)

(assert (=> b!324998 (=> (not res!266724) (not e!234269))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!324998 (= res!266724 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!9098 (buf!8240 thiss!877)) (currentByte!15266 thiss!877) (currentBit!15261 thiss!877))) (bitIndex!0 (size!9098 (buf!8240 thiss!877)) (bvadd #b00000000000000000000000000000001 (currentByte!15266 thiss!877)) #b00000000000000000000000000000000)))))

(declare-fun res!266725 () Bool)

(assert (=> start!73036 (=> (not res!266725) (not e!234269))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!73036 (= res!266725 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9098 (buf!8240 thiss!877))) ((_ sign_extend 32) (currentByte!15266 thiss!877)) ((_ sign_extend 32) (currentBit!15261 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!73036 e!234269))

(declare-fun inv!12 (BitStream!14358) Bool)

(assert (=> start!73036 (and (inv!12 thiss!877) e!234268)))

(declare-fun b!324999 () Bool)

(assert (=> b!324999 (= e!234269 (or (bvsgt ((_ sign_extend 32) (size!9098 (buf!8240 thiss!877))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15266 thiss!877))) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun b!324997 () Bool)

(declare-fun res!266723 () Bool)

(assert (=> b!324997 (=> (not res!266723) (not e!234269))))

(assert (=> b!324997 (= res!266723 (bvsge (currentBit!15261 thiss!877) #b00000000000000000000000000000111))))

(assert (= (and start!73036 res!266725) b!324997))

(assert (= (and b!324997 res!266723) b!324998))

(assert (= (and b!324998 res!266724) b!324999))

(assert (= start!73036 b!325000))

(declare-fun m!463019 () Bool)

(assert (=> b!325000 m!463019))

(declare-fun m!463021 () Bool)

(assert (=> b!324998 m!463021))

(declare-fun m!463023 () Bool)

(assert (=> b!324998 m!463023))

(declare-fun m!463025 () Bool)

(assert (=> start!73036 m!463025))

(declare-fun m!463027 () Bool)

(assert (=> start!73036 m!463027))

(check-sat (not b!325000) (not start!73036) (not b!324998))
(check-sat)
