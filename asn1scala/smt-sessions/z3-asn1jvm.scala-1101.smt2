; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31616 () Bool)

(assert start!31616)

(declare-fun b!158230 () Bool)

(declare-fun e!107490 () Bool)

(declare-fun e!107492 () Bool)

(assert (=> b!158230 (= e!107490 e!107492)))

(declare-fun res!132188 () Bool)

(assert (=> b!158230 (=> res!132188 e!107492)))

(declare-fun lt!249390 () (_ BitVec 64))

(declare-fun lt!249387 () (_ BitVec 32))

(declare-datatypes ((array!7358 0))(
  ( (array!7359 (arr!4242 (Array (_ BitVec 32) (_ BitVec 8))) (size!3333 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5850 0))(
  ( (BitStream!5851 (buf!3799 array!7358) (currentByte!6978 (_ BitVec 32)) (currentBit!6973 (_ BitVec 32))) )
))
(declare-fun lt!249386 () BitStream!5850)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!158230 (= res!132188 (not (validate_offset_bytes!0 ((_ sign_extend 32) (size!3333 (buf!3799 lt!249386))) lt!249390 ((_ sign_extend 32) (currentBit!6973 lt!249386)) lt!249387)))))

(declare-fun to!236 () (_ BitVec 32))

(declare-fun from!240 () (_ BitVec 32))

(assert (=> b!158230 (= lt!249387 (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun b!158231 () Bool)

(declare-fun e!107493 () Bool)

(declare-fun e!107494 () Bool)

(assert (=> b!158231 (= e!107493 e!107494)))

(declare-fun res!132185 () Bool)

(assert (=> b!158231 (=> (not res!132185) (not e!107494))))

(assert (=> b!158231 (= res!132185 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-fun bs!65 () BitStream!5850)

(declare-datatypes ((tuple2!14424 0))(
  ( (tuple2!14425 (_1!7674 BitStream!5850) (_2!7674 array!7358)) )
))
(declare-fun lt!249391 () tuple2!14424)

(declare-fun arr!153 () array!7358)

(declare-fun readByteArrayLoopPure!0 (BitStream!5850 array!7358 (_ BitVec 32) (_ BitVec 32)) tuple2!14424)

(declare-datatypes ((tuple2!14426 0))(
  ( (tuple2!14427 (_1!7675 BitStream!5850) (_2!7675 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5850) tuple2!14426)

(assert (=> b!158231 (= lt!249391 (readByteArrayLoopPure!0 lt!249386 (array!7359 (store (arr!4242 arr!153) from!240 (_2!7675 (readBytePure!0 bs!65))) (size!3333 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun withMovedByteIndex!0 (BitStream!5850 (_ BitVec 32)) BitStream!5850)

(assert (=> b!158231 (= lt!249386 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!249389 () tuple2!14424)

(assert (=> b!158231 (= lt!249389 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!158232 () Bool)

(declare-fun res!132186 () Bool)

(assert (=> b!158232 (=> (not res!132186) (not e!107493))))

(assert (=> b!158232 (= res!132186 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3333 (buf!3799 bs!65))) ((_ sign_extend 32) (currentByte!6978 bs!65)) ((_ sign_extend 32) (currentBit!6973 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!158233 () Bool)

(declare-fun e!107495 () Bool)

(declare-fun array_inv!3088 (array!7358) Bool)

(assert (=> b!158233 (= e!107495 (array_inv!3088 (buf!3799 bs!65)))))

(declare-fun b!158234 () Bool)

(assert (=> b!158234 (= e!107492 (bvslt lt!249387 (bvsub to!236 from!240)))))

(declare-fun lt!249392 () tuple2!14426)

(declare-fun lt!249385 () tuple2!14424)

(assert (=> b!158234 (= lt!249385 (readByteArrayLoopPure!0 (withMovedByteIndex!0 lt!249386 #b00000000000000000000000000000001) (array!7359 (store (store (arr!4242 arr!153) from!240 (_2!7675 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7675 lt!249392)) (size!3333 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) to!236))))

(declare-fun lt!249388 () (Array (_ BitVec 32) (_ BitVec 8)))

(assert (=> b!158234 (= lt!249388 (store (arr!4242 arr!153) from!240 (_2!7675 (readBytePure!0 bs!65))))))

(declare-fun b!158235 () Bool)

(assert (=> b!158235 (= e!107494 (not e!107490))))

(declare-fun res!132187 () Bool)

(assert (=> b!158235 (=> res!132187 e!107490)))

(assert (=> b!158235 (= res!132187 (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvsge (bvadd #b00000000000000000000000000000001 from!240) to!236)))))

(assert (=> b!158235 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3333 (buf!3799 lt!249386))) lt!249390 ((_ sign_extend 32) (currentBit!6973 lt!249386)) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001))))

(assert (=> b!158235 (= lt!249390 ((_ sign_extend 32) (currentByte!6978 lt!249386)))))

(declare-datatypes ((Unit!10576 0))(
  ( (Unit!10577) )
))
(declare-fun lt!249393 () Unit!10576)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5850 BitStream!5850 (_ BitVec 64) (_ BitVec 32)) Unit!10576)

(assert (=> b!158235 (= lt!249393 (validateOffsetBytesFromBitIndexLemma!0 bs!65 lt!249386 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)))))

(assert (=> b!158235 (= lt!249392 (readBytePure!0 lt!249386))))

(declare-fun res!132184 () Bool)

(assert (=> start!31616 (=> (not res!132184) (not e!107493))))

(assert (=> start!31616 (= res!132184 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3333 arr!153))))))

(assert (=> start!31616 e!107493))

(assert (=> start!31616 true))

(assert (=> start!31616 (array_inv!3088 arr!153)))

(declare-fun inv!12 (BitStream!5850) Bool)

(assert (=> start!31616 (and (inv!12 bs!65) e!107495)))

(assert (= (and start!31616 res!132184) b!158232))

(assert (= (and b!158232 res!132186) b!158231))

(assert (= (and b!158231 res!132185) b!158235))

(assert (= (and b!158235 (not res!132187)) b!158230))

(assert (= (and b!158230 (not res!132188)) b!158234))

(assert (= start!31616 b!158233))

(declare-fun m!248121 () Bool)

(assert (=> start!31616 m!248121))

(declare-fun m!248123 () Bool)

(assert (=> start!31616 m!248123))

(declare-fun m!248125 () Bool)

(assert (=> b!158231 m!248125))

(declare-fun m!248127 () Bool)

(assert (=> b!158231 m!248127))

(declare-fun m!248129 () Bool)

(assert (=> b!158231 m!248129))

(declare-fun m!248131 () Bool)

(assert (=> b!158231 m!248131))

(declare-fun m!248133 () Bool)

(assert (=> b!158231 m!248133))

(declare-fun m!248135 () Bool)

(assert (=> b!158235 m!248135))

(declare-fun m!248137 () Bool)

(assert (=> b!158235 m!248137))

(declare-fun m!248139 () Bool)

(assert (=> b!158235 m!248139))

(declare-fun m!248141 () Bool)

(assert (=> b!158233 m!248141))

(declare-fun m!248143 () Bool)

(assert (=> b!158232 m!248143))

(declare-fun m!248145 () Bool)

(assert (=> b!158230 m!248145))

(declare-fun m!248147 () Bool)

(assert (=> b!158234 m!248147))

(assert (=> b!158234 m!248125))

(assert (=> b!158234 m!248129))

(declare-fun m!248149 () Bool)

(assert (=> b!158234 m!248149))

(assert (=> b!158234 m!248149))

(declare-fun m!248151 () Bool)

(assert (=> b!158234 m!248151))

(check-sat (not b!158234) (not start!31616) (not b!158233) (not b!158230) (not b!158235) (not b!158231) (not b!158232))
(check-sat)
