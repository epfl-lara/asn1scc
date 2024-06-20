; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42896 () Bool)

(assert start!42896)

(declare-fun b!202044 () Bool)

(declare-fun res!169210 () Bool)

(declare-fun e!138546 () Bool)

(assert (=> b!202044 (=> (not res!169210) (not e!138546))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-datatypes ((array!10270 0))(
  ( (array!10271 (arr!5450 (Array (_ BitVec 32) (_ BitVec 8))) (size!4520 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8148 0))(
  ( (BitStream!8149 (buf!5025 array!10270) (currentByte!9456 (_ BitVec 32)) (currentBit!9451 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8148)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!202044 (= res!169210 (validate_offset_bits!1 ((_ sign_extend 32) (size!4520 (buf!5025 thiss!1204))) ((_ sign_extend 32) (currentByte!9456 thiss!1204)) ((_ sign_extend 32) (currentBit!9451 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!202045 () Bool)

(declare-fun e!138547 () Bool)

(declare-fun e!138543 () Bool)

(assert (=> b!202045 (= e!138547 e!138543)))

(declare-fun res!169208 () Bool)

(assert (=> b!202045 (=> (not res!169208) (not e!138543))))

(declare-datatypes ((tuple2!17280 0))(
  ( (tuple2!17281 (_1!9292 BitStream!8148) (_2!9292 Bool)) )
))
(declare-fun lt!314827 () tuple2!17280)

(declare-fun lt!314831 () Bool)

(declare-datatypes ((Unit!14333 0))(
  ( (Unit!14334) )
))
(declare-datatypes ((tuple2!17282 0))(
  ( (tuple2!17283 (_1!9293 Unit!14333) (_2!9293 BitStream!8148)) )
))
(declare-fun lt!314828 () tuple2!17282)

(assert (=> b!202045 (= res!169208 (and (= (_2!9292 lt!314827) lt!314831) (= (_1!9292 lt!314827) (_2!9293 lt!314828))))))

(declare-fun readBitPure!0 (BitStream!8148) tuple2!17280)

(declare-fun readerFrom!0 (BitStream!8148 (_ BitVec 32) (_ BitVec 32)) BitStream!8148)

(assert (=> b!202045 (= lt!314827 (readBitPure!0 (readerFrom!0 (_2!9293 lt!314828) (currentBit!9451 thiss!1204) (currentByte!9456 thiss!1204))))))

(declare-fun b!202046 () Bool)

(declare-fun res!169209 () Bool)

(assert (=> b!202046 (=> (not res!169209) (not e!138547))))

(declare-fun isPrefixOf!0 (BitStream!8148 BitStream!8148) Bool)

(assert (=> b!202046 (= res!169209 (isPrefixOf!0 thiss!1204 (_2!9293 lt!314828)))))

(declare-fun b!202047 () Bool)

(declare-fun lt!314829 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!202047 (= e!138543 (= (bitIndex!0 (size!4520 (buf!5025 (_1!9292 lt!314827))) (currentByte!9456 (_1!9292 lt!314827)) (currentBit!9451 (_1!9292 lt!314827))) lt!314829))))

(declare-fun b!202049 () Bool)

(declare-fun res!169214 () Bool)

(assert (=> b!202049 (=> (not res!169214) (not e!138546))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!202049 (= res!169214 (invariant!0 (currentBit!9451 thiss!1204) (currentByte!9456 thiss!1204) (size!4520 (buf!5025 thiss!1204))))))

(declare-fun b!202050 () Bool)

(declare-fun e!138548 () Bool)

(assert (=> b!202050 (= e!138548 e!138547)))

(declare-fun res!169211 () Bool)

(assert (=> b!202050 (=> (not res!169211) (not e!138547))))

(declare-fun lt!314830 () (_ BitVec 64))

(assert (=> b!202050 (= res!169211 (= lt!314829 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!314830)))))

(assert (=> b!202050 (= lt!314829 (bitIndex!0 (size!4520 (buf!5025 (_2!9293 lt!314828))) (currentByte!9456 (_2!9293 lt!314828)) (currentBit!9451 (_2!9293 lt!314828))))))

(assert (=> b!202050 (= lt!314830 (bitIndex!0 (size!4520 (buf!5025 thiss!1204)) (currentByte!9456 thiss!1204) (currentBit!9451 thiss!1204)))))

(declare-fun b!202051 () Bool)

(declare-fun e!138549 () Bool)

(assert (=> b!202051 (= e!138549 (bvslt (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) (bvsub nBits!348 i!590)))))

(declare-fun b!202048 () Bool)

(assert (=> b!202048 (= e!138546 (not e!138549))))

(declare-fun res!169206 () Bool)

(assert (=> b!202048 (=> res!169206 e!138549)))

(assert (=> b!202048 (= res!169206 (not (= (bitIndex!0 (size!4520 (buf!5025 (_2!9293 lt!314828))) (currentByte!9456 (_2!9293 lt!314828)) (currentBit!9451 (_2!9293 lt!314828))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4520 (buf!5025 thiss!1204)) (currentByte!9456 thiss!1204) (currentBit!9451 thiss!1204))))))))

(assert (=> b!202048 e!138548))

(declare-fun res!169213 () Bool)

(assert (=> b!202048 (=> (not res!169213) (not e!138548))))

(assert (=> b!202048 (= res!169213 (= (size!4520 (buf!5025 thiss!1204)) (size!4520 (buf!5025 (_2!9293 lt!314828)))))))

(declare-fun appendBit!0 (BitStream!8148 Bool) tuple2!17282)

(assert (=> b!202048 (= lt!314828 (appendBit!0 thiss!1204 lt!314831))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!202048 (= lt!314831 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!169212 () Bool)

(assert (=> start!42896 (=> (not res!169212) (not e!138546))))

(assert (=> start!42896 (= res!169212 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42896 e!138546))

(assert (=> start!42896 true))

(declare-fun e!138544 () Bool)

(declare-fun inv!12 (BitStream!8148) Bool)

(assert (=> start!42896 (and (inv!12 thiss!1204) e!138544)))

(declare-fun b!202052 () Bool)

(declare-fun res!169207 () Bool)

(assert (=> b!202052 (=> (not res!169207) (not e!138546))))

(assert (=> b!202052 (= res!169207 (not (= i!590 nBits!348)))))

(declare-fun b!202053 () Bool)

(declare-fun array_inv!4261 (array!10270) Bool)

(assert (=> b!202053 (= e!138544 (array_inv!4261 (buf!5025 thiss!1204)))))

(assert (= (and start!42896 res!169212) b!202044))

(assert (= (and b!202044 res!169210) b!202049))

(assert (= (and b!202049 res!169214) b!202052))

(assert (= (and b!202052 res!169207) b!202048))

(assert (= (and b!202048 res!169213) b!202050))

(assert (= (and b!202050 res!169211) b!202046))

(assert (= (and b!202046 res!169209) b!202045))

(assert (= (and b!202045 res!169208) b!202047))

(assert (= (and b!202048 (not res!169206)) b!202051))

(assert (= start!42896 b!202053))

(declare-fun m!312523 () Bool)

(assert (=> b!202047 m!312523))

(declare-fun m!312525 () Bool)

(assert (=> b!202053 m!312525))

(declare-fun m!312527 () Bool)

(assert (=> b!202048 m!312527))

(declare-fun m!312529 () Bool)

(assert (=> b!202048 m!312529))

(declare-fun m!312531 () Bool)

(assert (=> b!202048 m!312531))

(declare-fun m!312533 () Bool)

(assert (=> b!202049 m!312533))

(declare-fun m!312535 () Bool)

(assert (=> start!42896 m!312535))

(declare-fun m!312537 () Bool)

(assert (=> b!202046 m!312537))

(assert (=> b!202050 m!312527))

(assert (=> b!202050 m!312529))

(declare-fun m!312539 () Bool)

(assert (=> b!202044 m!312539))

(declare-fun m!312541 () Bool)

(assert (=> b!202045 m!312541))

(assert (=> b!202045 m!312541))

(declare-fun m!312543 () Bool)

(assert (=> b!202045 m!312543))

(check-sat (not start!42896) (not b!202045) (not b!202053) (not b!202047) (not b!202044) (not b!202046) (not b!202049) (not b!202048) (not b!202050))
(check-sat)
