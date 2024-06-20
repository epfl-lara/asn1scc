; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39960 () Bool)

(assert start!39960)

(declare-fun b!182018 () Bool)

(declare-fun e!126355 () Bool)

(declare-datatypes ((array!9720 0))(
  ( (array!9721 (arr!5217 (Array (_ BitVec 32) (_ BitVec 8))) (size!4287 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7682 0))(
  ( (BitStream!7683 (buf!4736 array!9720) (currentByte!8958 (_ BitVec 32)) (currentBit!8953 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15708 0))(
  ( (tuple2!15709 (_1!8499 BitStream!7682) (_2!8499 Bool)) )
))
(declare-fun lt!279481 () tuple2!15708)

(declare-fun lt!279492 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!182018 (= e!126355 (= (bitIndex!0 (size!4287 (buf!4736 (_1!8499 lt!279481))) (currentByte!8958 (_1!8499 lt!279481)) (currentBit!8953 (_1!8499 lt!279481))) lt!279492))))

(declare-fun b!182019 () Bool)

(declare-fun res!151244 () Bool)

(declare-fun e!126360 () Bool)

(assert (=> b!182019 (=> res!151244 e!126360)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!279493 () (_ BitVec 64))

(declare-datatypes ((Unit!13071 0))(
  ( (Unit!13072) )
))
(declare-datatypes ((tuple2!15710 0))(
  ( (tuple2!15711 (_1!8500 Unit!13071) (_2!8500 BitStream!7682)) )
))
(declare-fun lt!279488 () tuple2!15710)

(declare-fun lt!279496 () (_ BitVec 64))

(declare-fun thiss!1204 () BitStream!7682)

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!182019 (= res!151244 (or (not (= (size!4287 (buf!4736 (_2!8500 lt!279488))) (size!4287 (buf!4736 thiss!1204)))) (not (= lt!279493 (bvsub (bvadd lt!279496 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!182021 () Bool)

(declare-fun res!151235 () Bool)

(assert (=> b!182021 (=> res!151235 e!126360)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!182021 (= res!151235 (not (invariant!0 (currentBit!8953 (_2!8500 lt!279488)) (currentByte!8958 (_2!8500 lt!279488)) (size!4287 (buf!4736 (_2!8500 lt!279488))))))))

(declare-fun b!182022 () Bool)

(declare-fun e!126352 () Bool)

(assert (=> b!182022 (= e!126352 (invariant!0 (currentBit!8953 thiss!1204) (currentByte!8958 thiss!1204) (size!4287 (buf!4736 (_2!8500 lt!279488)))))))

(declare-fun b!182023 () Bool)

(declare-fun res!151240 () Bool)

(assert (=> b!182023 (=> res!151240 e!126360)))

(declare-fun lt!279483 () tuple2!15710)

(declare-fun isPrefixOf!0 (BitStream!7682 BitStream!7682) Bool)

(assert (=> b!182023 (= res!151240 (not (isPrefixOf!0 (_2!8500 lt!279483) (_2!8500 lt!279488))))))

(declare-fun b!182024 () Bool)

(declare-fun e!126354 () Bool)

(declare-fun array_inv!4028 (array!9720) Bool)

(assert (=> b!182024 (= e!126354 (array_inv!4028 (buf!4736 thiss!1204)))))

(declare-fun b!182025 () Bool)

(declare-fun res!151239 () Bool)

(declare-fun e!126359 () Bool)

(assert (=> b!182025 (=> (not res!151239) (not e!126359))))

(assert (=> b!182025 (= res!151239 (not (= i!590 nBits!348)))))

(declare-fun b!182026 () Bool)

(declare-fun res!151242 () Bool)

(assert (=> b!182026 (=> (not res!151242) (not e!126359))))

(assert (=> b!182026 (= res!151242 (invariant!0 (currentBit!8953 thiss!1204) (currentByte!8958 thiss!1204) (size!4287 (buf!4736 thiss!1204))))))

(declare-fun b!182027 () Bool)

(assert (=> b!182027 (= e!126360 true)))

(declare-fun v!189 () (_ BitVec 64))

(declare-datatypes ((tuple2!15712 0))(
  ( (tuple2!15713 (_1!8501 BitStream!7682) (_2!8501 (_ BitVec 64))) )
))
(declare-fun lt!279482 () tuple2!15712)

(declare-datatypes ((tuple2!15714 0))(
  ( (tuple2!15715 (_1!8502 BitStream!7682) (_2!8502 BitStream!7682)) )
))
(declare-fun lt!279495 () tuple2!15714)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7682 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15712)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!182027 (= lt!279482 (readNBitsLSBFirstsLoopPure!0 (_1!8502 lt!279495) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))))))

(declare-fun lt!279480 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!182027 (validate_offset_bits!1 ((_ sign_extend 32) (size!4287 (buf!4736 (_2!8500 lt!279488)))) ((_ sign_extend 32) (currentByte!8958 thiss!1204)) ((_ sign_extend 32) (currentBit!8953 thiss!1204)) lt!279480)))

(declare-fun lt!279490 () Unit!13071)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7682 array!9720 (_ BitVec 64)) Unit!13071)

(assert (=> b!182027 (= lt!279490 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4736 (_2!8500 lt!279488)) lt!279480))))

(declare-fun lt!279497 () Bool)

(declare-fun readBitPure!0 (BitStream!7682) tuple2!15708)

(assert (=> b!182027 (= (_2!8499 (readBitPure!0 (_1!8502 lt!279495))) lt!279497)))

(declare-fun lt!279479 () tuple2!15714)

(declare-fun reader!0 (BitStream!7682 BitStream!7682) tuple2!15714)

(assert (=> b!182027 (= lt!279479 (reader!0 (_2!8500 lt!279483) (_2!8500 lt!279488)))))

(assert (=> b!182027 (= lt!279495 (reader!0 thiss!1204 (_2!8500 lt!279488)))))

(declare-fun e!126351 () Bool)

(assert (=> b!182027 e!126351))

(declare-fun res!151233 () Bool)

(assert (=> b!182027 (=> (not res!151233) (not e!126351))))

(declare-fun lt!279484 () tuple2!15708)

(declare-fun lt!279494 () tuple2!15708)

(assert (=> b!182027 (= res!151233 (= (bitIndex!0 (size!4287 (buf!4736 (_1!8499 lt!279484))) (currentByte!8958 (_1!8499 lt!279484)) (currentBit!8953 (_1!8499 lt!279484))) (bitIndex!0 (size!4287 (buf!4736 (_1!8499 lt!279494))) (currentByte!8958 (_1!8499 lt!279494)) (currentBit!8953 (_1!8499 lt!279494)))))))

(declare-fun lt!279489 () Unit!13071)

(declare-fun lt!279486 () BitStream!7682)

(declare-fun readBitPrefixLemma!0 (BitStream!7682 BitStream!7682) Unit!13071)

(assert (=> b!182027 (= lt!279489 (readBitPrefixLemma!0 lt!279486 (_2!8500 lt!279488)))))

(assert (=> b!182027 (= lt!279494 (readBitPure!0 (BitStream!7683 (buf!4736 (_2!8500 lt!279488)) (currentByte!8958 thiss!1204) (currentBit!8953 thiss!1204))))))

(assert (=> b!182027 (= lt!279484 (readBitPure!0 lt!279486))))

(assert (=> b!182027 e!126352))

(declare-fun res!151238 () Bool)

(assert (=> b!182027 (=> (not res!151238) (not e!126352))))

(assert (=> b!182027 (= res!151238 (invariant!0 (currentBit!8953 thiss!1204) (currentByte!8958 thiss!1204) (size!4287 (buf!4736 (_2!8500 lt!279483)))))))

(assert (=> b!182027 (= lt!279486 (BitStream!7683 (buf!4736 (_2!8500 lt!279483)) (currentByte!8958 thiss!1204) (currentBit!8953 thiss!1204)))))

(declare-fun b!182028 () Bool)

(declare-fun res!151237 () Bool)

(declare-fun e!126356 () Bool)

(assert (=> b!182028 (=> (not res!151237) (not e!126356))))

(assert (=> b!182028 (= res!151237 (isPrefixOf!0 thiss!1204 (_2!8500 lt!279483)))))

(declare-fun b!182029 () Bool)

(assert (=> b!182029 (= e!126351 (= (_2!8499 lt!279484) (_2!8499 lt!279494)))))

(declare-fun b!182030 () Bool)

(assert (=> b!182030 (= e!126356 e!126355)))

(declare-fun res!151243 () Bool)

(assert (=> b!182030 (=> (not res!151243) (not e!126355))))

(assert (=> b!182030 (= res!151243 (and (= (_2!8499 lt!279481) lt!279497) (= (_1!8499 lt!279481) (_2!8500 lt!279483))))))

(declare-fun readerFrom!0 (BitStream!7682 (_ BitVec 32) (_ BitVec 32)) BitStream!7682)

(assert (=> b!182030 (= lt!279481 (readBitPure!0 (readerFrom!0 (_2!8500 lt!279483) (currentBit!8953 thiss!1204) (currentByte!8958 thiss!1204))))))

(declare-fun b!182031 () Bool)

(declare-fun res!151241 () Bool)

(assert (=> b!182031 (=> res!151241 e!126360)))

(assert (=> b!182031 (= res!151241 (not (isPrefixOf!0 thiss!1204 (_2!8500 lt!279483))))))

(declare-fun b!182032 () Bool)

(declare-fun e!126358 () Bool)

(assert (=> b!182032 (= e!126358 e!126359)))

(declare-fun res!151245 () Bool)

(assert (=> b!182032 (=> (not res!151245) (not e!126359))))

(assert (=> b!182032 (= res!151245 (validate_offset_bits!1 ((_ sign_extend 32) (size!4287 (buf!4736 thiss!1204))) ((_ sign_extend 32) (currentByte!8958 thiss!1204)) ((_ sign_extend 32) (currentBit!8953 thiss!1204)) lt!279480))))

(assert (=> b!182032 (= lt!279480 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun res!151234 () Bool)

(assert (=> start!39960 (=> (not res!151234) (not e!126358))))

(assert (=> start!39960 (= res!151234 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39960 e!126358))

(assert (=> start!39960 true))

(declare-fun inv!12 (BitStream!7682) Bool)

(assert (=> start!39960 (and (inv!12 thiss!1204) e!126354)))

(declare-fun b!182020 () Bool)

(declare-fun e!126353 () Bool)

(assert (=> b!182020 (= e!126359 (not e!126353))))

(declare-fun res!151248 () Bool)

(assert (=> b!182020 (=> res!151248 e!126353)))

(declare-fun lt!279487 () (_ BitVec 64))

(assert (=> b!182020 (= res!151248 (not (= lt!279487 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!279496))))))

(assert (=> b!182020 (= lt!279487 (bitIndex!0 (size!4287 (buf!4736 (_2!8500 lt!279483))) (currentByte!8958 (_2!8500 lt!279483)) (currentBit!8953 (_2!8500 lt!279483))))))

(assert (=> b!182020 (= lt!279496 (bitIndex!0 (size!4287 (buf!4736 thiss!1204)) (currentByte!8958 thiss!1204) (currentBit!8953 thiss!1204)))))

(declare-fun e!126361 () Bool)

(assert (=> b!182020 e!126361))

(declare-fun res!151247 () Bool)

(assert (=> b!182020 (=> (not res!151247) (not e!126361))))

(assert (=> b!182020 (= res!151247 (= (size!4287 (buf!4736 thiss!1204)) (size!4287 (buf!4736 (_2!8500 lt!279483)))))))

(declare-fun appendBit!0 (BitStream!7682 Bool) tuple2!15710)

(assert (=> b!182020 (= lt!279483 (appendBit!0 thiss!1204 lt!279497))))

(assert (=> b!182020 (= lt!279497 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!182033 () Bool)

(assert (=> b!182033 (= e!126353 e!126360)))

(declare-fun res!151246 () Bool)

(assert (=> b!182033 (=> res!151246 e!126360)))

(assert (=> b!182033 (= res!151246 (not (= lt!279493 (bvsub (bvsub (bvadd lt!279487 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!182033 (= lt!279493 (bitIndex!0 (size!4287 (buf!4736 (_2!8500 lt!279488))) (currentByte!8958 (_2!8500 lt!279488)) (currentBit!8953 (_2!8500 lt!279488))))))

(assert (=> b!182033 (isPrefixOf!0 thiss!1204 (_2!8500 lt!279488))))

(declare-fun lt!279491 () Unit!13071)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7682 BitStream!7682 BitStream!7682) Unit!13071)

(assert (=> b!182033 (= lt!279491 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8500 lt!279483) (_2!8500 lt!279488)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7682 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15710)

(assert (=> b!182033 (= lt!279488 (appendBitsLSBFirstLoopTR!0 (_2!8500 lt!279483) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!182034 () Bool)

(assert (=> b!182034 (= e!126361 e!126356)))

(declare-fun res!151236 () Bool)

(assert (=> b!182034 (=> (not res!151236) (not e!126356))))

(declare-fun lt!279485 () (_ BitVec 64))

(assert (=> b!182034 (= res!151236 (= lt!279492 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!279485)))))

(assert (=> b!182034 (= lt!279492 (bitIndex!0 (size!4287 (buf!4736 (_2!8500 lt!279483))) (currentByte!8958 (_2!8500 lt!279483)) (currentBit!8953 (_2!8500 lt!279483))))))

(assert (=> b!182034 (= lt!279485 (bitIndex!0 (size!4287 (buf!4736 thiss!1204)) (currentByte!8958 thiss!1204) (currentBit!8953 thiss!1204)))))

(assert (= (and start!39960 res!151234) b!182032))

(assert (= (and b!182032 res!151245) b!182026))

(assert (= (and b!182026 res!151242) b!182025))

(assert (= (and b!182025 res!151239) b!182020))

(assert (= (and b!182020 res!151247) b!182034))

(assert (= (and b!182034 res!151236) b!182028))

(assert (= (and b!182028 res!151237) b!182030))

(assert (= (and b!182030 res!151243) b!182018))

(assert (= (and b!182020 (not res!151248)) b!182033))

(assert (= (and b!182033 (not res!151246)) b!182021))

(assert (= (and b!182021 (not res!151235)) b!182019))

(assert (= (and b!182019 (not res!151244)) b!182023))

(assert (= (and b!182023 (not res!151240)) b!182031))

(assert (= (and b!182031 (not res!151241)) b!182027))

(assert (= (and b!182027 res!151238) b!182022))

(assert (= (and b!182027 res!151233) b!182029))

(assert (= start!39960 b!182024))

(declare-fun m!283169 () Bool)

(assert (=> b!182033 m!283169))

(declare-fun m!283171 () Bool)

(assert (=> b!182033 m!283171))

(declare-fun m!283173 () Bool)

(assert (=> b!182033 m!283173))

(declare-fun m!283175 () Bool)

(assert (=> b!182033 m!283175))

(declare-fun m!283177 () Bool)

(assert (=> b!182018 m!283177))

(declare-fun m!283179 () Bool)

(assert (=> b!182034 m!283179))

(declare-fun m!283181 () Bool)

(assert (=> b!182034 m!283181))

(declare-fun m!283183 () Bool)

(assert (=> b!182030 m!283183))

(assert (=> b!182030 m!283183))

(declare-fun m!283185 () Bool)

(assert (=> b!182030 m!283185))

(declare-fun m!283187 () Bool)

(assert (=> b!182022 m!283187))

(declare-fun m!283189 () Bool)

(assert (=> b!182021 m!283189))

(declare-fun m!283191 () Bool)

(assert (=> b!182032 m!283191))

(declare-fun m!283193 () Bool)

(assert (=> b!182026 m!283193))

(assert (=> b!182020 m!283179))

(assert (=> b!182020 m!283181))

(declare-fun m!283195 () Bool)

(assert (=> b!182020 m!283195))

(declare-fun m!283197 () Bool)

(assert (=> start!39960 m!283197))

(declare-fun m!283199 () Bool)

(assert (=> b!182023 m!283199))

(declare-fun m!283201 () Bool)

(assert (=> b!182024 m!283201))

(declare-fun m!283203 () Bool)

(assert (=> b!182028 m!283203))

(assert (=> b!182031 m!283203))

(declare-fun m!283205 () Bool)

(assert (=> b!182027 m!283205))

(declare-fun m!283207 () Bool)

(assert (=> b!182027 m!283207))

(declare-fun m!283209 () Bool)

(assert (=> b!182027 m!283209))

(declare-fun m!283211 () Bool)

(assert (=> b!182027 m!283211))

(declare-fun m!283213 () Bool)

(assert (=> b!182027 m!283213))

(declare-fun m!283215 () Bool)

(assert (=> b!182027 m!283215))

(declare-fun m!283217 () Bool)

(assert (=> b!182027 m!283217))

(declare-fun m!283219 () Bool)

(assert (=> b!182027 m!283219))

(declare-fun m!283221 () Bool)

(assert (=> b!182027 m!283221))

(declare-fun m!283223 () Bool)

(assert (=> b!182027 m!283223))

(declare-fun m!283225 () Bool)

(assert (=> b!182027 m!283225))

(declare-fun m!283227 () Bool)

(assert (=> b!182027 m!283227))

(declare-fun m!283229 () Bool)

(assert (=> b!182027 m!283229))

(push 1)

(assert (not b!182020))

(assert (not start!39960))

(assert (not b!182022))

(assert (not b!182023))

(assert (not b!182033))

(assert (not b!182030))

(assert (not b!182026))

(assert (not b!182024))

(assert (not b!182028))

(assert (not b!182032))

(assert (not b!182027))

(assert (not b!182031))

(assert (not b!182034))

(assert (not b!182018))

(assert (not b!182021))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

