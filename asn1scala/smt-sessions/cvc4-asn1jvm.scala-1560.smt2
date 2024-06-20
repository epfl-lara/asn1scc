; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43756 () Bool)

(assert start!43756)

(declare-fun b!208189 () Bool)

(declare-fun res!174720 () Bool)

(declare-fun e!142254 () Bool)

(assert (=> b!208189 (=> (not res!174720) (not e!142254))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!208189 (= res!174720 (not (= i!590 nBits!348)))))

(declare-fun b!208190 () Bool)

(declare-fun e!142259 () Bool)

(declare-fun e!142249 () Bool)

(assert (=> b!208190 (= e!142259 e!142249)))

(declare-fun res!174716 () Bool)

(assert (=> b!208190 (=> res!174716 e!142249)))

(declare-datatypes ((array!10446 0))(
  ( (array!10447 (arr!5523 (Array (_ BitVec 32) (_ BitVec 8))) (size!4593 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8294 0))(
  ( (BitStream!8295 (buf!5101 array!10446) (currentByte!9625 (_ BitVec 32)) (currentBit!9620 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!17862 0))(
  ( (tuple2!17863 (_1!9586 BitStream!8294) (_2!9586 Bool)) )
))
(declare-fun lt!325229 () tuple2!17862)

(declare-fun lt!325231 () (_ BitVec 64))

(declare-fun lt!325224 () (_ BitVec 64))

(declare-datatypes ((tuple2!17864 0))(
  ( (tuple2!17865 (_1!9587 BitStream!8294) (_2!9587 BitStream!8294)) )
))
(declare-fun lt!325233 () tuple2!17864)

(declare-datatypes ((tuple2!17866 0))(
  ( (tuple2!17867 (_1!9588 BitStream!8294) (_2!9588 (_ BitVec 64))) )
))
(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8294 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17866)

(assert (=> b!208190 (= res!174716 (not (= (_1!9588 (readNBitsLSBFirstsLoopPure!0 (_1!9587 lt!325233) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvor lt!325231 (ite (_2!9586 lt!325229) lt!325224 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9587 lt!325233))))))

(declare-datatypes ((Unit!14819 0))(
  ( (Unit!14820) )
))
(declare-datatypes ((tuple2!17868 0))(
  ( (tuple2!17869 (_1!9589 Unit!14819) (_2!9589 BitStream!8294)) )
))
(declare-fun lt!325230 () tuple2!17868)

(declare-fun lt!325221 () tuple2!17868)

(declare-fun lt!325240 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!208190 (validate_offset_bits!1 ((_ sign_extend 32) (size!4593 (buf!5101 (_2!9589 lt!325230)))) ((_ sign_extend 32) (currentByte!9625 (_2!9589 lt!325221))) ((_ sign_extend 32) (currentBit!9620 (_2!9589 lt!325221))) lt!325240)))

(declare-fun lt!325242 () Unit!14819)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8294 array!10446 (_ BitVec 64)) Unit!14819)

(assert (=> b!208190 (= lt!325242 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9589 lt!325221) (buf!5101 (_2!9589 lt!325230)) lt!325240))))

(assert (=> b!208190 (= lt!325240 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!325227 () tuple2!17864)

(declare-fun lt!325232 () tuple2!17866)

(assert (=> b!208190 (= lt!325232 (readNBitsLSBFirstsLoopPure!0 (_1!9587 lt!325227) nBits!348 i!590 lt!325231))))

(declare-fun thiss!1204 () BitStream!8294)

(declare-fun lt!325223 () (_ BitVec 64))

(assert (=> b!208190 (validate_offset_bits!1 ((_ sign_extend 32) (size!4593 (buf!5101 (_2!9589 lt!325230)))) ((_ sign_extend 32) (currentByte!9625 thiss!1204)) ((_ sign_extend 32) (currentBit!9620 thiss!1204)) lt!325223)))

(declare-fun lt!325241 () Unit!14819)

(assert (=> b!208190 (= lt!325241 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5101 (_2!9589 lt!325230)) lt!325223))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!208190 (= lt!325231 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun lt!325236 () Bool)

(assert (=> b!208190 (= (_2!9586 lt!325229) lt!325236)))

(declare-fun readBitPure!0 (BitStream!8294) tuple2!17862)

(assert (=> b!208190 (= lt!325229 (readBitPure!0 (_1!9587 lt!325227)))))

(declare-fun reader!0 (BitStream!8294 BitStream!8294) tuple2!17864)

(assert (=> b!208190 (= lt!325233 (reader!0 (_2!9589 lt!325221) (_2!9589 lt!325230)))))

(assert (=> b!208190 (= lt!325227 (reader!0 thiss!1204 (_2!9589 lt!325230)))))

(declare-fun e!142250 () Bool)

(assert (=> b!208190 e!142250))

(declare-fun res!174706 () Bool)

(assert (=> b!208190 (=> (not res!174706) (not e!142250))))

(declare-fun lt!325235 () tuple2!17862)

(declare-fun lt!325228 () tuple2!17862)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!208190 (= res!174706 (= (bitIndex!0 (size!4593 (buf!5101 (_1!9586 lt!325235))) (currentByte!9625 (_1!9586 lt!325235)) (currentBit!9620 (_1!9586 lt!325235))) (bitIndex!0 (size!4593 (buf!5101 (_1!9586 lt!325228))) (currentByte!9625 (_1!9586 lt!325228)) (currentBit!9620 (_1!9586 lt!325228)))))))

(declare-fun lt!325225 () Unit!14819)

(declare-fun lt!325243 () BitStream!8294)

(declare-fun readBitPrefixLemma!0 (BitStream!8294 BitStream!8294) Unit!14819)

(assert (=> b!208190 (= lt!325225 (readBitPrefixLemma!0 lt!325243 (_2!9589 lt!325230)))))

(assert (=> b!208190 (= lt!325228 (readBitPure!0 (BitStream!8295 (buf!5101 (_2!9589 lt!325230)) (currentByte!9625 thiss!1204) (currentBit!9620 thiss!1204))))))

(assert (=> b!208190 (= lt!325235 (readBitPure!0 lt!325243))))

(declare-fun e!142258 () Bool)

(assert (=> b!208190 e!142258))

(declare-fun res!174708 () Bool)

(assert (=> b!208190 (=> (not res!174708) (not e!142258))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!208190 (= res!174708 (invariant!0 (currentBit!9620 thiss!1204) (currentByte!9625 thiss!1204) (size!4593 (buf!5101 (_2!9589 lt!325221)))))))

(assert (=> b!208190 (= lt!325243 (BitStream!8295 (buf!5101 (_2!9589 lt!325221)) (currentByte!9625 thiss!1204) (currentBit!9620 thiss!1204)))))

(declare-fun b!208191 () Bool)

(declare-fun e!142253 () Bool)

(assert (=> b!208191 (= e!142253 e!142259)))

(declare-fun res!174721 () Bool)

(assert (=> b!208191 (=> res!174721 e!142259)))

(declare-fun lt!325237 () (_ BitVec 64))

(declare-fun lt!325244 () (_ BitVec 64))

(assert (=> b!208191 (= res!174721 (not (= lt!325237 (bvsub (bvsub (bvadd lt!325244 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!208191 (= lt!325237 (bitIndex!0 (size!4593 (buf!5101 (_2!9589 lt!325230))) (currentByte!9625 (_2!9589 lt!325230)) (currentBit!9620 (_2!9589 lt!325230))))))

(declare-fun isPrefixOf!0 (BitStream!8294 BitStream!8294) Bool)

(assert (=> b!208191 (isPrefixOf!0 thiss!1204 (_2!9589 lt!325230))))

(declare-fun lt!325238 () Unit!14819)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8294 BitStream!8294 BitStream!8294) Unit!14819)

(assert (=> b!208191 (= lt!325238 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9589 lt!325221) (_2!9589 lt!325230)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8294 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17868)

(assert (=> b!208191 (= lt!325230 (appendBitsLSBFirstLoopTR!0 (_2!9589 lt!325221) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!208192 () Bool)

(declare-fun e!142260 () Bool)

(declare-fun lt!325234 () tuple2!17862)

(declare-fun lt!325239 () (_ BitVec 64))

(assert (=> b!208192 (= e!142260 (= (bitIndex!0 (size!4593 (buf!5101 (_1!9586 lt!325234))) (currentByte!9625 (_1!9586 lt!325234)) (currentBit!9620 (_1!9586 lt!325234))) lt!325239))))

(declare-fun b!208194 () Bool)

(declare-fun res!174715 () Bool)

(assert (=> b!208194 (=> res!174715 e!142259)))

(assert (=> b!208194 (= res!174715 (not (isPrefixOf!0 (_2!9589 lt!325221) (_2!9589 lt!325230))))))

(declare-fun b!208195 () Bool)

(declare-fun res!174722 () Bool)

(assert (=> b!208195 (=> res!174722 e!142259)))

(declare-fun lt!325222 () (_ BitVec 64))

(assert (=> b!208195 (= res!174722 (or (not (= (size!4593 (buf!5101 (_2!9589 lt!325230))) (size!4593 (buf!5101 thiss!1204)))) (not (= lt!325237 (bvsub (bvadd lt!325222 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!208196 () Bool)

(assert (=> b!208196 (= e!142254 (not e!142253))))

(declare-fun res!174719 () Bool)

(assert (=> b!208196 (=> res!174719 e!142253)))

(assert (=> b!208196 (= res!174719 (not (= lt!325244 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!325222))))))

(assert (=> b!208196 (= lt!325244 (bitIndex!0 (size!4593 (buf!5101 (_2!9589 lt!325221))) (currentByte!9625 (_2!9589 lt!325221)) (currentBit!9620 (_2!9589 lt!325221))))))

(assert (=> b!208196 (= lt!325222 (bitIndex!0 (size!4593 (buf!5101 thiss!1204)) (currentByte!9625 thiss!1204) (currentBit!9620 thiss!1204)))))

(declare-fun e!142256 () Bool)

(assert (=> b!208196 e!142256))

(declare-fun res!174718 () Bool)

(assert (=> b!208196 (=> (not res!174718) (not e!142256))))

(assert (=> b!208196 (= res!174718 (= (size!4593 (buf!5101 thiss!1204)) (size!4593 (buf!5101 (_2!9589 lt!325221)))))))

(declare-fun appendBit!0 (BitStream!8294 Bool) tuple2!17868)

(assert (=> b!208196 (= lt!325221 (appendBit!0 thiss!1204 lt!325236))))

(assert (=> b!208196 (= lt!325236 (not (= (bvand v!189 lt!325224) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!208196 (= lt!325224 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!208197 () Bool)

(declare-fun e!142251 () Bool)

(assert (=> b!208197 (= e!142251 e!142260)))

(declare-fun res!174707 () Bool)

(assert (=> b!208197 (=> (not res!174707) (not e!142260))))

(assert (=> b!208197 (= res!174707 (and (= (_2!9586 lt!325234) lt!325236) (= (_1!9586 lt!325234) (_2!9589 lt!325221))))))

(declare-fun readerFrom!0 (BitStream!8294 (_ BitVec 32) (_ BitVec 32)) BitStream!8294)

(assert (=> b!208197 (= lt!325234 (readBitPure!0 (readerFrom!0 (_2!9589 lt!325221) (currentBit!9620 thiss!1204) (currentByte!9625 thiss!1204))))))

(declare-fun b!208198 () Bool)

(declare-fun res!174711 () Bool)

(assert (=> b!208198 (=> res!174711 e!142259)))

(assert (=> b!208198 (= res!174711 (not (invariant!0 (currentBit!9620 (_2!9589 lt!325230)) (currentByte!9625 (_2!9589 lt!325230)) (size!4593 (buf!5101 (_2!9589 lt!325230))))))))

(declare-fun b!208199 () Bool)

(assert (=> b!208199 (= e!142256 e!142251)))

(declare-fun res!174713 () Bool)

(assert (=> b!208199 (=> (not res!174713) (not e!142251))))

(declare-fun lt!325226 () (_ BitVec 64))

(assert (=> b!208199 (= res!174713 (= lt!325239 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!325226)))))

(assert (=> b!208199 (= lt!325239 (bitIndex!0 (size!4593 (buf!5101 (_2!9589 lt!325221))) (currentByte!9625 (_2!9589 lt!325221)) (currentBit!9620 (_2!9589 lt!325221))))))

(assert (=> b!208199 (= lt!325226 (bitIndex!0 (size!4593 (buf!5101 thiss!1204)) (currentByte!9625 thiss!1204) (currentBit!9620 thiss!1204)))))

(declare-fun b!208200 () Bool)

(assert (=> b!208200 (= e!142249 (bvslt i!590 nBits!348))))

(declare-fun b!208193 () Bool)

(declare-fun e!142252 () Bool)

(declare-fun array_inv!4334 (array!10446) Bool)

(assert (=> b!208193 (= e!142252 (array_inv!4334 (buf!5101 thiss!1204)))))

(declare-fun res!174710 () Bool)

(declare-fun e!142255 () Bool)

(assert (=> start!43756 (=> (not res!174710) (not e!142255))))

(assert (=> start!43756 (= res!174710 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43756 e!142255))

(assert (=> start!43756 true))

(declare-fun inv!12 (BitStream!8294) Bool)

(assert (=> start!43756 (and (inv!12 thiss!1204) e!142252)))

(declare-fun b!208201 () Bool)

(assert (=> b!208201 (= e!142258 (invariant!0 (currentBit!9620 thiss!1204) (currentByte!9625 thiss!1204) (size!4593 (buf!5101 (_2!9589 lt!325230)))))))

(declare-fun b!208202 () Bool)

(declare-fun res!174709 () Bool)

(assert (=> b!208202 (=> (not res!174709) (not e!142254))))

(assert (=> b!208202 (= res!174709 (invariant!0 (currentBit!9620 thiss!1204) (currentByte!9625 thiss!1204) (size!4593 (buf!5101 thiss!1204))))))

(declare-fun b!208203 () Bool)

(assert (=> b!208203 (= e!142255 e!142254)))

(declare-fun res!174712 () Bool)

(assert (=> b!208203 (=> (not res!174712) (not e!142254))))

(assert (=> b!208203 (= res!174712 (validate_offset_bits!1 ((_ sign_extend 32) (size!4593 (buf!5101 thiss!1204))) ((_ sign_extend 32) (currentByte!9625 thiss!1204)) ((_ sign_extend 32) (currentBit!9620 thiss!1204)) lt!325223))))

(assert (=> b!208203 (= lt!325223 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!208204 () Bool)

(assert (=> b!208204 (= e!142250 (= (_2!9586 lt!325235) (_2!9586 lt!325228)))))

(declare-fun b!208205 () Bool)

(declare-fun res!174717 () Bool)

(assert (=> b!208205 (=> (not res!174717) (not e!142251))))

(assert (=> b!208205 (= res!174717 (isPrefixOf!0 thiss!1204 (_2!9589 lt!325221)))))

(declare-fun b!208206 () Bool)

(declare-fun res!174714 () Bool)

(assert (=> b!208206 (=> res!174714 e!142259)))

(assert (=> b!208206 (= res!174714 (not (isPrefixOf!0 thiss!1204 (_2!9589 lt!325221))))))

(assert (= (and start!43756 res!174710) b!208203))

(assert (= (and b!208203 res!174712) b!208202))

(assert (= (and b!208202 res!174709) b!208189))

(assert (= (and b!208189 res!174720) b!208196))

(assert (= (and b!208196 res!174718) b!208199))

(assert (= (and b!208199 res!174713) b!208205))

(assert (= (and b!208205 res!174717) b!208197))

(assert (= (and b!208197 res!174707) b!208192))

(assert (= (and b!208196 (not res!174719)) b!208191))

(assert (= (and b!208191 (not res!174721)) b!208198))

(assert (= (and b!208198 (not res!174711)) b!208195))

(assert (= (and b!208195 (not res!174722)) b!208194))

(assert (= (and b!208194 (not res!174715)) b!208206))

(assert (= (and b!208206 (not res!174714)) b!208190))

(assert (= (and b!208190 res!174708) b!208201))

(assert (= (and b!208190 res!174706) b!208204))

(assert (= (and b!208190 (not res!174716)) b!208200))

(assert (= start!43756 b!208193))

(declare-fun m!320317 () Bool)

(assert (=> b!208201 m!320317))

(declare-fun m!320319 () Bool)

(assert (=> b!208199 m!320319))

(declare-fun m!320321 () Bool)

(assert (=> b!208199 m!320321))

(declare-fun m!320323 () Bool)

(assert (=> b!208191 m!320323))

(declare-fun m!320325 () Bool)

(assert (=> b!208191 m!320325))

(declare-fun m!320327 () Bool)

(assert (=> b!208191 m!320327))

(declare-fun m!320329 () Bool)

(assert (=> b!208191 m!320329))

(declare-fun m!320331 () Bool)

(assert (=> b!208206 m!320331))

(declare-fun m!320333 () Bool)

(assert (=> start!43756 m!320333))

(declare-fun m!320335 () Bool)

(assert (=> b!208190 m!320335))

(declare-fun m!320337 () Bool)

(assert (=> b!208190 m!320337))

(declare-fun m!320339 () Bool)

(assert (=> b!208190 m!320339))

(declare-fun m!320341 () Bool)

(assert (=> b!208190 m!320341))

(declare-fun m!320343 () Bool)

(assert (=> b!208190 m!320343))

(declare-fun m!320345 () Bool)

(assert (=> b!208190 m!320345))

(declare-fun m!320347 () Bool)

(assert (=> b!208190 m!320347))

(declare-fun m!320349 () Bool)

(assert (=> b!208190 m!320349))

(declare-fun m!320351 () Bool)

(assert (=> b!208190 m!320351))

(declare-fun m!320353 () Bool)

(assert (=> b!208190 m!320353))

(declare-fun m!320355 () Bool)

(assert (=> b!208190 m!320355))

(declare-fun m!320357 () Bool)

(assert (=> b!208190 m!320357))

(declare-fun m!320359 () Bool)

(assert (=> b!208190 m!320359))

(declare-fun m!320361 () Bool)

(assert (=> b!208190 m!320361))

(declare-fun m!320363 () Bool)

(assert (=> b!208190 m!320363))

(declare-fun m!320365 () Bool)

(assert (=> b!208190 m!320365))

(declare-fun m!320367 () Bool)

(assert (=> b!208198 m!320367))

(assert (=> b!208205 m!320331))

(declare-fun m!320369 () Bool)

(assert (=> b!208192 m!320369))

(declare-fun m!320371 () Bool)

(assert (=> b!208194 m!320371))

(declare-fun m!320373 () Bool)

(assert (=> b!208197 m!320373))

(assert (=> b!208197 m!320373))

(declare-fun m!320375 () Bool)

(assert (=> b!208197 m!320375))

(declare-fun m!320377 () Bool)

(assert (=> b!208202 m!320377))

(declare-fun m!320379 () Bool)

(assert (=> b!208203 m!320379))

(declare-fun m!320381 () Bool)

(assert (=> b!208193 m!320381))

(assert (=> b!208196 m!320319))

(assert (=> b!208196 m!320321))

(declare-fun m!320383 () Bool)

(assert (=> b!208196 m!320383))

(push 1)

(assert (not b!208190))

(assert (not b!208194))

(assert (not b!208196))

(assert (not b!208203))

(assert (not b!208192))

(assert (not b!208199))

(assert (not b!208198))

(assert (not b!208206))

(assert (not b!208201))

(assert (not b!208191))

(assert (not start!43756))

(assert (not b!208193))

(assert (not b!208205))

(assert (not b!208202))

(assert (not b!208197))

(check-sat)

(pop 1)

(push 1)

(check-sat)

