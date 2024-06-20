; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19912 () Bool)

(assert start!19912)

(declare-fun res!81316 () Bool)

(declare-fun e!64896 () Bool)

(assert (=> start!19912 (=> (not res!81316) (not e!64896))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!19912 (= res!81316 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!19912 e!64896))

(assert (=> start!19912 true))

(declare-datatypes ((array!4662 0))(
  ( (array!4663 (arr!2721 (Array (_ BitVec 32) (_ BitVec 8))) (size!2128 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3730 0))(
  ( (BitStream!3731 (buf!2485 array!4662) (currentByte!4925 (_ BitVec 32)) (currentBit!4920 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3730)

(declare-fun e!64894 () Bool)

(declare-fun inv!12 (BitStream!3730) Bool)

(assert (=> start!19912 (and (inv!12 thiss!1305) e!64894)))

(declare-fun b!99153 () Bool)

(declare-fun array_inv!1930 (array!4662) Bool)

(assert (=> b!99153 (= e!64894 (array_inv!1930 (buf!2485 thiss!1305)))))

(declare-fun b!99154 () Bool)

(assert (=> b!99154 (= e!64896 (not (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun e!64895 () Bool)

(assert (=> b!99154 e!64895))

(declare-fun res!81314 () Bool)

(assert (=> b!99154 (=> (not res!81314) (not e!64895))))

(declare-datatypes ((Unit!6083 0))(
  ( (Unit!6084) )
))
(declare-datatypes ((tuple2!7972 0))(
  ( (tuple2!7973 (_1!4241 Unit!6083) (_2!4241 BitStream!3730)) )
))
(declare-fun lt!144066 () tuple2!7972)

(assert (=> b!99154 (= res!81314 (= (size!2128 (buf!2485 thiss!1305)) (size!2128 (buf!2485 (_2!4241 lt!144066)))))))

(declare-fun lt!144065 () Bool)

(declare-fun appendBit!0 (BitStream!3730 Bool) tuple2!7972)

(assert (=> b!99154 (= lt!144066 (appendBit!0 thiss!1305 lt!144065))))

(declare-fun v!199 () (_ BitVec 64))

(assert (=> b!99154 (= lt!144065 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!99155 () Bool)

(declare-fun e!64898 () Bool)

(declare-datatypes ((tuple2!7974 0))(
  ( (tuple2!7975 (_1!4242 BitStream!3730) (_2!4242 Bool)) )
))
(declare-fun lt!144063 () tuple2!7974)

(declare-fun lt!144067 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!99155 (= e!64898 (= (bitIndex!0 (size!2128 (buf!2485 (_1!4242 lt!144063))) (currentByte!4925 (_1!4242 lt!144063)) (currentBit!4920 (_1!4242 lt!144063))) lt!144067))))

(declare-fun b!99156 () Bool)

(declare-fun res!81318 () Bool)

(assert (=> b!99156 (=> (not res!81318) (not e!64896))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!99156 (= res!81318 (validate_offset_bits!1 ((_ sign_extend 32) (size!2128 (buf!2485 thiss!1305))) ((_ sign_extend 32) (currentByte!4925 thiss!1305)) ((_ sign_extend 32) (currentBit!4920 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!99157 () Bool)

(declare-fun e!64897 () Bool)

(assert (=> b!99157 (= e!64897 e!64898)))

(declare-fun res!81320 () Bool)

(assert (=> b!99157 (=> (not res!81320) (not e!64898))))

(assert (=> b!99157 (= res!81320 (and (= (_2!4242 lt!144063) lt!144065) (= (_1!4242 lt!144063) (_2!4241 lt!144066))))))

(declare-fun readBitPure!0 (BitStream!3730) tuple2!7974)

(declare-fun readerFrom!0 (BitStream!3730 (_ BitVec 32) (_ BitVec 32)) BitStream!3730)

(assert (=> b!99157 (= lt!144063 (readBitPure!0 (readerFrom!0 (_2!4241 lt!144066) (currentBit!4920 thiss!1305) (currentByte!4925 thiss!1305))))))

(declare-fun b!99158 () Bool)

(declare-fun res!81319 () Bool)

(assert (=> b!99158 (=> (not res!81319) (not e!64897))))

(declare-fun isPrefixOf!0 (BitStream!3730 BitStream!3730) Bool)

(assert (=> b!99158 (= res!81319 (isPrefixOf!0 thiss!1305 (_2!4241 lt!144066)))))

(declare-fun b!99159 () Bool)

(assert (=> b!99159 (= e!64895 e!64897)))

(declare-fun res!81317 () Bool)

(assert (=> b!99159 (=> (not res!81317) (not e!64897))))

(declare-fun lt!144064 () (_ BitVec 64))

(assert (=> b!99159 (= res!81317 (= lt!144067 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!144064)))))

(assert (=> b!99159 (= lt!144067 (bitIndex!0 (size!2128 (buf!2485 (_2!4241 lt!144066))) (currentByte!4925 (_2!4241 lt!144066)) (currentBit!4920 (_2!4241 lt!144066))))))

(assert (=> b!99159 (= lt!144064 (bitIndex!0 (size!2128 (buf!2485 thiss!1305)) (currentByte!4925 thiss!1305) (currentBit!4920 thiss!1305)))))

(declare-fun b!99160 () Bool)

(declare-fun res!81315 () Bool)

(assert (=> b!99160 (=> (not res!81315) (not e!64896))))

(assert (=> b!99160 (= res!81315 (bvslt i!615 nBits!396))))

(declare-fun b!99161 () Bool)

(declare-fun res!81313 () Bool)

(assert (=> b!99161 (=> (not res!81313) (not e!64896))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!99161 (= res!81313 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(assert (= (and start!19912 res!81316) b!99156))

(assert (= (and b!99156 res!81318) b!99161))

(assert (= (and b!99161 res!81313) b!99160))

(assert (= (and b!99160 res!81315) b!99154))

(assert (= (and b!99154 res!81314) b!99159))

(assert (= (and b!99159 res!81317) b!99158))

(assert (= (and b!99158 res!81319) b!99157))

(assert (= (and b!99157 res!81320) b!99155))

(assert (= start!19912 b!99153))

(declare-fun m!144565 () Bool)

(assert (=> b!99159 m!144565))

(declare-fun m!144567 () Bool)

(assert (=> b!99159 m!144567))

(declare-fun m!144569 () Bool)

(assert (=> b!99156 m!144569))

(declare-fun m!144571 () Bool)

(assert (=> b!99157 m!144571))

(assert (=> b!99157 m!144571))

(declare-fun m!144573 () Bool)

(assert (=> b!99157 m!144573))

(declare-fun m!144575 () Bool)

(assert (=> start!19912 m!144575))

(declare-fun m!144577 () Bool)

(assert (=> b!99158 m!144577))

(declare-fun m!144579 () Bool)

(assert (=> b!99155 m!144579))

(declare-fun m!144581 () Bool)

(assert (=> b!99153 m!144581))

(declare-fun m!144583 () Bool)

(assert (=> b!99154 m!144583))

(declare-fun m!144585 () Bool)

(assert (=> b!99161 m!144585))

(push 1)

(assert (not b!99155))

(assert (not b!99154))

(assert (not b!99156))

(assert (not b!99158))

(assert (not b!99153))

(assert (not start!19912))

(assert (not b!99161))

(assert (not b!99159))

(assert (not b!99157))

(check-sat)

(pop 1)

(push 1)

(check-sat)

