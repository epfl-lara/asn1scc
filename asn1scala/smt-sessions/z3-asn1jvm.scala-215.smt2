; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4374 () Bool)

(assert start!4374)

(declare-fun b!17926 () Bool)

(declare-fun e!11468 () Bool)

(declare-datatypes ((array!1189 0))(
  ( (array!1190 (arr!938 (Array (_ BitVec 32) (_ BitVec 8))) (size!503 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!876 0))(
  ( (BitStream!877 (buf!821 array!1189) (currentByte!2048 (_ BitVec 32)) (currentBit!2043 (_ BitVec 32))) )
))
(declare-fun thiss!1917 () BitStream!876)

(declare-datatypes ((tuple2!2086 0))(
  ( (tuple2!2087 (_1!1113 array!1189) (_2!1113 BitStream!876)) )
))
(declare-fun lt!25975 () tuple2!2086)

(assert (=> b!17926 (= e!11468 (or (not (= (currentByte!2048 thiss!1917) (size!503 (buf!821 (_2!1113 lt!25975))))) (and (= (currentBit!2043 (_2!1113 lt!25975)) #b00000000000000000000000000000000) (= (currentBit!2043 thiss!1917) #b00000000000000000000000000000000))))))

(declare-fun b!17927 () Bool)

(declare-fun e!11471 () Bool)

(declare-fun array_inv!473 (array!1189) Bool)

(assert (=> b!17927 (= e!11471 (array_inv!473 (buf!821 thiss!1917)))))

(declare-fun b!17928 () Bool)

(declare-fun res!15767 () Bool)

(declare-fun e!11469 () Bool)

(assert (=> b!17928 (=> (not res!15767) (not e!11469))))

(declare-fun nBits!604 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!17928 (= res!15767 (validate_offset_bits!1 ((_ sign_extend 32) (size!503 (buf!821 thiss!1917))) ((_ sign_extend 32) (currentByte!2048 thiss!1917)) ((_ sign_extend 32) (currentBit!2043 thiss!1917)) nBits!604))))

(declare-fun b!17929 () Bool)

(declare-fun e!11470 () Bool)

(assert (=> b!17929 (= e!11469 (not e!11470))))

(declare-fun res!15765 () Bool)

(assert (=> b!17929 (=> res!15765 e!11470)))

(assert (=> b!17929 (= res!15765 (not (= (currentByte!2048 thiss!1917) (size!503 (buf!821 (_2!1113 lt!25975))))))))

(assert (=> b!17929 e!11468))

(declare-fun res!15764 () Bool)

(assert (=> b!17929 (=> (not res!15764) (not e!11468))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!17929 (= res!15764 (invariant!0 (currentBit!2043 (_2!1113 lt!25975)) (currentByte!2048 (_2!1113 lt!25975)) (size!503 (buf!821 (_2!1113 lt!25975)))))))

(declare-fun readBits!0 (BitStream!876 (_ BitVec 64)) tuple2!2086)

(assert (=> b!17929 (= lt!25975 (readBits!0 thiss!1917 nBits!604))))

(declare-fun res!15766 () Bool)

(assert (=> start!4374 (=> (not res!15766) (not e!11469))))

(assert (=> start!4374 (= res!15766 (bvsge nBits!604 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!4374 e!11469))

(assert (=> start!4374 true))

(declare-fun inv!12 (BitStream!876) Bool)

(assert (=> start!4374 (and (inv!12 thiss!1917) e!11471)))

(declare-fun b!17930 () Bool)

(assert (=> b!17930 (= e!11470 (invariant!0 (currentBit!2043 thiss!1917) (currentByte!2048 (_2!1113 lt!25975)) (size!503 (buf!821 (_2!1113 lt!25975)))))))

(assert (= (and start!4374 res!15766) b!17928))

(assert (= (and b!17928 res!15767) b!17929))

(assert (= (and b!17929 res!15764) b!17926))

(assert (= (and b!17929 (not res!15765)) b!17930))

(assert (= start!4374 b!17927))

(declare-fun m!24295 () Bool)

(assert (=> start!4374 m!24295))

(declare-fun m!24297 () Bool)

(assert (=> b!17929 m!24297))

(declare-fun m!24299 () Bool)

(assert (=> b!17929 m!24299))

(declare-fun m!24301 () Bool)

(assert (=> b!17927 m!24301))

(declare-fun m!24303 () Bool)

(assert (=> b!17930 m!24303))

(declare-fun m!24305 () Bool)

(assert (=> b!17928 m!24305))

(check-sat (not b!17929) (not start!4374) (not b!17930) (not b!17928) (not b!17927))
(check-sat)
