; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42892 () Bool)

(assert start!42892)

(declare-fun b!201984 () Bool)

(declare-fun res!169156 () Bool)

(declare-fun e!138504 () Bool)

(assert (=> b!201984 (=> (not res!169156) (not e!138504))))

(declare-datatypes ((array!10266 0))(
  ( (array!10267 (arr!5448 (Array (_ BitVec 32) (_ BitVec 8))) (size!4518 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8144 0))(
  ( (BitStream!8145 (buf!5023 array!10266) (currentByte!9454 (_ BitVec 32)) (currentBit!9449 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8144)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!201984 (= res!169156 (invariant!0 (currentBit!9449 thiss!1204) (currentByte!9454 thiss!1204) (size!4518 (buf!5023 thiss!1204))))))

(declare-fun b!201985 () Bool)

(declare-fun res!169153 () Bool)

(assert (=> b!201985 (=> (not res!169153) (not e!138504))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!201985 (= res!169153 (validate_offset_bits!1 ((_ sign_extend 32) (size!4518 (buf!5023 thiss!1204))) ((_ sign_extend 32) (currentByte!9454 thiss!1204)) ((_ sign_extend 32) (currentBit!9449 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun res!169158 () Bool)

(assert (=> start!42892 (=> (not res!169158) (not e!138504))))

(assert (=> start!42892 (= res!169158 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42892 e!138504))

(assert (=> start!42892 true))

(declare-fun e!138506 () Bool)

(declare-fun inv!12 (BitStream!8144) Bool)

(assert (=> start!42892 (and (inv!12 thiss!1204) e!138506)))

(declare-fun b!201986 () Bool)

(declare-fun e!138501 () Bool)

(declare-datatypes ((tuple2!17272 0))(
  ( (tuple2!17273 (_1!9288 BitStream!8144) (_2!9288 Bool)) )
))
(declare-fun lt!314800 () tuple2!17272)

(declare-fun lt!314801 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!201986 (= e!138501 (= (bitIndex!0 (size!4518 (buf!5023 (_1!9288 lt!314800))) (currentByte!9454 (_1!9288 lt!314800)) (currentBit!9449 (_1!9288 lt!314800))) lt!314801))))

(declare-fun b!201987 () Bool)

(declare-fun e!138502 () Bool)

(assert (=> b!201987 (= e!138502 e!138501)))

(declare-fun res!169155 () Bool)

(assert (=> b!201987 (=> (not res!169155) (not e!138501))))

(declare-fun lt!314797 () Bool)

(declare-datatypes ((Unit!14329 0))(
  ( (Unit!14330) )
))
(declare-datatypes ((tuple2!17274 0))(
  ( (tuple2!17275 (_1!9289 Unit!14329) (_2!9289 BitStream!8144)) )
))
(declare-fun lt!314798 () tuple2!17274)

(assert (=> b!201987 (= res!169155 (and (= (_2!9288 lt!314800) lt!314797) (= (_1!9288 lt!314800) (_2!9289 lt!314798))))))

(declare-fun readBitPure!0 (BitStream!8144) tuple2!17272)

(declare-fun readerFrom!0 (BitStream!8144 (_ BitVec 32) (_ BitVec 32)) BitStream!8144)

(assert (=> b!201987 (= lt!314800 (readBitPure!0 (readerFrom!0 (_2!9289 lt!314798) (currentBit!9449 thiss!1204) (currentByte!9454 thiss!1204))))))

(declare-fun b!201988 () Bool)

(declare-fun e!138507 () Bool)

(assert (=> b!201988 (= e!138507 (or (not (= (bvand i!590 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (= (bvand i!590 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000))))))

(declare-fun b!201989 () Bool)

(assert (=> b!201989 (= e!138504 (not e!138507))))

(declare-fun res!169152 () Bool)

(assert (=> b!201989 (=> res!169152 e!138507)))

(assert (=> b!201989 (= res!169152 (not (= (bitIndex!0 (size!4518 (buf!5023 (_2!9289 lt!314798))) (currentByte!9454 (_2!9289 lt!314798)) (currentBit!9449 (_2!9289 lt!314798))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4518 (buf!5023 thiss!1204)) (currentByte!9454 thiss!1204) (currentBit!9449 thiss!1204))))))))

(declare-fun e!138505 () Bool)

(assert (=> b!201989 e!138505))

(declare-fun res!169160 () Bool)

(assert (=> b!201989 (=> (not res!169160) (not e!138505))))

(assert (=> b!201989 (= res!169160 (= (size!4518 (buf!5023 thiss!1204)) (size!4518 (buf!5023 (_2!9289 lt!314798)))))))

(declare-fun appendBit!0 (BitStream!8144 Bool) tuple2!17274)

(assert (=> b!201989 (= lt!314798 (appendBit!0 thiss!1204 lt!314797))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!201989 (= lt!314797 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!201990 () Bool)

(declare-fun res!169157 () Bool)

(assert (=> b!201990 (=> (not res!169157) (not e!138502))))

(declare-fun isPrefixOf!0 (BitStream!8144 BitStream!8144) Bool)

(assert (=> b!201990 (= res!169157 (isPrefixOf!0 thiss!1204 (_2!9289 lt!314798)))))

(declare-fun b!201991 () Bool)

(assert (=> b!201991 (= e!138505 e!138502)))

(declare-fun res!169159 () Bool)

(assert (=> b!201991 (=> (not res!169159) (not e!138502))))

(declare-fun lt!314799 () (_ BitVec 64))

(assert (=> b!201991 (= res!169159 (= lt!314801 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!314799)))))

(assert (=> b!201991 (= lt!314801 (bitIndex!0 (size!4518 (buf!5023 (_2!9289 lt!314798))) (currentByte!9454 (_2!9289 lt!314798)) (currentBit!9449 (_2!9289 lt!314798))))))

(assert (=> b!201991 (= lt!314799 (bitIndex!0 (size!4518 (buf!5023 thiss!1204)) (currentByte!9454 thiss!1204) (currentBit!9449 thiss!1204)))))

(declare-fun b!201992 () Bool)

(declare-fun array_inv!4259 (array!10266) Bool)

(assert (=> b!201992 (= e!138506 (array_inv!4259 (buf!5023 thiss!1204)))))

(declare-fun b!201993 () Bool)

(declare-fun res!169154 () Bool)

(assert (=> b!201993 (=> (not res!169154) (not e!138504))))

(assert (=> b!201993 (= res!169154 (not (= i!590 nBits!348)))))

(assert (= (and start!42892 res!169158) b!201985))

(assert (= (and b!201985 res!169153) b!201984))

(assert (= (and b!201984 res!169156) b!201993))

(assert (= (and b!201993 res!169154) b!201989))

(assert (= (and b!201989 res!169160) b!201991))

(assert (= (and b!201991 res!169159) b!201990))

(assert (= (and b!201990 res!169157) b!201987))

(assert (= (and b!201987 res!169155) b!201986))

(assert (= (and b!201989 (not res!169152)) b!201988))

(assert (= start!42892 b!201992))

(declare-fun m!312479 () Bool)

(assert (=> b!201990 m!312479))

(declare-fun m!312481 () Bool)

(assert (=> b!201986 m!312481))

(declare-fun m!312483 () Bool)

(assert (=> b!201987 m!312483))

(assert (=> b!201987 m!312483))

(declare-fun m!312485 () Bool)

(assert (=> b!201987 m!312485))

(declare-fun m!312487 () Bool)

(assert (=> b!201989 m!312487))

(declare-fun m!312489 () Bool)

(assert (=> b!201989 m!312489))

(declare-fun m!312491 () Bool)

(assert (=> b!201989 m!312491))

(assert (=> b!201991 m!312487))

(assert (=> b!201991 m!312489))

(declare-fun m!312493 () Bool)

(assert (=> b!201992 m!312493))

(declare-fun m!312495 () Bool)

(assert (=> start!42892 m!312495))

(declare-fun m!312497 () Bool)

(assert (=> b!201984 m!312497))

(declare-fun m!312499 () Bool)

(assert (=> b!201985 m!312499))

(push 1)

(assert (not start!42892))

(assert (not b!201992))

(assert (not b!201989))

(assert (not b!201985))

(assert (not b!201986))

(assert (not b!201991))

(assert (not b!201987))

(assert (not b!201990))

(assert (not b!201984))

(check-sat)

(pop 1)

(push 1)

(check-sat)

