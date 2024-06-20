; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23916 () Bool)

(assert start!23916)

(declare-fun b!121026 () Bool)

(declare-fun e!79267 () Bool)

(declare-fun e!79273 () Bool)

(assert (=> b!121026 (= e!79267 e!79273)))

(declare-fun res!100221 () Bool)

(assert (=> b!121026 (=> (not res!100221) (not e!79273))))

(declare-datatypes ((array!5376 0))(
  ( (array!5377 (arr!3026 (Array (_ BitVec 32) (_ BitVec 8))) (size!2433 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4340 0))(
  ( (BitStream!4341 (buf!2867 array!5376) (currentByte!5552 (_ BitVec 32)) (currentBit!5547 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4340)

(declare-fun lt!189035 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!121026 (= res!100221 (validate_offset_bits!1 ((_ sign_extend 32) (size!2433 (buf!2867 thiss!1305))) ((_ sign_extend 32) (currentByte!5552 thiss!1305)) ((_ sign_extend 32) (currentBit!5547 thiss!1305)) lt!189035))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!121026 (= lt!189035 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!121027 () Bool)

(declare-fun e!79272 () Bool)

(declare-fun e!79265 () Bool)

(assert (=> b!121027 (= e!79272 e!79265)))

(declare-fun res!100232 () Bool)

(assert (=> b!121027 (=> (not res!100232) (not e!79265))))

(declare-fun lt!189047 () (_ BitVec 64))

(declare-fun lt!189056 () (_ BitVec 64))

(assert (=> b!121027 (= res!100232 (= lt!189047 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!189056)))))

(declare-datatypes ((Unit!7457 0))(
  ( (Unit!7458) )
))
(declare-datatypes ((tuple2!10160 0))(
  ( (tuple2!10161 (_1!5345 Unit!7457) (_2!5345 BitStream!4340)) )
))
(declare-fun lt!189062 () tuple2!10160)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!121027 (= lt!189047 (bitIndex!0 (size!2433 (buf!2867 (_2!5345 lt!189062))) (currentByte!5552 (_2!5345 lt!189062)) (currentBit!5547 (_2!5345 lt!189062))))))

(assert (=> b!121027 (= lt!189056 (bitIndex!0 (size!2433 (buf!2867 thiss!1305)) (currentByte!5552 thiss!1305) (currentBit!5547 thiss!1305)))))

(declare-fun res!100231 () Bool)

(assert (=> start!23916 (=> (not res!100231) (not e!79267))))

(assert (=> start!23916 (= res!100231 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!23916 e!79267))

(assert (=> start!23916 true))

(declare-fun e!79269 () Bool)

(declare-fun inv!12 (BitStream!4340) Bool)

(assert (=> start!23916 (and (inv!12 thiss!1305) e!79269)))

(declare-fun b!121028 () Bool)

(declare-fun e!79274 () Bool)

(assert (=> b!121028 (= e!79273 (not e!79274))))

(declare-fun res!100222 () Bool)

(assert (=> b!121028 (=> res!100222 e!79274)))

(declare-datatypes ((tuple2!10162 0))(
  ( (tuple2!10163 (_1!5346 BitStream!4340) (_2!5346 (_ BitVec 64))) )
))
(declare-fun lt!189053 () tuple2!10162)

(declare-datatypes ((tuple2!10164 0))(
  ( (tuple2!10165 (_1!5347 BitStream!4340) (_2!5347 BitStream!4340)) )
))
(declare-fun lt!189054 () tuple2!10164)

(assert (=> b!121028 (= res!100222 (not (= (_1!5346 lt!189053) (_2!5347 lt!189054))))))

(declare-fun lt!189039 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4340 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10162)

(assert (=> b!121028 (= lt!189053 (readNLeastSignificantBitsLoopPure!0 (_1!5347 lt!189054) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!189039))))

(declare-fun lt!189052 () tuple2!10160)

(declare-fun lt!189043 () (_ BitVec 64))

(assert (=> b!121028 (validate_offset_bits!1 ((_ sign_extend 32) (size!2433 (buf!2867 (_2!5345 lt!189052)))) ((_ sign_extend 32) (currentByte!5552 (_2!5345 lt!189062))) ((_ sign_extend 32) (currentBit!5547 (_2!5345 lt!189062))) lt!189043)))

(declare-fun lt!189041 () Unit!7457)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4340 array!5376 (_ BitVec 64)) Unit!7457)

(assert (=> b!121028 (= lt!189041 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5345 lt!189062) (buf!2867 (_2!5345 lt!189052)) lt!189043))))

(assert (=> b!121028 (= lt!189043 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!189040 () (_ BitVec 64))

(declare-datatypes ((tuple2!10166 0))(
  ( (tuple2!10167 (_1!5348 BitStream!4340) (_2!5348 Bool)) )
))
(declare-fun lt!189048 () tuple2!10166)

(declare-fun lt!189050 () (_ BitVec 64))

(assert (=> b!121028 (= lt!189039 (bvor lt!189040 (ite (_2!5348 lt!189048) lt!189050 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!189037 () tuple2!10164)

(declare-fun lt!189038 () tuple2!10162)

(assert (=> b!121028 (= lt!189038 (readNLeastSignificantBitsLoopPure!0 (_1!5347 lt!189037) nBits!396 i!615 lt!189040))))

(assert (=> b!121028 (validate_offset_bits!1 ((_ sign_extend 32) (size!2433 (buf!2867 (_2!5345 lt!189052)))) ((_ sign_extend 32) (currentByte!5552 thiss!1305)) ((_ sign_extend 32) (currentBit!5547 thiss!1305)) lt!189035)))

(declare-fun lt!189061 () Unit!7457)

(assert (=> b!121028 (= lt!189061 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2867 (_2!5345 lt!189052)) lt!189035))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!121028 (= lt!189040 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!189042 () Bool)

(assert (=> b!121028 (= (_2!5348 lt!189048) lt!189042)))

(declare-fun readBitPure!0 (BitStream!4340) tuple2!10166)

(assert (=> b!121028 (= lt!189048 (readBitPure!0 (_1!5347 lt!189037)))))

(declare-fun reader!0 (BitStream!4340 BitStream!4340) tuple2!10164)

(assert (=> b!121028 (= lt!189054 (reader!0 (_2!5345 lt!189062) (_2!5345 lt!189052)))))

(assert (=> b!121028 (= lt!189037 (reader!0 thiss!1305 (_2!5345 lt!189052)))))

(declare-fun e!79275 () Bool)

(assert (=> b!121028 e!79275))

(declare-fun res!100224 () Bool)

(assert (=> b!121028 (=> (not res!100224) (not e!79275))))

(declare-fun lt!189057 () tuple2!10166)

(declare-fun lt!189049 () tuple2!10166)

(assert (=> b!121028 (= res!100224 (= (bitIndex!0 (size!2433 (buf!2867 (_1!5348 lt!189057))) (currentByte!5552 (_1!5348 lt!189057)) (currentBit!5547 (_1!5348 lt!189057))) (bitIndex!0 (size!2433 (buf!2867 (_1!5348 lt!189049))) (currentByte!5552 (_1!5348 lt!189049)) (currentBit!5547 (_1!5348 lt!189049)))))))

(declare-fun lt!189051 () Unit!7457)

(declare-fun lt!189059 () BitStream!4340)

(declare-fun readBitPrefixLemma!0 (BitStream!4340 BitStream!4340) Unit!7457)

(assert (=> b!121028 (= lt!189051 (readBitPrefixLemma!0 lt!189059 (_2!5345 lt!189052)))))

(assert (=> b!121028 (= lt!189049 (readBitPure!0 (BitStream!4341 (buf!2867 (_2!5345 lt!189052)) (currentByte!5552 thiss!1305) (currentBit!5547 thiss!1305))))))

(assert (=> b!121028 (= lt!189057 (readBitPure!0 lt!189059))))

(assert (=> b!121028 (= lt!189059 (BitStream!4341 (buf!2867 (_2!5345 lt!189062)) (currentByte!5552 thiss!1305) (currentBit!5547 thiss!1305)))))

(declare-fun e!79266 () Bool)

(assert (=> b!121028 e!79266))

(declare-fun res!100228 () Bool)

(assert (=> b!121028 (=> (not res!100228) (not e!79266))))

(declare-fun isPrefixOf!0 (BitStream!4340 BitStream!4340) Bool)

(assert (=> b!121028 (= res!100228 (isPrefixOf!0 thiss!1305 (_2!5345 lt!189052)))))

(declare-fun lt!189055 () Unit!7457)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4340 BitStream!4340 BitStream!4340) Unit!7457)

(assert (=> b!121028 (= lt!189055 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5345 lt!189062) (_2!5345 lt!189052)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4340 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!10160)

(assert (=> b!121028 (= lt!189052 (appendNLeastSignificantBitsLoop!0 (_2!5345 lt!189062) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!121028 e!79272))

(declare-fun res!100223 () Bool)

(assert (=> b!121028 (=> (not res!100223) (not e!79272))))

(assert (=> b!121028 (= res!100223 (= (size!2433 (buf!2867 thiss!1305)) (size!2433 (buf!2867 (_2!5345 lt!189062)))))))

(declare-fun appendBit!0 (BitStream!4340 Bool) tuple2!10160)

(assert (=> b!121028 (= lt!189062 (appendBit!0 thiss!1305 lt!189042))))

(assert (=> b!121028 (= lt!189042 (not (= (bvand v!199 lt!189050) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!121028 (= lt!189050 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!121029 () Bool)

(assert (=> b!121029 (= e!79275 (= (_2!5348 lt!189057) (_2!5348 lt!189049)))))

(declare-fun b!121030 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!121030 (= e!79266 (invariant!0 (currentBit!5547 thiss!1305) (currentByte!5552 thiss!1305) (size!2433 (buf!2867 (_2!5345 lt!189052)))))))

(declare-fun b!121031 () Bool)

(declare-fun array_inv!2235 (array!5376) Bool)

(assert (=> b!121031 (= e!79269 (array_inv!2235 (buf!2867 thiss!1305)))))

(declare-fun b!121032 () Bool)

(declare-fun e!79268 () Bool)

(assert (=> b!121032 (= e!79265 e!79268)))

(declare-fun res!100229 () Bool)

(assert (=> b!121032 (=> (not res!100229) (not e!79268))))

(declare-fun lt!189044 () tuple2!10166)

(assert (=> b!121032 (= res!100229 (and (= (_2!5348 lt!189044) lt!189042) (= (_1!5348 lt!189044) (_2!5345 lt!189062))))))

(declare-fun readerFrom!0 (BitStream!4340 (_ BitVec 32) (_ BitVec 32)) BitStream!4340)

(assert (=> b!121032 (= lt!189044 (readBitPure!0 (readerFrom!0 (_2!5345 lt!189062) (currentBit!5547 thiss!1305) (currentByte!5552 thiss!1305))))))

(declare-fun b!121033 () Bool)

(declare-fun res!100226 () Bool)

(assert (=> b!121033 (=> (not res!100226) (not e!79266))))

(assert (=> b!121033 (= res!100226 (invariant!0 (currentBit!5547 thiss!1305) (currentByte!5552 thiss!1305) (size!2433 (buf!2867 (_2!5345 lt!189062)))))))

(declare-fun b!121034 () Bool)

(assert (=> b!121034 (= e!79268 (= (bitIndex!0 (size!2433 (buf!2867 (_1!5348 lt!189044))) (currentByte!5552 (_1!5348 lt!189044)) (currentBit!5547 (_1!5348 lt!189044))) lt!189047))))

(declare-fun b!121035 () Bool)

(declare-fun lt!189046 () BitStream!4340)

(assert (=> b!121035 (= e!79274 (or (not (= (_1!5347 lt!189054) lt!189046)) (= (_2!5346 lt!189038) (_2!5346 lt!189053))))))

(declare-fun e!79270 () Bool)

(assert (=> b!121035 e!79270))

(declare-fun res!100230 () Bool)

(assert (=> b!121035 (=> (not res!100230) (not e!79270))))

(declare-fun lt!189045 () (_ BitVec 64))

(declare-fun lt!189063 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4340 (_ BitVec 64)) BitStream!4340)

(assert (=> b!121035 (= res!100230 (= (_1!5347 lt!189054) (withMovedBitIndex!0 (_2!5347 lt!189054) (bvsub lt!189045 lt!189063))))))

(assert (=> b!121035 (= lt!189045 (bitIndex!0 (size!2433 (buf!2867 (_2!5345 lt!189062))) (currentByte!5552 (_2!5345 lt!189062)) (currentBit!5547 (_2!5345 lt!189062))))))

(declare-fun lt!189058 () (_ BitVec 64))

(assert (=> b!121035 (= (_1!5347 lt!189037) (withMovedBitIndex!0 (_2!5347 lt!189037) (bvsub lt!189058 lt!189063)))))

(assert (=> b!121035 (= lt!189063 (bitIndex!0 (size!2433 (buf!2867 (_2!5345 lt!189052))) (currentByte!5552 (_2!5345 lt!189052)) (currentBit!5547 (_2!5345 lt!189052))))))

(assert (=> b!121035 (= lt!189058 (bitIndex!0 (size!2433 (buf!2867 thiss!1305)) (currentByte!5552 thiss!1305) (currentBit!5547 thiss!1305)))))

(declare-fun lt!189036 () tuple2!10162)

(assert (=> b!121035 (and (= (_2!5346 lt!189038) (_2!5346 lt!189036)) (= (_1!5346 lt!189038) (_1!5346 lt!189036)))))

(declare-fun lt!189060 () Unit!7457)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4340 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7457)

(assert (=> b!121035 (= lt!189060 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5347 lt!189037) nBits!396 i!615 lt!189040))))

(assert (=> b!121035 (= lt!189036 (readNLeastSignificantBitsLoopPure!0 lt!189046 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!189039))))

(assert (=> b!121035 (= lt!189046 (withMovedBitIndex!0 (_1!5347 lt!189037) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!121036 () Bool)

(declare-fun res!100233 () Bool)

(assert (=> b!121036 (=> (not res!100233) (not e!79265))))

(assert (=> b!121036 (= res!100233 (isPrefixOf!0 thiss!1305 (_2!5345 lt!189062)))))

(declare-fun b!121037 () Bool)

(assert (=> b!121037 (= e!79270 (= lt!189058 (bvsub lt!189045 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!121038 () Bool)

(declare-fun res!100225 () Bool)

(assert (=> b!121038 (=> (not res!100225) (not e!79273))))

(assert (=> b!121038 (= res!100225 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!121039 () Bool)

(declare-fun res!100227 () Bool)

(assert (=> b!121039 (=> (not res!100227) (not e!79273))))

(assert (=> b!121039 (= res!100227 (bvslt i!615 nBits!396))))

(assert (= (and start!23916 res!100231) b!121026))

(assert (= (and b!121026 res!100221) b!121038))

(assert (= (and b!121038 res!100225) b!121039))

(assert (= (and b!121039 res!100227) b!121028))

(assert (= (and b!121028 res!100223) b!121027))

(assert (= (and b!121027 res!100232) b!121036))

(assert (= (and b!121036 res!100233) b!121032))

(assert (= (and b!121032 res!100229) b!121034))

(assert (= (and b!121028 res!100228) b!121033))

(assert (= (and b!121033 res!100226) b!121030))

(assert (= (and b!121028 res!100224) b!121029))

(assert (= (and b!121028 (not res!100222)) b!121035))

(assert (= (and b!121035 res!100230) b!121037))

(assert (= start!23916 b!121031))

(declare-fun m!183177 () Bool)

(assert (=> b!121031 m!183177))

(declare-fun m!183179 () Bool)

(assert (=> b!121035 m!183179))

(declare-fun m!183181 () Bool)

(assert (=> b!121035 m!183181))

(declare-fun m!183183 () Bool)

(assert (=> b!121035 m!183183))

(declare-fun m!183185 () Bool)

(assert (=> b!121035 m!183185))

(declare-fun m!183187 () Bool)

(assert (=> b!121035 m!183187))

(declare-fun m!183189 () Bool)

(assert (=> b!121035 m!183189))

(declare-fun m!183191 () Bool)

(assert (=> b!121035 m!183191))

(declare-fun m!183193 () Bool)

(assert (=> b!121035 m!183193))

(declare-fun m!183195 () Bool)

(assert (=> b!121038 m!183195))

(declare-fun m!183197 () Bool)

(assert (=> b!121032 m!183197))

(assert (=> b!121032 m!183197))

(declare-fun m!183199 () Bool)

(assert (=> b!121032 m!183199))

(declare-fun m!183201 () Bool)

(assert (=> b!121034 m!183201))

(declare-fun m!183203 () Bool)

(assert (=> b!121033 m!183203))

(declare-fun m!183205 () Bool)

(assert (=> b!121026 m!183205))

(declare-fun m!183207 () Bool)

(assert (=> start!23916 m!183207))

(declare-fun m!183209 () Bool)

(assert (=> b!121036 m!183209))

(declare-fun m!183211 () Bool)

(assert (=> b!121028 m!183211))

(declare-fun m!183213 () Bool)

(assert (=> b!121028 m!183213))

(declare-fun m!183215 () Bool)

(assert (=> b!121028 m!183215))

(declare-fun m!183217 () Bool)

(assert (=> b!121028 m!183217))

(declare-fun m!183219 () Bool)

(assert (=> b!121028 m!183219))

(declare-fun m!183221 () Bool)

(assert (=> b!121028 m!183221))

(declare-fun m!183223 () Bool)

(assert (=> b!121028 m!183223))

(declare-fun m!183225 () Bool)

(assert (=> b!121028 m!183225))

(declare-fun m!183227 () Bool)

(assert (=> b!121028 m!183227))

(declare-fun m!183229 () Bool)

(assert (=> b!121028 m!183229))

(declare-fun m!183231 () Bool)

(assert (=> b!121028 m!183231))

(declare-fun m!183233 () Bool)

(assert (=> b!121028 m!183233))

(declare-fun m!183235 () Bool)

(assert (=> b!121028 m!183235))

(declare-fun m!183237 () Bool)

(assert (=> b!121028 m!183237))

(declare-fun m!183239 () Bool)

(assert (=> b!121028 m!183239))

(declare-fun m!183241 () Bool)

(assert (=> b!121028 m!183241))

(declare-fun m!183243 () Bool)

(assert (=> b!121028 m!183243))

(declare-fun m!183245 () Bool)

(assert (=> b!121028 m!183245))

(declare-fun m!183247 () Bool)

(assert (=> b!121028 m!183247))

(assert (=> b!121027 m!183179))

(assert (=> b!121027 m!183185))

(declare-fun m!183249 () Bool)

(assert (=> b!121030 m!183249))

(push 1)

