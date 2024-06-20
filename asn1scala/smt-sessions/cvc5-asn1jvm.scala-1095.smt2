; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31526 () Bool)

(assert start!31526)

(declare-fun b!157894 () Bool)

(declare-fun e!107119 () Bool)

(assert (=> b!157894 (= e!107119 false)))

(declare-fun lt!248807 () (_ BitVec 64))

(declare-datatypes ((array!7317 0))(
  ( (array!7318 (arr!4215 (Array (_ BitVec 32) (_ BitVec 8))) (size!3310 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5812 0))(
  ( (BitStream!5813 (buf!3780 array!7317) (currentByte!6951 (_ BitVec 32)) (currentBit!6946 (_ BitVec 32))) )
))
(declare-fun lt!248803 () BitStream!5812)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!157894 (= lt!248807 (bitIndex!0 (size!3310 (buf!3780 lt!248803)) (currentByte!6951 lt!248803) (currentBit!6946 lt!248803)))))

(declare-fun b!157895 () Bool)

(declare-fun e!107120 () Bool)

(declare-fun bs!65 () BitStream!5812)

(declare-fun array_inv!3069 (array!7317) Bool)

(assert (=> b!157895 (= e!107120 (array_inv!3069 (buf!3780 bs!65)))))

(declare-fun b!157896 () Bool)

(declare-fun res!131913 () Bool)

(declare-fun e!107117 () Bool)

(assert (=> b!157896 (=> (not res!131913) (not e!107117))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!157896 (= res!131913 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3310 (buf!3780 bs!65))) ((_ sign_extend 32) (currentByte!6951 bs!65)) ((_ sign_extend 32) (currentBit!6946 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!157897 () Bool)

(declare-fun e!107122 () Bool)

(assert (=> b!157897 (= e!107117 e!107122)))

(declare-fun res!131914 () Bool)

(assert (=> b!157897 (=> (not res!131914) (not e!107122))))

(assert (=> b!157897 (= res!131914 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-datatypes ((tuple2!14334 0))(
  ( (tuple2!14335 (_1!7626 BitStream!5812) (_2!7626 array!7317)) )
))
(declare-fun lt!248804 () tuple2!14334)

(declare-fun arr!153 () array!7317)

(declare-fun readByteArrayLoopPure!0 (BitStream!5812 array!7317 (_ BitVec 32) (_ BitVec 32)) tuple2!14334)

(declare-datatypes ((tuple2!14336 0))(
  ( (tuple2!14337 (_1!7627 BitStream!5812) (_2!7627 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5812) tuple2!14336)

(assert (=> b!157897 (= lt!248804 (readByteArrayLoopPure!0 lt!248803 (array!7318 (store (arr!4215 arr!153) from!240 (_2!7627 (readBytePure!0 bs!65))) (size!3310 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun withMovedByteIndex!0 (BitStream!5812 (_ BitVec 32)) BitStream!5812)

(assert (=> b!157897 (= lt!248803 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!248805 () tuple2!14334)

(assert (=> b!157897 (= lt!248805 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!157898 () Bool)

(assert (=> b!157898 (= e!107122 e!107119)))

(declare-fun res!131912 () Bool)

(assert (=> b!157898 (=> (not res!131912) (not e!107119))))

(assert (=> b!157898 (= res!131912 (= (size!3310 (buf!3780 bs!65)) (size!3310 (buf!3780 lt!248803))))))

(declare-fun lt!248806 () tuple2!14336)

(assert (=> b!157898 (= lt!248806 (readBytePure!0 lt!248803))))

(declare-fun res!131915 () Bool)

(assert (=> start!31526 (=> (not res!131915) (not e!107117))))

(assert (=> start!31526 (= res!131915 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3310 arr!153))))))

(assert (=> start!31526 e!107117))

(assert (=> start!31526 true))

(assert (=> start!31526 (array_inv!3069 arr!153)))

(declare-fun inv!12 (BitStream!5812) Bool)

(assert (=> start!31526 (and (inv!12 bs!65) e!107120)))

(assert (= (and start!31526 res!131915) b!157896))

(assert (= (and b!157896 res!131913) b!157897))

(assert (= (and b!157897 res!131914) b!157898))

(assert (= (and b!157898 res!131912) b!157894))

(assert (= start!31526 b!157895))

(declare-fun m!247515 () Bool)

(assert (=> b!157895 m!247515))

(declare-fun m!247517 () Bool)

(assert (=> b!157894 m!247517))

(declare-fun m!247519 () Bool)

(assert (=> b!157897 m!247519))

(declare-fun m!247521 () Bool)

(assert (=> b!157897 m!247521))

(declare-fun m!247523 () Bool)

(assert (=> b!157897 m!247523))

(declare-fun m!247525 () Bool)

(assert (=> b!157897 m!247525))

(declare-fun m!247527 () Bool)

(assert (=> b!157897 m!247527))

(declare-fun m!247529 () Bool)

(assert (=> b!157896 m!247529))

(declare-fun m!247531 () Bool)

(assert (=> start!31526 m!247531))

(declare-fun m!247533 () Bool)

(assert (=> start!31526 m!247533))

(declare-fun m!247535 () Bool)

(assert (=> b!157898 m!247535))

(push 1)

(assert (not start!31526))

(assert (not b!157896))

(assert (not b!157894))

(assert (not b!157895))

(assert (not b!157897))

(assert (not b!157898))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

