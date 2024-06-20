; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4372 () Bool)

(assert start!4372)

(declare-fun b!17911 () Bool)

(declare-fun res!15754 () Bool)

(declare-fun e!11455 () Bool)

(assert (=> b!17911 (=> (not res!15754) (not e!11455))))

(declare-datatypes ((array!1187 0))(
  ( (array!1188 (arr!937 (Array (_ BitVec 32) (_ BitVec 8))) (size!502 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!874 0))(
  ( (BitStream!875 (buf!820 array!1187) (currentByte!2047 (_ BitVec 32)) (currentBit!2042 (_ BitVec 32))) )
))
(declare-fun thiss!1917 () BitStream!874)

(declare-fun nBits!604 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!17911 (= res!15754 (validate_offset_bits!1 ((_ sign_extend 32) (size!502 (buf!820 thiss!1917))) ((_ sign_extend 32) (currentByte!2047 thiss!1917)) ((_ sign_extend 32) (currentBit!2042 thiss!1917)) nBits!604))))

(declare-fun b!17912 () Bool)

(declare-fun e!11453 () Bool)

(declare-fun array_inv!472 (array!1187) Bool)

(assert (=> b!17912 (= e!11453 (array_inv!472 (buf!820 thiss!1917)))))

(declare-fun b!17913 () Bool)

(declare-fun e!11457 () Bool)

(assert (=> b!17913 (= e!11455 (not e!11457))))

(declare-fun res!15755 () Bool)

(assert (=> b!17913 (=> res!15755 e!11457)))

(declare-datatypes ((tuple2!2084 0))(
  ( (tuple2!2085 (_1!1112 array!1187) (_2!1112 BitStream!874)) )
))
(declare-fun lt!25972 () tuple2!2084)

(assert (=> b!17913 (= res!15755 (not (= (currentByte!2047 thiss!1917) (size!502 (buf!820 (_2!1112 lt!25972))))))))

(declare-fun e!11454 () Bool)

(assert (=> b!17913 e!11454))

(declare-fun res!15753 () Bool)

(assert (=> b!17913 (=> (not res!15753) (not e!11454))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!17913 (= res!15753 (invariant!0 (currentBit!2042 (_2!1112 lt!25972)) (currentByte!2047 (_2!1112 lt!25972)) (size!502 (buf!820 (_2!1112 lt!25972)))))))

(declare-fun readBits!0 (BitStream!874 (_ BitVec 64)) tuple2!2084)

(assert (=> b!17913 (= lt!25972 (readBits!0 thiss!1917 nBits!604))))

(declare-fun res!15752 () Bool)

(assert (=> start!4372 (=> (not res!15752) (not e!11455))))

(assert (=> start!4372 (= res!15752 (bvsge nBits!604 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!4372 e!11455))

(assert (=> start!4372 true))

(declare-fun inv!12 (BitStream!874) Bool)

(assert (=> start!4372 (and (inv!12 thiss!1917) e!11453)))

(declare-fun b!17914 () Bool)

(assert (=> b!17914 (= e!11457 (invariant!0 (currentBit!2042 thiss!1917) (currentByte!2047 (_2!1112 lt!25972)) (size!502 (buf!820 (_2!1112 lt!25972)))))))

(declare-fun b!17915 () Bool)

(assert (=> b!17915 (= e!11454 (or (not (= (currentByte!2047 thiss!1917) (size!502 (buf!820 (_2!1112 lt!25972))))) (and (= (currentBit!2042 (_2!1112 lt!25972)) #b00000000000000000000000000000000) (= (currentBit!2042 thiss!1917) #b00000000000000000000000000000000))))))

(assert (= (and start!4372 res!15752) b!17911))

(assert (= (and b!17911 res!15754) b!17913))

(assert (= (and b!17913 res!15753) b!17915))

(assert (= (and b!17913 (not res!15755)) b!17914))

(assert (= start!4372 b!17912))

(declare-fun m!24283 () Bool)

(assert (=> b!17911 m!24283))

(declare-fun m!24285 () Bool)

(assert (=> start!4372 m!24285))

(declare-fun m!24287 () Bool)

(assert (=> b!17912 m!24287))

(declare-fun m!24289 () Bool)

(assert (=> b!17913 m!24289))

(declare-fun m!24291 () Bool)

(assert (=> b!17913 m!24291))

(declare-fun m!24293 () Bool)

(assert (=> b!17914 m!24293))

(push 1)

(assert (not b!17911))

(assert (not b!17914))

(assert (not b!17913))

(assert (not start!4372))

(assert (not b!17912))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

