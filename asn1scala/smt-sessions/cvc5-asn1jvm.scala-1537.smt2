; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42900 () Bool)

(assert start!42900)

(declare-fun b!202104 () Bool)

(declare-fun e!138591 () Bool)

(declare-datatypes ((array!10274 0))(
  ( (array!10275 (arr!5452 (Array (_ BitVec 32) (_ BitVec 8))) (size!4522 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8152 0))(
  ( (BitStream!8153 (buf!5027 array!10274) (currentByte!9458 (_ BitVec 32)) (currentBit!9453 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!17288 0))(
  ( (tuple2!17289 (_1!9296 BitStream!8152) (_2!9296 Bool)) )
))
(declare-fun lt!314861 () tuple2!17288)

(declare-fun lt!314862 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!202104 (= e!138591 (= (bitIndex!0 (size!4522 (buf!5027 (_1!9296 lt!314861))) (currentByte!9458 (_1!9296 lt!314861)) (currentBit!9453 (_1!9296 lt!314861))) lt!314862))))

(declare-fun b!202105 () Bool)

(declare-fun e!138589 () Bool)

(declare-fun e!138590 () Bool)

(assert (=> b!202105 (= e!138589 (not e!138590))))

(declare-fun res!169263 () Bool)

(assert (=> b!202105 (=> res!169263 e!138590)))

(declare-datatypes ((Unit!14337 0))(
  ( (Unit!14338) )
))
(declare-datatypes ((tuple2!17290 0))(
  ( (tuple2!17291 (_1!9297 Unit!14337) (_2!9297 BitStream!8152)) )
))
(declare-fun lt!314860 () tuple2!17290)

(declare-fun thiss!1204 () BitStream!8152)

(assert (=> b!202105 (= res!169263 (not (= (bitIndex!0 (size!4522 (buf!5027 (_2!9297 lt!314860))) (currentByte!9458 (_2!9297 lt!314860)) (currentBit!9453 (_2!9297 lt!314860))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4522 (buf!5027 thiss!1204)) (currentByte!9458 thiss!1204) (currentBit!9453 thiss!1204))))))))

(declare-fun e!138588 () Bool)

(assert (=> b!202105 e!138588))

(declare-fun res!169267 () Bool)

(assert (=> b!202105 (=> (not res!169267) (not e!138588))))

(assert (=> b!202105 (= res!169267 (= (size!4522 (buf!5027 thiss!1204)) (size!4522 (buf!5027 (_2!9297 lt!314860)))))))

(declare-fun lt!314864 () Bool)

(declare-fun appendBit!0 (BitStream!8152 Bool) tuple2!17290)

(assert (=> b!202105 (= lt!314860 (appendBit!0 thiss!1204 lt!314864))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!202105 (= lt!314864 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!202106 () Bool)

(declare-fun res!169261 () Bool)

(assert (=> b!202106 (=> (not res!169261) (not e!138589))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!202106 (= res!169261 (invariant!0 (currentBit!9453 thiss!1204) (currentByte!9458 thiss!1204) (size!4522 (buf!5027 thiss!1204))))))

(declare-fun b!202107 () Bool)

(declare-fun res!169268 () Bool)

(assert (=> b!202107 (=> (not res!169268) (not e!138589))))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!202107 (= res!169268 (not (= i!590 nBits!348)))))

(declare-fun b!202108 () Bool)

(declare-fun e!138586 () Bool)

(declare-fun array_inv!4263 (array!10274) Bool)

(assert (=> b!202108 (= e!138586 (array_inv!4263 (buf!5027 thiss!1204)))))

(declare-fun b!202110 () Bool)

(declare-fun e!138585 () Bool)

(assert (=> b!202110 (= e!138588 e!138585)))

(declare-fun res!169265 () Bool)

(assert (=> b!202110 (=> (not res!169265) (not e!138585))))

(declare-fun lt!314863 () (_ BitVec 64))

(assert (=> b!202110 (= res!169265 (= lt!314862 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!314863)))))

(assert (=> b!202110 (= lt!314862 (bitIndex!0 (size!4522 (buf!5027 (_2!9297 lt!314860))) (currentByte!9458 (_2!9297 lt!314860)) (currentBit!9453 (_2!9297 lt!314860))))))

(assert (=> b!202110 (= lt!314863 (bitIndex!0 (size!4522 (buf!5027 thiss!1204)) (currentByte!9458 thiss!1204) (currentBit!9453 thiss!1204)))))

(declare-fun b!202111 () Bool)

(declare-fun res!169264 () Bool)

(assert (=> b!202111 (=> (not res!169264) (not e!138585))))

(declare-fun isPrefixOf!0 (BitStream!8152 BitStream!8152) Bool)

(assert (=> b!202111 (= res!169264 (isPrefixOf!0 thiss!1204 (_2!9297 lt!314860)))))

(declare-fun b!202112 () Bool)

(assert (=> b!202112 (= e!138585 e!138591)))

(declare-fun res!169262 () Bool)

(assert (=> b!202112 (=> (not res!169262) (not e!138591))))

(assert (=> b!202112 (= res!169262 (and (= (_2!9296 lt!314861) lt!314864) (= (_1!9296 lt!314861) (_2!9297 lt!314860))))))

(declare-fun readBitPure!0 (BitStream!8152) tuple2!17288)

(declare-fun readerFrom!0 (BitStream!8152 (_ BitVec 32) (_ BitVec 32)) BitStream!8152)

(assert (=> b!202112 (= lt!314861 (readBitPure!0 (readerFrom!0 (_2!9297 lt!314860) (currentBit!9453 thiss!1204) (currentByte!9458 thiss!1204))))))

(declare-fun b!202113 () Bool)

(assert (=> b!202113 (= e!138590 (isPrefixOf!0 thiss!1204 (_2!9297 lt!314860)))))

(declare-fun lt!314859 () tuple2!17290)

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8152 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17290)

(assert (=> b!202113 (= lt!314859 (appendBitsLSBFirstLoopTR!0 (_2!9297 lt!314860) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!202109 () Bool)

(declare-fun res!169266 () Bool)

(assert (=> b!202109 (=> (not res!169266) (not e!138589))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!202109 (= res!169266 (validate_offset_bits!1 ((_ sign_extend 32) (size!4522 (buf!5027 thiss!1204))) ((_ sign_extend 32) (currentByte!9458 thiss!1204)) ((_ sign_extend 32) (currentBit!9453 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun res!169260 () Bool)

(assert (=> start!42900 (=> (not res!169260) (not e!138589))))

(assert (=> start!42900 (= res!169260 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42900 e!138589))

(assert (=> start!42900 true))

(declare-fun inv!12 (BitStream!8152) Bool)

(assert (=> start!42900 (and (inv!12 thiss!1204) e!138586)))

(assert (= (and start!42900 res!169260) b!202109))

(assert (= (and b!202109 res!169266) b!202106))

(assert (= (and b!202106 res!169261) b!202107))

(assert (= (and b!202107 res!169268) b!202105))

(assert (= (and b!202105 res!169267) b!202110))

(assert (= (and b!202110 res!169265) b!202111))

(assert (= (and b!202111 res!169264) b!202112))

(assert (= (and b!202112 res!169262) b!202104))

(assert (= (and b!202105 (not res!169263)) b!202113))

(assert (= start!42900 b!202108))

(declare-fun m!312567 () Bool)

(assert (=> b!202108 m!312567))

(declare-fun m!312569 () Bool)

(assert (=> b!202105 m!312569))

(declare-fun m!312571 () Bool)

(assert (=> b!202105 m!312571))

(declare-fun m!312573 () Bool)

(assert (=> b!202105 m!312573))

(declare-fun m!312575 () Bool)

(assert (=> b!202112 m!312575))

(assert (=> b!202112 m!312575))

(declare-fun m!312577 () Bool)

(assert (=> b!202112 m!312577))

(assert (=> b!202110 m!312569))

(assert (=> b!202110 m!312571))

(declare-fun m!312579 () Bool)

(assert (=> b!202106 m!312579))

(declare-fun m!312581 () Bool)

(assert (=> b!202113 m!312581))

(declare-fun m!312583 () Bool)

(assert (=> b!202113 m!312583))

(declare-fun m!312585 () Bool)

(assert (=> b!202104 m!312585))

(assert (=> b!202111 m!312581))

(declare-fun m!312587 () Bool)

(assert (=> b!202109 m!312587))

(declare-fun m!312589 () Bool)

(assert (=> start!42900 m!312589))

(push 1)

(assert (not b!202104))

(assert (not b!202106))

(assert (not b!202112))

(assert (not b!202108))

(assert (not b!202109))

(assert (not b!202110))

(assert (not start!42900))

(assert (not b!202105))

(assert (not b!202111))

(assert (not b!202113))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

