; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31608 () Bool)

(assert start!31608)

(declare-fun b!158165 () Bool)

(declare-fun e!107413 () Bool)

(declare-fun e!107415 () Bool)

(assert (=> b!158165 (= e!107413 (not e!107415))))

(declare-fun res!132132 () Bool)

(assert (=> b!158165 (=> res!132132 e!107415)))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(assert (=> b!158165 (= res!132132 (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvsge (bvadd #b00000000000000000000000000000001 from!240) to!236)))))

(declare-datatypes ((array!7350 0))(
  ( (array!7351 (arr!4234 (Array (_ BitVec 32) (_ BitVec 8))) (size!3325 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5842 0))(
  ( (BitStream!5843 (buf!3795 array!7350) (currentByte!6974 (_ BitVec 32)) (currentBit!6969 (_ BitVec 32))) )
))
(declare-fun lt!249303 () BitStream!5842)

(declare-fun lt!249299 () (_ BitVec 64))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!158165 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3325 (buf!3795 lt!249303))) lt!249299 ((_ sign_extend 32) (currentBit!6969 lt!249303)) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001))))

(assert (=> b!158165 (= lt!249299 ((_ sign_extend 32) (currentByte!6974 lt!249303)))))

(declare-fun bs!65 () BitStream!5842)

(declare-datatypes ((Unit!10568 0))(
  ( (Unit!10569) )
))
(declare-fun lt!249301 () Unit!10568)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5842 BitStream!5842 (_ BitVec 64) (_ BitVec 32)) Unit!10568)

(assert (=> b!158165 (= lt!249301 (validateOffsetBytesFromBitIndexLemma!0 bs!65 lt!249303 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)))))

(declare-datatypes ((tuple2!14408 0))(
  ( (tuple2!14409 (_1!7666 BitStream!5842) (_2!7666 (_ BitVec 8))) )
))
(declare-fun lt!249300 () tuple2!14408)

(declare-fun readBytePure!0 (BitStream!5842) tuple2!14408)

(assert (=> b!158165 (= lt!249300 (readBytePure!0 lt!249303))))

(declare-fun res!132131 () Bool)

(declare-fun e!107416 () Bool)

(assert (=> start!31608 (=> (not res!132131) (not e!107416))))

(declare-fun arr!153 () array!7350)

(assert (=> start!31608 (= res!132131 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3325 arr!153))))))

(assert (=> start!31608 e!107416))

(assert (=> start!31608 true))

(declare-fun array_inv!3084 (array!7350) Bool)

(assert (=> start!31608 (array_inv!3084 arr!153)))

(declare-fun e!107414 () Bool)

(declare-fun inv!12 (BitStream!5842) Bool)

(assert (=> start!31608 (and (inv!12 bs!65) e!107414)))

(declare-fun b!158166 () Bool)

(declare-fun res!132134 () Bool)

(assert (=> b!158166 (=> (not res!132134) (not e!107416))))

(assert (=> b!158166 (= res!132134 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3325 (buf!3795 bs!65))) ((_ sign_extend 32) (currentByte!6974 bs!65)) ((_ sign_extend 32) (currentBit!6969 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!158167 () Bool)

(assert (=> b!158167 (= e!107416 e!107413)))

(declare-fun res!132133 () Bool)

(assert (=> b!158167 (=> (not res!132133) (not e!107413))))

(assert (=> b!158167 (= res!132133 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-datatypes ((tuple2!14410 0))(
  ( (tuple2!14411 (_1!7667 BitStream!5842) (_2!7667 array!7350)) )
))
(declare-fun lt!249302 () tuple2!14410)

(declare-fun readByteArrayLoopPure!0 (BitStream!5842 array!7350 (_ BitVec 32) (_ BitVec 32)) tuple2!14410)

(assert (=> b!158167 (= lt!249302 (readByteArrayLoopPure!0 lt!249303 (array!7351 (store (arr!4234 arr!153) from!240 (_2!7666 (readBytePure!0 bs!65))) (size!3325 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun withMovedByteIndex!0 (BitStream!5842 (_ BitVec 32)) BitStream!5842)

(assert (=> b!158167 (= lt!249303 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!249298 () tuple2!14410)

(assert (=> b!158167 (= lt!249298 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!158168 () Bool)

(assert (=> b!158168 (= e!107414 (array_inv!3084 (buf!3795 bs!65)))))

(declare-fun b!158169 () Bool)

(assert (=> b!158169 (= e!107415 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3325 (buf!3795 lt!249303))) lt!249299 ((_ sign_extend 32) (currentBit!6969 lt!249303)) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))))))

(assert (= (and start!31608 res!132131) b!158166))

(assert (= (and b!158166 res!132134) b!158167))

(assert (= (and b!158167 res!132133) b!158165))

(assert (= (and b!158165 (not res!132132)) b!158169))

(assert (= start!31608 b!158168))

(declare-fun m!248011 () Bool)

(assert (=> b!158166 m!248011))

(declare-fun m!248013 () Bool)

(assert (=> start!31608 m!248013))

(declare-fun m!248015 () Bool)

(assert (=> start!31608 m!248015))

(declare-fun m!248017 () Bool)

(assert (=> b!158168 m!248017))

(declare-fun m!248019 () Bool)

(assert (=> b!158167 m!248019))

(declare-fun m!248021 () Bool)

(assert (=> b!158167 m!248021))

(declare-fun m!248023 () Bool)

(assert (=> b!158167 m!248023))

(declare-fun m!248025 () Bool)

(assert (=> b!158167 m!248025))

(declare-fun m!248027 () Bool)

(assert (=> b!158167 m!248027))

(declare-fun m!248029 () Bool)

(assert (=> b!158169 m!248029))

(declare-fun m!248031 () Bool)

(assert (=> b!158165 m!248031))

(declare-fun m!248033 () Bool)

(assert (=> b!158165 m!248033))

(declare-fun m!248035 () Bool)

(assert (=> b!158165 m!248035))

(push 1)

(assert (not b!158168))

(assert (not b!158167))

(assert (not b!158165))

(assert (not b!158169))

(assert (not start!31608))

(assert (not b!158166))

(check-sat)

(pop 1)

(push 1)

(check-sat)

