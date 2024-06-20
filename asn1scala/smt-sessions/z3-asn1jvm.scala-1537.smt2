; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42902 () Bool)

(assert start!42902)

(declare-fun b!202135 () Bool)

(declare-fun e!138611 () Bool)

(declare-datatypes ((array!10276 0))(
  ( (array!10277 (arr!5453 (Array (_ BitVec 32) (_ BitVec 8))) (size!4523 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8154 0))(
  ( (BitStream!8155 (buf!5028 array!10276) (currentByte!9459 (_ BitVec 32)) (currentBit!9454 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8154)

(declare-fun array_inv!4264 (array!10276) Bool)

(assert (=> b!202135 (= e!138611 (array_inv!4264 (buf!5028 thiss!1204)))))

(declare-fun b!202136 () Bool)

(declare-fun res!169293 () Bool)

(declare-fun e!138608 () Bool)

(assert (=> b!202136 (=> (not res!169293) (not e!138608))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!202136 (= res!169293 (not (= i!590 nBits!348)))))

(declare-fun b!202137 () Bool)

(declare-fun e!138609 () Bool)

(declare-fun e!138607 () Bool)

(assert (=> b!202137 (= e!138609 e!138607)))

(declare-fun res!169287 () Bool)

(assert (=> b!202137 (=> (not res!169287) (not e!138607))))

(declare-datatypes ((tuple2!17292 0))(
  ( (tuple2!17293 (_1!9298 BitStream!8154) (_2!9298 Bool)) )
))
(declare-fun lt!314880 () tuple2!17292)

(declare-fun lt!314879 () Bool)

(declare-datatypes ((Unit!14339 0))(
  ( (Unit!14340) )
))
(declare-datatypes ((tuple2!17294 0))(
  ( (tuple2!17295 (_1!9299 Unit!14339) (_2!9299 BitStream!8154)) )
))
(declare-fun lt!314881 () tuple2!17294)

(assert (=> b!202137 (= res!169287 (and (= (_2!9298 lt!314880) lt!314879) (= (_1!9298 lt!314880) (_2!9299 lt!314881))))))

(declare-fun readBitPure!0 (BitStream!8154) tuple2!17292)

(declare-fun readerFrom!0 (BitStream!8154 (_ BitVec 32) (_ BitVec 32)) BitStream!8154)

(assert (=> b!202137 (= lt!314880 (readBitPure!0 (readerFrom!0 (_2!9299 lt!314881) (currentBit!9454 thiss!1204) (currentByte!9459 thiss!1204))))))

(declare-fun b!202138 () Bool)

(declare-fun res!169290 () Bool)

(assert (=> b!202138 (=> (not res!169290) (not e!138609))))

(declare-fun isPrefixOf!0 (BitStream!8154 BitStream!8154) Bool)

(assert (=> b!202138 (= res!169290 (isPrefixOf!0 thiss!1204 (_2!9299 lt!314881)))))

(declare-fun b!202139 () Bool)

(declare-fun res!169295 () Bool)

(assert (=> b!202139 (=> (not res!169295) (not e!138608))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!202139 (= res!169295 (invariant!0 (currentBit!9454 thiss!1204) (currentByte!9459 thiss!1204) (size!4523 (buf!5028 thiss!1204))))))

(declare-fun b!202140 () Bool)

(declare-fun e!138610 () Bool)

(assert (=> b!202140 (= e!138610 (isPrefixOf!0 thiss!1204 (_2!9299 lt!314881)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!314877 () tuple2!17294)

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8154 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17294)

(assert (=> b!202140 (= lt!314877 (appendBitsLSBFirstLoopTR!0 (_2!9299 lt!314881) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!202141 () Bool)

(declare-fun e!138612 () Bool)

(assert (=> b!202141 (= e!138612 e!138609)))

(declare-fun res!169292 () Bool)

(assert (=> b!202141 (=> (not res!169292) (not e!138609))))

(declare-fun lt!314878 () (_ BitVec 64))

(declare-fun lt!314882 () (_ BitVec 64))

(assert (=> b!202141 (= res!169292 (= lt!314878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!314882)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!202141 (= lt!314878 (bitIndex!0 (size!4523 (buf!5028 (_2!9299 lt!314881))) (currentByte!9459 (_2!9299 lt!314881)) (currentBit!9454 (_2!9299 lt!314881))))))

(assert (=> b!202141 (= lt!314882 (bitIndex!0 (size!4523 (buf!5028 thiss!1204)) (currentByte!9459 thiss!1204) (currentBit!9454 thiss!1204)))))

(declare-fun res!169288 () Bool)

(assert (=> start!42902 (=> (not res!169288) (not e!138608))))

(assert (=> start!42902 (= res!169288 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42902 e!138608))

(assert (=> start!42902 true))

(declare-fun inv!12 (BitStream!8154) Bool)

(assert (=> start!42902 (and (inv!12 thiss!1204) e!138611)))

(declare-fun b!202134 () Bool)

(assert (=> b!202134 (= e!138607 (= (bitIndex!0 (size!4523 (buf!5028 (_1!9298 lt!314880))) (currentByte!9459 (_1!9298 lt!314880)) (currentBit!9454 (_1!9298 lt!314880))) lt!314878))))

(declare-fun b!202142 () Bool)

(declare-fun res!169294 () Bool)

(assert (=> b!202142 (=> (not res!169294) (not e!138608))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!202142 (= res!169294 (validate_offset_bits!1 ((_ sign_extend 32) (size!4523 (buf!5028 thiss!1204))) ((_ sign_extend 32) (currentByte!9459 thiss!1204)) ((_ sign_extend 32) (currentBit!9454 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!202143 () Bool)

(assert (=> b!202143 (= e!138608 (not e!138610))))

(declare-fun res!169289 () Bool)

(assert (=> b!202143 (=> res!169289 e!138610)))

(assert (=> b!202143 (= res!169289 (not (= (bitIndex!0 (size!4523 (buf!5028 (_2!9299 lt!314881))) (currentByte!9459 (_2!9299 lt!314881)) (currentBit!9454 (_2!9299 lt!314881))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4523 (buf!5028 thiss!1204)) (currentByte!9459 thiss!1204) (currentBit!9454 thiss!1204))))))))

(assert (=> b!202143 e!138612))

(declare-fun res!169291 () Bool)

(assert (=> b!202143 (=> (not res!169291) (not e!138612))))

(assert (=> b!202143 (= res!169291 (= (size!4523 (buf!5028 thiss!1204)) (size!4523 (buf!5028 (_2!9299 lt!314881)))))))

(declare-fun appendBit!0 (BitStream!8154 Bool) tuple2!17294)

(assert (=> b!202143 (= lt!314881 (appendBit!0 thiss!1204 lt!314879))))

(assert (=> b!202143 (= lt!314879 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!42902 res!169288) b!202142))

(assert (= (and b!202142 res!169294) b!202139))

(assert (= (and b!202139 res!169295) b!202136))

(assert (= (and b!202136 res!169293) b!202143))

(assert (= (and b!202143 res!169291) b!202141))

(assert (= (and b!202141 res!169292) b!202138))

(assert (= (and b!202138 res!169290) b!202137))

(assert (= (and b!202137 res!169287) b!202134))

(assert (= (and b!202143 (not res!169289)) b!202140))

(assert (= start!42902 b!202135))

(declare-fun m!312591 () Bool)

(assert (=> b!202140 m!312591))

(declare-fun m!312593 () Bool)

(assert (=> b!202140 m!312593))

(declare-fun m!312595 () Bool)

(assert (=> b!202135 m!312595))

(declare-fun m!312597 () Bool)

(assert (=> b!202137 m!312597))

(assert (=> b!202137 m!312597))

(declare-fun m!312599 () Bool)

(assert (=> b!202137 m!312599))

(declare-fun m!312601 () Bool)

(assert (=> b!202139 m!312601))

(declare-fun m!312603 () Bool)

(assert (=> start!42902 m!312603))

(declare-fun m!312605 () Bool)

(assert (=> b!202143 m!312605))

(declare-fun m!312607 () Bool)

(assert (=> b!202143 m!312607))

(declare-fun m!312609 () Bool)

(assert (=> b!202143 m!312609))

(assert (=> b!202141 m!312605))

(assert (=> b!202141 m!312607))

(assert (=> b!202138 m!312591))

(declare-fun m!312611 () Bool)

(assert (=> b!202142 m!312611))

(declare-fun m!312613 () Bool)

(assert (=> b!202134 m!312613))

(check-sat (not b!202143) (not b!202140) (not b!202137) (not b!202142) (not b!202139) (not b!202141) (not b!202138) (not b!202135) (not b!202134) (not start!42902))
