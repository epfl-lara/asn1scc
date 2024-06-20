; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20358 () Bool)

(assert start!20358)

(declare-fun b!102426 () Bool)

(declare-fun e!67027 () Bool)

(declare-datatypes ((array!4802 0))(
  ( (array!4803 (arr!2785 (Array (_ BitVec 32) (_ BitVec 8))) (size!2192 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3858 0))(
  ( (BitStream!3859 (buf!2552 array!4802) (currentByte!5025 (_ BitVec 32)) (currentBit!5020 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3858)

(declare-fun array_inv!1994 (array!4802) Bool)

(assert (=> b!102426 (= e!67027 (array_inv!1994 (buf!2552 thiss!1305)))))

(declare-fun b!102427 () Bool)

(declare-fun res!84230 () Bool)

(declare-fun e!67029 () Bool)

(assert (=> b!102427 (=> (not res!84230) (not e!67029))))

(declare-datatypes ((Unit!6280 0))(
  ( (Unit!6281) )
))
(declare-datatypes ((tuple2!8358 0))(
  ( (tuple2!8359 (_1!4434 Unit!6280) (_2!4434 BitStream!3858)) )
))
(declare-fun lt!148988 () tuple2!8358)

(declare-fun isPrefixOf!0 (BitStream!3858 BitStream!3858) Bool)

(assert (=> b!102427 (= res!84230 (isPrefixOf!0 thiss!1305 (_2!4434 lt!148988)))))

(declare-fun b!102428 () Bool)

(declare-fun res!84225 () Bool)

(declare-fun e!67021 () Bool)

(assert (=> b!102428 (=> (not res!84225) (not e!67021))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!102428 (= res!84225 (invariant!0 (currentBit!5020 thiss!1305) (currentByte!5025 thiss!1305) (size!2192 (buf!2552 (_2!4434 lt!148988)))))))

(declare-fun b!102429 () Bool)

(declare-fun res!84226 () Bool)

(declare-fun e!67024 () Bool)

(assert (=> b!102429 (=> (not res!84226) (not e!67024))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!102429 (= res!84226 (bvslt i!615 nBits!396))))

(declare-fun b!102430 () Bool)

(declare-fun e!67028 () Bool)

(assert (=> b!102430 (= e!67028 e!67029)))

(declare-fun res!84221 () Bool)

(assert (=> b!102430 (=> (not res!84221) (not e!67029))))

(declare-fun lt!148982 () (_ BitVec 64))

(declare-fun lt!148986 () (_ BitVec 64))

(assert (=> b!102430 (= res!84221 (= lt!148982 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!148986)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!102430 (= lt!148982 (bitIndex!0 (size!2192 (buf!2552 (_2!4434 lt!148988))) (currentByte!5025 (_2!4434 lt!148988)) (currentBit!5020 (_2!4434 lt!148988))))))

(assert (=> b!102430 (= lt!148986 (bitIndex!0 (size!2192 (buf!2552 thiss!1305)) (currentByte!5025 thiss!1305) (currentBit!5020 thiss!1305)))))

(declare-fun b!102431 () Bool)

(declare-fun lt!148994 () tuple2!8358)

(assert (=> b!102431 (= e!67021 (invariant!0 (currentBit!5020 thiss!1305) (currentByte!5025 thiss!1305) (size!2192 (buf!2552 (_2!4434 lt!148994)))))))

(declare-fun b!102432 () Bool)

(declare-fun res!84222 () Bool)

(assert (=> b!102432 (=> (not res!84222) (not e!67024))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!102432 (= res!84222 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!102433 () Bool)

(declare-fun e!67022 () Bool)

(declare-datatypes ((tuple2!8360 0))(
  ( (tuple2!8361 (_1!4435 BitStream!3858) (_2!4435 Bool)) )
))
(declare-fun lt!148992 () tuple2!8360)

(declare-fun lt!148991 () tuple2!8360)

(assert (=> b!102433 (= e!67022 (= (_2!4435 lt!148992) (_2!4435 lt!148991)))))

(declare-fun b!102434 () Bool)

(assert (=> b!102434 (= e!67024 (not true))))

(declare-datatypes ((tuple2!8362 0))(
  ( (tuple2!8363 (_1!4436 BitStream!3858) (_2!4436 BitStream!3858)) )
))
(declare-fun lt!148989 () tuple2!8362)

(declare-datatypes ((tuple2!8364 0))(
  ( (tuple2!8365 (_1!4437 BitStream!3858) (_2!4437 (_ BitVec 64))) )
))
(declare-fun lt!148981 () tuple2!8364)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3858 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8364)

(assert (=> b!102434 (= lt!148981 (readNLeastSignificantBitsLoopPure!0 (_1!4436 lt!148989) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(declare-fun lt!148983 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!102434 (validate_offset_bits!1 ((_ sign_extend 32) (size!2192 (buf!2552 (_2!4434 lt!148994)))) ((_ sign_extend 32) (currentByte!5025 thiss!1305)) ((_ sign_extend 32) (currentBit!5020 thiss!1305)) lt!148983)))

(declare-fun lt!148995 () Unit!6280)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3858 array!4802 (_ BitVec 64)) Unit!6280)

(assert (=> b!102434 (= lt!148995 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2552 (_2!4434 lt!148994)) lt!148983))))

(declare-fun lt!148996 () Bool)

(declare-fun readBitPure!0 (BitStream!3858) tuple2!8360)

(assert (=> b!102434 (= (_2!4435 (readBitPure!0 (_1!4436 lt!148989))) lt!148996)))

(declare-fun lt!148987 () tuple2!8362)

(declare-fun reader!0 (BitStream!3858 BitStream!3858) tuple2!8362)

(assert (=> b!102434 (= lt!148987 (reader!0 (_2!4434 lt!148988) (_2!4434 lt!148994)))))

(assert (=> b!102434 (= lt!148989 (reader!0 thiss!1305 (_2!4434 lt!148994)))))

(assert (=> b!102434 e!67022))

(declare-fun res!84223 () Bool)

(assert (=> b!102434 (=> (not res!84223) (not e!67022))))

(assert (=> b!102434 (= res!84223 (= (bitIndex!0 (size!2192 (buf!2552 (_1!4435 lt!148992))) (currentByte!5025 (_1!4435 lt!148992)) (currentBit!5020 (_1!4435 lt!148992))) (bitIndex!0 (size!2192 (buf!2552 (_1!4435 lt!148991))) (currentByte!5025 (_1!4435 lt!148991)) (currentBit!5020 (_1!4435 lt!148991)))))))

(declare-fun lt!148984 () Unit!6280)

(declare-fun lt!148990 () BitStream!3858)

(declare-fun readBitPrefixLemma!0 (BitStream!3858 BitStream!3858) Unit!6280)

(assert (=> b!102434 (= lt!148984 (readBitPrefixLemma!0 lt!148990 (_2!4434 lt!148994)))))

(assert (=> b!102434 (= lt!148991 (readBitPure!0 (BitStream!3859 (buf!2552 (_2!4434 lt!148994)) (currentByte!5025 thiss!1305) (currentBit!5020 thiss!1305))))))

(assert (=> b!102434 (= lt!148992 (readBitPure!0 lt!148990))))

(assert (=> b!102434 (= lt!148990 (BitStream!3859 (buf!2552 (_2!4434 lt!148988)) (currentByte!5025 thiss!1305) (currentBit!5020 thiss!1305)))))

(assert (=> b!102434 e!67021))

(declare-fun res!84227 () Bool)

(assert (=> b!102434 (=> (not res!84227) (not e!67021))))

(assert (=> b!102434 (= res!84227 (isPrefixOf!0 thiss!1305 (_2!4434 lt!148994)))))

(declare-fun lt!148993 () Unit!6280)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3858 BitStream!3858 BitStream!3858) Unit!6280)

(assert (=> b!102434 (= lt!148993 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4434 lt!148988) (_2!4434 lt!148994)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3858 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8358)

(assert (=> b!102434 (= lt!148994 (appendNLeastSignificantBitsLoop!0 (_2!4434 lt!148988) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!102434 e!67028))

(declare-fun res!84220 () Bool)

(assert (=> b!102434 (=> (not res!84220) (not e!67028))))

(assert (=> b!102434 (= res!84220 (= (size!2192 (buf!2552 thiss!1305)) (size!2192 (buf!2552 (_2!4434 lt!148988)))))))

(declare-fun appendBit!0 (BitStream!3858 Bool) tuple2!8358)

(assert (=> b!102434 (= lt!148988 (appendBit!0 thiss!1305 lt!148996))))

(assert (=> b!102434 (= lt!148996 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!102435 () Bool)

(declare-fun e!67023 () Bool)

(declare-fun lt!148985 () tuple2!8360)

(assert (=> b!102435 (= e!67023 (= (bitIndex!0 (size!2192 (buf!2552 (_1!4435 lt!148985))) (currentByte!5025 (_1!4435 lt!148985)) (currentBit!5020 (_1!4435 lt!148985))) lt!148982))))

(declare-fun res!84228 () Bool)

(declare-fun e!67025 () Bool)

(assert (=> start!20358 (=> (not res!84228) (not e!67025))))

(assert (=> start!20358 (= res!84228 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20358 e!67025))

(assert (=> start!20358 true))

(declare-fun inv!12 (BitStream!3858) Bool)

(assert (=> start!20358 (and (inv!12 thiss!1305) e!67027)))

(declare-fun b!102436 () Bool)

(assert (=> b!102436 (= e!67029 e!67023)))

(declare-fun res!84224 () Bool)

(assert (=> b!102436 (=> (not res!84224) (not e!67023))))

(assert (=> b!102436 (= res!84224 (and (= (_2!4435 lt!148985) lt!148996) (= (_1!4435 lt!148985) (_2!4434 lt!148988))))))

(declare-fun readerFrom!0 (BitStream!3858 (_ BitVec 32) (_ BitVec 32)) BitStream!3858)

(assert (=> b!102436 (= lt!148985 (readBitPure!0 (readerFrom!0 (_2!4434 lt!148988) (currentBit!5020 thiss!1305) (currentByte!5025 thiss!1305))))))

(declare-fun b!102437 () Bool)

(assert (=> b!102437 (= e!67025 e!67024)))

(declare-fun res!84229 () Bool)

(assert (=> b!102437 (=> (not res!84229) (not e!67024))))

(assert (=> b!102437 (= res!84229 (validate_offset_bits!1 ((_ sign_extend 32) (size!2192 (buf!2552 thiss!1305))) ((_ sign_extend 32) (currentByte!5025 thiss!1305)) ((_ sign_extend 32) (currentBit!5020 thiss!1305)) lt!148983))))

(assert (=> b!102437 (= lt!148983 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (= (and start!20358 res!84228) b!102437))

(assert (= (and b!102437 res!84229) b!102432))

(assert (= (and b!102432 res!84222) b!102429))

(assert (= (and b!102429 res!84226) b!102434))

(assert (= (and b!102434 res!84220) b!102430))

(assert (= (and b!102430 res!84221) b!102427))

(assert (= (and b!102427 res!84230) b!102436))

(assert (= (and b!102436 res!84224) b!102435))

(assert (= (and b!102434 res!84227) b!102428))

(assert (= (and b!102428 res!84225) b!102431))

(assert (= (and b!102434 res!84223) b!102433))

(assert (= start!20358 b!102426))

(declare-fun m!149163 () Bool)

(assert (=> b!102435 m!149163))

(declare-fun m!149165 () Bool)

(assert (=> b!102434 m!149165))

(declare-fun m!149167 () Bool)

(assert (=> b!102434 m!149167))

(declare-fun m!149169 () Bool)

(assert (=> b!102434 m!149169))

(declare-fun m!149171 () Bool)

(assert (=> b!102434 m!149171))

(declare-fun m!149173 () Bool)

(assert (=> b!102434 m!149173))

(declare-fun m!149175 () Bool)

(assert (=> b!102434 m!149175))

(declare-fun m!149177 () Bool)

(assert (=> b!102434 m!149177))

(declare-fun m!149179 () Bool)

(assert (=> b!102434 m!149179))

(declare-fun m!149181 () Bool)

(assert (=> b!102434 m!149181))

(declare-fun m!149183 () Bool)

(assert (=> b!102434 m!149183))

(declare-fun m!149185 () Bool)

(assert (=> b!102434 m!149185))

(declare-fun m!149187 () Bool)

(assert (=> b!102434 m!149187))

(declare-fun m!149189 () Bool)

(assert (=> b!102434 m!149189))

(declare-fun m!149191 () Bool)

(assert (=> b!102434 m!149191))

(declare-fun m!149193 () Bool)

(assert (=> b!102434 m!149193))

(declare-fun m!149195 () Bool)

(assert (=> b!102434 m!149195))

(declare-fun m!149197 () Bool)

(assert (=> start!20358 m!149197))

(declare-fun m!149199 () Bool)

(assert (=> b!102436 m!149199))

(assert (=> b!102436 m!149199))

(declare-fun m!149201 () Bool)

(assert (=> b!102436 m!149201))

(declare-fun m!149203 () Bool)

(assert (=> b!102437 m!149203))

(declare-fun m!149205 () Bool)

(assert (=> b!102428 m!149205))

(declare-fun m!149207 () Bool)

(assert (=> b!102431 m!149207))

(declare-fun m!149209 () Bool)

(assert (=> b!102430 m!149209))

(declare-fun m!149211 () Bool)

(assert (=> b!102430 m!149211))

(declare-fun m!149213 () Bool)

(assert (=> b!102426 m!149213))

(declare-fun m!149215 () Bool)

(assert (=> b!102432 m!149215))

(declare-fun m!149217 () Bool)

(assert (=> b!102427 m!149217))

(check-sat (not b!102427) (not b!102435) (not b!102428) (not b!102432) (not b!102434) (not b!102431) (not b!102437) (not b!102430) (not b!102436) (not start!20358) (not b!102426))
