; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31026 () Bool)

(assert start!31026)

(declare-fun b!156551 () Bool)

(declare-fun res!130843 () Bool)

(declare-fun e!105799 () Bool)

(assert (=> b!156551 (=> (not res!130843) (not e!105799))))

(declare-datatypes ((array!7184 0))(
  ( (array!7185 (arr!4086 (Array (_ BitVec 32) (_ BitVec 8))) (size!3221 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5700 0))(
  ( (BitStream!5701 (buf!3724 array!7184) (currentByte!6851 (_ BitVec 32)) (currentBit!6846 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5700)

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!156551 (= res!130843 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3221 (buf!3724 bs!65))) ((_ sign_extend 32) (currentByte!6851 bs!65)) ((_ sign_extend 32) (currentBit!6846 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!156552 () Bool)

(declare-fun e!105798 () Bool)

(assert (=> b!156552 (= e!105799 e!105798)))

(declare-fun res!130840 () Bool)

(assert (=> b!156552 (=> (not res!130840) (not e!105798))))

(assert (=> b!156552 (= res!130840 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-fun lt!245188 () BitStream!5700)

(declare-datatypes ((tuple2!14024 0))(
  ( (tuple2!14025 (_1!7456 BitStream!5700) (_2!7456 array!7184)) )
))
(declare-fun lt!245190 () tuple2!14024)

(declare-fun arr!153 () array!7184)

(declare-fun readByteArrayLoopPure!0 (BitStream!5700 array!7184 (_ BitVec 32) (_ BitVec 32)) tuple2!14024)

(declare-datatypes ((tuple2!14026 0))(
  ( (tuple2!14027 (_1!7457 BitStream!5700) (_2!7457 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5700) tuple2!14026)

(assert (=> b!156552 (= lt!245190 (readByteArrayLoopPure!0 lt!245188 (array!7185 (store (arr!4086 arr!153) from!240 (_2!7457 (readBytePure!0 bs!65))) (size!3221 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun withMovedByteIndex!0 (BitStream!5700 (_ BitVec 32)) BitStream!5700)

(assert (=> b!156552 (= lt!245188 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!245189 () tuple2!14024)

(assert (=> b!156552 (= lt!245189 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!156553 () Bool)

(declare-fun e!105801 () Bool)

(assert (=> b!156553 (= e!105798 e!105801)))

(declare-fun res!130842 () Bool)

(assert (=> b!156553 (=> (not res!130842) (not e!105801))))

(assert (=> b!156553 (= res!130842 (= (size!3221 (buf!3724 bs!65)) (size!3221 (buf!3724 lt!245188))))))

(declare-fun lt!245187 () tuple2!14026)

(assert (=> b!156553 (= lt!245187 (readBytePure!0 lt!245188))))

(declare-fun res!130841 () Bool)

(assert (=> start!31026 (=> (not res!130841) (not e!105799))))

(assert (=> start!31026 (= res!130841 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3221 arr!153))))))

(assert (=> start!31026 e!105799))

(assert (=> start!31026 true))

(declare-fun array_inv!3010 (array!7184) Bool)

(assert (=> start!31026 (array_inv!3010 arr!153)))

(declare-fun e!105800 () Bool)

(declare-fun inv!12 (BitStream!5700) Bool)

(assert (=> start!31026 (and (inv!12 bs!65) e!105800)))

(declare-fun b!156554 () Bool)

(declare-fun res!130844 () Bool)

(assert (=> b!156554 (=> (not res!130844) (not e!105801))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!156554 (= res!130844 (bvsle #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3221 (buf!3724 lt!245188)) (currentByte!6851 lt!245188) (currentBit!6846 lt!245188))))))

(declare-fun b!156555 () Bool)

(assert (=> b!156555 (= e!105801 false)))

(declare-fun lt!245191 () (_ BitVec 64))

(assert (=> b!156555 (= lt!245191 (bitIndex!0 (size!3221 (buf!3724 bs!65)) (currentByte!6851 bs!65) (currentBit!6846 bs!65)))))

(declare-fun b!156556 () Bool)

(assert (=> b!156556 (= e!105800 (array_inv!3010 (buf!3724 bs!65)))))

(assert (= (and start!31026 res!130841) b!156551))

(assert (= (and b!156551 res!130843) b!156552))

(assert (= (and b!156552 res!130840) b!156553))

(assert (= (and b!156553 res!130842) b!156554))

(assert (= (and b!156554 res!130844) b!156555))

(assert (= start!31026 b!156556))

(declare-fun m!244113 () Bool)

(assert (=> b!156551 m!244113))

(declare-fun m!244115 () Bool)

(assert (=> b!156553 m!244115))

(declare-fun m!244117 () Bool)

(assert (=> b!156555 m!244117))

(declare-fun m!244119 () Bool)

(assert (=> b!156556 m!244119))

(declare-fun m!244121 () Bool)

(assert (=> b!156552 m!244121))

(declare-fun m!244123 () Bool)

(assert (=> b!156552 m!244123))

(declare-fun m!244125 () Bool)

(assert (=> b!156552 m!244125))

(declare-fun m!244127 () Bool)

(assert (=> b!156552 m!244127))

(declare-fun m!244129 () Bool)

(assert (=> b!156552 m!244129))

(declare-fun m!244131 () Bool)

(assert (=> b!156554 m!244131))

(declare-fun m!244133 () Bool)

(assert (=> start!31026 m!244133))

(declare-fun m!244135 () Bool)

(assert (=> start!31026 m!244135))

(check-sat (not b!156556) (not b!156553) (not b!156552) (not b!156551) (not start!31026) (not b!156555) (not b!156554))
