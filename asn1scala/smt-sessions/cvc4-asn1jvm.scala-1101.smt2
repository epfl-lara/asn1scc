; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31618 () Bool)

(assert start!31618)

(declare-fun b!158248 () Bool)

(declare-fun e!107514 () Bool)

(declare-fun e!107516 () Bool)

(assert (=> b!158248 (= e!107514 e!107516)))

(declare-fun res!132201 () Bool)

(assert (=> b!158248 (=> res!132201 e!107516)))

(declare-datatypes ((array!7360 0))(
  ( (array!7361 (arr!4245 (Array (_ BitVec 32) (_ BitVec 8))) (size!3336 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5852 0))(
  ( (BitStream!5853 (buf!3800 array!7360) (currentByte!6979 (_ BitVec 32)) (currentBit!6974 (_ BitVec 32))) )
))
(declare-fun lt!249420 () BitStream!5852)

(declare-fun lt!249415 () (_ BitVec 64))

(declare-fun lt!249419 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!158248 (= res!132201 (not (validate_offset_bytes!0 ((_ sign_extend 32) (size!3336 (buf!3800 lt!249420))) lt!249415 ((_ sign_extend 32) (currentBit!6974 lt!249420)) lt!249419)))))

(declare-fun to!236 () (_ BitVec 32))

(declare-fun from!240 () (_ BitVec 32))

(assert (=> b!158248 (= lt!249419 (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun b!158249 () Bool)

(assert (=> b!158249 (= e!107516 (bvslt lt!249419 (bvsub to!236 from!240)))))

(declare-datatypes ((tuple2!14428 0))(
  ( (tuple2!14429 (_1!7676 BitStream!5852) (_2!7676 (_ BitVec 8))) )
))
(declare-fun lt!249418 () tuple2!14428)

(declare-datatypes ((tuple2!14430 0))(
  ( (tuple2!14431 (_1!7677 BitStream!5852) (_2!7677 array!7360)) )
))
(declare-fun lt!249414 () tuple2!14430)

(declare-fun arr!153 () array!7360)

(declare-fun bs!65 () BitStream!5852)

(declare-fun readByteArrayLoopPure!0 (BitStream!5852 array!7360 (_ BitVec 32) (_ BitVec 32)) tuple2!14430)

(declare-fun withMovedByteIndex!0 (BitStream!5852 (_ BitVec 32)) BitStream!5852)

(declare-fun readBytePure!0 (BitStream!5852) tuple2!14428)

(assert (=> b!158249 (= lt!249414 (readByteArrayLoopPure!0 (withMovedByteIndex!0 lt!249420 #b00000000000000000000000000000001) (array!7361 (store (store (arr!4245 arr!153) from!240 (_2!7676 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7676 lt!249418)) (size!3336 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) to!236))))

(declare-fun lt!249413 () (Array (_ BitVec 32) (_ BitVec 8)))

(assert (=> b!158249 (= lt!249413 (store (arr!4245 arr!153) from!240 (_2!7676 (readBytePure!0 bs!65))))))

(declare-fun b!158250 () Bool)

(declare-fun e!107513 () Bool)

(declare-fun array_inv!3089 (array!7360) Bool)

(assert (=> b!158250 (= e!107513 (array_inv!3089 (buf!3800 bs!65)))))

(declare-fun res!132202 () Bool)

(declare-fun e!107511 () Bool)

(assert (=> start!31618 (=> (not res!132202) (not e!107511))))

(assert (=> start!31618 (= res!132202 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3336 arr!153))))))

(assert (=> start!31618 e!107511))

(assert (=> start!31618 true))

(assert (=> start!31618 (array_inv!3089 arr!153)))

(declare-fun inv!12 (BitStream!5852) Bool)

(assert (=> start!31618 (and (inv!12 bs!65) e!107513)))

(declare-fun b!158251 () Bool)

(declare-fun e!107515 () Bool)

(assert (=> b!158251 (= e!107515 (not e!107514))))

(declare-fun res!132199 () Bool)

(assert (=> b!158251 (=> res!132199 e!107514)))

(assert (=> b!158251 (= res!132199 (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvsge (bvadd #b00000000000000000000000000000001 from!240) to!236)))))

(assert (=> b!158251 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3336 (buf!3800 lt!249420))) lt!249415 ((_ sign_extend 32) (currentBit!6974 lt!249420)) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001))))

(assert (=> b!158251 (= lt!249415 ((_ sign_extend 32) (currentByte!6979 lt!249420)))))

(declare-datatypes ((Unit!10578 0))(
  ( (Unit!10579) )
))
(declare-fun lt!249417 () Unit!10578)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5852 BitStream!5852 (_ BitVec 64) (_ BitVec 32)) Unit!10578)

(assert (=> b!158251 (= lt!249417 (validateOffsetBytesFromBitIndexLemma!0 bs!65 lt!249420 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)))))

(assert (=> b!158251 (= lt!249418 (readBytePure!0 lt!249420))))

(declare-fun b!158252 () Bool)

(declare-fun res!132200 () Bool)

(assert (=> b!158252 (=> (not res!132200) (not e!107511))))

(assert (=> b!158252 (= res!132200 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3336 (buf!3800 bs!65))) ((_ sign_extend 32) (currentByte!6979 bs!65)) ((_ sign_extend 32) (currentBit!6974 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!158253 () Bool)

(assert (=> b!158253 (= e!107511 e!107515)))

(declare-fun res!132203 () Bool)

(assert (=> b!158253 (=> (not res!132203) (not e!107515))))

(assert (=> b!158253 (= res!132203 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-fun lt!249416 () tuple2!14430)

(assert (=> b!158253 (= lt!249416 (readByteArrayLoopPure!0 lt!249420 (array!7361 (store (arr!4245 arr!153) from!240 (_2!7676 (readBytePure!0 bs!65))) (size!3336 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> b!158253 (= lt!249420 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!249412 () tuple2!14430)

(assert (=> b!158253 (= lt!249412 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(assert (= (and start!31618 res!132202) b!158252))

(assert (= (and b!158252 res!132200) b!158253))

(assert (= (and b!158253 res!132203) b!158251))

(assert (= (and b!158251 (not res!132199)) b!158248))

(assert (= (and b!158248 (not res!132201)) b!158249))

(assert (= start!31618 b!158250))

(declare-fun m!248153 () Bool)

(assert (=> b!158253 m!248153))

(declare-fun m!248155 () Bool)

(assert (=> b!158253 m!248155))

(declare-fun m!248157 () Bool)

(assert (=> b!158253 m!248157))

(declare-fun m!248159 () Bool)

(assert (=> b!158253 m!248159))

(declare-fun m!248161 () Bool)

(assert (=> b!158253 m!248161))

(declare-fun m!248163 () Bool)

(assert (=> b!158251 m!248163))

(declare-fun m!248165 () Bool)

(assert (=> b!158251 m!248165))

(declare-fun m!248167 () Bool)

(assert (=> b!158251 m!248167))

(declare-fun m!248169 () Bool)

(assert (=> b!158250 m!248169))

(declare-fun m!248171 () Bool)

(assert (=> b!158248 m!248171))

(declare-fun m!248173 () Bool)

(assert (=> b!158252 m!248173))

(declare-fun m!248175 () Bool)

(assert (=> start!31618 m!248175))

(declare-fun m!248177 () Bool)

(assert (=> start!31618 m!248177))

(declare-fun m!248179 () Bool)

(assert (=> b!158249 m!248179))

(assert (=> b!158249 m!248155))

(declare-fun m!248181 () Bool)

(assert (=> b!158249 m!248181))

(assert (=> b!158249 m!248159))

(assert (=> b!158249 m!248179))

(declare-fun m!248183 () Bool)

(assert (=> b!158249 m!248183))

(push 1)

(assert (not b!158248))

(assert (not start!31618))

(assert (not b!158249))

(assert (not b!158250))

(assert (not b!158251))

(assert (not b!158253))

(assert (not b!158252))

(check-sat)

(pop 1)

(push 1)

(check-sat)

