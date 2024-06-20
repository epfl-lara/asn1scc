; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22384 () Bool)

(assert start!22384)

(declare-fun b!113186 () Bool)

(declare-fun res!93469 () Bool)

(declare-fun e!74273 () Bool)

(assert (=> b!113186 (=> (not res!93469) (not e!74273))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!113186 (= res!93469 (bvslt i!615 nBits!396))))

(declare-fun b!113187 () Bool)

(declare-fun e!74274 () Bool)

(declare-fun e!74272 () Bool)

(assert (=> b!113187 (= e!74274 e!74272)))

(declare-fun res!93468 () Bool)

(assert (=> b!113187 (=> (not res!93468) (not e!74272))))

(declare-datatypes ((array!5148 0))(
  ( (array!5149 (arr!2933 (Array (_ BitVec 32) (_ BitVec 8))) (size!2340 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4154 0))(
  ( (BitStream!4155 (buf!2748 array!5148) (currentByte!5328 (_ BitVec 32)) (currentBit!5323 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!6947 0))(
  ( (Unit!6948) )
))
(declare-datatypes ((tuple2!9320 0))(
  ( (tuple2!9321 (_1!4922 Unit!6947) (_2!4922 BitStream!4154)) )
))
(declare-fun lt!171963 () tuple2!9320)

(declare-datatypes ((tuple2!9322 0))(
  ( (tuple2!9323 (_1!4923 BitStream!4154) (_2!4923 Bool)) )
))
(declare-fun lt!171960 () tuple2!9322)

(declare-fun lt!171962 () Bool)

(assert (=> b!113187 (= res!93468 (and (= (_2!4923 lt!171960) lt!171962) (= (_1!4923 lt!171960) (_2!4922 lt!171963))))))

(declare-fun thiss!1305 () BitStream!4154)

(declare-fun readBitPure!0 (BitStream!4154) tuple2!9322)

(declare-fun readerFrom!0 (BitStream!4154 (_ BitVec 32) (_ BitVec 32)) BitStream!4154)

(assert (=> b!113187 (= lt!171960 (readBitPure!0 (readerFrom!0 (_2!4922 lt!171963) (currentBit!5323 thiss!1305) (currentByte!5328 thiss!1305))))))

(declare-fun b!113188 () Bool)

(declare-fun res!93470 () Bool)

(assert (=> b!113188 (=> (not res!93470) (not e!74274))))

(declare-fun isPrefixOf!0 (BitStream!4154 BitStream!4154) Bool)

(assert (=> b!113188 (= res!93470 (isPrefixOf!0 thiss!1305 (_2!4922 lt!171963)))))

(declare-fun b!113189 () Bool)

(declare-fun res!93472 () Bool)

(assert (=> b!113189 (=> (not res!93472) (not e!74273))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!113189 (= res!93472 (validate_offset_bits!1 ((_ sign_extend 32) (size!2340 (buf!2748 thiss!1305))) ((_ sign_extend 32) (currentByte!5328 thiss!1305)) ((_ sign_extend 32) (currentBit!5323 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun res!93473 () Bool)

(assert (=> start!22384 (=> (not res!93473) (not e!74273))))

(assert (=> start!22384 (= res!93473 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22384 e!74273))

(assert (=> start!22384 true))

(declare-fun e!74270 () Bool)

(declare-fun inv!12 (BitStream!4154) Bool)

(assert (=> start!22384 (and (inv!12 thiss!1305) e!74270)))

(declare-fun b!113190 () Bool)

(declare-fun e!74271 () Bool)

(assert (=> b!113190 (= e!74271 e!74274)))

(declare-fun res!93471 () Bool)

(assert (=> b!113190 (=> (not res!93471) (not e!74274))))

(declare-fun lt!171961 () (_ BitVec 64))

(declare-fun lt!171964 () (_ BitVec 64))

(assert (=> b!113190 (= res!93471 (= lt!171961 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!171964)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!113190 (= lt!171961 (bitIndex!0 (size!2340 (buf!2748 (_2!4922 lt!171963))) (currentByte!5328 (_2!4922 lt!171963)) (currentBit!5323 (_2!4922 lt!171963))))))

(assert (=> b!113190 (= lt!171964 (bitIndex!0 (size!2340 (buf!2748 thiss!1305)) (currentByte!5328 thiss!1305) (currentBit!5323 thiss!1305)))))

(declare-fun b!113191 () Bool)

(assert (=> b!113191 (= e!74273 (not (isPrefixOf!0 thiss!1305 (_2!4922 lt!171963))))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun lt!171965 () tuple2!9320)

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4154 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9320)

(assert (=> b!113191 (= lt!171965 (appendNLeastSignificantBitsLoop!0 (_2!4922 lt!171963) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!113191 e!74271))

(declare-fun res!93466 () Bool)

(assert (=> b!113191 (=> (not res!93466) (not e!74271))))

(assert (=> b!113191 (= res!93466 (= (size!2340 (buf!2748 thiss!1305)) (size!2340 (buf!2748 (_2!4922 lt!171963)))))))

(declare-fun appendBit!0 (BitStream!4154 Bool) tuple2!9320)

(assert (=> b!113191 (= lt!171963 (appendBit!0 thiss!1305 lt!171962))))

(assert (=> b!113191 (= lt!171962 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!113192 () Bool)

(declare-fun res!93467 () Bool)

(assert (=> b!113192 (=> (not res!93467) (not e!74273))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!113192 (= res!93467 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!113193 () Bool)

(assert (=> b!113193 (= e!74272 (= (bitIndex!0 (size!2340 (buf!2748 (_1!4923 lt!171960))) (currentByte!5328 (_1!4923 lt!171960)) (currentBit!5323 (_1!4923 lt!171960))) lt!171961))))

(declare-fun b!113194 () Bool)

(declare-fun array_inv!2142 (array!5148) Bool)

(assert (=> b!113194 (= e!74270 (array_inv!2142 (buf!2748 thiss!1305)))))

(assert (= (and start!22384 res!93473) b!113189))

(assert (= (and b!113189 res!93472) b!113192))

(assert (= (and b!113192 res!93467) b!113186))

(assert (= (and b!113186 res!93469) b!113191))

(assert (= (and b!113191 res!93466) b!113190))

(assert (= (and b!113190 res!93471) b!113188))

(assert (= (and b!113188 res!93470) b!113187))

(assert (= (and b!113187 res!93468) b!113193))

(assert (= start!22384 b!113194))

(declare-fun m!169207 () Bool)

(assert (=> start!22384 m!169207))

(declare-fun m!169209 () Bool)

(assert (=> b!113187 m!169209))

(assert (=> b!113187 m!169209))

(declare-fun m!169211 () Bool)

(assert (=> b!113187 m!169211))

(declare-fun m!169213 () Bool)

(assert (=> b!113190 m!169213))

(declare-fun m!169215 () Bool)

(assert (=> b!113190 m!169215))

(declare-fun m!169217 () Bool)

(assert (=> b!113193 m!169217))

(declare-fun m!169219 () Bool)

(assert (=> b!113192 m!169219))

(declare-fun m!169221 () Bool)

(assert (=> b!113188 m!169221))

(declare-fun m!169223 () Bool)

(assert (=> b!113189 m!169223))

(declare-fun m!169225 () Bool)

(assert (=> b!113194 m!169225))

(assert (=> b!113191 m!169221))

(declare-fun m!169227 () Bool)

(assert (=> b!113191 m!169227))

(declare-fun m!169229 () Bool)

(assert (=> b!113191 m!169229))

(push 1)

