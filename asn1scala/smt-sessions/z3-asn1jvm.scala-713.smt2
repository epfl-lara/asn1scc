; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19992 () Bool)

(assert start!19992)

(declare-fun b!99632 () Bool)

(declare-fun e!65215 () Bool)

(declare-fun e!65211 () Bool)

(assert (=> b!99632 (= e!65215 e!65211)))

(declare-fun res!81757 () Bool)

(assert (=> b!99632 (=> (not res!81757) (not e!65211))))

(declare-fun lt!144424 () Bool)

(declare-datatypes ((array!4691 0))(
  ( (array!4692 (arr!2734 (Array (_ BitVec 32) (_ BitVec 8))) (size!2141 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3756 0))(
  ( (BitStream!3757 (buf!2498 array!4691) (currentByte!4944 (_ BitVec 32)) (currentBit!4939 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!6109 0))(
  ( (Unit!6110) )
))
(declare-datatypes ((tuple2!8030 0))(
  ( (tuple2!8031 (_1!4270 Unit!6109) (_2!4270 BitStream!3756)) )
))
(declare-fun lt!144426 () tuple2!8030)

(declare-datatypes ((tuple2!8032 0))(
  ( (tuple2!8033 (_1!4271 BitStream!3756) (_2!4271 Bool)) )
))
(declare-fun lt!144422 () tuple2!8032)

(assert (=> b!99632 (= res!81757 (and (= (_2!4271 lt!144422) lt!144424) (= (_1!4271 lt!144422) (_2!4270 lt!144426))))))

(declare-fun thiss!1305 () BitStream!3756)

(declare-fun readBitPure!0 (BitStream!3756) tuple2!8032)

(declare-fun readerFrom!0 (BitStream!3756 (_ BitVec 32) (_ BitVec 32)) BitStream!3756)

(assert (=> b!99632 (= lt!144422 (readBitPure!0 (readerFrom!0 (_2!4270 lt!144426) (currentBit!4939 thiss!1305) (currentByte!4944 thiss!1305))))))

(declare-fun b!99633 () Bool)

(declare-fun e!65216 () Bool)

(declare-fun array_inv!1943 (array!4691) Bool)

(assert (=> b!99633 (= e!65216 (array_inv!1943 (buf!2498 thiss!1305)))))

(declare-fun res!81761 () Bool)

(declare-fun e!65214 () Bool)

(assert (=> start!19992 (=> (not res!81761) (not e!65214))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!19992 (= res!81761 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!19992 e!65214))

(assert (=> start!19992 true))

(declare-fun inv!12 (BitStream!3756) Bool)

(assert (=> start!19992 (and (inv!12 thiss!1305) e!65216)))

(declare-fun b!99634 () Bool)

(declare-fun res!81754 () Bool)

(assert (=> b!99634 (=> (not res!81754) (not e!65215))))

(declare-fun isPrefixOf!0 (BitStream!3756 BitStream!3756) Bool)

(assert (=> b!99634 (= res!81754 (isPrefixOf!0 thiss!1305 (_2!4270 lt!144426)))))

(declare-fun b!99635 () Bool)

(declare-fun e!65213 () Bool)

(assert (=> b!99635 (= e!65214 (not e!65213))))

(declare-fun res!81758 () Bool)

(assert (=> b!99635 (=> res!81758 e!65213)))

(assert (=> b!99635 (= res!81758 (not (isPrefixOf!0 thiss!1305 (_2!4270 lt!144426))))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun lt!144423 () tuple2!8030)

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3756 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8030)

(assert (=> b!99635 (= lt!144423 (appendNLeastSignificantBitsLoop!0 (_2!4270 lt!144426) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!65217 () Bool)

(assert (=> b!99635 e!65217))

(declare-fun res!81756 () Bool)

(assert (=> b!99635 (=> (not res!81756) (not e!65217))))

(assert (=> b!99635 (= res!81756 (= (size!2141 (buf!2498 thiss!1305)) (size!2141 (buf!2498 (_2!4270 lt!144426)))))))

(declare-fun appendBit!0 (BitStream!3756 Bool) tuple2!8030)

(assert (=> b!99635 (= lt!144426 (appendBit!0 thiss!1305 lt!144424))))

(assert (=> b!99635 (= lt!144424 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!99636 () Bool)

(declare-fun res!81755 () Bool)

(assert (=> b!99636 (=> (not res!81755) (not e!65214))))

(assert (=> b!99636 (= res!81755 (bvslt i!615 nBits!396))))

(declare-fun b!99637 () Bool)

(assert (=> b!99637 (= e!65217 e!65215)))

(declare-fun res!81759 () Bool)

(assert (=> b!99637 (=> (not res!81759) (not e!65215))))

(declare-fun lt!144427 () (_ BitVec 64))

(declare-fun lt!144421 () (_ BitVec 64))

(assert (=> b!99637 (= res!81759 (= lt!144427 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!144421)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!99637 (= lt!144427 (bitIndex!0 (size!2141 (buf!2498 (_2!4270 lt!144426))) (currentByte!4944 (_2!4270 lt!144426)) (currentBit!4939 (_2!4270 lt!144426))))))

(assert (=> b!99637 (= lt!144421 (bitIndex!0 (size!2141 (buf!2498 thiss!1305)) (currentByte!4944 thiss!1305) (currentBit!4939 thiss!1305)))))

(declare-fun b!99638 () Bool)

(declare-fun res!81760 () Bool)

(assert (=> b!99638 (=> (not res!81760) (not e!65214))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!99638 (= res!81760 (validate_offset_bits!1 ((_ sign_extend 32) (size!2141 (buf!2498 thiss!1305))) ((_ sign_extend 32) (currentByte!4944 thiss!1305)) ((_ sign_extend 32) (currentBit!4939 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!99639 () Bool)

(assert (=> b!99639 (= e!65211 (= (bitIndex!0 (size!2141 (buf!2498 (_1!4271 lt!144422))) (currentByte!4944 (_1!4271 lt!144422)) (currentBit!4939 (_1!4271 lt!144422))) lt!144427))))

(declare-fun b!99640 () Bool)

(declare-fun res!81753 () Bool)

(assert (=> b!99640 (=> (not res!81753) (not e!65214))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!99640 (= res!81753 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!99641 () Bool)

(assert (=> b!99641 (= e!65213 true)))

(declare-fun lt!144425 () Bool)

(assert (=> b!99641 (= lt!144425 (isPrefixOf!0 (_2!4270 lt!144426) (_2!4270 lt!144423)))))

(assert (= (and start!19992 res!81761) b!99638))

(assert (= (and b!99638 res!81760) b!99640))

(assert (= (and b!99640 res!81753) b!99636))

(assert (= (and b!99636 res!81755) b!99635))

(assert (= (and b!99635 res!81756) b!99637))

(assert (= (and b!99637 res!81759) b!99634))

(assert (= (and b!99634 res!81754) b!99632))

(assert (= (and b!99632 res!81757) b!99639))

(assert (= (and b!99635 (not res!81758)) b!99641))

(assert (= start!19992 b!99633))

(declare-fun m!144969 () Bool)

(assert (=> b!99638 m!144969))

(declare-fun m!144971 () Bool)

(assert (=> b!99635 m!144971))

(declare-fun m!144973 () Bool)

(assert (=> b!99635 m!144973))

(declare-fun m!144975 () Bool)

(assert (=> b!99635 m!144975))

(declare-fun m!144977 () Bool)

(assert (=> b!99632 m!144977))

(assert (=> b!99632 m!144977))

(declare-fun m!144979 () Bool)

(assert (=> b!99632 m!144979))

(declare-fun m!144981 () Bool)

(assert (=> b!99637 m!144981))

(declare-fun m!144983 () Bool)

(assert (=> b!99637 m!144983))

(declare-fun m!144985 () Bool)

(assert (=> b!99641 m!144985))

(declare-fun m!144987 () Bool)

(assert (=> b!99633 m!144987))

(assert (=> b!99634 m!144971))

(declare-fun m!144989 () Bool)

(assert (=> start!19992 m!144989))

(declare-fun m!144991 () Bool)

(assert (=> b!99640 m!144991))

(declare-fun m!144993 () Bool)

(assert (=> b!99639 m!144993))

(check-sat (not b!99633) (not b!99641) (not start!19992) (not b!99635) (not b!99638) (not b!99632) (not b!99634) (not b!99637) (not b!99640) (not b!99639))
