; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31606 () Bool)

(assert start!31606)

(declare-fun b!158151 () Bool)

(declare-fun res!132122 () Bool)

(declare-fun e!107396 () Bool)

(assert (=> b!158151 (=> (not res!132122) (not e!107396))))

(declare-datatypes ((array!7348 0))(
  ( (array!7349 (arr!4233 (Array (_ BitVec 32) (_ BitVec 8))) (size!3324 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5840 0))(
  ( (BitStream!5841 (buf!3794 array!7348) (currentByte!6973 (_ BitVec 32)) (currentBit!6968 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5840)

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!158151 (= res!132122 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3324 (buf!3794 bs!65))) ((_ sign_extend 32) (currentByte!6973 bs!65)) ((_ sign_extend 32) (currentBit!6968 bs!65)) (bvsub to!236 from!240)))))

(declare-fun res!132120 () Bool)

(assert (=> start!31606 (=> (not res!132120) (not e!107396))))

(declare-fun arr!153 () array!7348)

(assert (=> start!31606 (= res!132120 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3324 arr!153))))))

(assert (=> start!31606 e!107396))

(assert (=> start!31606 true))

(declare-fun array_inv!3083 (array!7348) Bool)

(assert (=> start!31606 (array_inv!3083 arr!153)))

(declare-fun e!107399 () Bool)

(declare-fun inv!12 (BitStream!5840) Bool)

(assert (=> start!31606 (and (inv!12 bs!65) e!107399)))

(declare-fun b!158154 () Bool)

(assert (=> b!158154 (= e!107399 (array_inv!3083 (buf!3794 bs!65)))))

(declare-fun b!158153 () Bool)

(declare-fun e!107400 () Bool)

(assert (=> b!158153 (= e!107400 (not (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvslt (bvadd #b00000000000000000000000000000001 from!240) to!236))))))

(declare-fun lt!249283 () BitStream!5840)

(assert (=> b!158153 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3324 (buf!3794 lt!249283))) ((_ sign_extend 32) (currentByte!6973 lt!249283)) ((_ sign_extend 32) (currentBit!6968 lt!249283)) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!10566 0))(
  ( (Unit!10567) )
))
(declare-fun lt!249284 () Unit!10566)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5840 BitStream!5840 (_ BitVec 64) (_ BitVec 32)) Unit!10566)

(assert (=> b!158153 (= lt!249284 (validateOffsetBytesFromBitIndexLemma!0 bs!65 lt!249283 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)))))

(declare-datatypes ((tuple2!14404 0))(
  ( (tuple2!14405 (_1!7664 BitStream!5840) (_2!7664 (_ BitVec 8))) )
))
(declare-fun lt!249285 () tuple2!14404)

(declare-fun readBytePure!0 (BitStream!5840) tuple2!14404)

(assert (=> b!158153 (= lt!249285 (readBytePure!0 lt!249283))))

(declare-fun b!158152 () Bool)

(assert (=> b!158152 (= e!107396 e!107400)))

(declare-fun res!132121 () Bool)

(assert (=> b!158152 (=> (not res!132121) (not e!107400))))

(assert (=> b!158152 (= res!132121 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-datatypes ((tuple2!14406 0))(
  ( (tuple2!14407 (_1!7665 BitStream!5840) (_2!7665 array!7348)) )
))
(declare-fun lt!249282 () tuple2!14406)

(declare-fun readByteArrayLoopPure!0 (BitStream!5840 array!7348 (_ BitVec 32) (_ BitVec 32)) tuple2!14406)

(assert (=> b!158152 (= lt!249282 (readByteArrayLoopPure!0 lt!249283 (array!7349 (store (arr!4233 arr!153) from!240 (_2!7664 (readBytePure!0 bs!65))) (size!3324 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun withMovedByteIndex!0 (BitStream!5840 (_ BitVec 32)) BitStream!5840)

(assert (=> b!158152 (= lt!249283 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!249281 () tuple2!14406)

(assert (=> b!158152 (= lt!249281 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(assert (= (and start!31606 res!132120) b!158151))

(assert (= (and b!158151 res!132122) b!158152))

(assert (= (and b!158152 res!132121) b!158153))

(assert (= start!31606 b!158154))

(declare-fun m!247987 () Bool)

(assert (=> b!158154 m!247987))

(declare-fun m!247989 () Bool)

(assert (=> b!158153 m!247989))

(declare-fun m!247991 () Bool)

(assert (=> b!158153 m!247991))

(declare-fun m!247993 () Bool)

(assert (=> b!158153 m!247993))

(declare-fun m!247995 () Bool)

(assert (=> b!158152 m!247995))

(declare-fun m!247997 () Bool)

(assert (=> b!158152 m!247997))

(declare-fun m!247999 () Bool)

(assert (=> b!158152 m!247999))

(declare-fun m!248001 () Bool)

(assert (=> b!158152 m!248001))

(declare-fun m!248003 () Bool)

(assert (=> b!158152 m!248003))

(declare-fun m!248005 () Bool)

(assert (=> b!158151 m!248005))

(declare-fun m!248007 () Bool)

(assert (=> start!31606 m!248007))

(declare-fun m!248009 () Bool)

(assert (=> start!31606 m!248009))

(push 1)

(assert (not b!158152))

(assert (not b!158154))

(assert (not start!31606))

(assert (not b!158151))

(assert (not b!158153))

(check-sat)

(pop 1)

(push 1)

(check-sat)

