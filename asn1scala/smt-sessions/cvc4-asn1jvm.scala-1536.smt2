; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42898 () Bool)

(assert start!42898)

(declare-fun b!202074 () Bool)

(declare-fun e!138569 () Bool)

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!202074 (= e!138569 (bvslt (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) (bvsub nBits!348 i!590)))))

(declare-fun b!202075 () Bool)

(declare-fun res!169238 () Bool)

(declare-fun e!138570 () Bool)

(assert (=> b!202075 (=> (not res!169238) (not e!138570))))

(declare-datatypes ((array!10272 0))(
  ( (array!10273 (arr!5451 (Array (_ BitVec 32) (_ BitVec 8))) (size!4521 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8150 0))(
  ( (BitStream!8151 (buf!5026 array!10272) (currentByte!9457 (_ BitVec 32)) (currentBit!9452 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8150)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!202075 (= res!169238 (validate_offset_bits!1 ((_ sign_extend 32) (size!4521 (buf!5026 thiss!1204))) ((_ sign_extend 32) (currentByte!9457 thiss!1204)) ((_ sign_extend 32) (currentBit!9452 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun res!169240 () Bool)

(assert (=> start!42898 (=> (not res!169240) (not e!138570))))

(assert (=> start!42898 (= res!169240 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42898 e!138570))

(assert (=> start!42898 true))

(declare-fun e!138566 () Bool)

(declare-fun inv!12 (BitStream!8150) Bool)

(assert (=> start!42898 (and (inv!12 thiss!1204) e!138566)))

(declare-fun b!202076 () Bool)

(declare-fun e!138564 () Bool)

(declare-fun e!138567 () Bool)

(assert (=> b!202076 (= e!138564 e!138567)))

(declare-fun res!169235 () Bool)

(assert (=> b!202076 (=> (not res!169235) (not e!138567))))

(declare-fun lt!314843 () (_ BitVec 64))

(declare-fun lt!314845 () (_ BitVec 64))

(assert (=> b!202076 (= res!169235 (= lt!314843 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!314845)))))

(declare-datatypes ((Unit!14335 0))(
  ( (Unit!14336) )
))
(declare-datatypes ((tuple2!17284 0))(
  ( (tuple2!17285 (_1!9294 Unit!14335) (_2!9294 BitStream!8150)) )
))
(declare-fun lt!314842 () tuple2!17284)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!202076 (= lt!314843 (bitIndex!0 (size!4521 (buf!5026 (_2!9294 lt!314842))) (currentByte!9457 (_2!9294 lt!314842)) (currentBit!9452 (_2!9294 lt!314842))))))

(assert (=> b!202076 (= lt!314845 (bitIndex!0 (size!4521 (buf!5026 thiss!1204)) (currentByte!9457 thiss!1204) (currentBit!9452 thiss!1204)))))

(declare-fun b!202077 () Bool)

(assert (=> b!202077 (= e!138570 (not e!138569))))

(declare-fun res!169236 () Bool)

(assert (=> b!202077 (=> res!169236 e!138569)))

(assert (=> b!202077 (= res!169236 (not (= (bitIndex!0 (size!4521 (buf!5026 (_2!9294 lt!314842))) (currentByte!9457 (_2!9294 lt!314842)) (currentBit!9452 (_2!9294 lt!314842))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4521 (buf!5026 thiss!1204)) (currentByte!9457 thiss!1204) (currentBit!9452 thiss!1204))))))))

(assert (=> b!202077 e!138564))

(declare-fun res!169239 () Bool)

(assert (=> b!202077 (=> (not res!169239) (not e!138564))))

(assert (=> b!202077 (= res!169239 (= (size!4521 (buf!5026 thiss!1204)) (size!4521 (buf!5026 (_2!9294 lt!314842)))))))

(declare-fun lt!314844 () Bool)

(declare-fun appendBit!0 (BitStream!8150 Bool) tuple2!17284)

(assert (=> b!202077 (= lt!314842 (appendBit!0 thiss!1204 lt!314844))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!202077 (= lt!314844 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!202078 () Bool)

(declare-fun res!169233 () Bool)

(assert (=> b!202078 (=> (not res!169233) (not e!138567))))

(declare-fun isPrefixOf!0 (BitStream!8150 BitStream!8150) Bool)

(assert (=> b!202078 (= res!169233 (isPrefixOf!0 thiss!1204 (_2!9294 lt!314842)))))

(declare-fun b!202079 () Bool)

(declare-fun array_inv!4262 (array!10272) Bool)

(assert (=> b!202079 (= e!138566 (array_inv!4262 (buf!5026 thiss!1204)))))

(declare-fun b!202080 () Bool)

(declare-fun res!169241 () Bool)

(assert (=> b!202080 (=> (not res!169241) (not e!138570))))

(assert (=> b!202080 (= res!169241 (not (= i!590 nBits!348)))))

(declare-fun b!202081 () Bool)

(declare-fun e!138568 () Bool)

(declare-datatypes ((tuple2!17286 0))(
  ( (tuple2!17287 (_1!9295 BitStream!8150) (_2!9295 Bool)) )
))
(declare-fun lt!314846 () tuple2!17286)

(assert (=> b!202081 (= e!138568 (= (bitIndex!0 (size!4521 (buf!5026 (_1!9295 lt!314846))) (currentByte!9457 (_1!9295 lt!314846)) (currentBit!9452 (_1!9295 lt!314846))) lt!314843))))

(declare-fun b!202082 () Bool)

(assert (=> b!202082 (= e!138567 e!138568)))

(declare-fun res!169234 () Bool)

(assert (=> b!202082 (=> (not res!169234) (not e!138568))))

(assert (=> b!202082 (= res!169234 (and (= (_2!9295 lt!314846) lt!314844) (= (_1!9295 lt!314846) (_2!9294 lt!314842))))))

(declare-fun readBitPure!0 (BitStream!8150) tuple2!17286)

(declare-fun readerFrom!0 (BitStream!8150 (_ BitVec 32) (_ BitVec 32)) BitStream!8150)

(assert (=> b!202082 (= lt!314846 (readBitPure!0 (readerFrom!0 (_2!9294 lt!314842) (currentBit!9452 thiss!1204) (currentByte!9457 thiss!1204))))))

(declare-fun b!202083 () Bool)

(declare-fun res!169237 () Bool)

(assert (=> b!202083 (=> (not res!169237) (not e!138570))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!202083 (= res!169237 (invariant!0 (currentBit!9452 thiss!1204) (currentByte!9457 thiss!1204) (size!4521 (buf!5026 thiss!1204))))))

(assert (= (and start!42898 res!169240) b!202075))

(assert (= (and b!202075 res!169238) b!202083))

(assert (= (and b!202083 res!169237) b!202080))

(assert (= (and b!202080 res!169241) b!202077))

(assert (= (and b!202077 res!169239) b!202076))

(assert (= (and b!202076 res!169235) b!202078))

(assert (= (and b!202078 res!169233) b!202082))

(assert (= (and b!202082 res!169234) b!202081))

(assert (= (and b!202077 (not res!169236)) b!202074))

(assert (= start!42898 b!202079))

(declare-fun m!312545 () Bool)

(assert (=> b!202075 m!312545))

(declare-fun m!312547 () Bool)

(assert (=> b!202076 m!312547))

(declare-fun m!312549 () Bool)

(assert (=> b!202076 m!312549))

(declare-fun m!312551 () Bool)

(assert (=> b!202083 m!312551))

(assert (=> b!202077 m!312547))

(assert (=> b!202077 m!312549))

(declare-fun m!312553 () Bool)

(assert (=> b!202077 m!312553))

(declare-fun m!312555 () Bool)

(assert (=> b!202079 m!312555))

(declare-fun m!312557 () Bool)

(assert (=> start!42898 m!312557))

(declare-fun m!312559 () Bool)

(assert (=> b!202082 m!312559))

(assert (=> b!202082 m!312559))

(declare-fun m!312561 () Bool)

(assert (=> b!202082 m!312561))

(declare-fun m!312563 () Bool)

(assert (=> b!202078 m!312563))

(declare-fun m!312565 () Bool)

(assert (=> b!202081 m!312565))

(push 1)

(assert (not b!202076))

(assert (not b!202081))

(assert (not b!202077))

(assert (not b!202079))

(assert (not start!42898))

(assert (not b!202083))

(assert (not b!202078))

(assert (not b!202082))

(assert (not b!202075))

(check-sat)

(pop 1)

(push 1)

(check-sat)

