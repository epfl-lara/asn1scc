; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41916 () Bool)

(assert start!41916)

(declare-fun b!197344 () Bool)

(declare-fun e!135538 () Bool)

(declare-fun e!135536 () Bool)

(assert (=> b!197344 (= e!135538 e!135536)))

(declare-fun res!165165 () Bool)

(assert (=> b!197344 (=> (not res!165165) (not e!135536))))

(declare-fun lt!307162 () (_ BitVec 64))

(declare-fun lt!307163 () (_ BitVec 64))

(assert (=> b!197344 (= res!165165 (= lt!307162 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!307163)))))

(declare-datatypes ((array!10101 0))(
  ( (array!10102 (arr!5382 (Array (_ BitVec 32) (_ BitVec 8))) (size!4452 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8012 0))(
  ( (BitStream!8013 (buf!4938 array!10101) (currentByte!9276 (_ BitVec 32)) (currentBit!9271 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!13969 0))(
  ( (Unit!13970) )
))
(declare-datatypes ((tuple2!17068 0))(
  ( (tuple2!17069 (_1!9179 Unit!13969) (_2!9179 BitStream!8012)) )
))
(declare-fun lt!307157 () tuple2!17068)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!197344 (= lt!307162 (bitIndex!0 (size!4452 (buf!4938 (_2!9179 lt!307157))) (currentByte!9276 (_2!9179 lt!307157)) (currentBit!9271 (_2!9179 lt!307157))))))

(declare-fun thiss!1204 () BitStream!8012)

(assert (=> b!197344 (= lt!307163 (bitIndex!0 (size!4452 (buf!4938 thiss!1204)) (currentByte!9276 thiss!1204) (currentBit!9271 thiss!1204)))))

(declare-fun b!197345 () Bool)

(declare-fun e!135537 () Bool)

(declare-datatypes ((tuple2!17070 0))(
  ( (tuple2!17071 (_1!9180 BitStream!8012) (_2!9180 Bool)) )
))
(declare-fun lt!307159 () tuple2!17070)

(assert (=> b!197345 (= e!135537 (= (bitIndex!0 (size!4452 (buf!4938 (_1!9180 lt!307159))) (currentByte!9276 (_1!9180 lt!307159)) (currentBit!9271 (_1!9180 lt!307159))) lt!307162))))

(declare-fun b!197346 () Bool)

(declare-fun res!165174 () Bool)

(declare-fun e!135539 () Bool)

(assert (=> b!197346 (=> res!165174 e!135539)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!307165 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!307161 () (_ BitVec 64))

(declare-fun lt!307160 () tuple2!17068)

(assert (=> b!197346 (= res!165174 (or (not (= (size!4452 (buf!4938 (_2!9179 lt!307160))) (size!4452 (buf!4938 thiss!1204)))) (not (= lt!307161 (bvsub (bvadd lt!307165 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!197347 () Bool)

(declare-fun res!165166 () Bool)

(assert (=> b!197347 (=> res!165166 e!135539)))

(declare-fun isPrefixOf!0 (BitStream!8012 BitStream!8012) Bool)

(assert (=> b!197347 (= res!165166 (not (isPrefixOf!0 (_2!9179 lt!307157) (_2!9179 lt!307160))))))

(declare-fun b!197349 () Bool)

(assert (=> b!197349 (= e!135539 (isPrefixOf!0 thiss!1204 (_2!9179 lt!307157)))))

(declare-fun b!197350 () Bool)

(declare-fun res!165170 () Bool)

(assert (=> b!197350 (=> (not res!165170) (not e!135536))))

(assert (=> b!197350 (= res!165170 (isPrefixOf!0 thiss!1204 (_2!9179 lt!307157)))))

(declare-fun b!197351 () Bool)

(declare-fun e!135540 () Bool)

(declare-fun array_inv!4193 (array!10101) Bool)

(assert (=> b!197351 (= e!135540 (array_inv!4193 (buf!4938 thiss!1204)))))

(declare-fun b!197352 () Bool)

(declare-fun res!165175 () Bool)

(declare-fun e!135535 () Bool)

(assert (=> b!197352 (=> (not res!165175) (not e!135535))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!197352 (= res!165175 (validate_offset_bits!1 ((_ sign_extend 32) (size!4452 (buf!4938 thiss!1204))) ((_ sign_extend 32) (currentByte!9276 thiss!1204)) ((_ sign_extend 32) (currentBit!9271 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!197353 () Bool)

(declare-fun res!165169 () Bool)

(assert (=> b!197353 (=> res!165169 e!135539)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!197353 (= res!165169 (not (invariant!0 (currentBit!9271 (_2!9179 lt!307160)) (currentByte!9276 (_2!9179 lt!307160)) (size!4452 (buf!4938 (_2!9179 lt!307160))))))))

(declare-fun b!197354 () Bool)

(declare-fun res!165176 () Bool)

(assert (=> b!197354 (=> (not res!165176) (not e!135535))))

(assert (=> b!197354 (= res!165176 (invariant!0 (currentBit!9271 thiss!1204) (currentByte!9276 thiss!1204) (size!4452 (buf!4938 thiss!1204))))))

(declare-fun b!197355 () Bool)

(declare-fun e!135541 () Bool)

(assert (=> b!197355 (= e!135535 (not e!135541))))

(declare-fun res!165168 () Bool)

(assert (=> b!197355 (=> res!165168 e!135541)))

(declare-fun lt!307156 () (_ BitVec 64))

(assert (=> b!197355 (= res!165168 (not (= lt!307156 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!307165))))))

(assert (=> b!197355 (= lt!307156 (bitIndex!0 (size!4452 (buf!4938 (_2!9179 lt!307157))) (currentByte!9276 (_2!9179 lt!307157)) (currentBit!9271 (_2!9179 lt!307157))))))

(assert (=> b!197355 (= lt!307165 (bitIndex!0 (size!4452 (buf!4938 thiss!1204)) (currentByte!9276 thiss!1204) (currentBit!9271 thiss!1204)))))

(assert (=> b!197355 e!135538))

(declare-fun res!165167 () Bool)

(assert (=> b!197355 (=> (not res!165167) (not e!135538))))

(assert (=> b!197355 (= res!165167 (= (size!4452 (buf!4938 thiss!1204)) (size!4452 (buf!4938 (_2!9179 lt!307157)))))))

(declare-fun lt!307158 () Bool)

(declare-fun appendBit!0 (BitStream!8012 Bool) tuple2!17068)

(assert (=> b!197355 (= lt!307157 (appendBit!0 thiss!1204 lt!307158))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!197355 (= lt!307158 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!197356 () Bool)

(assert (=> b!197356 (= e!135536 e!135537)))

(declare-fun res!165172 () Bool)

(assert (=> b!197356 (=> (not res!165172) (not e!135537))))

(assert (=> b!197356 (= res!165172 (and (= (_2!9180 lt!307159) lt!307158) (= (_1!9180 lt!307159) (_2!9179 lt!307157))))))

(declare-fun readBitPure!0 (BitStream!8012) tuple2!17070)

(declare-fun readerFrom!0 (BitStream!8012 (_ BitVec 32) (_ BitVec 32)) BitStream!8012)

(assert (=> b!197356 (= lt!307159 (readBitPure!0 (readerFrom!0 (_2!9179 lt!307157) (currentBit!9271 thiss!1204) (currentByte!9276 thiss!1204))))))

(declare-fun b!197357 () Bool)

(assert (=> b!197357 (= e!135541 e!135539)))

(declare-fun res!165171 () Bool)

(assert (=> b!197357 (=> res!165171 e!135539)))

(assert (=> b!197357 (= res!165171 (not (= lt!307161 (bvsub (bvsub (bvadd lt!307156 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!197357 (= lt!307161 (bitIndex!0 (size!4452 (buf!4938 (_2!9179 lt!307160))) (currentByte!9276 (_2!9179 lt!307160)) (currentBit!9271 (_2!9179 lt!307160))))))

(assert (=> b!197357 (isPrefixOf!0 thiss!1204 (_2!9179 lt!307160))))

(declare-fun lt!307164 () Unit!13969)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8012 BitStream!8012 BitStream!8012) Unit!13969)

(assert (=> b!197357 (= lt!307164 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9179 lt!307157) (_2!9179 lt!307160)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8012 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17068)

(assert (=> b!197357 (= lt!307160 (appendBitsLSBFirstLoopTR!0 (_2!9179 lt!307157) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun res!165173 () Bool)

(assert (=> start!41916 (=> (not res!165173) (not e!135535))))

(assert (=> start!41916 (= res!165173 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41916 e!135535))

(assert (=> start!41916 true))

(declare-fun inv!12 (BitStream!8012) Bool)

(assert (=> start!41916 (and (inv!12 thiss!1204) e!135540)))

(declare-fun b!197348 () Bool)

(declare-fun res!165177 () Bool)

(assert (=> b!197348 (=> (not res!165177) (not e!135535))))

(assert (=> b!197348 (= res!165177 (not (= i!590 nBits!348)))))

(assert (= (and start!41916 res!165173) b!197352))

(assert (= (and b!197352 res!165175) b!197354))

(assert (= (and b!197354 res!165176) b!197348))

(assert (= (and b!197348 res!165177) b!197355))

(assert (= (and b!197355 res!165167) b!197344))

(assert (= (and b!197344 res!165165) b!197350))

(assert (= (and b!197350 res!165170) b!197356))

(assert (= (and b!197356 res!165172) b!197345))

(assert (= (and b!197355 (not res!165168)) b!197357))

(assert (= (and b!197357 (not res!165171)) b!197353))

(assert (= (and b!197353 (not res!165169)) b!197346))

(assert (= (and b!197346 (not res!165174)) b!197347))

(assert (= (and b!197347 (not res!165166)) b!197349))

(assert (= start!41916 b!197351))

(declare-fun m!304945 () Bool)

(assert (=> b!197350 m!304945))

(declare-fun m!304947 () Bool)

(assert (=> b!197354 m!304947))

(declare-fun m!304949 () Bool)

(assert (=> start!41916 m!304949))

(declare-fun m!304951 () Bool)

(assert (=> b!197351 m!304951))

(declare-fun m!304953 () Bool)

(assert (=> b!197355 m!304953))

(declare-fun m!304955 () Bool)

(assert (=> b!197355 m!304955))

(declare-fun m!304957 () Bool)

(assert (=> b!197355 m!304957))

(declare-fun m!304959 () Bool)

(assert (=> b!197352 m!304959))

(assert (=> b!197344 m!304953))

(assert (=> b!197344 m!304955))

(declare-fun m!304961 () Bool)

(assert (=> b!197353 m!304961))

(declare-fun m!304963 () Bool)

(assert (=> b!197356 m!304963))

(assert (=> b!197356 m!304963))

(declare-fun m!304965 () Bool)

(assert (=> b!197356 m!304965))

(declare-fun m!304967 () Bool)

(assert (=> b!197357 m!304967))

(declare-fun m!304969 () Bool)

(assert (=> b!197357 m!304969))

(declare-fun m!304971 () Bool)

(assert (=> b!197357 m!304971))

(declare-fun m!304973 () Bool)

(assert (=> b!197357 m!304973))

(declare-fun m!304975 () Bool)

(assert (=> b!197347 m!304975))

(assert (=> b!197349 m!304945))

(declare-fun m!304977 () Bool)

(assert (=> b!197345 m!304977))

(push 1)

(assert (not b!197344))

(assert (not b!197352))

(assert (not b!197355))

(assert (not b!197353))

(assert (not b!197347))

(assert (not b!197354))

(assert (not b!197357))

(assert (not b!197356))

(assert (not b!197349))

(assert (not start!41916))

(assert (not b!197345))

(assert (not b!197350))

(assert (not b!197351))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

