; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15862 () Bool)

(assert start!15862)

(declare-fun b!80068 () Bool)

(declare-fun res!66267 () Bool)

(declare-fun e!52599 () Bool)

(assert (=> b!80068 (=> res!66267 e!52599)))

(declare-datatypes ((array!3474 0))(
  ( (array!3475 (arr!2209 (Array (_ BitVec 32) (_ BitVec 8))) (size!1602 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2766 0))(
  ( (BitStream!2767 (buf!1992 array!3474) (currentByte!3884 (_ BitVec 32)) (currentBit!3879 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!5280 0))(
  ( (Unit!5281) )
))
(declare-datatypes ((tuple3!270 0))(
  ( (tuple3!271 (_1!3720 Unit!5280) (_2!3720 BitStream!2766) (_3!156 array!3474)) )
))
(declare-fun lt!127135 () tuple3!270)

(declare-fun nBits!516 () (_ BitVec 64))

(declare-fun thiss!1716 () BitStream!2766)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!80068 (= res!66267 (not (= (bvadd (bitIndex!0 (size!1602 (buf!1992 thiss!1716)) (currentByte!3884 thiss!1716) (currentBit!3879 thiss!1716)) nBits!516) (bitIndex!0 (size!1602 (buf!1992 (_2!3720 lt!127135))) (currentByte!3884 (_2!3720 lt!127135)) (currentBit!3879 (_2!3720 lt!127135))))))))

(declare-fun b!80069 () Bool)

(declare-fun res!66266 () Bool)

(assert (=> b!80069 (=> res!66266 e!52599)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!80069 (= res!66266 (not (invariant!0 (currentBit!3879 (_2!3720 lt!127135)) (currentByte!3884 (_2!3720 lt!127135)) (size!1602 (buf!1992 (_2!3720 lt!127135))))))))

(declare-fun b!80070 () Bool)

(declare-fun e!52600 () Bool)

(declare-fun array_inv!1448 (array!3474) Bool)

(assert (=> b!80070 (= e!52600 (array_inv!1448 (buf!1992 thiss!1716)))))

(declare-fun b!80071 () Bool)

(declare-fun e!52602 () Bool)

(assert (=> b!80071 (= e!52602 false)))

(declare-fun lt!127137 () Bool)

(assert (=> b!80071 (= lt!127137 e!52599)))

(declare-fun res!66264 () Bool)

(assert (=> b!80071 (=> res!66264 e!52599)))

(assert (=> b!80071 (= res!66264 (not (= (buf!1992 (_2!3720 lt!127135)) (buf!1992 thiss!1716))))))

(declare-fun lt!127136 () (_ BitVec 32))

(declare-fun readBitsLoop!0 (BitStream!2766 (_ BitVec 64) array!3474 (_ BitVec 64) (_ BitVec 64)) tuple3!270)

(assert (=> b!80071 (= lt!127135 (readBitsLoop!0 thiss!1716 nBits!516 (array!3475 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!127136) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516))))

(assert (=> b!80071 (= lt!127136 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun res!66268 () Bool)

(assert (=> start!15862 (=> (not res!66268) (not e!52602))))

(assert (=> start!15862 (= res!66268 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15862 e!52602))

(assert (=> start!15862 true))

(declare-fun inv!12 (BitStream!2766) Bool)

(assert (=> start!15862 (and (inv!12 thiss!1716) e!52600)))

(declare-fun b!80072 () Bool)

(declare-fun res!66265 () Bool)

(assert (=> b!80072 (=> (not res!66265) (not e!52602))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!80072 (= res!66265 (validate_offset_bits!1 ((_ sign_extend 32) (size!1602 (buf!1992 thiss!1716))) ((_ sign_extend 32) (currentByte!3884 thiss!1716)) ((_ sign_extend 32) (currentBit!3879 thiss!1716)) nBits!516))))

(declare-fun b!80073 () Bool)

(assert (=> b!80073 (= e!52599 (or (not (= (size!1602 (_3!156 lt!127135)) lt!127136)) (bvsgt (currentByte!3884 thiss!1716) (currentByte!3884 (_2!3720 lt!127135)))))))

(assert (= (and start!15862 res!66268) b!80072))

(assert (= (and b!80072 res!66265) b!80071))

(assert (= (and b!80071 (not res!66264)) b!80068))

(assert (= (and b!80068 (not res!66267)) b!80069))

(assert (= (and b!80069 (not res!66266)) b!80073))

(assert (= start!15862 b!80070))

(declare-fun m!125591 () Bool)

(assert (=> b!80072 m!125591))

(declare-fun m!125593 () Bool)

(assert (=> b!80070 m!125593))

(declare-fun m!125595 () Bool)

(assert (=> b!80068 m!125595))

(declare-fun m!125597 () Bool)

(assert (=> b!80068 m!125597))

(declare-fun m!125599 () Bool)

(assert (=> b!80069 m!125599))

(declare-fun m!125601 () Bool)

(assert (=> start!15862 m!125601))

(declare-fun m!125603 () Bool)

(assert (=> b!80071 m!125603))

(check-sat (not start!15862) (not b!80070) (not b!80071) (not b!80069) (not b!80068) (not b!80072))
