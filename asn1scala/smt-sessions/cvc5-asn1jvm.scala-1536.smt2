; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42894 () Bool)

(assert start!42894)

(declare-fun b!202014 () Bool)

(declare-fun e!138527 () Bool)

(declare-fun e!138523 () Bool)

(assert (=> b!202014 (= e!138527 e!138523)))

(declare-fun res!169180 () Bool)

(assert (=> b!202014 (=> (not res!169180) (not e!138523))))

(declare-datatypes ((array!10268 0))(
  ( (array!10269 (arr!5449 (Array (_ BitVec 32) (_ BitVec 8))) (size!4519 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8146 0))(
  ( (BitStream!8147 (buf!5024 array!10268) (currentByte!9455 (_ BitVec 32)) (currentBit!9450 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!14331 0))(
  ( (Unit!14332) )
))
(declare-datatypes ((tuple2!17276 0))(
  ( (tuple2!17277 (_1!9290 Unit!14331) (_2!9290 BitStream!8146)) )
))
(declare-fun lt!314815 () tuple2!17276)

(declare-fun lt!314814 () Bool)

(declare-datatypes ((tuple2!17278 0))(
  ( (tuple2!17279 (_1!9291 BitStream!8146) (_2!9291 Bool)) )
))
(declare-fun lt!314812 () tuple2!17278)

(assert (=> b!202014 (= res!169180 (and (= (_2!9291 lt!314812) lt!314814) (= (_1!9291 lt!314812) (_2!9290 lt!314815))))))

(declare-fun thiss!1204 () BitStream!8146)

(declare-fun readBitPure!0 (BitStream!8146) tuple2!17278)

(declare-fun readerFrom!0 (BitStream!8146 (_ BitVec 32) (_ BitVec 32)) BitStream!8146)

(assert (=> b!202014 (= lt!314812 (readBitPure!0 (readerFrom!0 (_2!9290 lt!314815) (currentBit!9450 thiss!1204) (currentByte!9455 thiss!1204))))))

(declare-fun b!202015 () Bool)

(declare-fun res!169187 () Bool)

(assert (=> b!202015 (=> (not res!169187) (not e!138527))))

(declare-fun isPrefixOf!0 (BitStream!8146 BitStream!8146) Bool)

(assert (=> b!202015 (= res!169187 (isPrefixOf!0 thiss!1204 (_2!9290 lt!314815)))))

(declare-fun b!202016 () Bool)

(declare-fun res!169186 () Bool)

(declare-fun e!138524 () Bool)

(assert (=> b!202016 (=> (not res!169186) (not e!138524))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!202016 (= res!169186 (validate_offset_bits!1 ((_ sign_extend 32) (size!4519 (buf!5024 thiss!1204))) ((_ sign_extend 32) (currentByte!9455 thiss!1204)) ((_ sign_extend 32) (currentBit!9450 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!202017 () Bool)

(declare-fun e!138522 () Bool)

(assert (=> b!202017 (= e!138522 e!138527)))

(declare-fun res!169183 () Bool)

(assert (=> b!202017 (=> (not res!169183) (not e!138527))))

(declare-fun lt!314813 () (_ BitVec 64))

(declare-fun lt!314816 () (_ BitVec 64))

(assert (=> b!202017 (= res!169183 (= lt!314813 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!314816)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!202017 (= lt!314813 (bitIndex!0 (size!4519 (buf!5024 (_2!9290 lt!314815))) (currentByte!9455 (_2!9290 lt!314815)) (currentBit!9450 (_2!9290 lt!314815))))))

(assert (=> b!202017 (= lt!314816 (bitIndex!0 (size!4519 (buf!5024 thiss!1204)) (currentByte!9455 thiss!1204) (currentBit!9450 thiss!1204)))))

(declare-fun b!202018 () Bool)

(declare-fun res!169182 () Bool)

(assert (=> b!202018 (=> (not res!169182) (not e!138524))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!202018 (= res!169182 (invariant!0 (currentBit!9450 thiss!1204) (currentByte!9455 thiss!1204) (size!4519 (buf!5024 thiss!1204))))))

(declare-fun res!169184 () Bool)

(assert (=> start!42894 (=> (not res!169184) (not e!138524))))

(assert (=> start!42894 (= res!169184 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42894 e!138524))

(assert (=> start!42894 true))

(declare-fun e!138528 () Bool)

(declare-fun inv!12 (BitStream!8146) Bool)

(assert (=> start!42894 (and (inv!12 thiss!1204) e!138528)))

(declare-fun b!202019 () Bool)

(declare-fun e!138525 () Bool)

(assert (=> b!202019 (= e!138525 (bvslt (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) (bvsub nBits!348 i!590)))))

(declare-fun b!202020 () Bool)

(assert (=> b!202020 (= e!138524 (not e!138525))))

(declare-fun res!169181 () Bool)

(assert (=> b!202020 (=> res!169181 e!138525)))

(assert (=> b!202020 (= res!169181 (not (= (bitIndex!0 (size!4519 (buf!5024 (_2!9290 lt!314815))) (currentByte!9455 (_2!9290 lt!314815)) (currentBit!9450 (_2!9290 lt!314815))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4519 (buf!5024 thiss!1204)) (currentByte!9455 thiss!1204) (currentBit!9450 thiss!1204))))))))

(assert (=> b!202020 e!138522))

(declare-fun res!169179 () Bool)

(assert (=> b!202020 (=> (not res!169179) (not e!138522))))

(assert (=> b!202020 (= res!169179 (= (size!4519 (buf!5024 thiss!1204)) (size!4519 (buf!5024 (_2!9290 lt!314815)))))))

(declare-fun appendBit!0 (BitStream!8146 Bool) tuple2!17276)

(assert (=> b!202020 (= lt!314815 (appendBit!0 thiss!1204 lt!314814))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!202020 (= lt!314814 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!202021 () Bool)

(declare-fun res!169185 () Bool)

(assert (=> b!202021 (=> (not res!169185) (not e!138524))))

(assert (=> b!202021 (= res!169185 (not (= i!590 nBits!348)))))

(declare-fun b!202022 () Bool)

(assert (=> b!202022 (= e!138523 (= (bitIndex!0 (size!4519 (buf!5024 (_1!9291 lt!314812))) (currentByte!9455 (_1!9291 lt!314812)) (currentBit!9450 (_1!9291 lt!314812))) lt!314813))))

(declare-fun b!202023 () Bool)

(declare-fun array_inv!4260 (array!10268) Bool)

(assert (=> b!202023 (= e!138528 (array_inv!4260 (buf!5024 thiss!1204)))))

(assert (= (and start!42894 res!169184) b!202016))

(assert (= (and b!202016 res!169186) b!202018))

(assert (= (and b!202018 res!169182) b!202021))

(assert (= (and b!202021 res!169185) b!202020))

(assert (= (and b!202020 res!169179) b!202017))

(assert (= (and b!202017 res!169183) b!202015))

(assert (= (and b!202015 res!169187) b!202014))

(assert (= (and b!202014 res!169180) b!202022))

(assert (= (and b!202020 (not res!169181)) b!202019))

(assert (= start!42894 b!202023))

(declare-fun m!312501 () Bool)

(assert (=> b!202015 m!312501))

(declare-fun m!312503 () Bool)

(assert (=> b!202022 m!312503))

(declare-fun m!312505 () Bool)

(assert (=> b!202020 m!312505))

(declare-fun m!312507 () Bool)

(assert (=> b!202020 m!312507))

(declare-fun m!312509 () Bool)

(assert (=> b!202020 m!312509))

(declare-fun m!312511 () Bool)

(assert (=> b!202014 m!312511))

(assert (=> b!202014 m!312511))

(declare-fun m!312513 () Bool)

(assert (=> b!202014 m!312513))

(declare-fun m!312515 () Bool)

(assert (=> b!202018 m!312515))

(declare-fun m!312517 () Bool)

(assert (=> b!202023 m!312517))

(declare-fun m!312519 () Bool)

(assert (=> b!202016 m!312519))

(assert (=> b!202017 m!312505))

(assert (=> b!202017 m!312507))

(declare-fun m!312521 () Bool)

(assert (=> start!42894 m!312521))

(push 1)

(assert (not b!202015))

(assert (not b!202022))

(assert (not b!202016))

(assert (not b!202017))

(assert (not b!202014))

(assert (not b!202020))

(assert (not b!202018))

(assert (not start!42894))

(assert (not b!202023))

(check-sat)

(pop 1)

(push 1)

(check-sat)

