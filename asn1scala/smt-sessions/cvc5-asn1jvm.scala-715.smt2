; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20002 () Bool)

(assert start!20002)

(declare-fun b!99815 () Bool)

(declare-fun e!65333 () Bool)

(declare-fun e!65332 () Bool)

(assert (=> b!99815 (= e!65333 e!65332)))

(declare-fun res!81924 () Bool)

(assert (=> b!99815 (=> (not res!81924) (not e!65332))))

(declare-fun lt!144549 () Bool)

(declare-datatypes ((array!4701 0))(
  ( (array!4702 (arr!2739 (Array (_ BitVec 32) (_ BitVec 8))) (size!2146 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3766 0))(
  ( (BitStream!3767 (buf!2503 array!4701) (currentByte!4949 (_ BitVec 32)) (currentBit!4944 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!8050 0))(
  ( (tuple2!8051 (_1!4280 BitStream!3766) (_2!4280 Bool)) )
))
(declare-fun lt!144552 () tuple2!8050)

(declare-datatypes ((Unit!6119 0))(
  ( (Unit!6120) )
))
(declare-datatypes ((tuple2!8052 0))(
  ( (tuple2!8053 (_1!4281 Unit!6119) (_2!4281 BitStream!3766)) )
))
(declare-fun lt!144556 () tuple2!8052)

(assert (=> b!99815 (= res!81924 (and (= (_2!4280 lt!144552) lt!144549) (= (_1!4280 lt!144552) (_2!4281 lt!144556))))))

(declare-fun thiss!1305 () BitStream!3766)

(declare-fun readBitPure!0 (BitStream!3766) tuple2!8050)

(declare-fun readerFrom!0 (BitStream!3766 (_ BitVec 32) (_ BitVec 32)) BitStream!3766)

(assert (=> b!99815 (= lt!144552 (readBitPure!0 (readerFrom!0 (_2!4281 lt!144556) (currentBit!4944 thiss!1305) (currentByte!4949 thiss!1305))))))

(declare-fun b!99816 () Bool)

(declare-fun res!81932 () Bool)

(assert (=> b!99816 (=> (not res!81932) (not e!65333))))

(declare-fun isPrefixOf!0 (BitStream!3766 BitStream!3766) Bool)

(assert (=> b!99816 (= res!81932 (isPrefixOf!0 thiss!1305 (_2!4281 lt!144556)))))

(declare-fun res!81927 () Bool)

(declare-fun e!65331 () Bool)

(assert (=> start!20002 (=> (not res!81927) (not e!65331))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!20002 (= res!81927 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20002 e!65331))

(assert (=> start!20002 true))

(declare-fun e!65334 () Bool)

(declare-fun inv!12 (BitStream!3766) Bool)

(assert (=> start!20002 (and (inv!12 thiss!1305) e!65334)))

(declare-fun b!99817 () Bool)

(declare-fun res!81923 () Bool)

(declare-fun e!65327 () Bool)

(assert (=> b!99817 (=> res!81923 e!65327)))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!99817 (= res!81923 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!2146 (buf!2503 (_2!4281 lt!144556)))) ((_ sign_extend 32) (currentByte!4949 thiss!1305)) ((_ sign_extend 32) (currentBit!4944 thiss!1305)))))))

(declare-fun b!99818 () Bool)

(declare-fun res!81928 () Bool)

(assert (=> b!99818 (=> (not res!81928) (not e!65331))))

(assert (=> b!99818 (= res!81928 (bvslt i!615 nBits!396))))

(declare-fun b!99819 () Bool)

(declare-fun res!81925 () Bool)

(assert (=> b!99819 (=> res!81925 e!65327)))

(declare-fun lt!144553 () tuple2!8052)

(declare-fun arrayBitRangesEq!0 (array!4701 array!4701 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!99819 (= res!81925 (not (arrayBitRangesEq!0 (buf!2503 (_2!4281 lt!144556)) (buf!2503 (_2!4281 lt!144553)) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2146 (buf!2503 (_2!4281 lt!144556))) (currentByte!4949 thiss!1305) (currentBit!4944 thiss!1305))))))))

(declare-fun b!99820 () Bool)

(declare-fun e!65329 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!99820 (= e!65329 (invariant!0 (currentBit!4944 thiss!1305) (currentByte!4949 thiss!1305) (size!2146 (buf!2503 (_2!4281 lt!144556)))))))

(declare-fun b!99821 () Bool)

(assert (=> b!99821 (= e!65327 true)))

(declare-fun lt!144550 () tuple2!8050)

(assert (=> b!99821 (= lt!144550 (readBitPure!0 (BitStream!3767 (buf!2503 (_2!4281 lt!144553)) (currentByte!4949 thiss!1305) (currentBit!4944 thiss!1305))))))

(declare-fun lt!144555 () tuple2!8050)

(assert (=> b!99821 (= lt!144555 (readBitPure!0 (BitStream!3767 (buf!2503 (_2!4281 lt!144556)) (currentByte!4949 thiss!1305) (currentBit!4944 thiss!1305))))))

(assert (=> b!99821 (invariant!0 (currentBit!4944 thiss!1305) (currentByte!4949 thiss!1305) (size!2146 (buf!2503 (_2!4281 lt!144553))))))

(declare-fun b!99822 () Bool)

(declare-fun lt!144548 () (_ BitVec 64))

(assert (=> b!99822 (= e!65332 (= (bitIndex!0 (size!2146 (buf!2503 (_1!4280 lt!144552))) (currentByte!4949 (_1!4280 lt!144552)) (currentBit!4944 (_1!4280 lt!144552))) lt!144548))))

(declare-fun b!99823 () Bool)

(declare-fun array_inv!1948 (array!4701) Bool)

(assert (=> b!99823 (= e!65334 (array_inv!1948 (buf!2503 thiss!1305)))))

(declare-fun b!99824 () Bool)

(declare-fun res!81930 () Bool)

(assert (=> b!99824 (=> (not res!81930) (not e!65331))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!99824 (= res!81930 (validate_offset_bits!1 ((_ sign_extend 32) (size!2146 (buf!2503 thiss!1305))) ((_ sign_extend 32) (currentByte!4949 thiss!1305)) ((_ sign_extend 32) (currentBit!4944 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!99825 () Bool)

(declare-fun res!81929 () Bool)

(assert (=> b!99825 (=> (not res!81929) (not e!65331))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!99825 (= res!81929 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!99826 () Bool)

(assert (=> b!99826 (= e!65331 (not e!65327))))

(declare-fun res!81926 () Bool)

(assert (=> b!99826 (=> res!81926 e!65327)))

(assert (=> b!99826 (= res!81926 (not (= (size!2146 (buf!2503 (_2!4281 lt!144556))) (size!2146 (buf!2503 (_2!4281 lt!144553))))))))

(assert (=> b!99826 e!65329))

(declare-fun res!81931 () Bool)

(assert (=> b!99826 (=> (not res!81931) (not e!65329))))

(assert (=> b!99826 (= res!81931 (isPrefixOf!0 thiss!1305 (_2!4281 lt!144553)))))

(declare-fun lt!144551 () Unit!6119)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3766 BitStream!3766 BitStream!3766) Unit!6119)

(assert (=> b!99826 (= lt!144551 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4281 lt!144556) (_2!4281 lt!144553)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3766 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8052)

(assert (=> b!99826 (= lt!144553 (appendNLeastSignificantBitsLoop!0 (_2!4281 lt!144556) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!65328 () Bool)

(assert (=> b!99826 e!65328))

(declare-fun res!81921 () Bool)

(assert (=> b!99826 (=> (not res!81921) (not e!65328))))

(assert (=> b!99826 (= res!81921 (= (size!2146 (buf!2503 thiss!1305)) (size!2146 (buf!2503 (_2!4281 lt!144556)))))))

(declare-fun appendBit!0 (BitStream!3766 Bool) tuple2!8052)

(assert (=> b!99826 (= lt!144556 (appendBit!0 thiss!1305 lt!144549))))

(assert (=> b!99826 (= lt!144549 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!99827 () Bool)

(assert (=> b!99827 (= e!65328 e!65333)))

(declare-fun res!81922 () Bool)

(assert (=> b!99827 (=> (not res!81922) (not e!65333))))

(declare-fun lt!144554 () (_ BitVec 64))

(assert (=> b!99827 (= res!81922 (= lt!144548 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!144554)))))

(assert (=> b!99827 (= lt!144548 (bitIndex!0 (size!2146 (buf!2503 (_2!4281 lt!144556))) (currentByte!4949 (_2!4281 lt!144556)) (currentBit!4944 (_2!4281 lt!144556))))))

(assert (=> b!99827 (= lt!144554 (bitIndex!0 (size!2146 (buf!2503 thiss!1305)) (currentByte!4949 thiss!1305) (currentBit!4944 thiss!1305)))))

(assert (= (and start!20002 res!81927) b!99824))

(assert (= (and b!99824 res!81930) b!99825))

(assert (= (and b!99825 res!81929) b!99818))

(assert (= (and b!99818 res!81928) b!99826))

(assert (= (and b!99826 res!81921) b!99827))

(assert (= (and b!99827 res!81922) b!99816))

(assert (= (and b!99816 res!81932) b!99815))

(assert (= (and b!99815 res!81924) b!99822))

(assert (= (and b!99826 res!81931) b!99820))

(assert (= (and b!99826 (not res!81926)) b!99817))

(assert (= (and b!99817 (not res!81923)) b!99819))

(assert (= (and b!99819 (not res!81925)) b!99821))

(assert (= start!20002 b!99823))

(declare-fun m!145147 () Bool)

(assert (=> start!20002 m!145147))

(declare-fun m!145149 () Bool)

(assert (=> b!99819 m!145149))

(declare-fun m!145151 () Bool)

(assert (=> b!99819 m!145151))

(declare-fun m!145153 () Bool)

(assert (=> b!99825 m!145153))

(declare-fun m!145155 () Bool)

(assert (=> b!99820 m!145155))

(declare-fun m!145157 () Bool)

(assert (=> b!99816 m!145157))

(declare-fun m!145159 () Bool)

(assert (=> b!99815 m!145159))

(assert (=> b!99815 m!145159))

(declare-fun m!145161 () Bool)

(assert (=> b!99815 m!145161))

(declare-fun m!145163 () Bool)

(assert (=> b!99823 m!145163))

(declare-fun m!145165 () Bool)

(assert (=> b!99817 m!145165))

(declare-fun m!145167 () Bool)

(assert (=> b!99822 m!145167))

(declare-fun m!145169 () Bool)

(assert (=> b!99824 m!145169))

(declare-fun m!145171 () Bool)

(assert (=> b!99826 m!145171))

(declare-fun m!145173 () Bool)

(assert (=> b!99826 m!145173))

(declare-fun m!145175 () Bool)

(assert (=> b!99826 m!145175))

(declare-fun m!145177 () Bool)

(assert (=> b!99826 m!145177))

(declare-fun m!145179 () Bool)

(assert (=> b!99821 m!145179))

(declare-fun m!145181 () Bool)

(assert (=> b!99821 m!145181))

(declare-fun m!145183 () Bool)

(assert (=> b!99821 m!145183))

(declare-fun m!145185 () Bool)

(assert (=> b!99827 m!145185))

(declare-fun m!145187 () Bool)

(assert (=> b!99827 m!145187))

(push 1)

(assert (not b!99826))

(assert (not b!99821))

(assert (not b!99817))

(assert (not b!99827))

(assert (not b!99823))

(assert (not b!99815))

(assert (not b!99819))

(assert (not b!99816))

(assert (not b!99825))

(assert (not b!99820))

(assert (not b!99824))

(assert (not start!20002))

(assert (not b!99822))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

